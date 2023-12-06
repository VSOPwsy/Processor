`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/26 23:57:23
// Design Name: 
// Module Name: Cache
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

module Cache #(
    parameter TOTAL_CACHE_SIZE_KB = 4,
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter POLICY = `FIFO
)(
    // rc_ means reg to cache, cm_ means cache to memory
    input CLK,
    input Reset,
    input rc_RW,   // 0 for Read, 1 for Write
    input rc_Valid,
    input [ADDR_WIDTH-1:0] rc_Addr,
    input [DATA_WIDTH-1:0] rc_WriteData,
    output [DATA_WIDTH-1:0] rc_ReadData,
    output rc_Hit,
    
    output cm_ReadValid,
    output cm_WriteValid,
    output [ADDR_WIDTH-1:0] cm_WriteAddr,
    output [DATA_WIDTH-1:0] cm_WriteData,

    input cm_ReadReady,
    input [DATA_WIDTH-1:0] cm_ReadData,
    output [ADDR_WIDTH-1:0] cm_ReadAddr
    );
    
    localparam WAY_NUM = TOTAL_CACHE_SIZE_KB;
    localparam OFFSET_WIDTH = $clog2(DATA_WIDTH/4);
    localparam TAG_WIDTH = ADDR_WIDTH - ($clog2(WAY_NUM) + $clog2(DATA_WIDTH/8));

    wire [$clog2(TOTAL_CACHE_SIZE_KB)-1:0] Set_Addr;
    assign Set_Addr = rc_Addr[$clog2(TOTAL_CACHE_SIZE_KB)+$clog2(DATA_WIDTH/8)-1:$clog2(DATA_WIDTH/8)];

    wire [TOTAL_CACHE_SIZE_KB-1:0] Cache_rc_Hit;
    wire [TOTAL_CACHE_SIZE_KB-1:0] Cache_rc_Valid;
    wire [TOTAL_CACHE_SIZE_KB*DATA_WIDTH-1:0] Cache_rc_ReadData;
    wire [TOTAL_CACHE_SIZE_KB-1:0] Cache_cm_ReadValid;
    wire [TOTAL_CACHE_SIZE_KB-1:0] Cache_cm_WriteValid;
    wire [TOTAL_CACHE_SIZE_KB*DATA_WIDTH-1:0] Cache_cm_WriteData;
    wire [TOTAL_CACHE_SIZE_KB*TAG_WIDTH-1:0] Cache_cm_WriteTag;
    wire [TOTAL_CACHE_SIZE_KB*ADDR_WIDTH-1:0] Cache_cm_ReadAddr;
    
    genvar i;
    generate
        for (i = 0; i < TOTAL_CACHE_SIZE_KB; i = i + 1) begin
            Cache_1KB #(
                .TOTAL_CACHE_SIZE_KB(TOTAL_CACHE_SIZE_KB),
                .ADDR_WIDTH     (ADDR_WIDTH ),
                .DATA_WIDTH     (DATA_WIDTH ),
                .POLICY         (POLICY     )
            )Set(
                .CLK            (CLK                ),
                .Reset          (Reset              ),
                .rc_RW          (rc_RW              ),
                .rc_Valid       (Cache_rc_Valid[i]  ),
                .rc_Addr        (rc_Addr            ),
                .rc_WriteData   (rc_WriteData       ),
                .rc_Hit         (Cache_rc_Hit[i]    ),
                .rc_ReadData    (Cache_rc_ReadData[(i+1)*DATA_WIDTH-1-:DATA_WIDTH]),
                
                .cm_ReadValid   (Cache_cm_ReadValid[i]  ),
                .cm_WriteValid  (Cache_cm_WriteValid[i] ),
                .cm_ReadReady   (cm_ReadReady           ),
                .cm_ReadData    (cm_ReadData            ),
                .cm_WriteTag    (Cache_cm_WriteTag[(i+1)*TAG_WIDTH-1-:TAG_WIDTH]    ),
                .cm_WriteData   (Cache_cm_WriteData[(i+1)*DATA_WIDTH-1-:DATA_WIDTH] ),
                .cm_ReadAddr    (Cache_cm_ReadAddr[(i+1)*ADDR_WIDTH-1-:ADDR_WIDTH]  ));

            assign Cache_rc_Valid[i] = (Set_Addr == i) & rc_Valid;
        end
    endgenerate

    assign rc_ReadData      =   Cache_rc_ReadData[(Set_Addr+1)*DATA_WIDTH-1-:DATA_WIDTH];
    assign cm_ReadAddr      =   Cache_cm_ReadAddr[(Set_Addr+1)*ADDR_WIDTH-1-:ADDR_WIDTH];
    assign cm_ReadValid     =   Cache_cm_ReadValid[Set_Addr];
    assign cm_WriteValid    =   Cache_cm_WriteValid[Set_Addr];
    assign cm_WriteAddr     =   {Cache_cm_WriteTag[(Set_Addr+1)*TAG_WIDTH-1-:TAG_WIDTH], Set_Addr, {OFFSET_WIDTH{1'b0}}};
    assign cm_WriteData     =   Cache_cm_WriteData[(Set_Addr+1)*DATA_WIDTH-1-:DATA_WIDTH];

    assign rc_Hit = |Cache_rc_Hit;

endmodule
