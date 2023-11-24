`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: seg_display
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//      Display input data from segments.
//////////////////////////////////////////////////////////////////////////////////


module seg_display#(
    parameter CLK_FREQ = 100_000_000    
)(
    input           clk,
    input   [31:0]  data,
    output  [7:0]   anode,
    output  [6:0]   cathode,
    output          dp
    );
    
    localparam DELAY_1_MS = (CLK_FREQ / 1000) * 1 - 1; 
    reg     [2:0]   seg_index = 3'b0;
    reg     [31:0]  clk_cnt = 32'b0;
    reg     [6:0]   cathode_reg = 7'b0;
    
    always @(posedge clk) begin
        clk_cnt <= clk_cnt < DELAY_1_MS ? clk_cnt + 1 : 32'b0;
        seg_index <= clk_cnt == DELAY_1_MS ? seg_index + 1 : seg_index;
    end
    
    always @(*) begin
        case(data[4*seg_index+3-:4])
            4'h0: cathode_reg = 7'b100_0000;
            4'h1: cathode_reg = 7'b111_1001;
            4'h2: cathode_reg = 7'b010_0100;
            4'h3: cathode_reg = 7'b011_0000;
            4'h4: cathode_reg = 7'b001_1001;
            4'h5: cathode_reg = 7'b001_0010;
            4'h6: cathode_reg = 7'b000_0010;
            4'h7: cathode_reg = 7'b111_1000;
            4'h8: cathode_reg = 7'b000_0000;
            4'h9: cathode_reg = 7'b001_0000;
            4'ha: cathode_reg = 7'b000_1000;
            4'hb: cathode_reg = 7'b000_0011;
            4'hc: cathode_reg = 7'b100_0110;
            4'hd: cathode_reg = 7'b010_0001;
            4'he: cathode_reg = 7'b000_0110;
            4'hf: cathode_reg = 7'b000_1110;
        endcase
    end
    
    assign anode = ~(8'd1 << seg_index);
    assign cathode = cathode_reg;
    assign dp = 1'b1;
endmodule
