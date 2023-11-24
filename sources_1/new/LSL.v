`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: LSL
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module LSL(
    input   [31:0]      ShIn,
    input   [4:0]       Shamt5,
    output  [31:0]      ShOutLSL
    );
    
    wire [31:0] ShOutA;
    wire [31:0] ShOutB;
    wire [31:0] ShOutC;
    wire [31:0] ShOutD;
    
    assign  ShOutA      =   Shamt5[4] ? {ShIn[15:0], 16'b0} : ShIn;
    assign  ShOutB      =   Shamt5[3] ? {ShOutA[23:0], 8'b0} : ShOutA;
    assign  ShOutC      =   Shamt5[2] ? {ShOutB[27:0], 4'b0} : ShOutB;
    assign  ShOutD      =   Shamt5[1] ? {ShOutC[29:0], 2'b0} : ShOutC;
    assign  ShOutLSL    =   Shamt5[0] ? {ShOutD[30:0], 1'b0} : ShOutD;
endmodule
