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
    output rc_Hit,
    
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

    wire [3:0] Cache_rc_Hit;
    wire [3:0] Cache_rc_Valid;
    wire [4*32-1:0] Cache_rc_ReadData;
    wire [3:0] Cache_cm_ReadValid;
    wire [3:0] Cache_cm_WriteValid;
    wire [4*32-1:0] Cache_cm_WriteData;
    wire [4*28-1:0] Cache_cm_WriteTag;
    wire [4*32-1:0] Cache_cm_ReadAddr;
    
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            Cache_1KB #(
                .POLICY         (POLICY     )
            )Set(
                .CLK            (CLK                ),
                .Reset          (Reset              ),
                .rc_RW          (rc_RW              ),
                .rc_Valid       (Cache_rc_Valid[i]  ),
                .rc_Addr        (rc_Addr            ),
                .rc_WriteData   (rc_WriteData       ),
                .rc_Hit         (Cache_rc_Hit[i]    ),
                .rc_ReadData    (Cache_rc_ReadData[(i+1)*32-1-:32]),
                
                .cm_ReadValid   (Cache_cm_ReadValid[i]  ),
                .cm_WriteValid  (Cache_cm_WriteValid[i] ),
                .cm_ReadReady   (cm_ReadReady           ),
                .cm_ReadData    (cm_ReadData            ),
                .cm_WriteTag    (Cache_cm_WriteTag[(i+1)*28-1-:28]),
                .cm_WriteData   (Cache_cm_WriteData[(i+1)*32-1-:32]),
                .cm_ReadAddr    (Cache_cm_ReadAddr[(i+1)*32-1-:32]));

            assign Cache_rc_Valid[i] = (Set_Addr == i) & rc_Valid;
        end
    endgenerate

    assign rc_ReadData      =   Cache_rc_ReadData[(Set_Addr+1)*32-1-:32];
    assign cm_ReadAddr      =   Cache_cm_ReadAddr[(Set_Addr+1)*32-1-:32];
    assign cm_ReadValid     =   Cache_cm_ReadValid[Set_Addr];
    assign cm_WriteValid    =   Cache_cm_WriteValid[Set_Addr];
    assign cm_WriteAddr     =   {Cache_cm_WriteTag[(Set_Addr+1)*28-1-:28], Set_Addr, 2'b0};
    assign cm_WriteData     =   Cache_cm_WriteData[(Set_Addr+1)*32-1-:32];

    assign rc_Hit = |Cache_rc_Hit;

endmodule
