`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: ALU
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


`include "config.v"

module ALU(
    input   [31:0]  SrcA,
    input   [31:0]  SrcB,
    input           Carry,
    input   [3:0]   ALUControl,
    
    output reg  [31:0]  ALUResult,
    output      [3:0]   ALUFlags
    );
    
    wire N, Z, C, V;
    assign ALUFlags = {N, Z, C, V};
    reg [31:0] a;
    reg [31:0] b;
    reg cin;
    wire cout;
    wire [31:0] s;
    
    always @(*) begin
        if (ALUControl == `SUB | ALUControl == `RSB | ALUControl == `CMP)
            cin = 1;
        else if (ALUControl == `ADC | ALUControl == `SBC | ALUControl == `RSC)
            cin = Carry;
        else
            cin = 0;
    end
    
    always @(*) begin
        case (ALUControl)
            `SUB: begin
                a = SrcA;
                b = ~SrcB;
            end
            
            `RSB: begin
                a = SrcB;
                b = ~SrcA;
            end
            
            `ADD: begin
                a = SrcA;
                b = SrcB;
            end
            
            `ADC: begin
                a = SrcA;
                b = SrcB;
            end
            
            `SBC: begin
                a = SrcA;
                b = ~SrcB;
            end
            
            `RSC: begin
                a = SrcB;
                b = ~SrcA;
            end
            
            `CMP: begin
                a = SrcA;
                b = ~SrcB;
            end
            
            `CMN: begin
                a = SrcA;
                b = SrcB;
            end
        endcase
    end
    
    adder adder(
        .cin(cin),
        .a(a),
        .b(b),
        .s(s),
        .cout(cout)
    );
    
    always @(*) begin
        casex (ALUControl)
            `AND: ALUResult = SrcA & SrcB;
            `EOR: ALUResult = SrcA ^ SrcB;
            `TST: ALUResult = SrcA & SrcB;
            `TEQ: ALUResult = SrcA ^ SrcB;
            `ORR: ALUResult = SrcA | SrcB;
            `MOV: ALUResult = SrcB;
            `BIC: ALUResult = SrcA &~SrcB;
            `MVN: ALUResult = ~SrcB;
            default: ALUResult = s;
        endcase
    end
    
    assign N = ALUResult[31];
    assign Z = ~|ALUResult;
    assign C = ~ALUControl[1] & cout;
    assign V = ~ALUControl[1] & (SrcA[31] ^ s[31]) & ~(ALUControl[0] ^ SrcA[31] ^ SrcB[31]);
endmodule
