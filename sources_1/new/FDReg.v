`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: FDReg
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module FDReg(
    input CLK,
    input Reset,
    input EN,
    input CLR,
    input [31:0] InstrF,
    output reg [31:0] InstrD
    );
    initial InstrD = 0;
    always @(posedge CLK, posedge Reset) begin
        if (Reset | CLR)
            InstrD <= 32'b0;
        else
            InstrD <= EN ? InstrF : InstrD;
    end
    
endmodule
