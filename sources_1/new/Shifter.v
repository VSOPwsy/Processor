`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: Shifter
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module Shifter(
    input       [1:0]   Sh,
    input       [4:0]   Shamt5,
    input       [31:0]  ShIn,
    output reg  [31:0]  ShOut
    );
    
    wire [31:0] ShOutLSL;
    wire [31:0] ShOutLSR;
    wire [31:0] ShOutASR;
    wire [31:0] ShOutROR;
    
    LSL LSL(
        .ShIn       (ShIn       ),
        .Shamt5     (Shamt5     ),
        .ShOutLSL   (ShOutLSL   ));
        
    LSR LSR(
        .ShIn       (ShIn       ),
        .Shamt5     (Shamt5     ),
        .ShOutLSR   (ShOutLSR   ));
                
    ASR ASR(
        .ShIn       (ShIn       ),
        .Shamt5     (Shamt5     ),
        .ShOutASR   (ShOutASR   ));
        
    ROR ROR(
        .ShIn       (ShIn       ),
        .Shamt5     (Shamt5     ),
        .ShOutROR   (ShOutROR   ));
        
    always @(*) begin
        case (Sh)
            2'b00: ShOut = ShOutLSL;
            2'b01: ShOut = ShOutLSR;
            2'b10: ShOut = ShOutASR;
            2'b11: ShOut = ShOutROR;
        endcase
    end
endmodule
