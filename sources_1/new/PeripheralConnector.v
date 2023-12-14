`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: PeripheralConnector
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


`include "config.v"

module PeripheralConnector(
    input [31:0] ADDR,
    input [31:0] WD,
    input WE,
    output reg [31:0] RD,

    output LED_WE,
    output [31:0] LED_WD,

    input [31:0] SW_RD,

    output SEG_WE,
    output [31:0] SEG_WD
    );

    wire dec_LED, dec_SW, dec_SEG;
    assign dec_LED = ADDR == `LED;
    assign dec_SW = ADDR == `SW;
    assign dec_SEG = ADDR == `SEG;

    assign LED_WE = dec_LED & WE;
    assign LED_WD = WD;

    assign SEG_WE = dec_SEG & WE;
    assign SEG_WD = WD;

    always @(*) begin
        if (dec_SW) begin
            RD = SW_RD;
        end
        else begin
            RD = 32'b0;
        end
    end
endmodule
