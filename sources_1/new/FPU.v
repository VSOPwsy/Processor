`include "config.v"

module FPU (
    input [1:0] FPUOp,
    input [31:0] Operand1,
    input [31:0] Operand2,

    output [31:0] Result
);
    
//    /////////////////////////////////////////////////////////////////
//    ////// Unpack
//    /////////////////////////////////////////////////////////////////
//    wire op1_sign, op2_sign;
//    wire [7:0] op1_exp, op2_exp;
//    wire [23:0] op1_significand, op2_significand;
//    assign op1_sign = Operand1[31];
//    assign op2_sign = Operand2[31];
//    assign op1_exp = Operand1[30:23];
//    assign op2_exp = Operand2[30:23];
//    assign op1_significand = {1'b1, Operand1[22:0]};
//    assign op2_significand = {1'b1, Operand2[22:0]};
//    ///////////////////////////////////////////////
//    // Testing for special operands and exceptions
//    ///////////////////////////////////////////////


//    /////////////////////////////////////////////////////////////////
//    /////////////////////////////////////////////////////////////////



    
//    /////////////////////////////////////////////////////////////////
//    ////// Swapping and Alignment
//    /////////////////////////////////////////////////////////////////
//    wire swap;
//    wire [7:0] exp_dif;
//    assign swap = op1_exp < op2_exp;
//    assign exp_dif = swap ? op2_exp - op1_exp : op1_exp - op2_exp;

//    wire [23:0] OpA, OpB;
//    assign OpA = swap ? op2_significand : op1_significand;
//    assign OpB = swap ? op1_significand : op2_significand;

//    wire [23:0] OpA_aligned;
//    assign OpA_aligned = exp_dif[7:5] == 0 ? OpA >> exp_dif : 0;
//    wire
//    /////////////////////////////////////////////////////////////////
//    /////////////////////////////////////////////////////////////////



//    wire [31:0] a, b, s;
//    assign a = op1_sign ? {8'hFF, ~OpA_aligned} + 1 : {8'h00, OpA_aligned};
//    assign b = op2_sign ? {8'hFF, ~OpB} + 1 : {8'h00, OpB};
//    adder adder(
//        .cin(0),
//        .a(a),
//        .b(b),
//        .s(s),
//        .cout()
//    );

//    wire sign;
//    wire [31:0] abs_s;
//    assign sign = s[31];
//    assign abs_s = s[31] ? ~s + 1 : s;

//    wire [31:0] enc_in;
//    wire [4:0] enc_out;
//    wire enc_none;
//    genvar i;
//    generate for (i = 0; i < 32; i = i + 1) assign enc_in[i] = abs_s[31-i]; endgenerate
//    PriorityEncoder #(32) PriorityEncoder(
//        .in(enc_in),
//        .out(enc_out),
//        .none(enc_none));
    
//    wire [4:0] leading_zeros;
//    assign leading_zeros = enc_none ? 32 : enc_out;
endmodule