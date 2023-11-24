`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/20 13:21:32
// Design Name: 
// Module Name: Shifter_tb
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


module Shifter_tb;

reg [1:0] Sh;
reg [4:0] Shamt5;
reg [31:0] ShIn;
wire [31:0] ShOut;

Shifter uut(
    .Sh(Sh),
    .Shamt5(Shamt5),
    .ShIn(ShIn),
    .ShOut(ShOut)
);

initial begin
    Sh = 2'b00;
    Shamt5 = 5'b00000;
    ShIn = 32'hFFFFFFFF;
    #10;
    $finish;
end
endmodule
