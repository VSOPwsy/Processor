`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: Extend
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module Extend(
    input [1:0] ImmSrc,
    input [23:0] InstrImm,
    output reg [31:0] ExtImm,
    output reg ExtendCarry,
    output reg ExtendCFlagNoWrite
    );
    
    always @(*) begin
        case (ImmSrc)
            2'b00: begin
//                ExtImm = {24'b0, InstrImm[7:0]};
                ExtImm = ({24'b0, InstrImm[7:0]} >> (InstrImm[11:8] + InstrImm[11:8])) | ({24'b0, InstrImm[7:0]} << (32 - (InstrImm[11:8] + InstrImm[11:8])));
                ExtendCarry = ExtImm[31];
                ExtendCFlagNoWrite = InstrImm[11:8] == 4'b0;
            end
            2'b01: begin
                ExtImm = {20'b0, InstrImm[11:0]};
                ExtendCarry = 0;
                ExtendCFlagNoWrite = 0;
            end
            2'b10: begin
                ExtImm = {{6{InstrImm[23]}}, InstrImm, 2'b0};
                ExtendCarry = 0;
                ExtendCFlagNoWrite = 0;
            end
            default: begin
                ExtImm = 0;
                ExtendCarry = 0;
                ExtendCFlagNoWrite = 0;
            end
        endcase
    end
    
endmodule
