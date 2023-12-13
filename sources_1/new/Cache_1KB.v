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

module Cache_1KB (
    input CLK,
    input Reset,
    input [31:0] Addr,
    input WriteEnable,
    input [31:0] WriteData,
    input DirtyWrite,
    output Hit,
    output v,
    output d,
    output [31:0] ReadData,
    output [21:0] rep_tag
    );
    
    wire [7:0] index;
    reg [255:0] V;
    reg [255:0] D;
    reg [31:0] DATA [0:255];
    reg [21:0] TAG  [0:255];


// // BRAM_SINGLE_MACRO: Single Port RAM
// // 7 Series
// // Xilinx HDL Language Template, version 2021.2
// /////////////////////////////////////////////////////////////////////
// // READ_WIDTH | BRAM_SIZE | READ Depth | ADDR Width | //
// // WRITE_WIDTH | | WRITE Depth | | WE Width //
// // ============|===========|=============|============|============//
// // 37-72 | "36Kb" | 512 | 9-bit | 8-bit //
// // 19-36 | "36Kb" | 1024 | 10-bit | 4-bit //
// // 19-36 | "18Kb" | 512 | 9-bit | 4-bit //
// // 10-18 | "36Kb" | 2048 | 11-bit | 2-bit //
// // 10-18 | "18Kb" | 1024 | 10-bit | 2-bit //
// // 5-9 | "36Kb" | 4096 | 12-bit | 1-bit //
// // 5-9 | "18Kb" | 2048 | 11-bit | 1-bit //
// // 3-4 | "36Kb" | 8192 | 13-bit | 1-bit //
// Chapter 3: Unimacros
// UG953 (v2021.2) October 22, 2021 www.xilinx.com
// 7 Series FPGA and Zynq-7000 SoC Libraries Guide Send Feedback 212
// // 3-4 | "18Kb" | 4096 | 12-bit | 1-bit //
// // 2 | "36Kb" | 16384 | 14-bit | 1-bit //
// // 2 | "18Kb" | 8192 | 13-bit | 1-bit //
// // 1 | "36Kb" | 32768 | 15-bit | 1-bit //
// // 1 | "18Kb" | 16384 | 14-bit | 1-bit //
// /////////////////////////////////////////////////////////////////////
// BRAM_SINGLE_MACRO #(
// .BRAM_SIZE("18Kb"), // Target BRAM, "18Kb" or "36Kb"
// .DEVICE("7SERIES"), // Target Device: "7SERIES"
// .DO_REG(0), // Optional output register (0 or 1)
// .INIT(36'h000000000), // Initial values on output port
// .INIT_FILE ("NONE"),
// .WRITE_WIDTH(0), // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
// .READ_WIDTH(0), // Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
// .SRVAL(36'h000000000), // Set/Reset value for port output
// .WRITE_MODE("WRITE_FIRST") // "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"
// ) BRAM_SINGLE_MACRO_inst (
// .DO(DO), // Output data, width defined by READ_WIDTH parameter
// .ADDR(ADDR), // Input address, width defined by read/write port depth
// .CLK(CLK), // 1-bit input clock
// .DI(DI), // Input data port, width defined by WRITE_WIDTH parameter
// .EN(EN), // 1-bit input RAM enable
// .REGCE(REGCE), // 1-bit input output register enable
// .RST(RST), // 1-bit input reset
// .WE(WE) // Input write enable, width defined by write port depth
// );
// // End of BRAM_SINGLE_MACRO_inst instantiation














    integer i;

    initial begin
        V = 0;
        D = 0;
    end



    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            DATA[i] = 0;
            TAG[i] = 0;
        end
    end


    always @(posedge CLK) begin
        if (WriteEnable) begin
            DATA[index] <= WriteData;
            TAG[index] <= Addr[31:20];
        end
    end


    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            V <= 0;
            D <= 0;
        end
        else if (WriteEnable) begin
            V[index] <= 1;
            D[index] <= DirtyWrite;
        end
    end

    assign v = V[index];
    assign d = D[index];
    assign Hit = (TAG[index] == Addr[31:10]) & V[index];
    assign index = Addr[9:2];

    assign ReadData = DATA[index];
    assign rep_tag = TAG[index];
endmodule
