`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/25 16:31:28
// Design Name: 
// Module Name: PeripheralConnector
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


`include "config.v"

module PeripheralConnector(
    input [31:0] ADDR,
    input [31:0] WD,
    input WE,
    output reg [31:0] RD,

    output LED_WE,
    output [31:0] LED_WD,

    input [31:0] DIP_RD,

    output SEG_WE,
    output [31:0] SEG_WD
    );

    wire dec_LED, dec_DIP, dec_SEG;
    assign dec_LED = ADDR == `LED;
    assign dec_DIP = ADDR == `DIP;
    assign dec_SEG = ADDR == `SEG;

    assign LED_WE = dec_LED & WE;
    assign LED_WD = WD;

    assign SEG_WE = dec_SEG & WE;
    assign SEG_WD = WD;

    always @(*) begin
        if (dec_DIP) begin
            RD = DIP_RD;
        end
        else begin
            RD = 32'b0;
        end
    end
endmodule
