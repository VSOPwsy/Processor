//操作数不合法：使用了一些不合法的操作数：NaN数、无穷大数
//上溢：当结果比最大浮点数还大时，处理上溢的方法有终止计算和饱和运算（用最大值作为结果）等
//下溢：当结果比最小浮点数还小时，处理下溢的方法有将最小浮点数设为0或用一个小于2^Emin的非规格化数表示最小浮点数等方式处理。
module FADD (
    input clk,
    input rst,
    input [31:0] x,y,
    input [1:0] round,
    output reg [31:0] z,
    output reg [2:0] error,
    output reg [1:0] overflow
);
    parameter START = 3'b000, EQUALEXP = 3'b001, ADDM = 3'b010, NORMAL = 3'b011, ROUND = 3'b100, WAIT = 3'b101;
    reg [24:0] m_x,m_y,m_z;
    reg [24:0] m_z_temp;
    reg [7:0] exponent_x,exponent_y,exponent_z;
    reg sign_z;
    wire sign_x,sign_y;
    reg [23:0] out_z,mid_z,out_z_temp;
    reg [1:0] bigger;
    reg [4:0] first_one_bit;
    reg [2:0] next, state;
    reg [1:0] zero;
    reg signed [8:0] delta_e;
    reg [1:0] big_delta_e;
    wire [4:0] bit4,bit3,bit2,bit1;
    wire [48:0] temp;
    reg [31:0] z_temp;
    reg input_change,flag,flag_;
    wire new;
    // reg try;
 
//============================状态跳转触发器逻辑====================================
    always@(posedge clk or posedge rst) begin
        if(rst) begin state <= WAIT;end
        else begin state <= next;end
    end
 
//============================产生1个新数据导入的flag信号====================================
    always@(x,y,round,rst) begin
        if(rst) begin
            input_change = 0;
        end
        else begin
        input_change = ~input_change;
        end
    end
 
    always@(posedge clk or posedge rst) begin
        if(rst) begin
            flag <= 0;
            flag_ <= 0;
        end
        else begin
            flag <= input_change;
            flag_ <= flag;
        end
    end
 
    assign new = flag ^ flag_;
 
