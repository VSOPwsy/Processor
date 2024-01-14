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


module InstructionMemory #(
    parameter TEST = 0
)(
    input [31:0] PC,
    output [31:0] Instr
    );
    
    reg [31:0] INSTR_MEM [0:127];
    integer i;
    
    initial begin
        if (TEST == 0) begin
            INSTR_MEM[0] = 32'hE59F1204;
            INSTR_MEM[1] = 32'hE59F9204;
            INSTR_MEM[2] = 32'hE59F8204;
            INSTR_MEM[3] = 32'hE59F31EC;
            INSTR_MEM[4] = 32'hE59F41EC;
            INSTR_MEM[5] = 32'hE59FC1EC;
            
            INSTR_MEM[6] = 32'hE0815003; 
            INSTR_MEM[7] = 32'hE5835004;
            INSTR_MEM[8] = 32'hE0815005; 
            INSTR_MEM[9] = 32'hE5845000; 
            INSTR_MEM[10] = 32'hE5934004;
            INSTR_MEM[11] = 32'hE0456003;
            
            INSTR_MEM[12] = 32'hE0066004;
            INSTR_MEM[13] = 32'hE1816004;
            INSTR_MEM[14] = 32'hE0646006;
            INSTR_MEM[15] = 32'hE0986008;
            INSTR_MEM[16] = 32'hE0C56004;
            INSTR_MEM[17] = 32'hE0E46005;
            INSTR_MEM[18] = 32'hE1160001;
            INSTR_MEM[19] = 32'hE1360001;
            
            INSTR_MEM[20] = 32'hE1560003;
            INSTR_MEM[21] = 32'hE1760003;
            INSTR_MEM[22] = 32'hE0266001;
            INSTR_MEM[23] = 32'hE1E06001;
            INSTR_MEM[24] = 32'hE1C66008;
            
            INSTR_MEM[25] = 32'hE3A06009;
            
            INSTR_MEM[26] = 32'hE0070196;
            INSTR_MEM[27] = 32'hE59F31D4;
            INSTR_MEM[28] = 32'hE2933000;
            INSTR_MEM[29] = 32'h000A0791;
            INSTR_MEM[30] = 32'hE7FC0CFA;
            INSTR_MEM[31] = 32'h07FB06FC;
            
            INSTR_MEM[32] = 32'hEE79BA88;
            INSTR_MEM[33] = 32'hEE7BBAA9;

            INSTR_MEM[34] = 32'hEA000004;
            INSTR_MEM[35] = 32'hE0577007;
            INSTR_MEM[36] = 32'hE0577006;

            INSTR_MEM[37] = 32'h52933001;

            INSTR_MEM[38] = 32'hE3A0C009;
            INSTR_MEM[39] = 32'hE01C6608;

            INSTR_MEM[40] = 32'hE01C6628;

            INSTR_MEM[41] = 32'hE01C6C18;

            INSTR_MEM[42] = 32'hE3A0C020;
            INSTR_MEM[43] = 32'hE01C6C11;

            INSTR_MEM[44] = 32'hE3A0C009;
            INSTR_MEM[45] = 32'hE01C6C38;

            
            
			for(i = 46; i < 128; i = i+1) begin 
				INSTR_MEM[i] = 32'h0; 
			end
        end
        else if (TEST == 1) begin
            INSTR_MEM[0] = 32'hE59F11FC; 
			INSTR_MEM[1] = 32'hE59F21F4; 
			INSTR_MEM[2] = 32'hE59F31F8; 
			INSTR_MEM[3] = 32'hE5914000; 
			INSTR_MEM[4] = 32'hE5824000; 
			INSTR_MEM[5] = 32'hE3A09000; 
			INSTR_MEM[6] = 32'hE00B0999; 
			INSTR_MEM[7] = 32'hE15B0004; 
			INSTR_MEM[8] = 32'h8A000001; 
			INSTR_MEM[9] = 32'hE2899001; 
			INSTR_MEM[10] = 32'hEAFFFFFA; 
			INSTR_MEM[11] = 32'hE2499001; 
			INSTR_MEM[12] = 32'hE5839000; 
			INSTR_MEM[13] = 32'hEAFFFFF4; 
			for(i = 14; i < 128; i = i+1) begin 
				INSTR_MEM[i] = 32'h0; 
			end
        end
        else if (TEST == 2) begin
            INSTR_MEM[0] = 32'hE59F1208; 
			INSTR_MEM[1] = 32'hEE312A01; 
			INSTR_MEM[2] = 32'hEAFFFFFE; 
			for(i = 3; i < 128; i = i+1) begin 
				INSTR_MEM[i] = 32'h0; 
			end
        end
        else if (TEST == 3) begin: TASK_2
            INSTR_MEM[0] = 32'hE59F11FC;     // LDR R1, switches;
			INSTR_MEM[1] = 32'hE5914000;     // LDR R4, [R1, #0];
			INSTR_MEM[2] = 32'hE0050494;     // MUL R5, R4, R4;
			for(i = 3; i < 3 + 48; i = i+1) begin 
				INSTR_MEM[i] = 32'hE2866001; // R6 = 48;
			end
//			INSTR_MEM[51] = 32'hE2856001;     // ADD R6, R5, #1;
			for(i = 51; i < 128; i = i+1) begin 
				INSTR_MEM[i] = 32'h0; 
			end
        end
        else begin
            for(i = 3; i < 128; i = i+1) begin 
                INSTR_MEM[i] = 32'h0; 
            end
        end
    end
    
    
    
    assign Instr = INSTR_MEM[PC[31:2]];
    
endmodule
