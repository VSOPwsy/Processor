`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: ProgramCounter
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module ProgramCounter(
    input CLK,
    input Reset,
    input EN,
    input PCSrc,
    input [31:0] Target,
    output reg [31:0] PC,
    output [31:0] PCPlus4
    );
    
    reg [31:0] next_PC;
    
    initial begin
        PC = 32'b0;
        next_PC = 32'b0;
    end
    always @(*)
        next_PC = PCSrc ? Target : PCPlus4;
    
    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            PC <= 32'b0;
        end
        else begin
            PC <= EN ? next_PC : PC;
        end
    end
    
    assign PCPlus4 = PC + 32'd4;
endmodule
