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

module DataMemory #(
    parameter TEST = 0
)(
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
        if (TEST == 0) begin
            DATA_CONST_MEM[0] = 32'h00000810; 
            DATA_CONST_MEM[1] = 32'h00000820; 
            DATA_CONST_MEM[2] = 32'h00000830; 
            DATA_CONST_MEM[3] = 32'h00000005; 
            DATA_CONST_MEM[4] = 32'h3FC00000; 
            DATA_CONST_MEM[5] = 32'h40500000; 
            DATA_CONST_MEM[6] = 32'h00000000; 
            for(i = 7; i < 128; i = i+1) begin 
                DATA_CONST_MEM[i] = 32'h0; 
            end
        end
        else begin
            DATA_CONST_MEM[0] = 32'h00000C00; 
            DATA_CONST_MEM[1] = 32'h00000C04; 
            DATA_CONST_MEM[2] = 32'h00000C18; 
            DATA_CONST_MEM[3] = 32'h00000000; 
            DATA_CONST_MEM[4] = 32'h3FC00111; 
    //        DATA_CONST_MEM[4] = 32'h00012345; 
            for(i = 5; i < 128; i = i+1) begin 
                DATA_CONST_MEM[i] = 32'h0; 
            end
        end
    end

    wire dec_r_DATA_CONST, dec_r_DATA_VAR;
    assign dec_r_DATA_CONST		= (ReadAddr >= `DATA_CONST_ADDR_LOW & ReadAddr <= `DATA_CONST_ADDR_HIGH) ? 1'b1 : 1'b0;
    assign dec_r_DATA_VAR		= (ReadAddr >= `DATA_VAR_ADDR_LOW & ReadAddr <= `DATA_VAR_ADDR_HIGH) ? 1'b1 : 1'b0;
    
    wire dec_w_DATA_VAR;
    assign dec_w_DATA_VAR       = (WriteAddr >= `DATA_VAR_ADDR_LOW & WriteAddr <= `DATA_VAR_ADDR_HIGH) ? 1'b1 : 1'b0;

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
            ReadData = 0;
        end
    end
    

    always @(posedge CLK) begin
        if (WriteValid & dec_w_DATA_VAR) 
            DATA_VAR_MEM[WriteAddr[`DATA_VAR_ADDR_WIDTH+2-1:2]] <= WriteData;
    end
    
    assign ReadReady = 1;
    
endmodule
