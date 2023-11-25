`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/25 17:40:13
// Design Name: 
// Module Name: SegmentDriver
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


module SegmentDriver(
    input CLK,
    input Reset,
    input [31:0] WD,
    input WE,
    output reg [32:0] SEG
    );
    initial SEG = 0;
    always @(posedge CLK, posedge Reset) SEG <= Reset ? 0 : WE ? WD : SEG;
endmodule
