`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: ROR
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module ROR(
    input   [31:0]      ShIn,
    input   [4:0]       Shamt5,
    output  [31:0]      ShOutROR
    );
    
    wire [31:0] ShOutA;
    wire [31:0] ShOutB;
    wire [31:0] ShOutC;
    wire [31:0] ShOutD;
    
    assign  ShOutA      =   Shamt5[4] ? {ShIn[15:0], ShIn[31:16]} : ShIn;
    assign  ShOutB      =   Shamt5[3] ? {ShOutA[7:0], ShOutA[31:8]} : ShOutA;
    assign  ShOutC      =   Shamt5[2] ? {ShOutB[3:0], ShOutB[31:4]} : ShOutB;
    assign  ShOutD      =   Shamt5[1] ? {ShOutC[1:0], ShOutC[31:2]} : ShOutC;
    assign  ShOutROR    =   Shamt5[0] ? {ShOutD[0], ShOutD[31:1]} : ShOutD;
endmodule
