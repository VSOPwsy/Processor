`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: MemOrIO
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


`include "config.v"

module MemOrIO(
    input we,

    input   [31:0]  addr_in,
    output          dec_mem,
    
    input   [31:0]  m_rdata,
    output  [31:0]  m_wdata,
    output  [31:0]  m_addr,
    output          m_we,
    
    input   [31:0]  r_rdata,
    output  [31:0]  r_wdata,
    
    input   [31:0]  io_rdata,
    output  [31:0]  io_wdata,
    output  [31:0]  io_addr,
    output          io_we
    );
    
    
    wire dec_DATA_MEM, dec_IO;
    assign dec_DATA_MEM		= (addr_in >= `DATA_ADDR_LOW & addr_in <= `DATA_ADDR_HIGH) ? 1'b1 : 1'b0;
    assign dec_IO			= (addr_in >= `PERIPHERAL_ADDR_LOW & addr_in <= `PERIPHERAL_ADDR_HIGH) ? 1'b1 : 1'b0;

    assign dec_mem = dec_DATA_MEM;

    assign m_we = we & dec_DATA_MEM;
    assign io_we = we & dec_IO;

    assign m_addr = dec_DATA_MEM ? addr_in : 32'b0;
    assign io_addr = dec_IO ? addr_in : 32'b0;

    assign m_wdata = r_rdata;
    assign io_wdata = r_rdata;

    assign r_wdata = dec_DATA_MEM ? m_rdata : dec_IO ? io_rdata : 32'b0;
endmodule
