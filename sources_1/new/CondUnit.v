`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: CondUnit
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module CondUnit(
    input CLK,
    input Reset,
    input [3:0] FlagW,
    input PCS,
    input RegW,
    input MemW,
    input [3:0] Cond,
    input [3:0] ALUControl,
    input [3:0] ALUFlags,
    input ShifterCarry,
    input NoWrite,
    input MS,
    input FPUS,
    output PCSrc,
    output RegWrite,
    output MemWrite,
    output CFlag,
    output MStart,
    output FPUStart
    );
    
    wire CondEx;
    reg N = 0, Z = 0, C = 0, V = 0;
    wire [3:0] FlagWrite;
    
    ConditionCheck CondCheck(
        .Cond(Cond),
        .Flags({N, Z, C, V}),
        .CondEx(CondEx)
        );
        
        
    assign PCSrc = PCS & CondEx;
    assign RegWrite = RegW & CondEx & ~NoWrite;
    assign MemWrite = MemW & CondEx;
    assign FlagWrite = FlagW & {4{CondEx}};
    assign MStart = MS & CondEx;
    assign FPUStart = FPUS & CondEx;

    always @(posedge CLK, posedge Reset) begin
        if (Reset)
            {N, Z, C, V} <= 4'b0;
        else begin
            N <= FlagWrite[3] ? ALUFlags[3] : N;
            Z <= FlagWrite[2] ? ALUFlags[2] : Z;
            if (FlagWrite[1]) begin
                if (ALUControl == `AND || ALUControl == `EOR || ALUControl == `TST || ALUControl == `TEQ || ALUControl == `ORR || ALUControl == `MOV || ALUControl == `BIC || ALUControl == `MVN)
                    C <= ShifterCarry;
                else
                    C <= ALUFlags[1];
            end
            else begin
                C <= C;
            end
            V <= FlagWrite[0] ? ALUFlags[0] : V;
        end
    end
    
    assign CFlag = C;
    
endmodule
