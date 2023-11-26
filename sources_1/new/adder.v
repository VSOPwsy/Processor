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


module adder(
    input           cin,
    input   [31:0]  a,
    input   [31:0]  b,
    output  [31:0]  s,
    
    output          cout
    );
    
    wire    [8:0]   c;
    assign c[0] = cin;
    assign cout = c[8];
    
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            adder_4_cla adder_4(
                .cin  (c[i]          ),
                .a    (a[4*i +: 4]   ),
                .b    (b[4*i +: 4]   ),
                .s    (s[4*i +: 4]   ),
                .cout (c[i+1]        ));
        end
    endgenerate
endmodule
