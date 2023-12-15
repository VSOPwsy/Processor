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
//    initial begin
//			INSTR_MEM[0] = 32'hE59F11FC; 
//			INSTR_MEM[1] = 32'hE59F21F4; 
//			INSTR_MEM[2] = 32'hE59F31F8; 
//			INSTR_MEM[3] = 32'hE5914000; 
//			INSTR_MEM[4] = 32'hE5824000; 
//			INSTR_MEM[5] = 32'hE3A09000; 
//			INSTR_MEM[6] = 32'hE00B0999; 
//			INSTR_MEM[7] = 32'hE15B0004; 
//			INSTR_MEM[8] = 32'h8A000001; 
//			INSTR_MEM[9] = 32'hE2899001; 
//			INSTR_MEM[10] = 32'hEAFFFFFA; 
//			INSTR_MEM[11] = 32'hE2499001; 
//			INSTR_MEM[12] = 32'hE5839000; 
//			INSTR_MEM[13] = 32'hEAFFFFF4; 
//			for(i = 14; i < 128; i = i+1) begin 
//				INSTR_MEM[i] = 32'h0; 
//			end
//    end
    initial begin
			INSTR_MEM[0] = 32'hE59F1208; 
			INSTR_MEM[1] = 32'hE0020191; 
//			INSTR_MEM[1] = 32'hEE312A01; 
			INSTR_MEM[2] = 32'hEAFFFFFE; 
			for(i = 3; i < 128; i = i+1) begin 
				INSTR_MEM[i] = 32'h0; 
			end
    end
    
    assign Instr = INSTR_MEM[PC[31:2]];
    
endmodule
