`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/23 17:09:57
// Design Name: 
// Module Name: FDReg
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
