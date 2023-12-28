`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: ARMcore
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


`include "config.v"

module ARMcore(
    input               CLK,
    input               Reset,

    input   [31:0]      IO_ReadData,
    output  [31:0]      IO_Addr,
    output  [31:0]      IO_WriteData,
    output              IO_WE,

    output  [31:0]      PC,
    input   [31:0]      Instr,

    output              Cache_RW,
    output  [31:0]      Cache_Addr,
    output  [31:0]      Cache_WriteData,
    output              Cache_Valid,
    input               Cache_ReadReady,
    input   [31:0]      Cache_ReadData,
    
    input   [31:0]      Mem_ReadData,
    input               Mem_ReadReady
    );
    

    wire    [147:0]     CDB;
    wire    [35:0]      WBB;

    wire                ProgramCounter_EN;
    wire                ProgramCounter_PCSrc;
    wire    [31:0]      ProgramCounter_Result;
    wire    [31:0]      ProgramCounter_PC;
    wire    [31:0]      ProgramCounter_PCPlus4;


    wire                FDReg_EN;
    wire    [31:0]      FDReg_InstrF;
    wire    [31:0]      FDReg_InstrD;



    wire    [31:0]      ControlUnit_Instr;
    wire                ControlUnit_Issue;
    wire    [4:0]       ControlUnit_Operation;
    wire                ControlUnit_ALUSrc;
    wire    [1:0]       ControlUnit_ImmSrc;
    wire                ControlUnit_MemW;
    wire    [3:0]       ControlUnit_FlagW;
    wire                ControlUnit_MemtoReg;
    wire                ControlUnit_PCS;
    wire    [3:0]       ControlUnit_RegSrc;
    wire                ControlUnit_RegW;
    wire                ControlUnit_NoWrite;
    wire                ControlUnit_MS;
    wire                ControlUnit_MCycleOp;
    wire                ControlUnit_FPS;
    wire                ControlUnit_FPOp;


    
    wire    [1:0]       Extend_ImmSrc;
    wire    [23:0]      Extend_InstrImm;
    wire    [31:0]      Extend_ExtImm;


    wire                ReorderBuffer_append;
    wire                ReorderBuffer_full;
    wire    [2:0]       ReorderBuffer_ROBTail;
    wire    [2:0]       ReorderBuffer_ROBHead;
    wire    [3:0]       ReorderBuffer_DestReg;
    wire                ReorderBuffer_DP_WriteBack;
    wire                ReorderBuffer_MEM_WriteBack;
    wire    [3:0]       ReorderBuffer_WA;
    wire                ReorderBuffer_WE;
    wire    [31:0]      ReorderBuffer_WD;
    wire                ReorderBuffer_Commit;
    wire    [2:0]       ReorderBuffer_IndexA;
    wire    [2:0]       ReorderBuffer_IndexB;
    wire    [31:0]      ReorderBuffer_ForwardDataA;
    wire    [31:0]      ReorderBuffer_ForwardDataB;
    wire                ReorderBuffer_ForwardA;
    wire                ReorderBuffer_ForwardB;




    wire    [3:0]       RegisterFile_A1;
    wire    [3:0]       RegisterFile_A2;
    wire    [3:0]       RegisterFile_A3;
    wire                RegisterFile_WE3;
    wire    [31:0]      RegisterFile_WD3;
    wire    [31:0]      RegisterFile_R15;
    wire    [31:0]      RegisterFile_RD1;
    wire    [31:0]      RegisterFile_RD2;


    wire                DIReg_EN;
    wire                DIReg_IssueD;
    wire    [4:0]       DIReg_OpD;
    wire    [3:0]       DIReg_RA1D;
    wire    [3:0]       DIReg_RA2D;
    wire    [3:0]       DIReg_WA3D;
    wire                DIReg_ALUSrcD;
    wire    [31:0]      DIReg_ExtImmD;
    wire    [3:0]       DIReg_CondD;
    wire    [3:0]       DIReg_FlagWD;
    wire                DIReg_RegWD;
    wire                DIReg_NoWriteD;
    wire    [4:0]       DIReg_Shamt5D;
    wire    [1:0]       DIReg_ShD;
    wire                DIReg_MemWD;
    wire                DIReg_MemtoRegD;
    wire                DIReg_MULSD;
    wire                DIReg_FPSD;
    wire                DIReg_IssueI;
    wire    [4:0]       DIReg_OpI;
    wire    [3:0]       DIReg_RA1I;
    wire    [3:0]       DIReg_RA2I;
    wire    [3:0]       DIReg_WA3I;
    wire                DIReg_ALUSrcI;
    wire    [31:0]      DIReg_ExtImmI;
    wire    [3:0]       DIReg_CondI;
    wire    [3:0]       DIReg_FlagWI;
    wire                DIReg_RegWI;
    wire                DIReg_NoWriteI;
    wire    [4:0]       DIReg_Shamt5I;
    wire    [1:0]       DIReg_ShI;
    wire                DIReg_MemWI;
    wire                DIReg_MemtoRegI;
    wire                DIReg_MULSI;
    wire                DIReg_FPSI;



    wire                ReservationStations_Issue;
    wire                ReservationStations_MemW;
    wire                ReservationStations_MemtoReg;
    wire                ReservationStations_MULS;
    wire                ReservationStations_FPS;
    wire                ReservationStations_full;
    wire    [7:0]       ReservationStations_rrs_query;
    wire    [1:0]       ReservationStations_rrs_result_busy;
    wire    [5:0]       ReservationStations_rrs_index;
    wire                ReservationStations_fs_flagready;
    wire    [2:0]       ReservationStations_fs_index;
    wire                ReservationStations_ALUSrc;
    wire    [31:0]      ReservationStations_ExtImm;
    wire    [3:0]       ReservationStations_Cond;
    wire    [3:0]       ReservationStations_FlagW;
    wire                ReservationStations_NoWrite;
    wire    [4:0]       ReservationStations_Shamt5;
    wire    [1:0]       ReservationStations_Sh;
    wire    [3:0]       ReservationStations_RA1;
    wire    [3:0]       ReservationStations_RA2;
    wire    [31:0]      ReservationStations_RD1;
    wire    [31:0]      ReservationStations_RD2;
    wire    [4:0]       ReservationStations_Op;
    wire    [2:0]       ReservationStations_ROBTail;
    wire                ReservationStations_Cache_Busy;
    wire                ReservationStations_MCycle_Busy;
    wire                ReservationStations_FPU_Busy;
    wire                ReservationStations_ROB_ForwardA;
    wire                ReservationStations_ROB_ForwardB;
    wire    [31:0]      ReservationStations_ROB_ForwardDataA;
    wire    [31:0]      ReservationStations_ROB_ForwardDataB;

    wire                ReservationStations_DP_Exec;
    wire    [3:0]       ReservationStations_DP_Cond;
    wire    [3:0]       ReservationStations_DP_FlagW;
    wire                ReservationStations_DP_RegW;
    wire                ReservationStations_DP_NoWrite;
    wire    [2:0]       ReservationStations_DP_WIndex;
    wire    [4:0]       ReservationStations_DP_Op;
    wire    [4:0]       ReservationStations_DP_Shamt5;
    wire    [1:0]       ReservationStations_DP_Sh;
    wire    [31:0]      ReservationStations_DP_SrcA;
    wire    [31:0]      ReservationStations_DP_SrcB;
    wire                ReservationStations_DP_ALUSrc;

    wire                ReservationStations_MEM_Exec;
    wire    [3:0]       ReservationStations_MEM_Cond;
    wire                ReservationStations_MEM_RegW;
    wire    [2:0]       ReservationStations_MEM_WIndex;
    wire                ReservationStations_MEM_ALUSrc;
    wire    [4:0]       ReservationStations_MEM_Shamt5;
    wire    [1:0]       ReservationStations_MEM_Sh;
    wire    [31:0]      ReservationStations_MEM_SrcA;
    wire    [31:0]      ReservationStations_MEM_SrcB;
    wire    [31:0]      ReservationStations_MEM_WriteData;

    wire                ReservationStations_MUL_Exec;
    wire    [3:0]       ReservationStations_MUL_Cond;
    wire    [3:0]       ReservationStations_MUL_FlagW;
    wire    [2:0]       ReservationStations_MUL_WIndex;
    wire    [4:0]       ReservationStations_MUL_Op;
    wire    [31:0]      ReservationStations_MUL_SrcA;
    wire    [31:0]      ReservationStations_MUL_SrcB;

    wire                ReservationStations_FP_Exec;
    wire    [3:0]       ReservationStations_FP_Cond;
    wire    [3:0]       ReservationStations_FP_FlagW;
    wire    [2:0]       ReservationStations_FP_WIndex;
    wire    [4:0]       ReservationStations_FP_Op;
    wire    [31:0]      ReservationStations_FP_SrcA;
    wire    [31:0]      ReservationStations_FP_SrcB;



    wire    [7:0]       RegisterResultStatus_query;
    wire    [3:0]       RegisterResultStatus_WA;
    wire                RegisterResultStatus_NoWrite;
    wire                RegisterResultStatus_append;
    wire    [2:0]       RegisterResultStatus_ROBTail;
    wire    [1:0]       RegisterResultStatus_result_busy;
    wire    [5:0]       RegisterResultStatus_index;


    wire                FlagStatus_append;
    wire                FlagStatus_S;
    wire    [2:0]       FlagStatus_ROBTail;
    wire                FlagStatus_FlagReady;
    wire    [2:0]       FlagStatus_index;


    wire    [3:0]       Flags_FlagWrite;
    wire    [3:0]       Flags_ALUFlags;
    wire                Flags_ShifterCarry;
    wire    [4:0]       Flags_Op;
    wire    [3:0]       Flags_Flags;


    wire                DP_IEReg_EN;
    wire                DP_IEReg_CLR;
    wire                DP_IEReg_ExecI;
    wire    [3:0]       DP_IEReg_CondI;
    wire    [3:0]       DP_IEReg_FlagWI;
    wire                DP_IEReg_RegWI;
    wire    [2:0]       DP_IEReg_WIndexI;
    wire    [31:0]      DP_IEReg_SrcAI;
    wire    [31:0]      DP_IEReg_SrcBI;
    wire    [1:0]       DP_IEReg_ShI;
    wire    [4:0]       DP_IEReg_Shamt5I;
    wire                DP_IEReg_ALUSrcI;
    wire    [4:0]       DP_IEReg_OpI;
    wire                DP_IEReg_NoWriteI;
    wire                DP_IEReg_ExecE;
    wire    [3:0]       DP_IEReg_CondE;
    wire    [3:0]       DP_IEReg_FlagWE;
    wire                DP_IEReg_RegWE;
    wire    [2:0]       DP_IEReg_WIndexE;
    wire    [31:0]      DP_IEReg_SrcAE;
    wire    [31:0]      DP_IEReg_SrcBE;
    wire    [1:0]       DP_IEReg_ShE;
    wire    [4:0]       DP_IEReg_Shamt5E;
    wire                DP_IEReg_ALUSrcE;
    wire    [4:0]       DP_IEReg_OpE;
    wire                DP_IEReg_NoWriteE;


    wire    [3:0]       DP_CondUnit_Cond;
    wire    [3:0]       DP_CondUnit_Op;
    wire    [3:0]       DP_CondUnit_Flags;
    wire    [3:0]       DP_CondUnit_FlagW;
    wire                DP_CondUnit_RegW;
    wire                DP_CondUnit_NoWrite;
    wire    [3:0]       DP_CondUnit_FlagWrite;
    wire                DP_CondUnit_RegWrite;


    wire    [1:0]       DP_Shifter_Sh;
    wire    [4:0]       DP_Shifter_Shamt5;
    wire    [31:0]      DP_Shifter_ShIn;
    wire                DP_Shifter_CFlag;
    wire    [31:0]      DP_Shifter_ShOut;
    wire                DP_Shifter_Carry;

    wire    [31:0]      ALU_SrcA;
    wire    [31:0]      ALU_SrcB;
    wire    [4:0]       ALU_Op;
    wire                ALU_CFlag;
    wire    [31:0]      ALU_ALUResult;
    wire    [3:0]       ALU_ALUFlags;




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  Memory Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    wire                MEM_IEReg_EN;
    wire                MEM_IEReg_CLR;
    wire                MEM_IEReg_ExecI;
    wire    [3:0]       MEM_IEReg_CondI;
    wire                MEM_IEReg_RegWI;
    wire    [2:0]       MEM_IEReg_WIndexI;
    wire                MEM_IEReg_ALUSrcI;
    wire    [31:0]      MEM_IEReg_SrcAI;
    wire    [31:0]      MEM_IEReg_SrcBI;
    wire    [31:0]      MEM_IEReg_WriteDataI;
    wire    [1:0]       MEM_IEReg_ShI;
    wire    [4:0]       MEM_IEReg_Shamt5I;
    wire                MEM_IEReg_ExecE;
    wire    [3:0]       MEM_IEReg_CondE;
    wire                MEM_IEReg_RegWE;
    wire    [2:0]       MEM_IEReg_WIndexE;
    wire                MEM_IEReg_ALUSrcE;
    wire    [31:0]      MEM_IEReg_SrcAE;
    wire    [31:0]      MEM_IEReg_SrcBE;
    wire    [31:0]      MEM_IEReg_WriteDataE;
    wire    [1:0]       MEM_IEReg_ShE;
    wire    [4:0]       MEM_IEReg_Shamt5E;


    wire    [1:0]       MEM_Shifter_Sh;
    wire    [4:0]       MEM_Shifter_Shamt5;
    wire    [31:0]      MEM_Shifter_ShIn;
    wire    [31:0]      MEM_Shifter_ShOut;


    wire    [31:0]      MEM_adder_a;
    wire    [31:0]      MEM_adder_b;
    wire    [31:0]      MEM_adder_s;

    wire    [3:0]       MEM_CondUnit_Cond;
    wire                MEM_CondUnit_Exec;
    wire    [3:0]       MEM_CondUnit_Flags;
    wire                MEM_CondUnit_RegW;
    wire                MEM_CondUnit_RegWrite;
    wire                MEM_CondUnit_MemWrite;

    wire                Cache_Busy;


    wire                MemOrIO_we;
    wire    [31:0]      MemOrIO_addr_in;
    wire    [31:0]      MemOrIO_m_rdata;
    wire    [31:0]      MemOrIO_r_rdata;
    wire    [31:0]      MemOrIO_io_rdata;
    wire                MemOrIO_dec_mem;
    wire    [31:0]      MemOrIO_m_wdata;
    wire    [31:0]      MemOrIO_m_addr;
    wire                MemOrIO_m_we;
    wire    [31:0]      MemOrIO_r_wdata;
    wire    [31:0]      MemOrIO_io_wdata;
    wire    [31:0]      MemOrIO_io_addr;
    wire                MemOrIO_io_we;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  MUL Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    wire                MUL_IEReg_EN;
    wire                MUL_IEReg_CLR;
    wire                MUL_IEReg_ExecI;
    wire    [3:0]       MUL_IEReg_CondI;
    wire    [3:0]       MUL_IEReg_FlagWI;
    wire    [2:0]       MUL_IEReg_WIndexI;
    wire    [31:0]      MUL_IEReg_SrcAI;
    wire    [31:0]      MUL_IEReg_SrcBI;
    wire    [4:0]       MUL_IEReg_OpI;
    wire                MUL_IEReg_MULSI;
    wire                MUL_IEReg_ExecE;
    wire    [3:0]       MUL_IEReg_CondE;
    wire    [3:0]       MUL_IEReg_FlagWE;
    wire    [2:0]       MUL_IEReg_WIndexE;
    wire    [31:0]      MUL_IEReg_SrcAE;
    wire    [31:0]      MUL_IEReg_SrcBE;
    wire    [4:0]       MUL_IEReg_OpE;
    wire                MUL_IEReg_MULSE;


    wire    [3:0]       MUL_CondUnit_Cond;
    wire    [3:0]       MUL_CondUnit_Flags;
    wire    [3:0]       MUL_CondUnit_FlagW;
    wire                MUL_CondUnit_MULS;
    wire    [3:0]       MUL_CondUnit_FlagWrite;
    wire                MUL_CondUnit_MULStart;

    wire                MCycle_Start;
    wire                MCycle_MCycleOp;
    wire    [31:0]      MCycle_Operand1;
    wire    [31:0]      MCycle_Operand2;
    wire    [31:0]      MCycle_Result;
    wire                MCycle_Busy;
    wire                MCycle_Done;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////






