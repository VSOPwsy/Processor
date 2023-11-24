`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Module Name: Core
// Project Name: 
// Tool Versions: 
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module Extend_tb;

reg [11:0] Imm12;
wire [31:0] ExtImm;

Extend uut(.Imm12(Imm12), .ExtImm(ExtImm));

initial begin
    Imm12 = {4'h0, 8'hFF};
    #100;
    Imm12 = {4'b0010, 8'hFF};
    #100;
    Imm12 = {4'b0100, 8'hFF};
    #100;
    $finish;
end
endmodule
