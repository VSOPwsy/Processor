`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/23 13:51:38
// Design Name: 
// Module Name: ProgramCounter_tb
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


module ProgramCounter_tb;

reg CLK;
reg Reset;
reg EN;
reg PCSrc;
reg [31:0] Result;
wire [31:0] PC;
wire [31:0] PCPlus4;

ProgramCounter uut(
    .CLK(CLK),
    .Reset(Reset),
    .EN(EN),
    .PCSrc(PCSrc),
    .Result(Result),
    .PC(PC),
    .PCPlus4(PCPlus4)
    );
    
    
initial begin
    Result = 0;
    EN = 1;
    CLK = 0;
    PCSrc = 0;
    forever #5 CLK = ~CLK;
end

initial begin
    #2500;
    EN = 0;
    #2500;
    $finish;
end
endmodule
