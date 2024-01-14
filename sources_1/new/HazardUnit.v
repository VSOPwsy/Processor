`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: HazardUnit
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
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
    input RegWriteE,
    input RegWriteM,
    input RegWriteW,
    input MemWriteM,
    input MemtoRegE,
    input MemtoRegW,
    input MemtoRegM,
    input dec_mem,
    input PCSrcE,
    input [3:0] MCycleWA3,
    input MCycleBusyE,
    input MCycleBusyM,
    input MStart,
    input MS,
    input [3:0] FPUWA3,
    input FPUBusyE,
    input FPUBusyM,
    input FPUStart,
    input FPUS,
    input Cache_ReadReady,
    input RW,
    input Mem_ReadReady,
    output reg [2:0] ForwardAE,
    output reg [2:0] ForwardBE,
    output ForwardM,
    output StallF,
    output StallD,
    output StallE,
    output StallM,
    output StallW,
    output FlushD,
    output FlushE
    );
    
    wire Match_1E_M, Match_2E_M;
    wire Match_1E_W, Match_2E_W;
    
    assign Match_1E_M = RA1E == WA3M;
    assign Match_2E_M = RA2E == WA3M;
    assign Match_1E_W = RA1E == WA3W;
    assign Match_2E_W = RA2E == WA3W;
    always @(*) begin
        if (Match_1E_M & RegWriteM)
            ForwardAE = 2'b10;
        else if (Match_1E_W & RegWriteW)
            ForwardAE = 2'b01;
        else
            ForwardAE = 2'b00;
            
        if (Match_2E_M & RegWriteM)
            ForwardBE = 2'b10;
        else if (Match_2E_W & RegWriteW)
            ForwardBE = 2'b01;
        else
            ForwardBE = 2'b00;
    end
    
    
    assign ForwardM = (RA2M == WA3W) & MemWriteM & MemtoRegW & RegWriteW;
    
    
    wire Match_12D_E;
    wire ldrstall;
    wire memstall;
    assign Match_12D_E = (RA1D == WA3E) | (RA2D == WA3E);
    assign ldrstall = Match_12D_E & MemtoRegE & RegWriteE;
    assign memstall = dec_mem & ~Cache_ReadReady & (MemtoRegM & RegWriteM);

    wire Match_123D_MCycleWA;
    wire Match_123D_FPUWA;
    assign Match_123D_MCycleWA = MCycleBusyM & ((RA1E == MCycleWA3) | (RA2E == MCycleWA3) | (WA3E == MCycleWA3));
    assign Match_123D_FPUWA = FPUBusyM & ((RA1E == FPUWA3) | (RA2E == FPUWA3) | (WA3E == FPUWA3));
    
    assign StallF = ldrstall | memstall | (MCycleBusyE & Match_123D_MCycleWA) | (~MCycleBusyE & MCycleBusyM) | (FPUBusyE & Match_123D_FPUWA) | (~FPUBusyE & FPUBusyM);
    assign StallD = ldrstall | memstall | (MCycleBusyE & Match_123D_MCycleWA) | (~MCycleBusyE & MCycleBusyM) | (FPUBusyE & Match_123D_FPUWA) | (~FPUBusyE & FPUBusyM);
    assign StallE = memstall | (MCycleBusyE & Match_123D_MCycleWA) | (~MCycleBusyE & MCycleBusyM) | (FPUBusyE & Match_123D_FPUWA) | (~FPUBusyE & FPUBusyM);
    assign StallM = memstall | (MCycleBusyE & Match_123D_MCycleWA) | (FPUBusyE & Match_123D_FPUWA);
    assign StallW = memstall;
    assign FlushD = PCSrcE;
    assign FlushE = ldrstall | PCSrcE;
endmodule
