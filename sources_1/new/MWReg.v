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
    input           MemtoRegM,
    input   [31:0]  ReadDataM,
    input   [31:0]  ALUOutM,
    input   [3:0]   WA3M,
    
    output reg          RegWriteW,
    output reg          MemtoRegW,
    output reg  [31:0]  ReadDataW,
    output reg  [31:0]  ALUOutW,
    output reg  [3:0]   WA3W
    );
    
    initial begin
        RegWriteW = 0;
        MemtoRegW = 0;
        ReadDataW = 0;
        ALUOutW = 0;
        WA3W = 0;
    end
    
    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            RegWriteW <= 0;
            MemtoRegW <= 0;
            ReadDataW <= 0;
            ALUOutW <= 0;
            WA3W <= 0;
        end
        else begin
            RegWriteW <= RegWriteM;
            MemtoRegW <= MemtoRegM;
            ReadDataW <= ReadDataM;
            ALUOutW <= ALUOutM;
            WA3W <= WA3M;
        end
    end
    
endmodule
