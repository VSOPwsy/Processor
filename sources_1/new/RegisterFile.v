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
    input WE5,
    input [3:0] A1,
    input [3:0] A2,
    input [3:0] A3,
    input [3:0] A4,
    input [3:0] A5,
    input [31:0] WD3,
    input [31:0] WD5,
    input [31:0] R15,
    output [31:0] RD1,
    output [31:0] RD2,
    output [31:0] RD4
    );
    
    reg [31:0] RegBankCore[0:14];
    
    integer i;
    initial begin
        for (i = 0; i < 15; i = i + 1)
            RegBankCore[i] = 32'b0;
    end
    
    always @(posedge CLK_n, posedge Reset) begin
        if (Reset) begin
            for (i = 0; i < 15; i = i + 1)
                RegBankCore[i] = 32'b0;
        end
        else begin
            if (WE3 & (A3 != 4'd15))
                RegBankCore[A3] <= WD3;
            if (WE5 & (A5 != 4'd15))
                RegBankCore[A5] <= WD5;
        end
    end
    
    assign RD1 = A1 == 4'd15 ? R15 : RegBankCore[A1];
    assign RD2 = A2 == 4'd15 ? R15 : RegBankCore[A2];
    assign RD4 = A4 == 4'd15 ? R15 : RegBankCore[A4];
endmodule
