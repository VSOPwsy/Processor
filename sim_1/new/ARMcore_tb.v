`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/19 20:20:14
// Design Name: 
// Module Name: ARMcore_tb
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


module ARMcore_tb;

reg CLK;    
reg Reset;    

ARMcore uut(
    .CLK(CLK),
    .Reset(Reset)
); 

always #5 CLK = ~CLK;
    
initial begin
    CLK = 0;
    Reset = 0;
    #10;
    Reset = 1;
    #30;
    Reset = 0;
    #8000;
    $finish;
end
 
endmodule
