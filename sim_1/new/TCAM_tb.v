`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/27 19:52:11
// Design Name: 
// Module Name: TCAM_tb
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


module TCAM_tb;

reg CLK;
reg [31:0] Addr;
reg Valid;
reg [7:0] RepPtr;
wire h;
wire [7:0] Hit_Index;

TCAM uut(
.CLK(CLK),
.Addr(Addr),
.Valid(Valid),
.RepPtr(RepPtr),
.h(h),
.Hit_Index(Hit_Index)
);

initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end


initial begin
    Addr = 0;
    RepPtr = 0;
    Valid = 1;
    #10;
    Valid = 0;
    #20;
    Addr = 32'h0000FFF0;
    RepPtr = 1;
    Valid = 1;
    #10;
    Valid = 0;
    #30;
    Valid = 1;
    #20;
    $finish;
end


endmodule
