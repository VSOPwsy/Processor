`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/23 17:17:44
// Design Name: 
// Module Name: CondUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CondUnit(
    input CLK,
    input Reset,
    input [1:0] FlagW,
    input PCS,
    input RegW,
    input MemW,
    input [3:0] Cond,
    input [3:0] ALUFlags,
    input NoWrite,
    input MS,
    output PCSrc,
    output RegWrite,
    output MemWrite,
    output Carry,
    output MStart
    );
    
    wire CondEx;
    reg N = 0, Z = 0, C = 0, V = 0;
    wire [1:0] FlagWrite;
    
    ConditionCheck CondCheck(
        .Cond(Cond),
        .Flags({N, Z, C, V}),
        .CondEx(CondEx)
        );
        
        
    assign PCSrc = PCS & CondEx;
    assign RegWrite = RegW & CondEx & ~NoWrite;
    assign MemWrite = MemW & CondEx;
    assign FlagWrite = FlagW & {2{CondEx}};
    assign MStart = MS & CondEx;

    always @(posedge CLK, posedge Reset) begin
        if (Reset)
            {N, Z, C, V} <= 4'b0;
        else begin
            if (FlagWrite[1])
                {N, Z} <= ALUFlags[3:2];
            if (FlagWrite[0])
                {C, V} <= ALUFlags[1:0];
        end
    end
    
    assign Carry = C;
    
endmodule