//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  FP Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    wire                FP_IEReg_EN;
    wire                FP_IEReg_CLR;
    wire                FP_IEReg_ExecI;
    wire    [3:0]       FP_IEReg_CondI;
    wire    [3:0]       FP_IEReg_FlagWI;
    wire    [2:0]       FP_IEReg_WIndexI;
    wire    [31:0]      FP_IEReg_SrcAI;
    wire    [31:0]      FP_IEReg_SrcBI;
    wire    [4:0]       FP_IEReg_OpI;
    wire                FP_IEReg_FPSI;
    wire                FP_IEReg_ExecE;
    wire    [3:0]       FP_IEReg_CondE;
    wire    [3:0]       FP_IEReg_FlagWE;
    wire    [2:0]       FP_IEReg_WIndexE;
    wire    [31:0]      FP_IEReg_SrcAE;
    wire    [31:0]      FP_IEReg_SrcBE;
    wire    [4:0]       FP_IEReg_OpE;
    wire                FP_IEReg_FPSE;


    wire    [3:0]       FP_CondUnit_Cond;
    wire    [3:0]       FP_CondUnit_Flags;
    wire    [3:0]       FP_CondUnit_FlagW;
    wire                FP_CondUnit_FPS;
    wire    [3:0]       FP_CondUnit_FlagWrite;
    wire                FP_CondUnit_FPStart;

    wire                FPU_Start;
    wire                FPU_FPUOp;
    wire    [31:0]      FPU_Operand1;
    wire    [31:0]      FPU_Operand2;
    wire    [31:0]      FPU_Result;
    wire                FPU_Busy;
    wire                FPU_Done;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////












    
    assign  PC  =   ProgramCounter_PC;

    assign  ProgramCounter_EN   =   ~(ReorderBuffer_full | ReservationStations_full);

    assign  FDReg_EN        =   ~(ReorderBuffer_full | ReservationStations_full);
    assign  FDReg_InstrF    =   Instr;

    assign  ControlUnit_Instr   =   FDReg_InstrD;

    assign  Extend_ImmSrc   =   ControlUnit_ImmSrc;
    assign  Extend_InstrImm =   FDReg_InstrD[23:0];

    assign  ReorderBuffer_append    =   ReservationStations_Issue;
    assign  ReorderBuffer_DestReg   =   DIReg_WA3I;
    assign  ReorderBuffer_DP_WriteBack =   DP_CondUnit_RegWrite;
    assign  ReorderBuffer_MEM_WriteBack =   MEM_CondUnit_RegWrite;
    assign  ReorderBuffer_IndexA    =   RegisterResultStatus_index[2:0];
    assign  ReorderBuffer_IndexB    =   RegisterResultStatus_index[5:3];

    assign  RegisterFile_WE3    =   ReorderBuffer_WE;
    assign  RegisterFile_WD3    =   ReorderBuffer_WD;
    assign  RegisterFile_A1     =   DIReg_RA1I;
    assign  RegisterFile_A2     =   DIReg_RA2I;
    assign  RegisterFile_A3     =   ReorderBuffer_WA;
    assign  RegisterFile_R15    =   ProgramCounter_PC;
    

    assign  DIReg_EN    =   ~(ReorderBuffer_full | ReservationStations_full);
    assign  DIReg_IssueD=   ControlUnit_Issue;
    assign  DIReg_OpD   =   ControlUnit_Operation;
    assign  DIReg_RA1D  =   ControlUnit_RegSrc[2] ? FDReg_InstrD[11:8] : ControlUnit_RegSrc[0] ? 4'd15 : FDReg_InstrD[19:16];
    assign  DIReg_RA2D  =   ControlUnit_RegSrc[2] ? FDReg_InstrD[3:0] : ControlUnit_RegSrc[1] ? FDReg_InstrD[15:12] : FDReg_InstrD[3:0];
    assign  DIReg_WA3D  =   ControlUnit_RegSrc[2] ? FDReg_InstrD[19:16] : FDReg_InstrD[15:12];
    assign  DIReg_ALUSrcD    =   ControlUnit_ALUSrc;
    assign  DIReg_ExtImmD   =   Extend_ExtImm;
    assign  DIReg_CondD =   FDReg_InstrD[31:28];
    assign  DIReg_FlagWD =  ControlUnit_FlagW;
    assign  DIReg_RegWD =   ControlUnit_RegW;
    assign  DIReg_NoWriteD  =   ControlUnit_NoWrite;
    assign  DIReg_Shamt5D   =   FDReg_InstrD[11:7];
    assign  DIReg_ShD   =   FDReg_InstrD[6:5];
    assign  DIReg_MemWD =   ControlUnit_MemW;
    assign  DIReg_MemtoRegD =   ControlUnit_MemtoReg;
    assign  DIReg_MULSD =   ControlUnit_MS;
    assign  DIReg_FPSD  =   ControlUnit_FPS;
    
    
    assign  ReservationStations_Issue   =   ~(ReorderBuffer_full | ReservationStations_full) & DIReg_IssueI;
    assign  ReservationStations_MemW    =   DIReg_MemWI;
    assign  ReservationStations_MemtoReg=   DIReg_MemtoRegI;
    assign  ReservationStations_MULS    =   DIReg_MULSI;
    assign  ReservationStations_FPS     =   DIReg_FPSI;
    assign  ReservationStations_rrs_result_busy =   RegisterResultStatus_result_busy;
    assign  ReservationStations_rrs_index   =   RegisterResultStatus_index;
    assign  ReservationStations_fs_flagready=   FlagStatus_FlagReady;
    assign  ReservationStations_fs_index    =   FlagStatus_index;
    assign  ReservationStations_ALUSrc  =   DIReg_ALUSrcI;
    assign  ReservationStations_ExtImm  =   DIReg_ExtImmI;
    assign  ReservationStations_Cond    =   DIReg_CondI;
    assign  ReservationStations_FlagW   =   DIReg_FlagWI;
    assign  ReservationStations_RegW    =   DIReg_RegWI;
    assign  ReservationStations_NoWrite =   DIReg_NoWriteI;
    assign  ReservationStations_Shamt5  =   DIReg_Shamt5I;
    assign  ReservationStations_Sh      =   DIReg_ShI;
    assign  ReservationStations_RA1     =   DIReg_RA1I;
    assign  ReservationStations_RA2     =   DIReg_RA2I;
    assign  ReservationStations_RD1     =   RegisterFile_RD1;
    assign  ReservationStations_RD2     =   RegisterFile_RD2;
    assign  ReservationStations_Op      =   DIReg_OpI;
    assign  ReservationStations_ROBTail =   ReorderBuffer_ROBTail;
    assign  ReservationStations_Cache_Busy  =   Cache_Busy;
    assign  ReservationStations_MCycle_Busy =   MCycle_Busy;
    assign  ReservationStations_FPU_Busy    =   FPU_Busy;
    assign  ReservationStations_ROB_ForwardA    =   ReorderBuffer_ForwardA;
    assign  ReservationStations_ROB_ForwardB    =   ReorderBuffer_ForwardB;
    assign  ReservationStations_ROB_ForwardDataA    =   ReorderBuffer_ForwardDataA;
    assign  ReservationStations_ROB_ForwardDataB    =   ReorderBuffer_ForwardDataB;



    assign  RegisterResultStatus_query  =   ReservationStations_rrs_query;
    assign  RegisterResultStatus_WA     =   DIReg_WA3I;
    assign  RegisterResultStatus_NoWrite=   DIReg_NoWriteI | (DIReg_OpI == `STRN | DIReg_OpI == `STRP);
    assign  RegisterResultStatus_append =   ReservationStations_Issue;
    assign  RegisterResultStatus_ROBTail=   ReorderBuffer_ROBTail;

    assign  FlagStatus_append   =   ReservationStations_Issue;
    assign  FlagStatus_S        =   |DIReg_FlagWI;
    assign  FlagStatus_ROBTail  =   ReorderBuffer_ROBTail;


    assign  Flags_FlagWrite     =   DP_CondUnit_FlagWrite;
    assign  Flags_ALUFlags      =   ALU_ALUFlags;
    assign  Flags_ShifterCarry  =   DP_Shifter_Carry;
    assign  Flags_Op            =   DP_CondUnit_Op;




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  Data Processing Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    assign  DP_IEReg_EN            =   1'b1;
    assign  DP_IEReg_CLR           =   1'b0;
    assign  DP_IEReg_ExecI         =   ReservationStations_DP_Exec;
    assign  DP_IEReg_CondI         =   ReservationStations_DP_Cond;
    assign  DP_IEReg_FlagWI        =   ReservationStations_DP_FlagW;
    assign  DP_IEReg_RegWI         =   ReservationStations_DP_RegW;
    assign  DP_IEReg_WIndexI       =   ReservationStations_DP_WIndex;
    assign  DP_IEReg_SrcAI         =   ReservationStations_DP_SrcA;
    assign  DP_IEReg_SrcBI         =   ReservationStations_DP_SrcB;
    assign  DP_IEReg_ShI           =   ReservationStations_DP_Sh;
    assign  DP_IEReg_Shamt5I       =   ReservationStations_DP_Shamt5;
    assign  DP_IEReg_ALUSrcI       =   ReservationStations_DP_ALUSrc;
    assign  DP_IEReg_OpI           =   ReservationStations_DP_Op;
    assign  DP_IEReg_NoWriteI      =   ReservationStations_DP_NoWrite;


    
    assign  DP_Shifter_Sh      =   DP_IEReg_ShE;
    assign  DP_Shifter_Shamt5  =   DP_IEReg_Shamt5E;
    assign  DP_Shifter_ShIn    =   DP_IEReg_SrcBE;
    assign  DP_Shifter_CFlag   =   Flags_Flags[1];



    assign  DP_CondUnit_Cond    =   DP_IEReg_CondE;
    assign  DP_CondUnit_Op      =   DP_IEReg_OpE;
    assign  DP_CondUnit_Flags   =   Flags_Flags;
    assign  DP_CondUnit_FlagW   =   DP_IEReg_FlagWE;
    assign  DP_CondUnit_RegW    =   DP_IEReg_RegWE;
    assign  DP_CondUnit_NoWrite =   DP_IEReg_NoWriteE;


    assign  ALU_SrcA        =   DP_IEReg_SrcAE;
    assign  ALU_SrcB        =   DP_IEReg_ALUSrcE ? DP_IEReg_SrcBE : DP_Shifter_ShOut;
    assign  ALU_Op          =   DP_IEReg_OpE;
    assign  ALU_CFlag       =   Flags_Flags[1];
    
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  Memory Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    assign  MEM_IEReg_EN            =   ~Cache_Busy;
    assign  MEM_IEReg_CLR           =   1'b0;
    assign  MEM_IEReg_CondI         =   ReservationStations_MEM_Cond;
    assign  MEM_IEReg_RegWI         =   ReservationStations_MEM_RegW;
    assign  MEM_IEReg_ExecI         =   ReservationStations_MEM_Exec;
    assign  MEM_IEReg_WIndexI       =   ReservationStations_MEM_WIndex;
    assign  MEM_IEReg_ALUSrcI       =   ReservationStations_MEM_ALUSrc;
    assign  MEM_IEReg_SrcAI         =   ReservationStations_MEM_SrcA;
    assign  MEM_IEReg_SrcBI         =   ReservationStations_MEM_SrcB;
    assign  MEM_IEReg_WriteDataI    =   ReservationStations_MEM_WriteData;
    assign  MEM_IEReg_ShI           =   ReservationStations_MEM_Sh;
    assign  MEM_IEReg_Shamt5I       =   ReservationStations_MEM_Shamt5;


    assign  MEM_Shifter_Sh      =   MEM_IEReg_ShE;
    assign  MEM_Shifter_Shamt5  =   MEM_IEReg_Shamt5E;
    assign  MEM_Shifter_ShIn    =   MEM_IEReg_SrcBE;


    assign  MEM_adder_a     =   MEM_IEReg_SrcAE;
    assign  MEM_adder_b     =   MEM_IEReg_ALUSrcE ? MEM_IEReg_SrcBE : MEM_Shifter_ShOut;



    assign  MEM_CondUnit_Cond    =   MEM_IEReg_CondE;
    assign  MEM_CondUnit_Exec    =   MEM_IEReg_ExecE;
    assign  MEM_CondUnit_Flags   =   Flags_Flags;
    assign  MEM_CondUnit_RegW    =   MEM_IEReg_RegWE;



    assign  MemOrIO_we          =   ~MEM_IEReg_RegWE;
    assign  MemOrIO_addr_in     =   MEM_adder_s;
    assign  MemOrIO_m_rdata     =   Cache_ReadData;
    assign  MemOrIO_r_rdata     =   MEM_IEReg_WriteDataE;
    assign  MemOrIO_io_rdata    =   IO_ReadData;


    assign  IO_Addr         =   MemOrIO_io_addr;
    assign  IO_WriteData    =   MemOrIO_io_wdata;
    assign  IO_WE           =   MemOrIO_io_we;


    assign  Cache_RW        =   MemOrIO_m_we;
    assign  Cache_Addr      =   MemOrIO_m_addr;
    assign  Cache_Valid     =   MemOrIO_dec_mem & (MEM_CondUnit_MemWrite | MEM_CondUnit_RegWrite);
    assign  Cache_WriteData =   MemOrIO_m_wdata;

    assign  Cache_Busy  =   MEM_CondUnit_RegWrite & Cache_Valid & ~Cache_ReadReady;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  MUL Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    assign  MUL_IEReg_EN            =   ~MCycle_Busy;
    assign  MUL_IEReg_CLR           =   1'b0;
    assign  MUL_IEReg_ExecI         =   ReservationStations_MUL_Exec;
    assign  MUL_IEReg_CondI         =   ReservationStations_MUL_Cond;
    assign  MUL_IEReg_FlagWI        =   ReservationStations_MUL_FlagW;
    assign  MUL_IEReg_WIndexI       =   ReservationStations_MUL_WIndex;
    assign  MUL_IEReg_OpI           =   ReservationStations_MUL_Op;
    assign  MUL_IEReg_MULSI         =   ReservationStations_MUL_Exec;
    assign  MUL_IEReg_SrcAI         =   ReservationStations_MUL_SrcA;
    assign  MUL_IEReg_SrcBI         =   ReservationStations_MUL_SrcB;


    assign  MUL_CondUnit_Cond   =   MUL_IEReg_CondE;
    assign  MUL_CondUnit_Flags  =   Flags_Flags;
    assign  MUL_CondUnit_FlagW  =   MUL_IEReg_FlagWE;
    assign  MUL_CondUnit_MULS   =   MUL_IEReg_MULSE;



    assign  MCycle_Start        =   MUL_CondUnit_MULStart;
    assign  MCycle_MCycleOp     =   MUL_IEReg_OpE == `DIV;
    assign  MCycle_Operand1     =   MUL_IEReg_SrcAE;
    assign  MCycle_Operand2     =   MUL_IEReg_SrcBE;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////






//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  FP Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    assign  FP_IEReg_EN         =   ~FPU_Busy;
    assign  FP_IEReg_CLR        =   1'b0;
    assign  FP_IEReg_ExecI      =   ReservationStations_FP_Exec;
    assign  FP_IEReg_CondI      =   ReservationStations_FP_Cond;
    assign  FP_IEReg_FlagWI     =   ReservationStations_FP_FlagW;
    assign  FP_IEReg_WIndexI    =   ReservationStations_FP_WIndex;
    assign  FP_IEReg_OpI        =   ReservationStations_FP_Op;
    assign  FP_IEReg_FPSI       =   ReservationStations_FP_Exec;
    assign  FP_IEReg_SrcAI      =   ReservationStations_FP_SrcA;
    assign  FP_IEReg_SrcBI      =   ReservationStations_FP_SrcB;


    assign  FP_CondUnit_Cond    =   FP_IEReg_CondE;
    assign  FP_CondUnit_Flags   =   Flags_Flags;
    assign  FP_CondUnit_FlagW   =   FP_IEReg_FlagWE;
    assign  FP_CondUnit_FPS     =   FP_IEReg_FPSE;



    assign  FPU_Start       =   FP_CondUnit_FPStart;
    assign  FPU_FPUOp       =   FP_IEReg_OpE == `FMUL;
    assign  FPU_Operand1    =   FP_IEReg_SrcAE;
    assign  FPU_Operand2    =   FP_IEReg_SrcBE;












    assign  WBB     =   {ReorderBuffer_WD, ReorderBuffer_Commit, ReorderBuffer_ROBHead};

    assign  CDB[35:0] = {ALU_ALUResult, DP_IEReg_ExecE, DP_IEReg_WIndexE};
    assign  CDB[71:36] = {MEM_CondUnit_MemWrite ? MEM_IEReg_WriteDataE : Cache_ReadData, Cache_ReadReady | MEM_CondUnit_MemWrite, MEM_IEReg_WIndexE};
    assign  CDB[107:72] = {MCycle_Result, MCycle_Done, MUL_IEReg_WIndexE};
    assign  CDB[143:108] = {FPU_Result, FPU_Done, FP_IEReg_WIndexE};
    assign  CDB[147:144] = {|DP_IEReg_FlagWE, DP_IEReg_WIndexE};





    ProgramCounter ProgramCounter(
        .CLK        (CLK                        ),
        .Reset      (Reset                      ),
        .EN         (ProgramCounter_EN          ),
        .PCSrc      (1'b0       ),
        .Result     (32'b0      ),
        .PC         (ProgramCounter_PC          ),
        .PCPlus4    (ProgramCounter_PCPlus4     ));

    FDReg FDReg(
        .CLK(CLK),
        .Reset(Reset),
        .EN(FDReg_EN),
        .CLR(1'b0),
        .InstrF(FDReg_InstrF),
        .InstrD(FDReg_InstrD)
    );

    ControlUnit ControlUnit(
        .Instr      (ControlUnit_Instr      ),
        .Issue      (ControlUnit_Issue      ),
        .FlagW      (ControlUnit_FlagW      ),
        .PCS        (ControlUnit_PCS        ),
        .RegW       (ControlUnit_RegW       ),
        .MemW       (ControlUnit_MemW       ),
        .MemtoReg   (ControlUnit_MemtoReg   ),
        .ALUSrc     (ControlUnit_ALUSrc     ),
        .ImmSrc     (ControlUnit_ImmSrc     ),
        .RegSrc     (ControlUnit_RegSrc     ),
        .Operation  (ControlUnit_Operation  ),
        .NoWrite    (ControlUnit_NoWrite    ),
        .MS         (ControlUnit_MS         ),
        .MCycleOp   (ControlUnit_MCycleOp   ),
        .FPS       (ControlUnit_FPS       ),
        .FPOp      (ControlUnit_FPOp      ));
        

    Extend Extend(
        .ImmSrc     (Extend_ImmSrc      ),
        .InstrImm   (Extend_InstrImm    ),
        .ExtImm     (Extend_ExtImm      ));


    ReorderBuffer ReorderBuffer(
        .CLK(CLK),
        .Reset(Reset),
        .append(ReorderBuffer_append),
        .full(ReorderBuffer_full),
        .ROBTail(ReorderBuffer_ROBTail),
        .ROBHead(ReorderBuffer_ROBHead),
        .CDB(CDB),
        .DestReg(ReorderBuffer_DestReg),
        .DP_WriteBack(ReorderBuffer_DP_WriteBack),
        .MEM_WriteBack(ReorderBuffer_MEM_WriteBack),
        .WA(ReorderBuffer_WA),
        .WE(ReorderBuffer_WE),
        .WD(ReorderBuffer_WD),
        .Commit(ReorderBuffer_Commit),
        .IndexA(ReorderBuffer_IndexA),
        .IndexB(ReorderBuffer_IndexB),
        .ForwardDataA(ReorderBuffer_ForwardDataA),
        .ForwardDataB(ReorderBuffer_ForwardDataB),
        .ForwardA(ReorderBuffer_ForwardA),
        .ForwardB(ReorderBuffer_ForwardB)
    );


    DIReg DIReg(
        .CLK(CLK),
        .Reset(Reset),
        .EN(DIReg_EN),
        .IssueD (DIReg_IssueD),
        .OpD    (DIReg_OpD),
        .RA1D   (DIReg_RA1D),
        .RA2D   (DIReg_RA2D),
        .WA3D   (DIReg_WA3D),
        .ALUSrcD     (DIReg_ALUSrcD),
        .ExtImmD(DIReg_ExtImmD),
        .CondD(DIReg_CondD),
        .FlagWD(DIReg_FlagWD),
        .RegWD(DIReg_RegWD),
        .NoWriteD(DIReg_NoWriteD),
        .Shamt5D(DIReg_Shamt5D),
        .ShD(DIReg_ShD),
        .MemWD  (DIReg_MemWD),
        .MemtoRegD  (DIReg_MemtoRegD),
        .MULSD  (DIReg_MULSD),
        .FPSD   (DIReg_FPSD),
        .IssueI (DIReg_IssueI),
        .OpI    (DIReg_OpI),
        .RA1I   (DIReg_RA1I),
        .RA2I   (DIReg_RA2I),
        .WA3I   (DIReg_WA3I),
        .ALUSrcI     (DIReg_ALUSrcI),
        .ExtImmI(DIReg_ExtImmI),
        .CondI(DIReg_CondI),
        .FlagWI(DIReg_FlagWI),
        .RegWI(DIReg_RegWI),
        .NoWriteI(DIReg_NoWriteI),
        .MemWI  (DIReg_MemWI),
        .MemtoRegI  (DIReg_MemtoRegI),
        .MULSI  (DIReg_MULSI),
        .FPSI   (DIReg_FPSI),
        .Shamt5I(DIReg_Shamt5I),
        .ShI(DIReg_ShI)
    );


    RegisterFile RegisterFile(
        .CLK    (CLK                ),
        .Reset  (Reset              ),
        .WE3    (RegisterFile_WE3   ),
        .A1     (RegisterFile_A1    ),
        .A2     (RegisterFile_A2    ),
        .A3     (RegisterFile_A3    ),
        .WD3    (RegisterFile_WD3   ),
        .R15    (RegisterFile_R15   ),
        .RD1    (RegisterFile_RD1   ),
        .RD2    (RegisterFile_RD2   ));
    


    ReservationStations #(
        .DP_STATION_DEPTH(4),
        .MEM_STATION_DEPTH(2)
    )ReservationStations(
        .CLK(CLK),
        .Reset(Reset),
        .Issue(ReservationStations_Issue),
        .MemW(ReservationStations_MemW),
        .MemtoReg(ReservationStations_MemtoReg),
        .MULS(ReservationStations_MULS),
        .FPS(ReservationStations_FPS),
        .full(ReservationStations_full),
        .CDB(CDB),
        .rrs_query(ReservationStations_rrs_query),
        .rrs_result_busy(ReservationStations_rrs_result_busy),
        .rrs_index(ReservationStations_rrs_index),
        .fs_flagready(ReservationStations_fs_flagready),
        .fs_index(ReservationStations_fs_index),
        .ALUSrc(ReservationStations_ALUSrc),
        .ExtImm(ReservationStations_ExtImm),
        .Cond(ReservationStations_Cond),
        .FlagW(ReservationStations_FlagW),
        .RegW(ReservationStations_RegW),
        .NoWrite(ReservationStations_NoWrite),
        .Shamt5(ReservationStations_Shamt5),
        .Sh(ReservationStations_Sh),
        .RA1(ReservationStations_RA1),
        .RA2(ReservationStations_RA2),
        .RD1(ReservationStations_RD1),
        .RD2(ReservationStations_RD2),
        .Op(ReservationStations_Op),
        .ROBTail(ReservationStations_ROBTail),
        .Cache_Busy(ReservationStations_Cache_Busy),
        .MCycle_Busy(ReservationStations_MCycle_Busy),
        .FPU_Busy(ReservationStations_FPU_Busy),
        .ROB_ForwardDataA(ReservationStations_ROB_ForwardDataA),
        .ROB_ForwardDataB(ReservationStations_ROB_ForwardDataB),
        .ROB_ForwardA(ReservationStations_ROB_ForwardA),
        .ROB_ForwardB(ReservationStations_ROB_ForwardB),

        .DP_Exec    (ReservationStations_DP_Exec    ),
        .DP_Cond    (ReservationStations_DP_Cond    ),
        .DP_FlagW   (ReservationStations_DP_FlagW   ),
        .DP_RegW    (ReservationStations_DP_RegW    ),
        .DP_NoWrite (ReservationStations_DP_NoWrite ),
        .DP_WIndex  (ReservationStations_DP_WIndex  ),
        .DP_Op      (ReservationStations_DP_Op      ),
        .DP_Shamt5  (ReservationStations_DP_Shamt5  ),
        .DP_Sh      (ReservationStations_DP_Sh      ),
        .DP_SrcA    (ReservationStations_DP_SrcA    ),
        .DP_SrcB    (ReservationStations_DP_SrcB    ),
        .DP_ALUSrc  (ReservationStations_DP_ALUSrc  ),

        .MEM_Exec   (ReservationStations_MEM_Exec   ),
        .MEM_Cond   (ReservationStations_MEM_Cond   ),
        .MEM_RegW   (ReservationStations_MEM_RegW   ),
        .MEM_WIndex (ReservationStations_MEM_WIndex ),
        .MEM_ALUSrc (ReservationStations_MEM_ALUSrc ),
        .MEM_Shamt5 (ReservationStations_MEM_Shamt5 ),
        .MEM_Sh     (ReservationStations_MEM_Sh     ),
        .MEM_SrcA   (ReservationStations_MEM_SrcA   ),
        .MEM_SrcB   (ReservationStations_MEM_SrcB   ),
        .MEM_WriteData(ReservationStations_MEM_WriteData),

        .MUL_Exec   (ReservationStations_MUL_Exec   ),
        .MUL_Cond   (ReservationStations_MUL_Cond   ),
        .MUL_FlagW  (ReservationStations_MUL_FlagW  ),
        .MUL_Op     (ReservationStations_MUL_Op     ),
        .MUL_WIndex (ReservationStations_MUL_WIndex ),
        .MUL_SrcA   (ReservationStations_MUL_SrcA   ),
        .MUL_SrcB   (ReservationStations_MUL_SrcB   ),

        .FP_Exec   (ReservationStations_FP_Exec   ),
        .FP_Cond   (ReservationStations_FP_Cond   ),
        .FP_FlagW  (ReservationStations_FP_FlagW  ),
        .FP_Op     (ReservationStations_FP_Op     ),
        .FP_WIndex (ReservationStations_FP_WIndex ),
        .FP_SrcA   (ReservationStations_FP_SrcA   ),
        .FP_SrcB   (ReservationStations_FP_SrcB   ));
        


    RegisterResultStatus RegisterResultStatus(
        .CLK(CLK),
        .Reset(Reset),
        .WBB(WBB),
        .CDB(CDB),
        .query(RegisterResultStatus_query),
        .WA(RegisterResultStatus_WA),
        .NoWrite(RegisterResultStatus_NoWrite),
        .append(RegisterResultStatus_append),
        .ROBTail(RegisterResultStatus_ROBTail),
        .result_busy(RegisterResultStatus_result_busy),
        .index(RegisterResultStatus_index)
    );


    FlagStatus FlagStatus(
        .CLK(CLK),
        .Reset(Reset),
        .CDB(CDB),
        .append(FlagStatus_append),
        .S(FlagStatus_S),
        .ROBTail(FlagStatus_ROBTail),
        .FlagReady(FlagStatus_FlagReady),
        .index(FlagStatus_index)
    );


    Flags Flags(
        .CLK(CLK),
        .Reset(Reset),
        .FlagWrite(Flags_FlagWrite),
        .ALUFlags(Flags_ALUFlags),
        .ShifterCarry(Flags_ShifterCarry),
        .Op(Flags_Op),
        .Flags(Flags_Flags)
    );

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  Data Processing Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    DP_IEReg DP_IEReg(
        .CLK            (CLK                ),
        .Reset          (Reset              ),
        .EN             (DP_IEReg_EN           ),
        .CLR            (DP_IEReg_CLR          ),
        .ExecI          (DP_IEReg_ExecI        ),
        .CondI          (DP_IEReg_CondI        ),
        .FlagWI         (DP_IEReg_FlagWI       ),
        .RegWI          (DP_IEReg_RegWI        ),
        .WIndexI        (DP_IEReg_WIndexI      ),
        .SrcAI          (DP_IEReg_SrcAI        ),
        .SrcBI          (DP_IEReg_SrcBI        ),
        .ShI            (DP_IEReg_ShI          ),
        .Shamt5I        (DP_IEReg_Shamt5I      ),
        .ALUSrcI        (DP_IEReg_ALUSrcI      ),
        .OpI            (DP_IEReg_OpI          ),
        .NoWriteI       (DP_IEReg_NoWriteI     ),
        
        .ExecE          (DP_IEReg_ExecE        ),
        .CondE          (DP_IEReg_CondE        ),
        .FlagWE         (DP_IEReg_FlagWE       ),
        .RegWE          (DP_IEReg_RegWE        ),
        .WIndexE        (DP_IEReg_WIndexE      ),
        .SrcAE          (DP_IEReg_SrcAE        ),
        .SrcBE          (DP_IEReg_SrcBE        ),
        .ShE            (DP_IEReg_ShE          ),
        .Shamt5E        (DP_IEReg_Shamt5E      ),
        .ALUSrcE        (DP_IEReg_ALUSrcE      ),
        .OpE            (DP_IEReg_OpE          ),
        .NoWriteE       (DP_IEReg_NoWriteE     ));
        

    DP_CondUnit DP_CondUnit(
        .CLK        (CLK                ),
        .Reset      (Reset              ),
        .Cond       (DP_CondUnit_Cond      ),
        .Op         (DP_CondUnit_Op),
        .Flags      (DP_CondUnit_Flags),
        .FlagW      (DP_CondUnit_FlagW     ),
        .RegW       (DP_CondUnit_RegW),
        .NoWrite    (DP_CondUnit_NoWrite   ),
        .FlagWrite  (DP_CondUnit_FlagWrite),
        .RegWrite   (DP_CondUnit_RegWrite));



    Shifter DP_Shifter(
        .Sh     (DP_Shifter_Sh     ),
        .Shamt5 (DP_Shifter_Shamt5 ),
        .ShIn   (DP_Shifter_ShIn   ),
        .CFlag  (DP_Shifter_CFlag  ),
        .ShOut  (DP_Shifter_ShOut  ),
        .Carry  (DP_Shifter_Carry  ));



    ALU ALU(
        .SrcA       (ALU_SrcA       ),
        .SrcB       (ALU_SrcB       ),
        .Op         (ALU_Op         ),
        .ALUResult  (ALU_ALUResult  ),
        .ALUFlags   (ALU_ALUFlags   ),
        .CFlag      (ALU_CFlag      ));
        
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  Memory Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    MEM_IEReg MEM_IEReg(
        .CLK            (CLK                ),
        .Reset          (Reset              ),
        .EN             (MEM_IEReg_EN           ),
        .CLR            (MEM_IEReg_CLR          ),
        .ExecI          (MEM_IEReg_ExecI        ),
        .CondI          (MEM_IEReg_CondI        ),
        .RegWI          (MEM_IEReg_RegWI        ),
        .WIndexI        (MEM_IEReg_WIndexI      ),
        .ALUSrcI        (MEM_IEReg_ALUSrcI      ),
        .SrcAI          (MEM_IEReg_SrcAI        ),
        .SrcBI          (MEM_IEReg_SrcBI        ),
        .WriteDataI     (MEM_IEReg_WriteDataI   ),
        .ShI            (MEM_IEReg_ShI          ),
        .Shamt5I        (MEM_IEReg_Shamt5I      ),
        
        .ExecE          (MEM_IEReg_ExecE        ),
        .CondE          (MEM_IEReg_CondE        ),
        .RegWE          (MEM_IEReg_RegWE        ),
        .WIndexE        (MEM_IEReg_WIndexE      ),
        .ALUSrcE        (MEM_IEReg_ALUSrcE      ),
        .SrcAE          (MEM_IEReg_SrcAE        ),
        .SrcBE          (MEM_IEReg_SrcBE        ),
        .WriteDataE     (MEM_IEReg_WriteDataE   ),
        .ShE            (MEM_IEReg_ShE          ),
        .Shamt5E        (MEM_IEReg_Shamt5E      ));



    Shifter MEM_Shifter(
        .Sh     (MEM_Shifter_Sh     ),
        .Shamt5 (MEM_Shifter_Shamt5 ),
        .ShIn   (MEM_Shifter_ShIn   ),
        .CFlag  (                   ),
        .ShOut  (MEM_Shifter_ShOut  ),
        .Carry  (                   ));


    adder MEM_adder(
        .cin(1'b0),
        .a(MEM_adder_a),
        .b(MEM_adder_b),
        .s(MEM_adder_s),
        .cout()
    );



    MEM_CondUnit MEM_CondUnit(
        .Cond       (MEM_CondUnit_Cond  ),
        .Exec       (MEM_CondUnit_Exec  ),
        .Flags      (MEM_CondUnit_Flags ),
        .RegW       (MEM_CondUnit_RegW  ),
        .RegWrite   (MEM_CondUnit_RegWrite),
        .MemWrite   (MEM_CondUnit_MemWrite));




    MemOrIO MemOrIO(
        .we         (MemOrIO_we         ),
        .addr_in    (MemOrIO_addr_in    ),
        .dec_mem    (MemOrIO_dec_mem    ),
        .m_rdata    (MemOrIO_m_rdata    ),
        .r_rdata    (MemOrIO_r_rdata    ),
        .io_rdata   (MemOrIO_io_rdata   ),
        .m_wdata    (MemOrIO_m_wdata    ),
        .m_addr     (MemOrIO_m_addr     ),
        .m_we       (MemOrIO_m_we       ),
        .r_wdata    (MemOrIO_r_wdata    ),
        .io_wdata   (MemOrIO_io_wdata   ),
        .io_addr    (MemOrIO_io_addr    ),
        .io_we      (MemOrIO_io_we      ));
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  MUL Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    MUL_IEReg MUL_IEReg(
        .CLK            (CLK                ),
        .Reset          (Reset              ),
        .EN             (MUL_IEReg_EN           ),
        .CLR            (MUL_IEReg_CLR          ),
        .ExecI          (MUL_IEReg_ExecI        ),
        .CondI          (MUL_IEReg_CondI        ),
        .FlagWI         (MUL_IEReg_FlagWI       ),
        .WIndexI        (MUL_IEReg_WIndexI      ),
        .SrcAI          (MUL_IEReg_SrcAI        ),
        .SrcBI          (MUL_IEReg_SrcBI        ),
        .OpI            (MUL_IEReg_OpI          ),
        .MULSI          (MUL_IEReg_MULSI        ),
        
        .ExecE          (MUL_IEReg_ExecE        ),
        .CondE          (MUL_IEReg_CondE        ),
        .FlagWE         (MUL_IEReg_FlagWE       ),
        .WIndexE        (MUL_IEReg_WIndexE      ),
        .SrcAE          (MUL_IEReg_SrcAE        ),
        .SrcBE          (MUL_IEReg_SrcBE        ),
        .OpE            (MUL_IEReg_OpE          ),
        .MULSE          (MUL_IEReg_MULSE        ));
        

    MUL_CondUnit MUL_CondUnit(
        .CLK        (CLK                ),
        .Reset      (Reset              ),
        .Cond       (MUL_CondUnit_Cond      ),
        .Flags      (MUL_CondUnit_Flags),
        .FlagW      (MUL_CondUnit_FlagW     ),
        .FlagWrite  (MUL_CondUnit_FlagWrite),
        .MULS       (MUL_CondUnit_MULS),
        .MULStart   (MUL_CondUnit_MULStart));
        


    MCycle #(32) MCycle(
        .CLK        (CLK                ),
        .Reset      (Reset              ),
        .Start      (MCycle_Start       ),
        .MCycleOp   (MCycle_MCycleOp    ),
        .Operand1   (MCycle_Operand1    ),
        .Operand2   (MCycle_Operand2    ),
        .Result     (MCycle_Result      ),
        .Busy       (MCycle_Busy        ),
        .Done       (MCycle_Done        ));
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////





        

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////  FP Pipline
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    FP_IEReg FP_IEReg(
        .CLK            (CLK                ),
        .Reset          (Reset              ),
        .EN             (FP_IEReg_EN           ),
        .CLR            (FP_IEReg_CLR          ),
        .ExecI          (FP_IEReg_ExecI        ),
        .CondI          (FP_IEReg_CondI        ),
        .FlagWI         (FP_IEReg_FlagWI       ),
        .WIndexI        (FP_IEReg_WIndexI      ),
        .SrcAI          (FP_IEReg_SrcAI        ),
        .SrcBI          (FP_IEReg_SrcBI        ),
        .OpI            (FP_IEReg_OpI          ),
        .FPSI           (FP_IEReg_FPSI        ),
        
        .ExecE          (FP_IEReg_ExecE        ),
        .CondE          (FP_IEReg_CondE        ),
        .FlagWE         (FP_IEReg_FlagWE       ),
        .WIndexE        (FP_IEReg_WIndexE      ),
        .SrcAE          (FP_IEReg_SrcAE        ),
        .SrcBE          (FP_IEReg_SrcBE        ),
        .OpE            (FP_IEReg_OpE          ),
        .FPSE           (FP_IEReg_FPSE        ));
        

    FP_CondUnit FP_CondUnit(
        .CLK        (CLK                ),
        .Reset      (Reset              ),
        .Cond       (FP_CondUnit_Cond      ),
        .Flags      (FP_CondUnit_Flags),
        .FlagW      (FP_CondUnit_FlagW     ),
        .FlagWrite  (FP_CondUnit_FlagWrite),
        .FPS        (FP_CondUnit_FPS),
        .FPStart    (FP_CondUnit_FPStart));
        


    FPU FPU(
        .CLK        (CLK                ),
        .Reset      (Reset              ),
        .Start      (FPU_Start          ),
        .FPUOp      (FPU_FPUOp          ),
        .Operand1   (FPU_Operand1       ),
        .Operand2   (FPU_Operand2       ),
        .Result     (FPU_Result         ),
        .Busy       (FPU_Busy           ),
        .Done       (FPU_Done           ));
endmodule
