/* 对于数据格式的说明：
signed  exp       man
31      30...23   22...0
情况：
  exponent  fraction  value
  0         zero      0
  0         non-zero  +-2^(-126)*0.(man(10)(小数化十进制数))
  1~254     any       +-2^(exp-127)*1.(man(10)(小数化十进制数))
  255       zero      +-inf
  255       non-zero  NaN
*/
module FADD (
    input CLK,
    input Reset,
    input Start,
    input [3:0] WA3,
    input       [31:0]  Operand1,
    input       [31:0]  Operand2,
    output reg  [31:0]  Result,
    output Busy,
    output Done,
    output reg [3:0] FADDWA3
    );
    reg [31:0] Operand1_reg, Operand2_reg;
    initial begin
        FADDWA3 = 0;
        Operand1_reg = 0;
        Operand2_reg = 0;
    end
    reg [1:0] state = 0;
    wire [1:0] next_state;
    always @(posedge CLK, posedge Reset) state <= Reset ? 0 : next_state;
    assign next_state = state == 2'b00 ? (Start ? 2'b01 : 2'b00) :
                        state == 2'b01 ? 2'b10 :
                        state == 2'b10 ? 2'b00 : 2'b00;
    assign Busy = state == 2'b00 ? Start : 
                  state == 2'b01 ? 1 :
                  state == 2'b10 ? 0 : 0;
    assign Done = state == 2'b01;
    always @(posedge CLK, posedge Reset) begin
        FADDWA3 <= Reset ? 0 : state == 2'b00 & Start ? WA3 : FADDWA3;
        Operand1_reg <= Reset ? 0 : state == 2'b00 & Start ? Operand1 : Operand1_reg;
        Operand2_reg <= Reset ? 0 : state == 2'b00 & Start ? Operand2 : Operand2_reg;
    end
    
    reg [66:0]  fraction_1;
    reg [66:0]  fraction_2;
    
    reg [66:0]  fraction_Ans;

    reg [7:0]   exponent_1;
    reg [7:0]   exponent_2;
    reg [7:0]   exponent_Ans;

    reg [4:0]   norm_count;
    reg         norm_vld;

    reg         sign_1;
    reg         sign_2;
    reg         sign_Ans;

    reg         guard_bit;
    reg         round_bit;
    reg         sticky_bit;

    reg         inf_1;
    reg         inf_2;
    reg         nan_1;
    reg         nan_2;
