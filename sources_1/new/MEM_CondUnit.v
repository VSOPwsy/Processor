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
    
    ConditionCheck CondCheck(
        .Cond(Cond),
        .Flags(Flags),
        .CondEx(CondEx)
        );
        
    assign RegWrite = RegW & CondEx & Exec;
    assign MemWrite = ~RegW & CondEx & Exec;
    
endmodule
