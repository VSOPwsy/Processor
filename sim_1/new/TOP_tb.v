`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/25 17:54:07
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb;

reg CLK;    
reg Reset;    
reg [15:0] SW;

wire [15:0] LED;
wire [7:0] SevenSegAn;
wire [6:0] SevenSegCat;

TOP #(1) uut(
    .CLK(CLK),
    .Reset(Reset),
    .SW(SW),
    .LED(LED),
    .SevenSegAn(SevenSegAn),
    .SevenSegCat(SevenSegCat)
); 

always #5 CLK = ~CLK;
    
initial begin
    CLK = 0;
    SW = 16'h0009;
    Reset = 0;
    #10;
    Reset = 1;
    #30;
    Reset = 0;
    #7000;
end
 
endmodule
