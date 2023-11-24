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
    output reg [31:0] ExtImm
    );
    
    always @(*) begin
        case (ImmSrc)
            2'b00:
//                ExtImm = {24'b0, InstrImm[7:0]};
                ExtImm = ({24'b0, InstrImm[7:0]} >> (InstrImm[11:8] + InstrImm[11:8])) | ({24'b0, InstrImm[7:0]} << (32 - (InstrImm[11:8] + InstrImm[11:8])));
            
            2'b01:
                ExtImm = {20'b0, InstrImm[11:0]};
            
            2'b10:
                ExtImm = {{6{InstrImm[23]}}, InstrImm, 2'b0};
        endcase
    end
    
endmodule
