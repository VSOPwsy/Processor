module FMUL (
    input CLK,   // Connect to CPU clock
    input RESET, // Connect to the reset of the ARM processor.
    input Start, // Multi-cycle Enable. The control unit should assert this when MUL or DIV instruction is detected.
    input   [31:0]  src1,
    input   [31:0]  src2,
    output reg  [31:0]  out,
    output  FBusy
    );
    reg [31:0]  fraction_1;
    reg [31:0]  fraction_2;
    reg [31:0]  fraction_Ans;

    reg [7:0]   exponent_1;
    reg [7:0]   exponent_2;
    reg [7:0]   exponent_Ans;

    wire        sign;
    assign sign      = src1[31]^src2[31];

    wire CA;
    wire [47:0]MResult;
    assign CA=((exponent_1 != 8'd255)&&(exponent_2 != 8'd255)&&(src1!=0)&&(src2!=0)&&({0,exponent_1}+{0,exponent_2}>7'd127)&&({0,exponent_1}+{0,exponent_2}-7'd127<8'd254));

    wire Done;

    always @(*) begin
        //loading
        begin
            fraction_1  = {9'd0,src1[22:0]};
            fraction_2  = {9'd0,src2[22:0]};	
            exponent_1  = src1[30:23];
            exponent_2  = src2[30:23];
        end    
        //preprocessing
        begin
            if(exponent_1 == 0) begin //when exponent is zero but fraction is non-zero,set it to 1
                fraction_1[23] = 0;    //make 0.(Frac) //参考代码开头对于特殊情况的说明
            end
            else
                fraction_1[23] = 1;            
            if(exponent_2 == 0) begin
                fraction_2[23] = 0;
            end
            else
                fraction_2[23] = 1;   //make 1.(Frac)
        end

        //special case
        begin
            if((exponent_1 == 0) && (fraction_1 == 0)) begin //if src1 is zero, then return 0
                exponent_Ans = 0;
                fraction_Ans = 0;
            end
            else if (exponent_1 == 8'hff) begin
                if (fraction_1 == 0) begin
                    // 对inf的处理
                    exponent_Ans = 8'hff;
                    fraction_Ans = 0;
                end
                else begin
                    // 对NaN的处理
                    exponent_Ans = 8'hff;
                    fraction_Ans = 1;
                end
            end 
            else begin
            end

            if((exponent_2 == 0) && (fraction_2 == 0)) begin // if src2 is zero, then return 0
                exponent_Ans = 0;
                fraction_Ans = 0;
            end  
            else if (exponent_2 == 8'hff) begin
                if (fraction_2 == 0) begin
                    // 对inf的处理
                    exponent_Ans = 8'hff;
                    fraction_Ans = 0;
                end
                else begin
                    // 对NaN的处理
                    exponent_Ans = 8'hff;
                    fraction_Ans = 1;
                end
            end
        end  

        begin
            if ({0,exponent_1}+{0,exponent_2}>8'd254+7'd127) begin
                exponent_Ans=8'b1111_1111;
                fraction_Ans = 0;
            end
            else if({0,exponent_1}+{0,exponent_2}<7'd127) begin
                exponent_Ans=0;
                fraction_Ans = 0;
            end
            else if ((!CA&&src1!=0&&src2!=0)&&(exponent_1 != 8'd255)&&(exponent_2 != 8'd255))begin
                exponent_Ans={0,exponent_1}+{0,exponent_2}-7'd127;
            end
        end

        begin
            if (CA&&Done&&MResult!=0) begin
                if (MResult[47]) begin
                    exponent_Ans={0,exponent_1}+{0,exponent_2}-7'd127+1'b1;
                    fraction_Ans=MResult[46:15];
                end
                else begin
                    exponent_Ans={0,exponent_1}+{0,exponent_2}-7'd127;
                    fraction_Ans=MResult[45:14];
                end
            end
            else begin
            end
        end

        begin
            out[22:0]  = fraction_Ans[31:9];
            out[30:23] = exponent_Ans[7:0];
            out[31]    = sign;             
        end
    end
reg [31:0] last_src1=0;
reg [31:0] last_src2=0;

always @(*) begin
    if (Done) begin
        last_src1=src1;
        last_src2=src2;
    end
end
MCycle  #(.width(48))u_MCycle(
	.CLK      	( CLK       ),
	.RESET    	( RESET     ),
	.Start    	( (Start&&CA&&((last_src1!=src1)||(last_src2!=src2)))?1'b1:1'b0),
	.MCycleOp 	( 0 ),
	.Operand1 	( {16'b0,fraction_1}  ),
	.Operand2 	( {16'b0,fraction_2}  ),
	.MResult  	( MResult   ),
    .Done(Done),
	.Busy     	( FBusy      )
);


endmodule