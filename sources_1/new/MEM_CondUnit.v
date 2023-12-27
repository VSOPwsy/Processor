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


module MEM_CondUnit(
    input RegW,
    input [3:0] Cond,
    input Exec,
    input [3:0] Flags,
    output RegWrite,
    output MemWrite
    );
    
    wire CondEx;
    wire N = 0, Z = 0, C = 0, V = 0;
    assign {N, Z, C, V} = Flags;
    
    ConditionCheck CondCheck(
        .Cond(Cond),
        .Flags({N, Z, C, V}),
        .CondEx(CondEx)
        );
        
    assign RegWrite = RegW & CondEx & Exec;
    assign MemWrite = ~RegW & CondEx & Exec;
    
endmodule
