`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: SegmentDriver
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module SegmentDriver(
    input CLK,
    input Reset,
    input WE,
    input [31:0] WD,
    output reg [31:0] SEG
    );
    initial SEG = 0;
    always @(posedge CLK, posedge Reset) SEG <= Reset ? 0 : WE ? WD : SEG;
endmodule
