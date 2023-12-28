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
    output reg Issue,
    output reg [3:0] FlagW,
    output PCS,
    output reg RegW,
    output reg MemW, 
    output reg MemtoReg,
    output reg NoWrite,
    output reg ALUSrc,
    output reg [1:0] ImmSrc,
    output reg [3:0] RegSrc,
    output reg [4:0] Operation,
    output reg MS,
    output reg MCycleOp,
    output reg FPOp,
    output reg FPS
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
        RegSrc = 3'b000;
        ALUOp = 2'b00;
        MS = 1'b0;
        MCycleOp = 1'b0;
        FPOp = 1'b0;
        FPS = 1'b0;
        Issue = |Instr;
        casex (Op)
            2'b00: begin: _DP
                casex (Funct)
                    6'b0XXXXX: begin
                        if (Instr[7:4] == 4'b1001 && Instr[24:21] == 4'b0000) begin: _MUL
                            Branch = 1'b0;
                            MemtoReg = 1'b0;
                            MemW = 1'b0;
                            ALUSrc = 1'b0;
                            ImmSrc = 2'b00;
                            RegW = 1'b0;
                            RegSrc = 3'b100;
                            ALUOp = 2'b11;
                            MS = 1'b1;
                            MCycleOp = 1'b0;
                            FPOp = 1'b0;
                            FPS = 1'b0;
                        end
                        else begin: _DP_reg
                            Branch = 1'b0;
                            MemtoReg = 1'b0;
                            MemW = 1'b0;
                            ALUSrc = 1'b0;
                            ImmSrc = 2'b00;
                            RegW = 1'b1;
                            RegSrc = 3'b000;
                            ALUOp = 2'b11;
                            MS = 1'b0;
                            MCycleOp = 1'b0;
                            FPOp = 1'b0;
                            FPS = 1'b0;
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
                        FPOp = 1'b0;
                        FPS = 1'b0;
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
                        FPOp = 1'b0;
                        FPS = 1'b0;
                    end
                    
                    6'bXXXXX1: begin
                        if(Instr[25:20] == 6'b111111 && Instr[7:4] == 4'b1111) begin: _DIV
                            Branch = 1'b0;
                            MemtoReg = 1'b0;
                            MemW = 1'b0;
                            ALUSrc = 1'b0;
                            ImmSrc = 2'b01;
                            RegW = 1'b0;
                            RegSrc = 3'b100;
                            ALUOp = 2'b11;
                            MS = 1'b1;
                            MCycleOp = 1'b1;
                            FPOp = 1'b0;
                            FPS = 1'b0;
                        end
                        else begin: _LDR
                            Branch = 1'b0;
                            MemtoReg = 1'b1;
                            MemW = 1'b0;
                            ALUSrc = ~I_bar;
                            ImmSrc = 2'b01;
                            RegW = 1'b1;
                            RegSrc = 3'b000;
                            ALUOp = 2'b01;
                            MS = 1'b0;
                            MCycleOp = 1'b0;
                            FPOp = 1'b0;
                            FPS = 1'b0;
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
                        FPOp = 1'b0;
                        FPS = 1'b0;
                    end
                endcase
            end

            2'b11: begin: _FloatingPoint
                casex (Funct)
                    6'b100X11: begin: _FADDS
                        Branch = 1'b0;
                        MemtoReg = 1'b0;
                        MemW = 1'b0;
                        ALUSrc = 1'b0;
                        ImmSrc = 2'b10;
                        RegW = 1'b0;
                        RegSrc = 3'b000;
                        ALUOp = 2'b00;
                        MS = 1'b0;
                        MCycleOp = 1'b0;
                        FPOp = 1'b0;
                        FPS = 1'b1;
                    end

                    6'b100X10: begin: _FMULS
                        Branch = 1'b0;
                        MemtoReg = 1'b0;
                        MemW = 1'b0;
                        ALUSrc = 1'b0;
                        ImmSrc = 2'b10;
                        RegW = 1'b0;
                        RegSrc = 3'b000;
                        ALUOp = 2'b00;
                        MS = 1'b0;
                        MCycleOp = 1'b0;
                        FPOp = 1'b1;
                        FPS = 1'b1;
                    end
                endcase
            end
        endcase
    end
    
    
    
    always @(*) begin
        Operation = `ADD;
        FlagW = 4'b0000;
        NoWrite = 1'b0;

        if (MS) begin
            Operation = MCycleOp ? `DIV : `MUL;
            FlagW = 4'b0000;
            NoWrite = 1'b0;
        end
        else if (FPS) begin
            Operation = FPOp ? `FMUL : `FADD;
            FlagW = 4'b0000;
            NoWrite = 1'b0;
        end
        else begin
            case (ALUOp)
                2'b11: begin
                    case (Funct[4:1])
                        `AND: begin
                            Operation = `AND;
                            FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `EOR: begin
                            Operation = `EOR;
                            FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `SUB: begin
                            Operation = `SUB;
                            FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `RSB: begin
                            Operation = `RSB;
                            FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `ADD: begin
                            Operation = `ADD;
                            FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `ADC: begin
                            Operation = `ADC;
                            FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `SBC: begin
                            Operation = `SBC;
                            FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `RSC: begin
                            Operation = `RSC;
                            FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `TST: begin
                            if (Funct[0])   // TST with S bit clear is not a DP instruction
                                Operation = `TST;
                                FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                                NoWrite = 1'b1;
                        end
                        
                        `TEQ: begin
                            if (Funct[0])   // TEQ with S bit clear is not a DP instruction
                                Operation = `TEQ;
                            FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                            NoWrite = 1'b1;
                        end
                        
                        `CMP: begin
                            if (Funct[0])   // CMP with S bit clear is not a DP instruction
                                Operation = `CMP;
                            FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                            NoWrite = 1'b1;
                        end
                        
                        `CMN: begin
                            if (Funct[0])   // CMN with S bit clear is not a DP instruction
                                Operation = `CMN;
                            FlagW = Funct[0] ? 4'b1111 : 4'b0000;
                            NoWrite = 1'b1;
                        end
                        
                        `ORR: begin
                            Operation = `ORR;
                            FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `MOV: begin
                            Operation = `MOV;
                            FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `BIC: begin
                            Operation = `BIC;
                            FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        `MVN: begin
                            Operation = `MVN;
                            FlagW = Funct[0] ? 4'b1110 : 4'b0000;
                            NoWrite = 1'b0;
                        end
                    endcase
                end
                
                2'b01: begin: _Mem_offset
                    casex (Funct[4:1])
                        4'bX1XX: begin
                            Operation = Funct[0] ? `LDRP : `STRP;
                            FlagW = 4'b0000;
                            NoWrite = 1'b0;
                        end
                        
                        4'bX0XX: begin
                            Operation = Funct[0] ? `LDRN : `STRN;
                            FlagW = 4'b0000;
                            NoWrite = 1'b0;
                        end
                    endcase
                end
                
                2'b00: begin: _Branch_
                    Operation = `ADD;
                    FlagW = 4'b0000;
                    NoWrite = 1'b0;
                end
            endcase
        end
    end
    
    assign PCS = ((Rd == 4'd15) & RegW) | Branch;
endmodule
