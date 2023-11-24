`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: LSR
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module LSR(
    input   [31:0]      ShIn,
    input   [4:0]       Shamt5,
    output  [31:0]      ShOutLSR
    );
    
    wire [31:0] ShOutA;
    wire [31:0] ShOutB;
    wire [31:0] ShOutC;
    wire [31:0] ShOutD;
    
    assign  ShOutA      =   Shamt5[4] ? {16'b0, ShIn[31:16]} : ShIn;
    assign  ShOutB      =   Shamt5[3] ? {8'b0,  ShOutA[31:8]} : ShOutA;
    assign  ShOutC      =   Shamt5[2] ? {4'b0,  ShOutB[31:4]} : ShOutB;
    assign  ShOutD      =   Shamt5[1] ? {2'b0,  ShOutC[31:2]} : ShOutC;
    assign  ShOutLSR    =   Shamt5[0] ? {1'b0,  ShOutD[31:1]} : ShOutD;
endmodule
