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
    

    wire    [143:0]     CDB;

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
    wire    [3:0]       ReorderBuffer_DestReg;
    wire    [3:0]       ReorderBuffer_WA;
    wire                ReorderBuffer_WE;
    wire    [31:0]      ReorderBuffer_WD;




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
    wire                ReservationStations_ALUSrc;
    wire    [31:0]      ReservationStations_ExtImm;
    wire    [3:0]       ReservationStations_Cond;
    wire    [4:0]       ReservationStations_Shamt5;
    wire    [1:0]       ReservationStations_Sh;
    wire    [3:0]       ReservationStations_RA1;
    wire    [3:0]       ReservationStations_RA2;
    wire    [31:0]      ReservationStations_RD1;
    wire    [31:0]      ReservationStations_RD2;
    wire    [4:0]       ReservationStations_Op;
    wire    [2:0]       ReservationStations_ROBTail;
    wire                ReservationStations_DP_Exec;
    wire    [3:0]       ReservationStations_DP_Cond;
    wire    [2:0]       ReservationStations_DP_WIndex;
    wire    [4:0]       ReservationStations_DP_Op;
    wire    [4:0]       ReservationStations_DP_Shamt5;
    wire    [1:0]       ReservationStations_DP_Sh;
    wire    [31:0]      ReservationStations_DP_SrcA;
    wire    [31:0]      ReservationStations_DP_SrcB;
    wire                ReservationStations_DP_ALUSrc;



    wire    [7:0]       RegisterResultStatus_query;
    wire    [3:0]       RegisterResultStatus_WA;
    wire    [31:0]      RegisterResultStatus_append;
    wire    [2:0]       RegisterResultStatus_ROBTail;
    wire    [1:0]       RegisterResultStatus_result_busy;
    wire    [5:0]       RegisterResultStatus_index;



    wire                DP_IEReg_EN;
    wire                DP_IEReg_CLR;
    wire                DP_IEReg_ExecI;
    wire    [3:0]       DP_IEReg_CondI;
    wire    [3:0]       DP_IEReg_FlagWI;
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
    wire    [3:0]       DP_CondUnit_FlagW;
    wire    [3:0]       DP_CondUnit_ALUFlags;
    wire                DP_CondUnit_ShifterCarry;
    wire                DP_CondUnit_NoWrite;
    wire                DP_CondUnit_CFlag;


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

    wire                DP_EWReg_ExecE;
    wire    [31:0]      DP_EWReg_ALUResultE;
    wire    [2:0]       DP_EWReg_WIndexE;
    wire                DP_EWReg_ExecW;
    wire    [31:0]      DP_EWReg_ALUResultW;
    wire    [2:0]       DP_EWReg_WIndexW;


    
    assign  PC  =   ProgramCounter_PC;

    assign  ProgramCounter_EN   =   ~(ReorderBuffer_full | ReservationStations_full);

    assign  FDReg_EN        =   ~(ReorderBuffer_full | ReservationStations_full);
    assign  FDReg_InstrF    =   Instr;

    assign  ControlUnit_Instr   =   FDReg_InstrD;

    assign  Extend_ImmSrc   =   ControlUnit_ImmSrc;
    assign  Extend_InstrImm =   FDReg_InstrD[23:0];

    assign  ReorderBuffer_append    =   ReservationStations_Issue;
    assign  ReorderBuffer_DestReg   =   DIReg_WA3I;

    assign  RegisterFile_WE3    =   ReorderBuffer_WE;
    assign  RegisterFile_WD3    =   ReorderBuffer_WD;
    assign  RegisterFile_A1     =   DIReg_RA1I;
    assign  RegisterFile_A2     =   DIReg_RA2I;
    assign  RegisterFile_A3     =   ReorderBuffer_WA;
    assign  RegisterFile_R15    =   ProgramCounter_PCPlus4;
    

    assign  DIReg_EN    =   ~(ReorderBuffer_full | ReservationStations_full);
    assign  DIReg_IssueD=   ControlUnit_Issue;
    assign  DIReg_OpD   =   ControlUnit_Operation;
    assign  DIReg_RA1D  =   ControlUnit_RegSrc[2] ? FDReg_InstrD[11:8] : ControlUnit_RegSrc[0] ? 4'd15 : FDReg_InstrD[19:16];;
    assign  DIReg_RA2D  =   ControlUnit_RegSrc[2] ? FDReg_InstrD[3:0] : ControlUnit_RegSrc[1] ? FDReg_InstrD[15:12] : FDReg_InstrD[3:0];;
    assign  DIReg_WA3D  =   ControlUnit_RegSrc[2] ? FDReg_InstrD[19:16] : FDReg_InstrD[15:12];
    assign  DIReg_ALUSrcD    =   ControlUnit_ALUSrc;
    assign  DIReg_ExtImmD   =   Extend_ExtImm;
    assign  DIReg_CondD =   FDReg_InstrD[31:28];
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
    assign  ReservationStations_ALUSrc       =   DIReg_ALUSrcI;
    assign  ReservationStations_ExtImm  =   DIReg_ExtImmI;
    assign  ReservationStations_Cond    =   DIReg_CondI;
    assign  ReservationStations_Shamt5  =   DIReg_Shamt5I;
    assign  ReservationStations_Sh      =   DIReg_ShI;
    assign  ReservationStations_RA1     =   DIReg_RA1I;
    assign  ReservationStations_RA2     =   DIReg_RA2I;
    assign  ReservationStations_RD1     =   RegisterFile_RD1;
    assign  ReservationStations_RD2     =   RegisterFile_RD2;
    assign  ReservationStations_Op      =   DIReg_OpI;
    assign  ReservationStations_ROBTail =   ReorderBuffer_ROBTail;


    assign  RegisterResultStatus_query  =   ReservationStations_rrs_query;
    assign  RegisterResultStatus_WA     =   DIReg_WA3I;
    assign  RegisterResultStatus_append =   ReservationStations_Issue;
    assign  RegisterResultStatus_ROBTail=   ReorderBuffer_ROBTail;




    assign  DP_IEReg_EN            =   ReservationStations_DP_Exec;
    assign  DP_IEReg_CLR           =   1'b0;
    assign  DP_IEReg_ExecI          =   ReservationStations_DP_Exec;
    assign  DP_IEReg_CondI         =   ReservationStations_Cond;
    assign  DP_IEReg_FlagWI        =   ControlUnit_FlagW;
    assign  DP_IEReg_WIndexI       =   ReservationStations_DP_WIndex;
    assign  DP_IEReg_SrcAI         =   ReservationStations_DP_SrcA;
    assign  DP_IEReg_SrcBI         =   ReservationStations_DP_SrcB;
    assign  DP_IEReg_ShI           =   ReservationStations_DP_Sh;
    assign  DP_IEReg_Shamt5I       =   ReservationStations_DP_Shamt5;
    assign  DP_IEReg_ALUSrcI       =   ReservationStations_DP_ALUSrc;
    assign  DP_IEReg_OpI           =   ReservationStations_DP_Op;
    assign  DP_IEReg_NoWriteI      =   ControlUnit_NoWrite;


    
    assign  DP_Shifter_Sh      =   DP_IEReg_ShE;
    assign  DP_Shifter_Shamt5  =   DP_IEReg_Shamt5E;
    assign  DP_Shifter_ShIn    =   DP_IEReg_SrcBE;
    assign  DP_Shifter_CFlag   =   DP_CondUnit_CFlag;


    assign  ALU_SrcA        =   DP_IEReg_SrcAE;
    assign  ALU_SrcB        =   DP_IEReg_ALUSrcE ? DP_IEReg_SrcBE : DP_Shifter_ShOut;
    assign  ALU_Op          =   DP_IEReg_OpE;
    assign  ALU_CFlag       =   DP_CondUnit_CFlag;
    

    assign  DP_EWReg_ExecE         =   DP_IEReg_ExecE;
    assign  DP_EWReg_ALUResultE    =   ALU_ALUResult;
    assign  DP_EWReg_WIndexE       =   DP_IEReg_WIndexE;







    assign  CDB[35:0] = {ALU_ALUResult, DP_IEReg_ExecE, DP_IEReg_WIndexE};







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
        .CDB(CDB),
        .DestReg(ReorderBuffer_DestReg),
        .WA(ReorderBuffer_WA),
        .WE(ReorderBuffer_WE),
        .WD(ReorderBuffer_WD)
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
        .MemWI  (DIReg_MemWI),
        .MemtoRegI  (DIReg_MemtoRegI),
        .MULSI  (DIReg_MULSI),
        .FPSI   (DIReg_FPSI),
        .Shamt5I(DIReg_Shamt5I),
        .ShI(DIReg_ShI)
    );


    RegisterFile RegisterFile(
        .CLK_n  (~CLK               ),
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
        .DP_STATION_DEPTH(4)
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
        .ALUSrc(ReservationStations_ALUSrc),
        .ExtImm(ReservationStations_ExtImm),
        .Cond(ReservationStations_Cond),
        .Shamt5(ReservationStations_Shamt5),
        .Sh(ReservationStations_Sh),
        .RA1(ReservationStations_RA1),
        .RA2(ReservationStations_RA2),
        .RD1(ReservationStations_RD1),
        .RD2(ReservationStations_RD2),
        .Op(ReservationStations_Op),
        .ROBTail(ReservationStations_ROBTail),
        .DP_Exec(ReservationStations_DP_Exec),
        .DP_Cond(ReservationStations_DP_Cond),
        .DP_WIndex(ReservationStations_DP_WIndex),
        .DP_Op(ReservationStations_DP_Op),
        .DP_Shamt5(ReservationStations_DP_Shamt5),
        .DP_Sh(ReservationStations_DP_Sh),
        .DP_SrcA(ReservationStations_DP_SrcA),
        .DP_SrcB(ReservationStations_DP_SrcB),
        .DP_ALUSrc(ReservationStations_DP_ALUSrc)
    );
        


    RegisterResultStatus RegisterResultStatus(
        .CLK(CLK),
        .Reset(Reset),
        .CDB(CDB),
        .query(RegisterResultStatus_query),
        .WA(RegisterResultStatus_WA),
        .append(RegisterResultStatus_append),
        .ROBTail(RegisterResultStatus_ROBTail),
        .result_busy(RegisterResultStatus_result_busy),
        .index(RegisterResultStatus_index)
    );



    DP_IEReg DP_IEReg(
        .CLK            (CLK                ),
        .Reset          (Reset              ),
        .EN             (DP_IEReg_EN           ),
        .CLR            (DP_IEReg_CLR          ),
        .ExecI          (DP_IEReg_ExecI        ),
        .CondI          (DP_IEReg_CondI        ),
        .FlagWI         (DP_IEReg_FlagWI       ),
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
        .Op (DP_CondUnit_Op),
        .FlagW      (DP_CondUnit_FlagW     ),
        .ALUFlags   (DP_CondUnit_ALUFlags  ),
        .ShifterCarry(DP_CondUnit_ShifterCarry),
        .NoWrite    (DP_CondUnit_NoWrite   ),
        .CFlag      (DP_CondUnit_CFlag     ));



    DP_Shifter DP_Shifter(
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
        

    DP_EWReg DP_EWReg(
        .CLK(CLK),
        .Reset(Reset),
        .ExecE(DP_EWReg_ExecE),
        .ALUResultE(DP_EWReg_ALUResultE),
        .WIndexE(DP_EWReg_WIndexE),
        .ExecW(DP_EWReg_ExecW),
        .ALUResultW(DP_EWReg_ALUResultW),
        .WIndexW(DP_EWReg_WIndexW)
    );


endmodule
