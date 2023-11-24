`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: adder_4_cla
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//      4-bit CLA adder.
//////////////////////////////////////////////////////////////////////////////////


module adder_4_cla(
    input cin,
    input [3:0] a,
    input [3:0] b,
    output [3:0] s,
    output cout
    );
    
    wire [3:0] p;
    wire [3:0] g;
    wire [3:0] c;
    
    genvar i;
    
    generate
        for (i = 0; i < 4; i = i + 1) begin
            assign p[i] = a[i] ^ b[i];
            assign g[i] = a[i] & b[i];
            assign s[i] = c[i] ^ p[i];
        end
    endgenerate
    
    assign c[0] = cin;
    assign c[1] = p[0]&c[0]|g[0];
    assign c[2] = p[1]&(p[0]&c[0]|g[0])|g[1];
    assign c[3] = p[2]&(p[1]&(p[0]&c[0]|g[0])|g[1])|g[2];
    assign cout = p[3]&(p[2]&(p[1]&(p[0]&c[0]|g[0])|g[1])|g[2])|g[3];
    
    
    
endmodule
