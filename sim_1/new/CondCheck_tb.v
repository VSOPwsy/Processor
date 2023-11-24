`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/18 17:41:56
// Design Name: 
// Module Name: CondCheck_tb
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


module CondCheck_tb;

reg [3:0] Cond;
reg [3:0] Flags;
wire CondEx;

    ConditionCheck uut(
        .Cond(Cond),
        .Flags(Flags),
        .CondEx(CondEx));
        
    
    initial begin
        Cond = 4'b0000;
        Flags = 4'b0000;
        #10;
        Flags = 4'b0100;
        #10;
        $finish;
    end
endmodule
