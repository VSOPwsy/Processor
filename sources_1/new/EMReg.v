`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/23 19:09:58
// Design Name: 
// Module Name: EMReg
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


module EMReg(
    input CLK,
    input Reset,
    input RegWriteE,
    input RegWrite2E,
    input MemWriteE,
    input MemtoRegE,
    input [31:0] ALUResultE,
    input [31:0] MCResultHighE,
    input [31:0] WriteDataE,
    input [3:0] WA3E,
    input [3:0] WA5E,
    input [3:0] RA2E,
    output reg RegWriteM,
    output reg RegWrite2M,
    output reg MemWriteM,
    output reg MemtoRegM,
    output reg [31:0] ALUOutM,
    output reg [31:0] MCResultHighM,
    output reg [31:0] WriteDataM,
    output reg [3:0] WA3M,
    output reg [3:0] WA5M,
    output reg [3:0] RA2M
    );
    
    initial begin
        RegWriteM = 0;
        RegWrite2M = 0;
        MemWriteM = 0;
        MemtoRegM = 0;
        ALUOutM = 0;
        WriteDataM = 0;
        WA3M = 0;
        RA2M = 0;
        WA5M = 0;
        MCResultHighM = 0;
    end
    
    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            RegWriteM <= 0;
            RegWrite2M <= 0;
            MemWriteM <= 0;
            MemtoRegM <= 0;
            ALUOutM <= 0;
            WriteDataM <= 0;
            WA3M <= 0;
            RA2M <= 0;
            WA5M <= 0;
            MCResultHighM <= 0;
        end
        else begin
            RegWriteM <= RegWriteE;
            RegWrite2M <= RegWrite2E;
            MemWriteM <= MemWriteE;
            MemtoRegM <= MemtoRegE;
            ALUOutM <= ALUResultE;
            WriteDataM <= WriteDataE;
            WA3M <= WA3E;
            RA2M <= RA2E;
            WA5M <= WA5E;
            MCResultHighM <= MCResultHighE;
        end
    end
    
endmodule
