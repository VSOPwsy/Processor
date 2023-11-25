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
reg [6:0] DIP;

wire [15:0] LED;
wire [7:0] SevenSegAn;
wire [6:0] SevenSegCat;

TOP uut(
    .CLK(CLK),
    .Reset(Reset),
    .DIP(DIP),
    .LED(LED),
    .SevenSegAn(SevenSegAn),
    .SevenSegCat(SevenSegCat)
); 

always #5 CLK = ~CLK;
    
initial begin
    CLK = 0;
    DIP = 7'b1010101;
    Reset = 0;
    #10;
    Reset = 1;
    #30;
    Reset = 0;
    #1000;
    
    
    DIP = 7'b0001111;
    #7000;
    $finish;
end
 
endmodule
