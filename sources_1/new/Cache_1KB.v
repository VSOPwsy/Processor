`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: Cache_1KB
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
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
    reg [255:0] V;
    reg [255:0] D;
    reg [31:0] DATA [0:255];
    reg [21:0] TAG  [0:255];


    integer i;

    initial begin
        V = 0;
        D = 0;
    end



    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            DATA[i] = 0;
            TAG[i] = 0;
        end
    end


    always @(posedge CLK) begin
        if (WriteEnable) begin
            DATA[index] <= WriteData;
            TAG[index] <= Addr[31:10];
        end
    end


    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            V <= 0;
            D <= 0;
        end
        else if (WriteEnable) begin
            V[index] <= 1;
            D[index] <= DirtyWrite;
        end
    end

    assign v = V[index];
    assign d = D[index];
    assign Hit = (TAG[index] == Addr[31:10]) & V[index];
    assign index = Addr[9:2];

    assign ReadData = DATA[index];
    assign rep_tag = TAG[index];
endmodule
