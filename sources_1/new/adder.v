`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: adder
// Project Name: ROM_Display
// Tool Versions: Vivado 2021.2
// Description: 
//      Four 4-bit CLA adder in series.
//////////////////////////////////////////////////////////////////////////////////


module adder #(
    parameter WIDTH = 32
)(
    input           cin,
    input   [WIDTH-1:0]  a,
    input   [WIDTH-1:0]  b,
    output  [WIDTH-1:0]  s,
    
    output          cout
    );

        assign {cout, s} = a + b + cin;
endmodule
