`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: DataMemory
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


`include "config.v"

module DataMemory(
    input CLK,
    input WE,
    input [31:0] A,
    input [31:0] WD,
    output reg [31:0] RD
    );
    
    reg [31:0] DATA_CONST_MEM [0:`DATA_CONST_ADDR_SIZE-1];
    reg [31:0] DATA_VAR_MEM [0:`DATA_VAR_ADDR_SIZE-1];

    integer i;
    initial begin
        for (i = 0; i <= `DATA_VAR_ADDR_SIZE; i = i + 1) begin
            DATA_VAR_MEM[i] = 32'b0;
        end
    end
    
    initial begin
        DATA_CONST_MEM[0] = 32'h00000810; 
        DATA_CONST_MEM[1] = 32'h00000820; 
        DATA_CONST_MEM[2] = 32'h00000830; 
        DATA_CONST_MEM[3] = 32'h00000003; 
        DATA_CONST_MEM[4] = 32'h00000001; 
        DATA_CONST_MEM[5] = 32'hFFFFFFFF; 
        DATA_CONST_MEM[6] = 32'hFFFFFEFA; 
        for (i = 7; i <= `DATA_CONST_ADDR_SIZE; i = i + 1) begin 
            DATA_CONST_MEM[i] = 32'b0; 
        end
    end

    wire dec_DATA_CONST, dec_DATA_VAR;
    assign dec_DATA_CONST		= (A >= `DATA_CONST_ADDR_LOW & A <= `DATA_CONST_ADDR_HIGH) ? 1'b1 : 1'b0;
    assign dec_DATA_VAR			= (A >= `DATA_VAR_ADDR_LOW & A <= `DATA_VAR_ADDR_HIGH) ? 1'b1 : 1'b0;

    always  @(*) begin
        if (dec_DATA_VAR)
            RD = DATA_VAR_MEM[A[`DATA_VAR_ADDR_WIDTH+2-1:2]]; 
        else if (dec_DATA_CONST)
            RD = DATA_CONST_MEM[A[`DATA_CONST_ADDR_WIDTH+2-1:2]]; 	
        else
            RD = 32'h0; 
    end
    

    always @(posedge CLK) begin
        if (WE & dec_DATA_VAR) 
            DATA_VAR_MEM[A[`DATA_VAR_ADDR_WIDTH+2-1:2]] <= WD ;
    end
    
endmodule
