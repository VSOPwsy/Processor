`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: CondUnit
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module FP_CondUnit(
    input CLK,
    input Reset,
    input [3:0] FlagW,
    input [3:0] Cond,
    input [3:0] Flags,
    input FPS,
    output [3:0] FlagWrite,
    output FPStart
    );
    
    wire CondEx;
    
    ConditionCheck CondCheck(
        .Cond(Cond),
        .Flags(Flags),
        .CondEx(CondEx)
        );
        
        
    assign FlagWrite = FlagW & {4{CondEx}};
    assign FPStart = FPS & CondEx;
    
endmodule
