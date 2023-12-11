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

`define     IDLE                2'b00
`define     WAITING_TCAM        2'b01
`define     READING_MAIN_MEM    2'b10
`define     WAITING_FIFO        2'b11

module Cache_1KB #(
    parameter POLICY = `FIFO,
    parameter SET_ID = 2'b00
)(

    input CLK,
    input Reset,
    input rc_RW,   // 0 for Read, 1 for Write
    input rc_Valid,
    input [31:0] rc_Addr,
    input [31:0] rc_WriteData,
    output reg [31:0] rc_ReadData,
    output reg rc_ReadReady,

    output reg cm_ReadValid,
    output reg [63:0] FIFO_wd,
    output reg FIFO_we,
    input cm_ReadReady,
    input [31:0] cm_ReadData,
    output reg [31:0] cm_ReadAddr,

    input FIFO_full
    );
    
    reg RW_reg;
    reg [31:0] Addr_reg;
    reg [31:0] WriteData_reg;
    wire [7:0] TCAM_hit_index;
    wire [7:0] RepPtr;
    reg ptr_update;
    reg tag_update;
    wire [27:0] replaced_Tag;
    wire found;
    reg V [0:255];
    reg D [0:255];
    reg [31:0] DATA [0:255];
    integer i;

    initial begin
        RW_reg = 0;
        Addr_reg = 0;
        WriteData_reg = 0;
        ptr_update = 0;
        tag_update = 0;
        rc_ReadData = 0;
        cm_ReadValid = 0;
        cm_ReadAddr = 0;
    end
    

    RepPolicy #(
        .POLICY     (POLICY     )
    )RepPolicy(
        .CLK        (CLK        ),
        .update     (ptr_update ),
        .RepPtr     (RepPtr     ));


    reg TCAM_valid;

    TCAM TCAM(
        .CLK        (CLK                ),
        .tag_in     (Addr_reg[31-:28]   ),
        .tag_update (tag_update         ),
        .valid      (TCAM_valid         ),
        .ready      (TCAM_ready         ),
        .RepPtr     (RepPtr             ),
        .found      (found              ),
        .hit_index  (TCAM_hit_index     ),
        .replaced_Tag(replaced_Tag      ));

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            V[i] = 0;
            D[i] = 0;
            DATA[i] = 0;
        end
    end

    //////////////////////////////////////////////////////////////////
    ////// FSM
    //////////////////////////////////////////////////////////////////
    reg current_state, next_state;

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            current_state <= `IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
            `IDLE: begin
                if (rc_Valid) begin
                    next_state = `WAITING_TCAM;
                end
                else begin
                    next_state = `IDLE;
                end
            end

            `WAITING_TCAM: begin
                if (TCAM_ready) begin
                    if (found) begin
                        if (~RW_reg) begin
                            if (V[TCAM_hit_index]) begin
                                next_state = `IDLE;
                            end
                            else begin
                                next_state = `READING_MAIN_MEM;
                            end
                        end
                        else begin
                            next_state = `IDLE;
                        end
                    end
                    else begin
                        next_state = `READING_MAIN_MEM;
                    end
                end
                else begin
                    next_state = `WAITING_TCAM;
                end
            end

            `READING_MAIN_MEM: begin
                if (cm_ReadReady) begin
                    if (D[RepPtr] & FIFO_full) begin
                        next_state = `WAITING_FIFO;
                    end
                    else begin
                        next_state = `IDLE;
                    end
                end
                else begin
                    next_state = `READING_MAIN_MEM;
                end
            end

            `WAITING_FIFO: begin
                if (FIFO_full) begin
                    next_state = `WAITING_FIFO;
                end
                else begin
                    next_state = `IDLE;
                end
            end
        endcase
    end

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            TCAM_valid <= 0;
            RW_reg <= 0;
            Addr_reg <= 0;
            WriteData_reg <= 0;
            cm_ReadAddr <= 0;
            cm_ReadValid <= 0;
            rc_ReadData <= 0;
            rc_ReadReady <= 0;
            FIFO_wd <= 0;
            FIFO_we <= 0;
            ptr_update <= 0;
            tag_update <= 1;
            for (i = 0; i < 256; i = i + 1) begin
                V[i] = 0;
                D[i] = 0;
                DATA[i] = 0;
            end
        end
        else begin
            if (current_state == `IDLE & next_state == `WAITING_TCAM) begin
                TCAM_valid <= 1;
                RW_reg <= rc_RW;
                Addr_reg <= rc_Addr;
                WriteData_reg <= rc_WriteData;
            end
            else begin
                TCAM_valid <= 0;
                RW_reg <= RW_reg;
                Addr_reg <= Addr_reg;
                WriteData_reg <= WriteData_reg;
            end


            if (current_state != `READING_MAIN_MEM & next_state == `READING_MAIN_MEM) begin
                cm_ReadAddr <= Addr_reg;
                cm_ReadValid <= 1;
            end
            else begin
                cm_ReadAddr <= 0;
                cm_ReadValid <= 0;
            end


            if (current_state == `WAITING_TCAM & next_state == `IDLE) begin
                rc_ReadData <= DATA[TCAM_hit_index];
                rc_ReadReady <= 1;
            end
            else if (current_state == `READING_MAIN_MEM & next_state == `IDLE & ~RW_reg) begin
                rc_ReadData <= cm_ReadData;
                rc_ReadReady <= 1;
            end
            else if (current_state == `WAITING_FIFO & next_state == `IDLE & ~RW_reg) begin
                rc_ReadData <= cm_ReadData;
                rc_ReadReady <= 1;
            end
            else begin
                rc_ReadData <= 0;
                rc_ReadReady <= 0;
            end

            
            if (current_state == `READING_MAIN_MEM & next_state == `IDLE & D[RepPtr]) begin
                FIFO_wd <= {DATA[RepPtr], replaced_Tag, SET_ID, 2'b0};
                FIFO_we <= 1;
            end
            else if (current_state == `WAITING_FIFO & next_state == `IDLE) begin
                FIFO_wd <= {DATA[RepPtr], replaced_Tag, SET_ID, 2'b0};
                FIFO_we <= 1;
            end
            else begin
                FIFO_wd <= 0;
                FIFO_we <= 0;
            end


            if (current_state == `READING_MAIN_MEM & next_state != `READING_MAIN_MEM) begin
                V[RepPtr] <= 1;
            end


            if (current_state == `READING_MAIN_MEM & next_state == `IDLE) begin
                ptr_update <= 1;
            end
            else if (current_state == `WAITING_FIFO & next_state == `IDLE) begin
                ptr_update <= 1;
            end
            else begin
                ptr_update <= 0;
            end


            if (current_state == `WAITING_TCAM & next_state == `IDLE) begin
                if (RW_reg) begin
                    DATA[TCAM_hit_index] <= WriteData_reg;
                    tag_update <= 1;
                    D[TCAM_hit_index] <= 1;
                end
            end
            else if (current_state == `READING_MAIN_MEM & next_state == `IDLE) begin
                if (RW_reg) begin
                    DATA[RepPtr] <= WriteData_reg;
                    tag_update <= 1;
                    D[RepPtr] <= 1;
                end
                else begin
                    DATA[RepPtr] <= cm_ReadData;
                    tag_update <= 1;
                end
            end
            else begin
                tag_update <= 0;
            end
        end
    end
endmodule
