`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: LedDriver
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module LedDriver(
    input CLK,
    input Reset,
    input WE,
    input [31:0] WD,
    output reg [15:0] LED
    );
    initial LED = 0;
    always @(posedge CLK, posedge Reset) LED <= Reset ? 0 : WE ? WD : LED;
endmodule