//============================ADDM状态下的尾数加组合逻辑====================================
    always@(*)begin//ADDM
        {m_z_temp,out_z_temp} = 0;
        if(state == ADDM) begin
            if(sign_x ^ sign_y)begin//异号情况
                if(bigger == 2'b01)begin//x指数大于y
                    {m_z_temp,out_z_temp} = {m_x,24'd0} - {m_y,out_z};
                end
                else if(bigger == 2'b10)begin//y指数大于x
                    {m_z_temp,out_z_temp} = {m_y,24'd0} - {m_x,out_z};
                end
                else if(bigger == 2'b00)begin
                    m_z_temp = (m_x > m_y)?(m_x - m_y):(m_y - m_x);
                end
            end
            else begin
                m_z_temp = m_x + m_y;
            end
        end
    end
//============================ROUND状态下的输出值舍入组合逻辑====================================
    always@(*)begin//ROUND
        z_temp = 0;
        if(state == ROUND) begin
            //------输入有0情况------
            if(zero) begin
                if(zero == 2'b10)begin
                    z_temp = {sign_y,exponent_y[7:0],m_y[22:0]};
                end
                else if(zero == 2'b01)begin
                    z_temp = {sign_x,exponent_x[7:0],m_x[22:0]};
                end
            end
            //------指数差距较大情况------
            else if(big_delta_e) begin
                if(big_delta_e == 2'b01) begin//y远大于x
                    case(round)
                        2'b00:begin//向0舍入
                            if(sign_y ^ sign_x==1)begin//异号
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                            else begin//同号
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                        end
                        2'b01:begin//向最近的数舍入（向偶数舍入）
                            z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                        end
                        2'b10:begin//向正无穷大舍入
                            if(sign_x)begin//x为负
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                        end
                        2'b11:begin//向负无穷大舍入
                            if(!sign_x)begin//x为正
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                        end
                    endcase
                end
                else if(big_delta_e == 2'b10)begin//x远大于y
                    case(round)
                        2'b00:begin//向0舍入
                            if(sign_y ^ sign_x==1)begin//异号
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                            else begin//同号
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                        end
                        2'b01:begin//向最近的数舍入（向偶数舍入）
                            z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                        end
                        2'b10:begin//向正无穷大舍入
                            if(sign_y)begin//y为负
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                        end
                        2'b11:begin//向负无穷大舍入
                            if(!sign_y)begin//y为正
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                        end
                    endcase
                end
            end
            //------常规情况------
            else if((error == 0) && (overflow == 0)) begin
                if(out_z)begin//要考虑舍入
                    case(round)
                        2'b00:begin//向0舍入
                            z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                        end
                        2'b01:begin//向最近的数舍入（向偶数舍入）
                            if(out_z > mid_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                            else if(out_z < mid_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(m_z[0] == 0)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                        end
                        2'b10:begin//向正无穷大舍入
                            if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                        end
                        2'b11:begin//向负无穷大舍入
                            if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                        end
                    endcase
                end
                else begin
                    z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                end
            end
        end
    end
//============================符号位赋值及最高有效位判断等组合逻辑====================================
    assign sign_x = x[31];
    assign sign_y = y[31];
    assign bit4 = m_z_temp[23]?23:m_z_temp[22]?22:m_z_temp[21]?21:m_z_temp[20]?20:m_z_temp[19]?19:m_z_temp[18]?18:0;
    assign bit3 = m_z_temp[17]?17:m_z_temp[16]?16:m_z_temp[15]?15:m_z_temp[14]?14:m_z_temp[13]?13:m_z_temp[12]?12:0;
    assign bit2 = m_z_temp[11]?11:m_z_temp[10]?10:m_z_temp[9]?9:m_z_temp[8]?8:m_z_temp[7]?7:m_z_temp[6]?6:0;
    assign bit1 = m_z_temp[5]?5:m_z_temp[4]?4:m_z_temp[3]?3:m_z_temp[2]?2:m_z_temp[1]?1:m_z_temp[0]?0:0;
    assign temp = {m_z,out_z};
//============================状态转移判断组合逻辑====================================
    always@(*) begin
        case(state)
            START:begin
                if((x[30:23]==8'd255)||(y[30:23]==8'd255))begin//出现了NaN，无穷大
                    next = ROUND;
                end
                else if(x[30:23]==8'd0)begin
                    if(x[22:0]==0)begin//x=0
                        next = ROUND;
                    end
                    else begin//非归约数
                        next = ROUND;
                    end
                end
                else if(y[30:23]==8'd0)begin//y=0
                    if(y[22:0]==0)begin//y=0
                        next = ROUND;
                    end
                    else begin//非归约数
                        next = ROUND;
                    end
                end
                else begin
                    next = EQUALEXP;
                end
            end
            EQUALEXP:begin
                if ((delta_e <= -25) || (delta_e >= 25)) begin
                    next = ROUND;
                end
                else begin
                next = ADDM;
                end
            end
            ADDM:begin next = NORMAL;end
            NORMAL:begin next = ROUND;end
            ROUND:begin next = new?START:WAIT;end
            WAIT:begin next = new?START:WAIT;end
            default:begin next = START;end
        endcase
    end
//============================状态相关运算时序逻辑====================================
    always@(posedge clk or posedge rst) begin
        if(rst) begin 
            error <= 3'b000;
            zero <= 0;
            overflow <= 0;
            
        end
        else begin
            case(state)
                START:begin
                    //分离指数和尾数
                    exponent_x <= x[30:23];
                    exponent_y <= y[30:23];
                    m_x <= {1'b0,1'b1,x[22:0]};//最高位来控制溢出 1.F
                    m_y <= {1'b0,1'b1,y[22:0]};
                    out_z <= 24'b0;
                    mid_z <= {1'b1,23'b0};
                    zero <= 0;
                    error <= 3'b000;
                    delta_e <= x[30:23] - y[30:23];
                    //只有阶码[1,254]和实数0是规格化数字
                    if((x[30:23]==8'd255)||(y[30:23]==8'd255))begin//出现了NaN，无穷大
                        error <= 3'b001;
                    end
                    else if(x[30:23]==8'd0)begin
                        if(x[22:0]==0)begin//x=0
                            zero <= 2'b10;
                        end
                        else begin//非归约数
                            error <= 3'b001;
                        end
                    end
                    else if(y[30:23]==8'd0)begin//y=0
                        if(y[22:0]==0)begin//y=0
                            zero <= 2'b01;
                        end
                        else begin//非归约数
                            error <= 3'b001;
                        end
                    end
                end
                EQUALEXP:begin//对阶处理  
                    big_delta_e <= 0;
                    if (delta_e <= -25)begin //y远大于x
                        big_delta_e <= 1;
                        sign_z <= sign_y;
                        exponent_z <= exponent_y;
                        m_z <= m_y;
                    end
                    else if(delta_e >= 25)begin//x远大于y,24刚好移出
                        big_delta_e <= 2;
                        sign_z <= sign_x;
                        exponent_z <= exponent_x;
                        m_z <= m_x;
                    end
                    else if (delta_e > 0) begin//x指数大于y，y尾数需要右移?
                        {m_y,out_z} <= {m_y,out_z} >> delta_e;
                        exponent_y <= exponent_x;
                        bigger <= 2'b01;
                    end
                    else if (delta_e < 0) begin//y指数大于x，x尾数需要右移?
                        {m_x,out_z} <= {m_x,out_z} >> (-delta_e);
                        exponent_x <= exponent_y;
                        bigger <= 2'b10;
                    end
                    else begin
                        bigger <= 2'b00;
                    end
                end
 
                ADDM:begin
                    exponent_z <= exponent_x;
                    m_z <= m_z_temp;
                    out_z <= out_z_temp;
                    if(sign_x ^ sign_y)begin//异号情况
                        if(bigger == 2'b01)begin//x指数大于y
                            sign_z <= sign_x;
                        end
                        else if(bigger == 2'b10)begin//y指数大于x
                            sign_z <= sign_y;
                        end
                        else if(bigger == 2'b00)begin                            
                            sign_z <= (m_x > m_y)?sign_x:sign_y;
                        end
                    end
                    else begin                        
                        sign_z <= sign_x;
                    end
                    first_one_bit <= bit4?bit4:bit3?bit3:bit2?bit2:bit1?bit1:0;//m_z中第1个出现1的bit位
                end
                NORMAL:begin
                    error <= 3'b000;
                    overflow <= 2'b00;
                    if(m_z[24])begin
                        if(exponent_z == 254) begin
                            if(m_z[23:1])begin//NaN,上溢
                                error <= 3'b100;
                                overflow <= 2'b01;
                            end
                            else begin//无穷大，上溢
                                error <= 3'b011;
                                overflow <= 2'b01;
                            end
                        end
                        else begin
                            m_z <= m_z >> 1;
                            exponent_z <= exponent_z + 1;
                        end
                    end
                    else begin
                        if((exponent_z < (23 - first_one_bit)) || 
                        (exponent_z == (23 - first_one_bit) && (temp[(first_one_bit+1) +: 23] != 0)))begin//下溢
                            error <= 3'b010;
                            overflow <= 2'b10;
                        end
                        else begin
                            {m_z,out_z} <= {m_z,out_z} << (23 - first_one_bit);
                            exponent_z <= exponent_z - (23 - first_one_bit);
                        end
                    end
                end
                ROUND:begin
                    if(z_temp[30:23]==8'd255)begin//出现了NaN，无穷大
                        if(z_temp[22:0])begin//NaN
                            error <= 3'b100;
                            overflow <= 2'b01;
                        end
                        else begin//无穷大?
                            error <= 3'b011;
                            overflow <= 2'b01;
                        end
                    end
                    else if(z_temp[30:23]==8'd0)begin//
                        if(z_temp[22:0])begin//非归约数,下溢
                            error <= 3'b010;
                            overflow <= 2'b10;
                        end
                    end
                    z <= z_temp;
                end
            endcase
        end
    end
endmodule