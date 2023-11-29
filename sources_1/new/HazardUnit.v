`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/23 20:24:27
// Design Name: 
// Module Name: HazardUnit
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


module HazardUnit(
    input [3:0] RA1D,
    input [3:0] RA2D,
    input [3:0] RA1E,
    input [3:0] RA2E,
    input [3:0] RA2M,
    input [3:0] WA3D,
    input [3:0] WA3E,
    input [3:0] WA3M,
    input [3:0] WA3W,
    input [3:0] WA5M,
    input [3:0] WA5W,
    input RegWriteE,
    input RegWriteM,
    input RegWriteW,
    input RegWrite2M,
    input RegWrite2W,
    input MemWriteM,
    input MemtoRegE,
    input MemtoRegW,
    input PCSrcE,
    input [3:0] MCycleWA3,
    input MCycleDone,
    input MCycleBusy,
    input MStart,
    input MS,
    input Cache_Hit,
    input RW,
    input Mem_ReadReady,
    output reg [2:0] ForwardAE,
    output reg [2:0] ForwardBE,
    output ForwardM,
    output StallF,
    output StallD,
    output StallE,
    output StallM,
    output FlushD,
    output FlushE,
    output MCycleHazard
    );
    
    wire Match_1E_M, Match_2E_M;
    wire Match_1E_5M, Match_2E_5M;
    wire Match_1E_W, Match_2E_W;
    wire Match_1E_5W, Match_2E_5W;
    
    assign Match_1E_M = RA1E == WA3M;
    assign Match_2E_M = RA2E == WA3M;
    assign Match_1E_5M = RA1E == WA5M;
    assign Match_2E_5M = RA2E == WA5M;
    assign Match_1E_W = RA1E == WA3W;
    assign Match_2E_W = RA2E == WA3W;
    assign Match_1E_5W = RA1E == WA5W;
    assign Match_2E_5W = RA2E == WA5W;
    always @(*) begin
        if (Match_1E_5M & RegWrite2M)
            ForwardAE = 3'b110;
        else if (Match_1E_5W & RegWrite2W)
            ForwardAE = 3'b101;
        else if (Match_1E_M & RegWriteM)
            ForwardAE = 3'b010;
        else if (Match_1E_W & RegWriteW)
            ForwardAE = 3'b001;
        else
            ForwardAE = 3'b000;
            
        if (Match_2E_5M & RegWrite2M)
            ForwardBE = 3'b110;
        else if (Match_2E_5W & RegWrite2W)
            ForwardBE = 3'b101;
        else if (Match_2E_M & RegWriteM)
            ForwardBE = 3'b010;
        else if (Match_2E_W & RegWriteW)
            ForwardBE = 3'b001;
        else
            ForwardBE = 3'b000;
    end
    
    
    assign ForwardM = (RA2M == WA3W) & MemWriteM & MemtoRegW & RegWriteW;
    
    
    wire Match_12D_E;
    wire ldrstall;
    wire memstall;
    wire cachestall;
    assign Match_12D_E = (RA1D == WA3E) | (RA2D == WA3E);
    assign ldrstall = Match_12D_E & MemtoRegE & RegWriteE;
    assign memstall = ~Cache_Hit & ~RW & ~Mem_ReadReady;      // Stall pipline while reading from Cache but not hitting and memory is no ready
    wire Match_123D_MCycleWA;
    assign Match_123D_MCycleWA = (RA1D == MCycleWA3) | (RA2D == MCycleWA3) | (WA3D == MCycleWA3) | (MStart & WA3D == WA3E);
    
    assign StallF = ldrstall | MCycleDone | (Match_123D_MCycleWA & MCycleBusy) | memstall;
    assign StallD = ldrstall | MCycleDone | (Match_123D_MCycleWA & MCycleBusy) | memstall;
    assign StallE = memstall;
    assign StallM = memstall;
    assign FlushD = PCSrcE;
    assign FlushE = ldrstall | PCSrcE;
    
    assign MCycleHazard = Match_123D_MCycleWA | (MCycleBusy & MS);
endmodule
