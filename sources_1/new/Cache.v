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
    parameter POLICY = `FIFO
)(
    // rc_ means reg to cache, cm_ means cache to memory
    input CLK,
    input Reset,
    input rc_RW,   // 0 for Read, 1 for Write
    input rc_Valid,
    input [31:0] rc_Addr,
    input [31:0] rc_WriteData,
    output [31:0] rc_ReadData,
    output rc_ReadReady,
    
    output cm_ReadValid,
    output cm_WriteValid,
    output [31:0] cm_WriteAddr,
    output [31:0] cm_WriteData,

    input cm_ReadReady,
    input [31:0] cm_ReadData,
    output [31:0] cm_ReadAddr
    );

    wire [1:0] Set_Addr;
    assign Set_Addr = rc_Addr[3:2];

    wire [3:0] Cache_rc_Valid;
    wire [3:0] Cache_rc_ReadReady;
    wire [4*32-1:0] Cache_rc_ReadData;
    wire [3:0] Cache_FIFO_we;
    wire [4*64-1:0] Cache_FIFO_wd;
    wire [4*32-1:0] Cache_cm_ReadAddr;
    wire [3:0] Cache_cm_ReadValid;
    wire [1:0] Cache_Write_Set_Addr;
    wire FIFO_re;
    wire FIFO_we;
    wire [63:0] FIFO_rd;
    wire [63:0] FIFO_wd;
    wire FIFO_empty;
    wire FIFO_full;
    

    FIFO FIFO(
        .re(FIFO_re),
        .rd(FIFO_rd),
        .we(FIFO_we),
        .wd(FIFO_wd),
        .empty(FIFO_empty),
        .full(FIFO_full));

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            Cache_1KB #(
                .POLICY         (POLICY     ),
                .SET_ID         (i[1:0]     )
            )Set(
                .CLK            (CLK                ),
                .Reset          (Reset              ),
                .rc_RW          (rc_RW              ),
                .rc_Addr        (rc_Addr            ),
                .rc_WriteData   (rc_WriteData       ),
                .rc_Valid       (Cache_rc_Valid[i]  ),
                .rc_ReadReady   (Cache_rc_ReadReady[i]              ),
                .rc_ReadData    (Cache_rc_ReadData[(i+1)*32-1-:32]  ),
                
                .FIFO_we        (Cache_FIFO_we[i]       ),
                .FIFO_wd        (Cache_FIFO_wd[(i+1)*64-1-:32]      ),
                .cm_ReadAddr    (Cache_cm_ReadAddr[(i+1)*32-1-:32]  ),
                .cm_ReadValid   (Cache_cm_ReadValid[i]  ),
                .cm_ReadReady   (cm_ReadReady           ),
                .cm_ReadData    (cm_ReadData            ),
                .FIFO_full      (FIFO_full              ));

            assign Cache_rc_Valid[i] = (Set_Addr == i) & rc_Valid;
        end
    endgenerate

    assign rc_ReadReady     =   |Cache_rc_ReadReady;
    assign rc_ReadData      =   Cache_rc_ReadData[(Set_Addr+1)*32-1-:32];
    assign FIFO_we          =   |Cache_FIFO_we;
    assign FIFO_wd          =   Cache_FIFO_wd[(Cache_Write_Set_Addr+1)*64-1-:64];
    assign cm_ReadAddr      =   Cache_cm_ReadAddr[(Set_Addr+1)*32-1-:32];
    assign cm_ReadValid     =   Cache_cm_ReadValid[Set_Addr];


    PriorityEncoder #(4) PriorityEncoder(
        .in(Cache_FIFO_we),
        .out(Cache_Write_Set_Addr),
        .none()
    );

endmodule
