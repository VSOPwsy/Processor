`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: EMReg
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
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
    input MCycleBusyE,
    input FPUBusyE,
    output reg RegWriteM,
    output reg MemWriteM,
    output reg MemtoRegM,
    output reg [31:0] ALUOutM,
    output reg [31:0] WriteDataM,
    output reg [3:0] WA3M,
    output reg [3:0] RA2M,
    output reg MCycleBusyM,
    output reg FPUBusyM
    );
    
    initial begin
        RegWriteM = 0;
        MemWriteM = 0;
        MemtoRegM = 0;
        ALUOutM = 0;
        WriteDataM = 0;
        WA3M = 0;
        RA2M = 0;
        MCycleBusyM = 0;
        FPUBusyM = 0;
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
            MCycleBusyM <= 0;
            FPUBusyM <= 0;
        end
        else if (EN) begin
            RegWriteM <= RegWriteE;
            MemWriteM <= MemWriteE;
            MemtoRegM <= MemtoRegE;
            ALUOutM <= ALUResultE;
            WriteDataM <= WriteDataE;
            WA3M <= WA3E;
            RA2M <= RA2E;
            MCycleBusyM <= MCycleBusyE;
            FPUBusyM <= FPUBusyE;
        end
        else begin
            RegWriteM <= RegWriteM;
            MemWriteM <= MemWriteM;
            MemtoRegM <= MemtoRegM;
            ALUOutM <= ALUOutM;
            WriteDataM <= WriteDataM;
            WA3M <= WA3M;
            RA2M <= RA2M;
            MCycleBusyM <= MCycleBusyM;
            FPUBusyM <= FPUBusyM;
        end
    end
    
endmodule
