`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: ControlUnit
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


`include "config.v"

module ControlUnit(
    input [31:0] Instr,
    output reg [3:0] FlagW,
    output PCS,
    output reg RegW,
    output reg MemW, 
    output reg MemtoReg,
    output reg NoWrite,
    output reg ALUSrc,
    output reg [1:0] ImmSrc,
    output reg [3:0] RegSrc,
    output reg [3:0] ALUControl,
    output reg MS,
    output reg MCycleOp,
    output reg FPUS,
    output reg FPUOp
    );
    
    reg Branch;
    reg [1:0] ALUOp;
    
    wire [1:0] Op;
    wire [5:0] Funct;
    wire [3:0] Rd;
    assign Op = Instr[27:26];
    assign Funct = Instr[25:20];
    assign Rd = Instr[15:12];
    
    wire I_bar, P, U, B, W, L;
    assign {I_bar, P, U, B, W, L} = Funct;
    
    
    
    always @(*) begin
        Branch = 1'b0;
        MemtoReg = 1'b0;
        MemW = 1'b0;
        ALUSrc = 1'b1;
        ImmSrc = 2'b10;
        RegW = 1'b0;
        RegSrc = 3'b001;
        ALUOp = 2'b00;
        MS = 1'b0;
        MCycleOp = 1'b0;
        casex (Op)
            2'b00: begin: _DP
                casex (Funct)
                    6'b0XXXXX: begin
                        if (Instr[7:4] == 4'b1001 && Instr[24:21] == 4'b0000) begin: _MUL
                            Branch = 1'b0;
                            MemtoReg = 1'b0;
                            MemW = 1'b0;
                            ALUSrc = 2'b10;
                            ImmSrc = 2'b00;
                            RegW = 1'b0;
                            RegSrc = 3'b100;
                            ALUOp = 2'b11;
                            MS = 1'b1;
                            MCycleOp = 1'b0;
                        end
                        else begin: _DP_reg
                            Branch = 1'b0;
                            MemtoReg = 1'b0;
                            MemW = 1'b0;
                            ALUSrc = 2'b00;
                            ImmSrc = 2'b00;
                            RegW = 1'b1;
                            RegSrc = 3'b000;
                            ALUOp = 2'b11;
                            MS = 1'b0;
                            MCycleOp = 1'b0;
                        end
                    end
                    
                    6'b1XXXXX: begin: _DP_imm
                        Branch = 1'b0;
                        MemtoReg = 1'b0;
                        MemW = 1'b0;
                        ALUSrc = 1'b1;
                        ImmSrc = 2'b00;
                        RegW = 1'b1;
                        RegSrc = 3'b000;
                        ALUOp = 2'b11;
                        MS = 1'b0;
                        MCycleOp = 1'b0;
                    end
                endcase
            end
            
            2'b01: begin: _Mem
                casex (Funct)
                    6'bXXXXX0: begin: _STR
                        Branch = 1'b0;
                        MemtoReg = 1'b0;
                        MemW = 1'b1;
                        ALUSrc = ~I_bar;
                        ImmSrc = 2'b01;
                        RegW = 1'b0;
                        RegSrc = 2'b10;
                        ALUOp = 2'b01;
                        MS = 1'b0;
                        MCycleOp = 1'b0;
                    end
                    
                    6'bXXXXX1: begin
                        if(Instr[25:20] == 6'b111111 && Instr[7:4] == 4'b1111) begin: _DIV
                            Branch = 1'b0;
                            MemtoReg = 1'b0;
                            MemW = 1'b0;
                            ALUSrc = 2'b10;
                            ImmSrc = 2'b01;
                            RegW = 1'b0;
                            RegSrc = 3'b100;
                            ALUOp = 2'b11;
                            MS = 1'b1;
                            MCycleOp = 1'b1;
                        end
                        else begin: _LDR
                            Branch = 1'b0;
                            MemtoReg = 1'b1;
                            MemW = 1'b0;
                            ALUSrc = {1'b0, ~I_bar};
                            ImmSrc = 2'b01;
                            RegW = 1'b1;
                            RegSrc = 3'b000;
                            ALUOp = 2'b01;
                            MS = 1'b0;
                            MCycleOp = 1'b0;
                        end
                    end
                endcase
            end
            
            2'b10: begin: _Branch
                casex (Funct)
                    6'bXXXXXX: begin: _B
                        Branch = 1'b1;
                        MemtoReg = 1'b0;
                        MemW = 1'b0;
                        ALUSrc = 1'b1;
                        ImmSrc = 2'b10;
                        RegW = 1'b0;
                        RegSrc = 3'b001;
                        ALUOp = 2'b00;
                        MS = 1'b0;
                        MCycleOp = 1'b0;
                    end
                endcase
            end

            2'b11: begin: _Float
                casex (Funct)
                    6'b100X11: begin: _FADDS
                        
                    end
                endcase
            end
        endcase
    end
    
    
    
    always @(*) begin
        ALUControl = `ADD;
        FlagW = 4'b0000;
        NoWrite = 1'b0;
        case (ALUOp)
            2'b11: begin
                case (Funct[4:1])
                    `AND: begin
                        ALUControl = `AND;
                        FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `EOR: begin
                        ALUControl = `EOR;
                        FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `SUB: begin
                        ALUControl = `SUB;
                        FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `RSB: begin
                        ALUControl = `RSB;
                        FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `ADD: begin
                        ALUControl = `ADD;
                        FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `ADC: begin
                        ALUControl = `ADC;
                        FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `SBC: begin
                        ALUControl = `SBC;
                        FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `RSC: begin
                        ALUControl = `RSC;
                        FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `TST: begin
                        if (Funct[0])   // TST with S bit clear is not a DP instruction
                            ALUControl = `TST;
                            FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                            NoWrite = 1'b1;
                    end
                    
                    `TEQ: begin
                        if (Funct[0])   // TEQ with S bit clear is not a DP instruction
                            ALUControl = `TEQ;
                        FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                        NoWrite = 1'b1;
                    end
                    
                    `CMP: begin
                        if (Funct[0])   // CMP with S bit clear is not a DP instruction
                            ALUControl = `CMP;
                        FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                        NoWrite = 1'b1;
                    end
                    
                    `CMN: begin
                        if (Funct[0])   // CMN with S bit clear is not a DP instruction
                            ALUControl = `CMN;
                        FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                        NoWrite = 1'b1;
                    end
                    
                    `ORR: begin
                        ALUControl = `ORR;
                        FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `MOV: begin
                        ALUControl = `MOV;
                        FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `BIC: begin
                        ALUControl = `BIC;
                        FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    `MVN: begin
                        ALUControl = `MVN;
                        FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                        NoWrite = 1'b0;
                    end
                endcase
            end
            
            2'b01: begin: _Mem_offset
                casex (Funct[4:1])
                    4'bX1XX: begin
                        ALUControl = `ADD;
                        FlagW = 4'b0000;
                        NoWrite = 1'b0;
                    end
                    
                    4'bX0XX: begin
                        ALUControl = `SUB;
                        FlagW = 4'b0000;
                        NoWrite = 1'b0;
                    end
                endcase
            end
            
            2'b00: begin: _Branch_
                ALUControl = `ADD;
                FlagW = 4'b0000;
                NoWrite = 1'b0;
            end
        endcase
    end
    
    assign PCS = ((Rd == 4'd15) & RegW) | Branch;
endmodule
