`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: ASR
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module ASR(
    input   [31:0]      ShIn,
    input   [4:0]       Shamt5,
    output  [31:0]      ShOutASR,
    output              CarryASR
    );
    
    wire [31:0] ShOutA;
    wire [31:0] ShOutB;
    wire [31:0] ShOutC;
    wire [31:0] ShOutD;
    wire [31:0] ShOutE;
    
    assign  ShOutA      =   Shamt5[4] ? {{16{ShIn[31]}}, ShIn[31:16]} : ShIn;
    assign  ShOutB      =   Shamt5[3] ? {{8{ShOutA[31]}},  ShOutA[31:8]} : ShOutA;
    assign  ShOutC      =   Shamt5[2] ? {{4{ShOutB[31]}},  ShOutB[31:4]} : ShOutB;
    assign  ShOutD      =   Shamt5[1] ? {{2{ShOutC[31]}},  ShOutC[31:2]} : ShOutC;
    assign  ShOutE      =   Shamt5[0] ? {{1{ShOutD[31]}},  ShOutD[31:1]} : ShOutD;

    assign  ShOutASR    =   Shamt5 == 0 ? (ShIn[31] == 0 ? 0 : 32'hFFFFFFFF) : ShOutE;
    assign  CarryASR    =   Shamt5 == 0 ? ShIn[31] : ShIn[Shamt5 - 1];
endmodule
