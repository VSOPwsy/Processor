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
    input               CFlag,
    output reg  [31:0]  ShOut,
    output reg          ShifterCarry,
    output reg          ShifterCFlagNoWrite
    );
    
    wire [31:0] ShOutLSL;
    wire [31:0] ShOutLSR;
    wire [31:0] ShOutASR;
    wire [31:0] ShOutROR;
    wire CFlagNoWriteLSL;
    
    LSL LSL(
        .ShIn       (ShIn       ),
        .Shamt5     (Shamt5     ),
        .ShOutLSL   (ShOutLSL   ),
        .CarryLSL   (CarryLSL   ),
        .CFlagNoWriteLSL(CFlagNoWriteLSL));
        
    LSR LSR(
        .ShIn       (ShIn       ),
        .Shamt5     (Shamt5     ),
        .ShOutLSR   (ShOutLSR   ),
        .CarryLSR   (CarryLSR   ));
                
    ASR ASR(
        .ShIn       (ShIn       ),
        .Shamt5     (Shamt5     ),
        .ShOutASR   (ShOutASR   ),
        .CarryASR   (CarryASR   ));
        
    ROR ROR(
        .ShIn       (ShIn       ),
        .Shamt5     (Shamt5     ),
        .CFlag      (CFlag      ),
        .ShOutROR   (ShOutROR   ),
        .CarryROR   (CarryROR   ));
        
    always @(*) begin
        case (Sh)
            2'b00: begin
                ShOut = ShOutLSL;
                ShifterCarry = CarryLSL;
                ShifterCFlagNoWrite = CFlagNoWriteLSL;
            end

            2'b01: begin
                ShOut = ShOutLSR;
                ShifterCarry = CarryLSR;
                ShifterCFlagNoWrite = 0;
            end

            2'b10: begin
                ShOut = ShOutASR;
                ShifterCarry = CarryASR;
                ShifterCFlagNoWrite = 0;
            end

            2'b11: begin
                ShOut = ShOutROR;
                ShifterCarry = CarryROR;
                ShifterCFlagNoWrite = 0;
            end
        endcase
    end
endmodule
