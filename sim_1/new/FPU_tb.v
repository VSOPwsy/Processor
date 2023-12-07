`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/07 16:18:37
// Design Name: 
// Module Name: FPU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FPU_tb;

reg [1:0] FPUOp;
reg [31:0] Operand1;
reg [31:0] Operand2;

wire [31:0] Result;



FPU uut(
    .FPUOp(FPUOp),
    .Operand1(Operand1),
    .Operand2(Operand2),
    .Result(Result)
);


initial begin
    Operand1 = 32'b0_01111111_10000000000000000000000;
    Operand2 = 32'b1_10000011_10000000000000000000000;
    #20;
    $finish;
end

endmodule
