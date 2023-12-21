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
    input           CFlag,
    input   [4:0]   Op,
    
    output reg  [31:0]  ALUResult,
    output      [3:0]   ALUFlags
    );
    
    wire N, Z, C, V;
    assign ALUFlags = {N, Z, C, V};
    reg [31:0] a;
    reg [31:0] b;
    reg cin;
    reg adder_en;
    reg adder_op;   // 0 for add, 1 for sub
    wire cout;
    wire [31:0] s;
    
    always @(*) begin
        case (Op)
            `SUB: begin
                a = SrcA;
                b = ~SrcB;
                cin = 1;
                adder_en = 1;
                adder_op = 1;
            end
            
            `RSB: begin
                a = SrcB;
                b = ~SrcA;
                cin = 1;
                adder_en = 1;
                adder_op = 1;
            end
            
            `ADD: begin
                a = SrcA;
                b = SrcB;
                cin = 0;
                adder_en = 1;
                adder_op = 0;
            end
            
            `ADC: begin
                a = SrcA;
                b = SrcB;
                cin = CFlag;
                adder_en = 1;
                adder_op = 0;
            end
            
            `SBC: begin
                a = SrcA;
                b = ~SrcB;
                cin = CFlag;
                adder_en = 1;
                adder_op = 1;
            end
            
            `RSC: begin
                a = SrcB;
                b = ~SrcA;
                cin = CFlag;
                adder_en = 1;
                adder_op = 1;
            end
            
            `CMP: begin
                a = SrcA;
                b = ~SrcB;
                cin = 1;
                adder_en = 1;
                adder_op = 1;
            end
            
            `CMN: begin
                a = SrcA;
                b = SrcB;
                cin = 0;
                adder_en = 1;
                adder_op = 0;
            end
            
            default: begin
                a = SrcA;
                b = SrcB;
                cin = 0;
                adder_en = 0;
                adder_op = 0;
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
        case (Op)
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
    assign C = adder_en & cout;
    assign V = adder_en & (SrcA[31] ^ s[31]) & ~(adder_op ^ SrcA[31] ^ SrcB[31]);
endmodule
