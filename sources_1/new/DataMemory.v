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
    input ReadValid,
    input [31:0] ReadAddr,
    output reg [31:0] ReadData,
    output ReadReady,
    
    input WriteValid,
    input [31:0] WriteAddr,
    input [31:0] WriteData
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
        DATA_CONST_MEM[0] = 32'h00000C00; 
        DATA_CONST_MEM[1] = 32'h00000C04; 
        DATA_CONST_MEM[2] = 32'h00000C18; 
        for(i = 3; i < 128; i = i+1) begin 
            DATA_CONST_MEM[i] = 32'h0; 
        end
    end

    wire dec_r_DATA_CONST, dec_r_DATA_VAR;
    assign dec_r_DATA_CONST		= (ReadAddr >= `DATA_CONST_ADDR_LOW & ReadAddr <= `DATA_CONST_ADDR_HIGH) ? 1'b1 : 1'b0;
    assign dec_r_DATA_VAR		= (ReadAddr >= `DATA_VAR_ADDR_LOW & ReadAddr <= `DATA_VAR_ADDR_HIGH) ? 1'b1 : 1'b0;
    
    wire dec_w_DATA_VAR;
    assign dec_w_DATA_VAR       = (WriteAddr >= `DATA_VAR_ADDR_LOW & WriteAddr <= `DATA_VAR_ADDR_HIGH) ? 1'b1 : 1'b0;

    reg [31:0] ReadData_reg;
    always @(posedge CLK) ReadData_reg <= ReadData;
    always @(*) begin
        if (ReadValid) begin
            if (dec_r_DATA_VAR)
                ReadData = DATA_VAR_MEM[ReadAddr[`DATA_VAR_ADDR_WIDTH+2-1:2]]; 
            else if (dec_r_DATA_CONST)
                ReadData = DATA_CONST_MEM[ReadAddr[`DATA_CONST_ADDR_WIDTH+2-1:2]]; 	
            else
                ReadData = 0; 
        end
        else begin
            ReadData = ReadData_reg;
        end
    end
    

    always @(posedge CLK) begin
        if (WriteValid & dec_w_DATA_VAR) 
            DATA_VAR_MEM[WriteAddr[`DATA_VAR_ADDR_WIDTH+2-1:2]] <= WriteData;
    end
    
    assign ReadReady = 1;
    
endmodule
