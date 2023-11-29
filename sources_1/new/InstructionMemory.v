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
			INSTR_MEM[0] = 32'hE59F1204; 
			INSTR_MEM[1] = 32'hE59F2204; 
			INSTR_MEM[2] = 32'hE59F31F0; 
			INSTR_MEM[3] = 32'hE59F41F0; 
			INSTR_MEM[4] = 32'hE59FC1F0; 
			INSTR_MEM[5] = 32'hE0815002; 
			INSTR_MEM[6] = 32'hE5835004; 
			INSTR_MEM[7] = 32'hE2833008; 
			INSTR_MEM[8] = 32'hE5135004; 
			INSTR_MEM[9] = 32'hE0426001; 
			INSTR_MEM[10] = 32'hE5046004; 
			INSTR_MEM[11] = 32'hE2444008; 
			INSTR_MEM[12] = 32'hE5946004; 
			INSTR_MEM[13] = 32'hE0070295;
			INSTR_MEM[14] = 32'hE59F81D4;
			INSTR_MEM[15] = 32'hE59F31D4;
			INSTR_MEM[16] = 32'h00070891;
			INSTR_MEM[17] = 32'hE2933000;
			INSTR_MEM[18] = 32'h000A0891;
			INSTR_MEM[19] = 32'hE09AA007;
			INSTR_MEM[20] = 32'hE7F707F8;
			INSTR_MEM[21] = 32'hE7F707F1;
			INSTR_MEM[22] = 32'h07F702F8;
			INSTR_MEM[23] = 32'hE2933000;
			INSTR_MEM[24] = 32'h07FB02F8;
			INSTR_MEM[25] = 32'hE08BB007; 
			INSTR_MEM[26] = 32'hE08BB00A; 
			INSTR_MEM[27] = 32'hE58CB000; 
			INSTR_MEM[28] = 32'hEAFFFFFE; 
        for(i = 29; i < 128; i = i+1) begin 
            INSTR_MEM[i] = 32'h0; 
        end
    end
    
    assign Instr = INSTR_MEM[PC[31:2]];
    
endmodule
