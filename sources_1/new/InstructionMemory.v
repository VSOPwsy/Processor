`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: InstructionMemory
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module InstructionMemory(
    input [31:0] PC,
    output [31:0] Instr
    );
    
    reg [31:0] INSTR_MEM [0:127];
    integer i;
    initial begin
        INSTR_MEM[0] = 32'hE5909C04;    //   LOOP:  LDR  R9,  DIP
        INSTR_MEM[1] = 32'hE5809C00;    //          STR  R9,  LED
        INSTR_MEM[2] = 32'hE5809C18;    //          STR  R9,  SEG
        INSTR_MEM[3] = 32'hEAFFFFFB;    //          B    LOOP
        for(i = 4; i < 128; i = i+1) begin 
            INSTR_MEM[i] = 32'h0; 
        end
    end
    
    assign Instr = INSTR_MEM[PC[31:2]];
    
endmodule
