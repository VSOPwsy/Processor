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
        INSTR_MEM[0] = 32'b1110_00_1_1010_1_0000_0001_000000000000;
        // DP with Immediate Src2
        INSTR_MEM[1] = 32'b0000_00_1_0100_0_0000_0001_000011110000;
        // DP with Immediate Src2 (Not Execute)
        INSTR_MEM[2] = 32'b0100_00_1_0100_0_0000_0001_000011110000;
        // STR
        INSTR_MEM[3] = 32'b1110_01_0_1100_0_0000_0001_000000000000;
        // LDR
        INSTR_MEM[4] = 32'b1110_01_0_1100_1_0000_0010_000000000000;
        
        // STR with shift
        INSTR_MEM[5] = 32'b1110_01_0_1100_0_0000_0010_000000000100;
        // LDR with shift
        INSTR_MEM[6] = 32'b1110_01_0_1100_1_0000_0011_000000000100;
        
        // Clear R0
        INSTR_MEM[7] = 32'b1110_00_0_0010_0_0000_0000_000000000000;
        // Set R0 to 4
        INSTR_MEM[8] = 32'b1110_00_1_0100_0_0000_0000_000000000100;
        
        
        for(i = 9; i < 128; i=i+1) begin
            INSTR_MEM[i] = 32'b0;
        end
    end
    
    assign Instr = INSTR_MEM[{2'b00, PC[31:2]}];
    
endmodule
