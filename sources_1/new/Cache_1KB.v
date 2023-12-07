`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/27 00:04:15
// Design Name: 
// Module Name: Cache_1KB
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

`define     IDLE        1'b0
`define     READING     1'b1
`define     WRITING     1'b1    // For 2 different FSM

module Cache_1KB #(
    parameter POLICY = `FIFO
)(

    input CLK,
    input Reset,
    input rc_RW,   // 0 for Read, 1 for Write
    input rc_Valid,
    input [31:0] rc_Addr,
    input [31:0] rc_WriteData,
    output rc_Hit,
    output reg [31:0] rc_ReadData,

    output reg cm_ReadValid,
    output reg cm_WriteValid,
    output reg [31:0] cm_WriteData,
    output reg [27:0] cm_WriteTag,
    input cm_ReadReady,
    input [31:0] cm_ReadData,
    output reg [31:0] cm_ReadAddr
    );
    
    wire [7:0] Hit_Index;
    wire [7:0] RepPtr;
    wire [27:0] replaced_Tag;
    wire h;
    reg V [0:255];
    reg D [0:255];
    reg [31:0] DATA [0:255];
    integer i;

    initial begin
        rc_ReadData = 0;
        cm_ReadValid = 0;
        cm_WriteValid = 0;
        cm_WriteData = 0;
        cm_WriteTag = 0;
        cm_ReadAddr = 0;
    end
    

    RepPolicy #(
        .POLICY     (POLICY     )
    )RepPolicy(
        .CLK        (CLK        ),
        .Valid      (rc_Valid   ),
        .Hit        (rc_Hit     ),
        .Addr       (rc_Addr    ),
        .RepPtr     (RepPtr     ));


    TCAM TCAm(
        .CLK        (CLK        ),
        .Addr       (rc_Addr    ),
        .Valid      (rc_Valid   ),
        .RepPtr     (RepPtr     ),
        .h          (h          ),
        .Hit_Index  (Hit_Index  ),
        .replaced_Tag(replaced_Tag));

    assign rc_Hit = h & V[Hit_Index] & rc_Valid;

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            V[i] = 0;
            D[i] = 0;
            DATA[i] = 0;
        end
    end

    //////////////////////////////////////////////////////////////////
    // Read FSM
    //////////////////////////////////////////////////////////////////
    reg r_current_state, r_next_state;

    always @(posedge CLK) begin
        if (Reset) begin
            r_current_state <= `IDLE;
        end
        else begin
            r_current_state <= r_next_state;
        end
    end

    always @(*) begin
        case (r_current_state)
            `IDLE: begin
                if (rc_Valid & ~rc_Hit & ~rc_RW) begin
                    if (cm_ReadReady)
                        r_next_state = `IDLE;
                    else
                        r_next_state = `READING;
                end
                else begin
                    r_next_state = `IDLE;
                end
            end

            `READING: begin
                if (cm_ReadReady)
                    r_next_state = `IDLE;
                else
                    r_next_state = `READING;
            end
        endcase
    end

    always @(*) begin
        if ((r_current_state == `IDLE & rc_Valid & ~rc_Hit & ~rc_RW) | r_current_state == `READING) begin
            cm_ReadValid = 1;
            cm_ReadAddr = rc_Addr;
        end
        else begin
            cm_ReadValid = 0;
        end
    end


    //////////////////////////////////////////////////////////////////
    // Write to Memory
    //////////////////////////////////////////////////////////////////
    reg dirty_data_replace = 0;

    always @(*) begin
        if (rc_RW & rc_Valid) begin
            dirty_data_replace = D[RepPtr];
        end
        else if (r_current_state == `IDLE & rc_Valid & ~rc_Hit & ~rc_RW) begin
            dirty_data_replace = D[RepPtr];
        end
        else begin
            dirty_data_replace = 0;
        end
    end


    always @(*) begin
        if (dirty_data_replace) begin
            cm_WriteTag = replaced_Tag;
            cm_WriteData = DATA[RepPtr];
            cm_WriteValid = 1;
        end
        else begin
            cm_WriteValid = 0;
        end
    end


    //////////////////////////////////////////////////////////////////
    // Data Replace
    //////////////////////////////////////////////////////////////////
    always @(posedge CLK) begin
        if (rc_RW & rc_Valid) begin
            DATA[RepPtr] <= rc_WriteData;
            D[RepPtr] <= 1;
            V[RepPtr] <= 1;
        end
        else if (r_current_state == `READING & cm_ReadReady) begin
            DATA[RepPtr] <= cm_ReadData;
            V[RepPtr] <= 1;
        end
        else if (r_current_state == `IDLE & rc_Valid & ~rc_Hit & ~rc_RW & cm_ReadReady) begin
            DATA[RepPtr] <= cm_ReadData;
            V[RepPtr] <= 1;
        end
    end


    //////////////////////////////////////////////////////////////////
    // Data Readout
    //////////////////////////////////////////////////////////////////
    always @(*) begin
        if (rc_Hit & ~rc_RW) begin
            rc_ReadData = DATA[Hit_Index];
        end
        else begin
            rc_ReadData = 0;
        end
    end
    
    
endmodule
