`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/19 19:25:52
// Design Name: 
// Module Name: ControlUnit_tb
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


module ControlUnit_tb;

reg CLK;
reg [31:0] Instr;
reg [3:0] ALUFlags;

wire PCSrc;     
wire RegWrite;  
wire MemWrite;  
wire MemtoReg;  
wire ALUSrc;    
wire [1:0] ImmSrc;    
wire [1:0] RegSrc;    
wire [1:0] ALUControl;


ControlUnit ControlUnit(
    .CLK        (CLK        ),
    .Instr      (Instr      ),
    .ALUFlags   (ALUFlags   ),
    .ALUControl (ALUControl ),
    .ALUSrc     (ALUSrc     ),
    .ImmSrc     (ImmSrc     ),
    .MemWrite   (MemWrite   ),
    .MemtoReg   (MemtoReg   ),
    .PCSrc      (PCSrc      ),
    .RegSrc     (RegSrc     ),
    .RegWrite   (RegWrite   ));
    
    
initial begin
    CLK = 0;
    forever #5 CLK=~CLK;
end


initial begin
    ALUFlags = 4'b0100;
end


initial begin
    // Set flags
    Instr = 32'b1110_00_1_1010_1_0000_0001_000000000000;
    #10;
    // DP with Immediate Src2
    Instr = 32'b0000_00_1_0100_0_0000_0001_000011110000;
    #10;
    // DP with Immediate Src2 (Not Execute)
    Instr = 32'b0100_00_1_0100_0_0000_0001_000011110000;
    #10;
    
    $finish;
end
endmodule
