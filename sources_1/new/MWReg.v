`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/23 17:09:16
// Design Name: 
// Module Name: MWReg
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


module MWReg(
    input           CLK,
    input           Reset,
    input           RegWriteM,
    input           RegWrite2M,
    input           MemtoRegM,
    input   [31:0]  ReadDataM,
    input   [31:0]  ALUOutM,
    input   [31:0]  MCResultHighM,
    input   [3:0]   WA3M,
    input   [3:0]   WA5M,
    
    output reg          RegWriteW,
    output reg          RegWrite2W,
    output reg          MemtoRegW,
    output reg  [31:0]  ReadDataW,
    output reg  [31:0]  ALUOutW,
    output reg  [31:0]  MCResultHighW,
    output reg  [3:0]   WA3W,
    output reg  [3:0]   WA5W
    );
    
    initial begin
        RegWriteW = 0;
        RegWrite2W = 0;
        MemtoRegW = 0;
        ReadDataW = 0;
        ALUOutW = 0;
        MCResultHighW = 0;
        WA3W = 0;
        WA5W = 0;
    end
    
    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            RegWriteW <= 0;
            RegWrite2W <= 0;
            MemtoRegW <= 0;
            ReadDataW <= 0;
            ALUOutW <= 0;
            MCResultHighW <= 0;
            WA3W <= 0;
            WA5W <= 0;
        end
        else begin
            RegWriteW <= RegWriteM;
            RegWrite2W <= RegWrite2M;
            MemtoRegW <= MemtoRegM;
            ReadDataW <= ReadDataM;
            ALUOutW <= ALUOutM;
            MCResultHighW <= MCResultHighM;
            WA3W <= WA3M;
            WA5W <= WA5M;
        end
    end
    
endmodule
