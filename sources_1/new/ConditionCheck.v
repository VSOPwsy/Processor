`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: ConditionCheck
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module ConditionCheck(
    input [3:0] Cond,
    input [3:0] Flags,
    output reg CondEx
    );
    
    wire N, Z, C, V;
    
    assign {N, Z, C, V} = Flags;
    
    always @(*) begin
        case (Cond)
            4'b0000: CondEx = Z;
            4'b0001: CondEx = ~Z;
            4'b0010: CondEx = C;
            4'b0011: CondEx = ~C;
            4'b0100: CondEx = N;
            4'b0101: CondEx = ~N;
            4'b0110: CondEx = V;
            4'b0111: CondEx = ~V;
            4'b1000: CondEx = ~Z & C;
            4'b1001: CondEx = Z | (~C);
            4'b1010: CondEx = ~(N ^ V);
            4'b1011: CondEx = N ^ V;
            4'b1100: CondEx = ~Z & ~(N ^ V);
            4'b1101: CondEx = Z | (N ^ V);
            4'b1110: CondEx = 1'b1;
        endcase
    end
endmodule
