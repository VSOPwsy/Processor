`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/25 17:39:06
// Design Name: 
// Module Name: LedDriver
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


module LedDriver(
    input CLK,
    input Reset,
    input [31:0] WD,
    input WE,
    output reg [15:0] LED
    );
    initial LED = 0;
    always @(posedge CLK, posedge Reset) LED <= Reset ? 0 : WE ? WD : LED;
endmodule