// FP ADDER ///
    always@(*) begin 
        //loading
        begin
            fraction_1  = {2'd0,Operand1_reg[22:0],42'd0};	// 对尾数扩展。前2bit第一位为进位位，第二位为隐藏的1，
            fraction_2  = {2'd0,Operand2_reg[22:0],42'd0};	// 此处不赋值2'b01是留在special case中处理指数全0的情况。后42bit保障精度，可适当减少
            exponent_1  = Operand1_reg[30:23];
            exponent_2  = Operand2_reg[30:23];
            sign_1      = Operand1_reg[31];
            sign_2      = Operand2_reg[31]; 
            inf_1       = 1'b0;
            nan_1       = 1'b0;
            inf_2       = 1'b0;
            nan_2       = 1'b0;
        end    
        //preprocessing
        begin
            if(exponent_1 == 0) begin //when exponent is zero but fraction is non-zero,set it to 1
                exponent_1 = 1;
                fraction_1[65] = 0;    //make 0.(Frac) //参考代码开头对于特殊情况的说明
            end
            else
                fraction_1[65] = 1;            
            if(exponent_2 == 0) begin
                exponent_2 = 1;
                fraction_2[65] = 0;
            end
            else
                fraction_2[65] = 1;   //make 1.(Frac)
        end

        //special case
        begin
            if((exponent_1 == 0) && (fraction_1 == 0)) begin //if Operand1_reg is zero, then return Operand2_reg
                sign_Ans     = sign_2;
                exponent_Ans = exponent_2;
                fraction_Ans = fraction_2;
            end
            else if (exponent_1 == 8'hff) begin
                if (fraction_1 == 23'h0) inf_1 = 1'b1;		// 补充原代码缺失的对inf与NaN的处理
                else nan_1 = 1'b1;
            end 
            else begin
            end

            if((exponent_2 == 0) && (fraction_2 == 0)) begin // if Operand2_reg is zero, then return Operand1_reg
                sign_Ans     = sign_1;
                exponent_Ans = exponent_1;
                fraction_Ans = fraction_1;
            end  
            else if (exponent_2 == 8'hff) begin
                if (fraction_2 == 23'h0) inf_2 = 1'b1;
                else nan_2 = 1'b1;
            end 
            else begin
            end

        end    

        //align
        begin
            if(exponent_1 > exponent_2) begin
                fraction_2 = fraction_2 >> (exponent_1 - exponent_2);
                exponent_Ans = exponent_1;
                
                
            end
            else if(exponent_1 < exponent_2) begin
                fraction_1 = fraction_1 >> (exponent_2 - exponent_1);
                exponent_Ans = exponent_2;
               
                
            end
            else if(exponent_1 == exponent_2)begin
                exponent_Ans = exponent_1;  
                
            end
        end

        //add significands
        begin
            if(sign_1 == sign_2) begin
                fraction_Ans = fraction_1 + fraction_2;
                sign_Ans = sign_1;
            end
            else begin
                if(fraction_1 >= fraction_2) begin
                    fraction_Ans = fraction_1 - fraction_2;
                    sign_Ans = sign_1;
                end
                else begin
                    fraction_Ans = fraction_2 - fraction_1;
                    sign_Ans = sign_2;
                end
            end
        end

        
        //overflow
        begin
            if(fraction_Ans[66]) begin
                fraction_Ans = fraction_Ans >> 1;
                exponent_Ans = exponent_Ans + 1;
            end
        end   
        ///////////////////////////////////////////////////////////////////////////////// 
        //normalization
        begin
            if(fraction_Ans == 67'b0) begin
                fraction_Ans = 67'b0;
                exponent_Ans = 8'b0;
            end
            else begin
                if(fraction_Ans[65] == 0)begin
                    PENC32({11'b0, fraction_Ans[64:42]}, norm_count, norm_vld);	// 用优先编码器计算最高位1所在bit
                    fraction_Ans = fraction_Ans << (5'd23 - norm_count);		// 左移完成规格化
                    if ((exponent_Ans + norm_count)>=5'd23) begin
                        exponent_Ans = exponent_Ans + norm_count - 5'd23;      		// 对应更新阶数
                    end
                    else begin 
                        exponent_Ans =8'h00;//下溢
                        fraction_Ans =0;
                    end
                end    
                else if(fraction_Ans[65]) begin
                end
            end
        end

        //round
        begin
            guard_bit = fraction_Ans[41]; 
            round_bit = fraction_Ans[40];
            if(fraction_Ans[39:0] > 0)
                sticky_bit = 1;  
            else
                sticky_bit = 0;                         
            if(guard_bit && (fraction_Ans[42] | round_bit | sticky_bit)) begin	// 对照进位的条件
                fraction_Ans = fraction_Ans + 67'b0;
            end
        end
        //convert:
        begin
            Result[22:0]  = fraction_Ans[64:42];
            Result[30:23] = exponent_Ans[7:0];
            Result[31]    = sign_Ans; 
            //special case
            if(fraction_Ans == 0) //when fraction is 23'd0
                Result = 0;
            if(nan_1 || nan_2 || (inf_1 && inf_2 && (sign_1 ^ sign_2))) begin // return NaN
                exponent_Ans = 8'hff;
                fraction_Ans = 23'h1;
                Result=32'h7f800001;
            end
            else if(inf_1 || inf_2 || (exponent_Ans == 8'b11111111)) begin // return inf
                fraction_Ans = 0;
                Result[22:0]  = 23'h0;
            end
        end
    end










// PENC TASK // 用4个PENC8拼接实现32bit优先编码
    task PENC8;
        //port declaration
        input   [7:0] D;
        output  [2:0] Q;
        output        vld;
        //internal node signals declaration
        begin
            vld  = D[7]|D[6]|D[5]|D[4]|D[3]|D[2]|D[1]|D[0];
            Q[2] = D[7]|D[6]|D[5]|D[4];
            Q[1] = (D[7]|D[6]|D[5]|D[4]) ? (D[7]|D[6]) : (D[3]|D[2]);
            Q[0] = (D[7]|D[6]|D[5]|D[4]) ? (D[7]|((~D[6])&D[5])) : (D[3]|((~D[2])&D[1]));
        end
    endtask

    task PENC16;
        //port declaration
        input   [15:0] D;
        output  [3:0]  Q;
        output         vld;
        //internal node signals declaration
        reg [2:0] Q1_h, Q1_l;
        reg       vld1_h, vld1_l;
        begin
            PENC8( D[15:8],  Q1_h,   vld1_h);
            PENC8( D[7:0],   Q1_l,   vld1_l);
            Q[3]    = vld1_h;
            Q[2:0]  = vld1_h ? Q1_h : Q1_l;
            vld     = vld1_h | vld1_l;
        end
    endtask

    task PENC32;
        //port declaration
        input   [31:0] D;
        output  [4:0]  Q;
        output         vld;
        //internal node signals declaration
        reg [3:0] Q2_h, Q2_l;
        reg       vld2_h, vld2_l;
        begin
            PENC16( D[31:16],   Q2_h,   vld2_h);
            PENC16( D[15:0],    Q2_l,   vld2_l);
            Q[4]    = vld2_h;
            Q[3:0]  = vld2_h ? Q2_h : Q2_l;
            vld     = vld2_h | vld2_l;
        end
    endtask      
endmodule
