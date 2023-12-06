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
    input EN,
    input RegWriteE,
    input MemWriteE,
    input MemtoRegE,
    input [31:0] ALUResultE,
    input [31:0] WriteDataE,
    input [3:0] WA3E,
    input [3:0] RA2E,
    output reg RegWriteM,
    output reg MemWriteM,
    output reg MemtoRegM,
    output reg [31:0] ALUOutM,
    output reg [31:0] WriteDataM,
    output reg [3:0] WA3M,
    output reg [3:0] RA2M
    );
    
    initial begin
        RegWriteM = 0;
        MemWriteM = 0;
        MemtoRegM = 0;
        ALUOutM = 0;
        WriteDataM = 0;
        WA3M = 0;
        RA2M = 0;
    end
    
    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            RegWriteM <= 0;
            MemWriteM <= 0;
            MemtoRegM <= 0;
            ALUOutM <= 0;
            WriteDataM <= 0;
            WA3M <= 0;
            RA2M <= 0;
        end
        else if (EN) begin
            RegWriteM <= RegWriteE;
            MemWriteM <= MemWriteE;
            MemtoRegM <= MemtoRegE;
            ALUOutM <= ALUResultE;
            WriteDataM <= WriteDataE;
            WA3M <= WA3E;
            RA2M <= RA2E;
        end
        else begin
            RegWriteM <= RegWriteM;
            MemWriteM <= MemWriteM;
            MemtoRegM <= MemtoRegM;
            ALUOutM <= ALUOutM;
            WriteDataM <= WriteDataM;
            WA3M <= WA3M;
            RA2M <= RA2M;
        end
    end
    
endmodule
