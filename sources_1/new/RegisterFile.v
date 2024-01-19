`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: RegisterFile
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module RegisterFile(
    input CLK_n,
    input Reset,
    input WE3,
    input [3:0] A1,
    input [3:0] A2,
    input [3:0] A3,
    input [31:0] WD3,
    input [31:0] R15,
    output [31:0] RD1,
    output [31:0] RD2
    );
    
    reg [31:0] RegBankCore[0:14];
    
    integer i;
    initial begin
        for (i = 0; i < 15; i = i + 1)
            RegBankCore[i] = 32'b0;
    end
    
    always @(posedge CLK_n, posedge Reset) begin
        if (Reset) begin
            RegBankCore[0] <= 32'b0;
            RegBankCore[1] <= 32'b0;
            RegBankCore[2] <= 32'b0;
            RegBankCore[3] <= 32'b0;
            RegBankCore[4] <= 32'b0;
            RegBankCore[5] <= 32'b0;
            RegBankCore[6] <= 32'b0;
            RegBankCore[7] <= 32'b0;
            RegBankCore[8] <= 32'b0;
            RegBankCore[9] <= 32'b0;
            RegBankCore[10] <= 32'b0;
            RegBankCore[11] <= 32'b0;
            RegBankCore[12] <= 32'b0;
            RegBankCore[13] <= 32'b0;
            RegBankCore[14] <= 32'b0;
        end
        else begin
            if (WE3 & (A3 != 4'd15))
                RegBankCore[A3] <= WD3;
        end
    end
    
    assign RD1 = A1 == 4'd15 ? R15 : RegBankCore[A1];
    assign RD2 = A2 == 4'd15 ? R15 : RegBankCore[A2];
    
    
    wire [31:0] R0, R1, R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15;
    assign R0 = RegBankCore[0];
    assign R1 = RegBankCore[1];
    assign R2 = RegBankCore[2];
    assign R3 = RegBankCore[3];
    assign R4 = RegBankCore[4];
    assign R5 = RegBankCore[5];
    assign R6 = RegBankCore[6];
    assign R7 = RegBankCore[7];
    assign R8 = RegBankCore[8];
    assign R9 = RegBankCore[9];
    
endmodule
