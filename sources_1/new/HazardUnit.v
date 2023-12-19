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
    input MCycleDone,
    input MCycleBusy,
    input MStart,
    input MS,
    input [3:0] FPUWA3,
    input FPUDone,
    input FPUBusy,
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
    output FlushE,
    output MCycleHazard,
    output FPUHazard
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
    wire cachestall;
    assign Match_12D_E = (RA1D == WA3E) | (RA2D == WA3E);
    assign ldrstall = Match_12D_E & MemtoRegE & RegWriteE;
    assign cachestall = dec_mem & ~Cache_ReadReady & (MemtoRegM & RegWriteM);

    wire Match_123D_MCycleWA;
    wire Match_123D_FPUWA;
    assign Match_123D_MCycleWA = (RA1D == MCycleWA3) | (RA2D == MCycleWA3) | (WA3D == MCycleWA3) | (MStart & WA3D == WA3E);
    assign Match_123D_FPUWA = (RA1D == FPUWA3) | (RA2D == FPUWA3) | (WA3D == FPUWA3) | (FPUStart & WA3D == WA3E);
    
    assign StallF = ldrstall | (MCycleDone & ~PCSrcE) | (FPUDone & ~PCSrcE) | (Match_123D_MCycleWA & MCycleBusy) | (Match_123D_FPUWA & FPUBusy) | cachestall;
    assign StallD = ldrstall | (MCycleDone & ~PCSrcE) | (FPUDone & ~PCSrcE) | (Match_123D_MCycleWA & MCycleBusy) | (Match_123D_FPUWA & FPUBusy) | cachestall;
    assign StallE = cachestall;
    assign StallM = cachestall;
    assign StallW = cachestall;
    assign FlushD = PCSrcE;
    assign FlushE = ldrstall | PCSrcE;
    
    assign MCycleHazard = Match_123D_MCycleWA | (MCycleBusy & MS);
    assign FPUHazard = Match_123D_FPUWA | (FPUBusy & FPUS);
endmodule
