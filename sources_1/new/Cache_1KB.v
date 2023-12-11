`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/27 00:04:15
// Design Name: 
// Module Name: Cache_1KB
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


`include "config.v"

module Cache_1KB (
    input CLK,
    input Reset,
    input [31:0] Addr,
    input WriteEnable,
    input [31:0] WriteData,
    input DirtyWrite,
    output Hit,
    output v,
    output d,
    output [31:0] ReadData,
    output [21:0] rep_tag
    );
    
    wire [7:0] index;
    reg V [0:255];
    reg D [0:255];
    reg [31:0] DATA [0:255];
    reg [21:0] TAG  [0:255];
    integer i;

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            V[i] = 0;
            D[i] = 0;
            DATA[i] = 0;
            TAG[i] = 0;
        end
    end

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            for (i = 0; i < 256; i = i + 1) begin
                V[i] = 0;
                D[i] = 0;
                DATA[i] = 0;
                TAG[i] = 0;
            end
        end
        else begin
            if (WriteEnable) begin
                DATA[index] <= WriteData;
                V[index] <= 1;
                D[index] <= DirtyWrite;
            end
        end
    end

    assign v = V[index];
    assign d = D[index];
    assign Hit = (TAG[index] == Addr[31:10]) & V[index];
    assign index = Addr[9:2];

    assign ReadData = DATA[index];
    assign rep_tag = TAG[index];
endmodule
