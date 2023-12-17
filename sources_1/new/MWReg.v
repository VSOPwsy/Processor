`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: MWReg
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module MWReg(
    input           CLK,
    input           Reset,
    input           EN,
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
            if (EN) begin
                RegWriteW <= RegWriteM;
                MemtoRegW <= MemtoRegM;
                ReadDataW <= ReadDataM;
                ALUOutW <= ALUOutM;
                WA3W <= WA3M;
            end
            else begin
                RegWriteW <= RegWriteW;
                MemtoRegW <= MemtoRegW;
                ReadDataW <= ReadDataW;
                ALUOutW <= ALUOutW;
                WA3W <= WA3W;
            end
        end
    end
    
endmodule
