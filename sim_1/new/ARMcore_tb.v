`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/19 20:20:14
// Design Name: 
// Module Name: ARMcore_tb
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


module ARMcore_tb;

reg CLK;    
reg Reset;    
reg Instr;    
reg ReadData;


wire MemWrite; 
wire PC;       
wire ALUResult;
wire WriteData;

ARMcore uut(
    .CLK(CLK),
    .Reset(Reset),
    .Instr(Instr),
    .ReadData(ReadData),
    .MemWrite(MemWrite),
    .PC(PC),
    .ALUResult(ALUResult),
    .WriteData(WriteData)
); 


initial begin
    CLK = 1;
    forever #5 CLK=~CLK;
end


initial begin
    Reset = 1'b1;
    #10;
    Reset = 1'b0;
    #150;
    $finish;
end
 
endmodule
