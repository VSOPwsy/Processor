`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: Cache
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


`include "config.v"

`define     CACHE_IDLE                2'b00
`define     READING_MAIN_MEM    2'b01
`define     WRITING_MAIN_MEM    2'b10

module Cache(
    // rc_ means reg to cache, cm_ means cache to memory
    input CLK,
    input Reset,
    input rc_RW,   // 0 for Read, 1 for Write
    input rc_Valid,
    input [31:0] rc_Addr,
    input [31:0] rc_WriteData,
    output reg [31:0] rc_ReadData,
    output reg rc_ReadReady,
    
    output reg cm_ReadValid,
    output reg [31:0] cm_ReadAddr,
    output reg cm_WriteValid,
    output [31:0] cm_WriteAddr,
    output reg [31:0] cm_WriteData,

    input cm_ReadReady,
    input [31:0] cm_ReadData
    );

    reg all_dirty;
    reg [1:0] rep_way;
    reg [21:0] rep_tag;
    reg [31:0] rep_data;
    wire Hit_0, Hit_1, Hit_2, Hit_3;
    wire v_0, v_1, v_2, v_3;
    wire d_0, d_1, d_2, d_3;
    reg WriteEnable;
    wire WriteEnable_0, WriteEnable_1, WriteEnable_2, WriteEnable_3;
    reg [31:0] WriteData;
    wire [31:0] ReadData_0, ReadData_1, ReadData_2, ReadData_3;
    wire [21:0] rep_tag_0, rep_tag_1, rep_tag_2, rep_tag_3;
    reg DirtyWrite = 0;
    Cache_1KB Way_0(
        .CLK(CLK),
        .Reset(Reset),
        .Addr(rc_Addr),
        .WriteEnable(WriteEnable_0),
        .WriteData(WriteData),
        .DirtyWrite(DirtyWrite),
        .Hit(Hit_0),
        .v(v_0),
        .d(d_0),
        .ReadData(ReadData_0),
        .rep_tag(rep_tag_0)
    );
    
    Cache_1KB Way_1(
        .CLK(CLK),
        .Reset(Reset),
        .Addr(rc_Addr),
        .WriteEnable(WriteEnable_1),
        .WriteData(WriteData),
        .DirtyWrite(DirtyWrite),
        .Hit(Hit_1),
        .v(v_1),
        .d(d_1),
        .ReadData(ReadData_1),
        .rep_tag(rep_tag_1)
    );
    
    Cache_1KB Way_2(
        .CLK(CLK),
        .Reset(Reset),
        .Addr(rc_Addr),
        .WriteEnable(WriteEnable_2),
        .WriteData(WriteData),
        .DirtyWrite(DirtyWrite),
        .Hit(Hit_2),
        .v(v_2),
        .d(d_2),
        .ReadData(ReadData_2),
        .rep_tag(rep_tag_2)
    );
    
    Cache_1KB Way_3(
        .CLK(CLK),
        .Reset(Reset),
        .Addr(rc_Addr),
        .WriteEnable(WriteEnable_3),
        .WriteData(WriteData),
        .DirtyWrite(DirtyWrite),
        .Hit(Hit_3),
        .v(v_3),
        .d(d_3),
        .ReadData(ReadData_3),
        .rep_tag(rep_tag_3)
    );

    assign Hit = Hit_0 | Hit_1 | Hit_2 | Hit_3;
    always @(*) begin
        if (Hit_0) begin
            rc_ReadData = ReadData_0;
        end
        else if (Hit_1) begin
            rc_ReadData = ReadData_1;
        end
        else if (Hit_2) begin
            rc_ReadData = ReadData_2;
        end
        else if (Hit_3) begin
            rc_ReadData = ReadData_3;
        end
        else begin
            rc_ReadData = 0;
        end
    end

    reg [1:0] current_state = `CACHE_IDLE;
    reg [1:0] next_state;
    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            current_state <= `CACHE_IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        next_state = `CACHE_IDLE;
        case (current_state)
            `CACHE_IDLE: begin
                if (~Hit & rc_Valid) begin
                    if (~rc_RW) begin                  // read miss
                        if (~cm_ReadReady) begin
                            next_state = `READING_MAIN_MEM;
                        end
                    end
                end
            end
            
            `READING_MAIN_MEM: begin
                if (~cm_ReadReady) begin
                    next_state = `READING_MAIN_MEM;
                end
            end
            
            default: next_state = `CACHE_IDLE;
        endcase
    end

    assign cm_WriteAddr = {rep_tag, rc_Addr[9:2], rep_way};

    always @(*) begin
        if (current_state == `CACHE_IDLE && rc_Valid && rc_RW) begin
            WriteEnable = 1;
            WriteData = rc_WriteData;
            DirtyWrite = 1;
        end
        else if (current_state == `READING_MAIN_MEM && next_state == `CACHE_IDLE) begin
            WriteEnable = 1;
            WriteData = cm_ReadData;
            DirtyWrite = 0;
        end
        else if (current_state == `CACHE_IDLE && rc_Valid && ~rc_RW && ~Hit && cm_ReadReady) begin
            WriteEnable = 1;
            WriteData = cm_ReadData;
            DirtyWrite = 0;
        end
        else begin
            WriteEnable = 0;
            WriteData = 0;
            DirtyWrite = 0;
        end


        if (current_state == `CACHE_IDLE && rc_Valid && ~rc_RW && ~Hit) begin
            cm_ReadValid = 1;
            cm_ReadAddr = rc_Addr;
        end
        else begin
            cm_ReadValid = 0;
            cm_ReadAddr = rc_Addr;
        end


        if (current_state == `CACHE_IDLE && rc_Valid && rc_RW && ~Hit && all_dirty) begin
            cm_WriteValid = 1;
            cm_WriteData = rep_data;
        end
        else if (current_state == `READING_MAIN_MEM && next_state == `CACHE_IDLE && all_dirty) begin
            cm_WriteValid = 1;
            cm_WriteData = rep_data;
        end
        else begin
            cm_WriteValid = 0;
            cm_WriteData = 0;
        end
    end



    always @(*) begin
        if (rc_Valid & ~rc_RW & Hit) begin
            rc_ReadReady = 1;
        end
        else begin
            rc_ReadReady = 0;
        end
    end



    always @(*) begin
        if (~v_0) begin
            rep_way = 2'd0;
            rep_tag = rep_tag_0;
            rep_data = ReadData_0;
            all_dirty = 0;
        end
        else if (~v_1) begin
            rep_way = 2'd1;
            rep_tag = rep_tag_1;
            rep_data = ReadData_1;
            all_dirty = 0;
        end
        else if (~v_2) begin
            rep_way = 2'd2;
            rep_tag = rep_tag_2;
            rep_data = ReadData_2;
            all_dirty = 0;
        end
        else if (~v_3) begin
            rep_way = 2'd3;
            rep_tag = rep_tag_3;
            rep_data = ReadData_3;
            all_dirty = 0;
        end
        else if (~d_0) begin
            rep_way = 2'd0;
            rep_tag = rep_tag_0;
            rep_data = ReadData_0;
            all_dirty = 0;
        end
        else if (~d_1) begin
            rep_way = 2'd1;
            rep_tag = rep_tag_1;
            rep_data = ReadData_1;
            all_dirty = 0;
        end
        else if (~d_2) begin
            rep_way = 2'd2;
            rep_tag = rep_tag_2;
            rep_data = ReadData_2;
            all_dirty = 0;
        end
        else if (~d_3) begin
            rep_way = 2'd3;
            rep_tag = rep_tag_3;
            rep_data = ReadData_3;
            all_dirty = 0;
        end
        else begin
            rep_way = 2'd0;
            rep_tag = rep_tag_0;
            rep_data = ReadData_0;
            all_dirty = 1;
        end
    end


    assign WriteEnable_0 = WriteEnable & rep_way == 2'd0;
    assign WriteEnable_1 = WriteEnable & rep_way == 2'd1;
    assign WriteEnable_2 = WriteEnable & rep_way == 2'd2;
    assign WriteEnable_3 = WriteEnable & rep_way == 2'd3;

endmodule
