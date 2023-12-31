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


module DP_CondUnit(
    input CLK,
    input Reset,
    input [3:0] FlagW,
    input PCS,
    input RegW,
    input MemW,
    input [3:0] Cond,
    input [3:0] Op,
    input [3:0] Flags,
    input NoWrite,
    output PCSrc,
    output [3:0] FlagWrite,
    output RegWrite,
    output MemWrite
    );
    
    wire CondEx;
    
    ConditionCheck CondCheck(
        .Cond(Cond),
        .Flags(Flags),
        .CondEx(CondEx)
        );
        
        
    assign PCSrc = PCS & CondEx;
    assign RegWrite = RegW & CondEx & ~NoWrite;
    assign MemWrite = MemW & CondEx;
    assign FlagWrite = FlagW & {4{CondEx}};
    
endmodule
