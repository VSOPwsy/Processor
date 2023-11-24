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


module ARMcore(
    input               CLK,
    input               Reset,
    input   [31:0]      Instr,
    input   [31:0]      ReadData,
    
    output              MemWrite,
    output  [31:0]      PC,
    output  [31:0]      ALUResult,
    output  [31:0]      WriteData
    );
    
    // Test
    assign  ALUResult   =   EMReg_ALUOutM;
    assign  WriteData   =   HazardUnit_ForwardM ? ResultW : EMReg_WriteDataM;
    assign  DataMemory_RD   =   ReadData;
    assign  MemWrite    =   EMReg_MemWriteM;
    assign  PC          =   InstructionMemory_PC;
    assign  InstructionMemory_Instr     =   Instr;
    
    
    
    // HazardUnit
    // Input
    wire    [3:0]       HazardUnit_RA1D;
    wire    [3:0]       HazardUnit_RA2D;
    wire    [3:0]       HazardUnit_RA1E;
    wire    [3:0]       HazardUnit_RA2E;
    wire    [3:0]       HazardUnit_RA2M;
    wire    [3:0]       HazardUnit_WA3E;
    wire    [3:0]       HazardUnit_WA3M;
    wire    [3:0]       HazardUnit_WA3W;
    wire                HazardUnit_RegWriteE;
    wire                HazardUnit_RegWriteM;
    wire                HazardUnit_RegWriteW;
    wire                HazardUnit_MemWriteM;
    wire                HazardUnit_MemtoRegE;
    wire                HazardUnit_MemtoRegW;
    wire                HazardUnit_PCSrcE;
    wire    [3:0]       HazardUnit_MCycleWA3;
    wire                HazardUnit_MCycleDone;
    wire                HazardUnit_MCycleBusy;
    // Output
    wire    [1:0]       HazardUnit_ForwardAE;
    wire    [1:0]       HazardUnit_ForwardBE;
    wire                HazardUnit_ForwardM;
    wire                HazardUnit_StallF;
    wire                HazardUnit_StallD;
    wire                HazardUnit_FlushD;
    wire                HazardUnit_FlushE;
    wire                HazardUnit_MCycleHazard;
    // Assignment
    assign  HazardUnit_RA1D     =   RegisterFile_A1;
    assign  HazardUnit_RA2D     =   RegisterFile_A2;
    assign  HazardUnit_RA1E     =   DEReg_RA1E;
    assign  HazardUnit_RA2E     =   DEReg_RA2E;
    assign  HazardUnit_RA2M     =   EMReg_RA2M;
    assign  HazardUnit_WA3E     =   DEReg_WA3E;
    assign  HazardUnit_WA3M     =   EMReg_WA3M;
    assign  HazardUnit_WA3W     =   MWReg_WA3W;
    assign  HazardUnit_RegWriteE    =   CondUnit_RegWrite;
    assign  HazardUnit_RegWriteM    =   EMReg_RegWriteM;
    assign  HazardUnit_RegWriteW    =   MWReg_RegWriteW;
    assign  HazardUnit_MemWriteM    =   EMReg_MemWriteM;
    assign  HazardUnit_MemtoRegE    =   DEReg_MemtoRegE;
    assign  HazardUnit_MemtoRegW    =   MWReg_MemtoRegW;
    assign  HazardUnit_PCSrcE       =   CondUnit_PCSrc;
    assign  HazardUnit_MCycleWA3    =   MCycle_MCycleWA3;
    assign  HazardUnit_MCycleDone   =   MCycle_Done;
    assign  HazardUnit_MCycleBusy   =   MCycle_Busy;
    
    
    
    // ProgramCounter
    // Input
    wire                ProgramCounter_EN;
    wire                ProgramCounter_PCSrc;
    wire    [31:0]      ProgramCounter_Result;
    // Output
    wire    [31:0]      ProgramCounter_PC;
    wire    [31:0]      ProgramCounter_PCPlus4;
    // Assignment
    assign  ProgramCounter_EN       =   ~HazardUnit_StallF;
    assign  ProgramCounter_PCSrc    =   CondUnit_PCSrc;
    assign  ProgramCounter_Result   =   ALU_ALUResult;
    
    
    
    // InstructionMemory
    // Input
    wire    [31:0]      InstructionMemory_PC;
    // Output
    wire    [31:0]      InstructionMemory_Instr;
    // Assignment
    assign  InstructionMemory_PC    =   ProgramCounter_PC;
    
    
    
    // FDReg
    // Input
    wire                FDReg_EN;
    wire                FDReg_CLR;
    wire    [31:0]      FDReg_InstrF;
    // Output
    wire    [31:0]      FDReg_InstrD;
    // Assignment
    assign  FDReg_EN        =   ~HazardUnit_StallD;
    assign  FDReg_CLR       =   HazardUnit_FlushD;
    assign  FDReg_InstrF    =   InstructionMemory_Instr;
    
    
    
    // ControlUnit
    // Input
    wire    [31:0]      ControlUnit_Instr;
    // Output
    wire    [3:0]       ControlUnit_ALUControl;
    wire                ControlUnit_ALUSrc;
    wire    [1:0]       ControlUnit_ImmSrc;
    wire                ControlUnit_MemW;
    wire    [1:0]       ControlUnit_FlagW;
    wire                ControlUnit_MemtoReg;
    wire                ControlUnit_PCS;
    wire    [3:0]       ControlUnit_RegSrc;
    wire                ControlUnit_RegW;
    wire                ControlUnit_NoWrite;
    wire                ControlUnit_MS;
    wire                ControlUnit_MCycleOp;
    // Assignment
    assign  ControlUnit_Instr       =   FDReg_InstrD;
    
    
    
    // RegisterFile
    // Input
    wire                RegisterFile_WE3;
    wire    [3:0]       RegisterFile_A1;
    wire    [3:0]       RegisterFile_A2;
    wire    [3:0]       RegisterFile_A3;
    wire    [31:0]      RegisterFile_WD3;
    wire    [31:0]      RegisterFile_R15;
    // Output
    wire    [31:0]      RegisterFile_RD1;
    wire    [31:0]      RegisterFile_RD2;
    // Assignment
    assign  RegisterFile_WE3    =   MWReg_RegWriteW;
    assign  RegisterFile_A1     =   ControlUnit_RegSrc[2] ? FDReg_InstrD[11:8] : ControlUnit_RegSrc[0] ? 4'd15 : FDReg_InstrD[19:16];
    assign  RegisterFile_A2     =   ControlUnit_RegSrc[2] ? FDReg_InstrD[3:0] : ControlUnit_RegSrc[1] ? FDReg_InstrD[15:12] : FDReg_InstrD[3:0];
    assign  RegisterFile_A3     =   MWReg_WA3W;
    assign  RegisterFile_WD3    =   ResultW;
    assign  RegisterFile_R15    =   ProgramCounter_PCPlus4;
    
    
    
    // Extend
    // Input
    wire    [1:0]       Extend_ImmSrc;
    wire    [23:0]      Extend_InstrImm;
    // Output
    wire    [31:0]      Extend_ExtImm;
    // Assignment
    assign  Extend_ImmSrc       =   ControlUnit_ImmSrc;
    assign  Extend_InstrImm     =   FDReg_InstrD[23:0];
    
    
    
    // DEReg
    //Input
    wire                DEReg_CLR;
    wire    [3:0]       DEReg_CondD;     
    wire    [1:0]       DEReg_FlagWD;    
    wire                DEReg_PCSD;            
    wire                DEReg_RegWD;           
    wire                DEReg_MemWD;           
    wire                DEReg_MemtoRegD;
    wire    [3:0]       DEReg_WA3D;         
    wire                DEReg_ALUSrcD;       
    wire    [3:0]       DEReg_ALUControlD;
    wire    [31:0]      DEReg_RD1D;  
    wire    [31:0]      DEReg_RD2D;   
    wire    [31:0]      DEReg_ExtImmD;
    wire    [3:0]       DEReg_RA1D;
    wire    [3:0]       DEReg_RA2D;
    wire    [1:0]       DEReg_ShD;
    wire    [4:0]       DEReg_Shamt5D;
    wire                DEReg_NoWriteD;
    wire                DEReg_MSD;
    wire                DEReg_MCycleOpD;
    wire                DEreg_MCycleHazardD;
    // Output
    wire    [3:0]       DEReg_CondE;     
    wire    [1:0]       DEReg_FlagWE;    
    wire                DEReg_PCSE;            
    wire                DEReg_RegWE;           
    wire                DEReg_MemWE;           
    wire                DEReg_MemtoRegE;
    wire    [3:0]       DEReg_WA3E;         
    wire                DEReg_ALUSrcE;       
    wire    [3:0]       DEReg_ALUControlE;
    wire    [31:0]      DEReg_RD1E;  
    wire    [31:0]      DEReg_RD2E;   
    wire    [31:0]      DEReg_ExtImmE;
    wire    [3:0]       DEReg_RA1E;
    wire    [3:0]       DEReg_RA2E;
    wire    [1:0]       DEReg_ShE;
    wire    [4:0]       DEReg_Shamt5E;
    wire                DEReg_NoWriteE;
    wire                DEReg_MSE;
    wire                DEReg_MCycleOpE;
    wire                DEreg_MCycleHazardE;
    // Assignment
    assign  DEReg_CLR           =   HazardUnit_FlushE;
    assign  DEReg_CondD         =   FDReg_InstrD[31:28];
    assign  DEReg_FlagWD        =   ControlUnit_FlagW;
    assign  DEReg_PCSD          =   ControlUnit_PCS;
    assign  DEReg_RegWD         =   ControlUnit_RegW;
    assign  DEReg_MemWD         =   ControlUnit_MemW;
    assign  DEReg_MemtoRegD     =   ControlUnit_MemtoReg;
    assign  DEReg_WA3D          =   ControlUnit_RegSrc[2] ? FDReg_InstrD[19:16] : FDReg_InstrD[15:12];
    assign  DEReg_ALUSrcD       =   ControlUnit_ALUSrc;
    assign  DEReg_ALUControlD   =   ControlUnit_ALUControl;
    assign  DEReg_RD1D          =   RegisterFile_RD1;
    assign  DEReg_RD2D          =   RegisterFile_RD2;
    assign  DEReg_ExtImmD       =   Extend_ExtImm;
    assign  DEReg_RA1D          =   RegisterFile_A1;
    assign  DEReg_RA2D          =   RegisterFile_A2;
    assign  DEReg_ShD           =   FDReg_InstrD[6:5];
    assign  DEReg_Shamt5D       =   FDReg_InstrD[11:7];
    assign  DEReg_NoWriteD      =   ControlUnit_NoWrite;
    assign  DEReg_MSD           =   ControlUnit_MS;
    assign  DEReg_MCycleOpD     =   ControlUnit_MCycleOp;
    assign  DEReg_MCycleHazardD =   HazardUnit_MCycleHazard;
    
    
    // Shifter
    // Input
    wire    [1:0]       Shifter_Sh;
    wire    [4:0]       Shifter_Shamt5;
    wire    [31:0]      Shifter_ShIn;
    // Output
    wire    [31:0]      Shifter_ShOut;
    // Assignment
    assign  Shifter_Sh  =   DEReg_ShE;
    assign  Shifter_Shamt5  =   DEReg_Shamt5E;
    assign  Shifter_ShIn    =   EMReg_WriteDataE;
    
    
    
    // CondUnit
    // Input
    wire    [3:0]       CondUnit_Cond;
    wire                CondUnit_PCS;
    wire                CondUnit_RegW;
    wire                CondUnit_MemW;
    wire    [1:0]       CondUnit_FlagW;
    wire    [3:0]       CondUnit_ALUFlags;
    wire                CondUnit_NoWrite;
    wire                CondUnit_MS;
    // Output
    wire                CondUnit_PCSrc;
    wire                CondUnit_RegWrite;
    wire                CondUnit_MemWrite;
    wire                CondUnit_Carry;
    wire                CondUnit_MStart;
    // Assignment
    assign  CondUnit_Cond       =   DEReg_CondE;
    assign  CondUnit_PCS        =   DEReg_PCSE;
    assign  CondUnit_RegW       =   DEReg_RegWE;
    assign  CondUnit_MemW       =   DEReg_MemWE;
    assign  CondUnit_FlagW      =   DEReg_FlagWE;
    assign  CondUnit_ALUFlags   =   ALU_ALUFlags;
    assign  CondUnit_NoWrite    =   DEReg_NoWriteE;
    assign  CondUnit_MS         =   DEReg_MSE;
    
    
    reg     [31:0]      SA;
    reg     [31:0]      SB;
    always @(*) case (HazardUnit_ForwardAE)
        2'b00:  SA = DEReg_RD1E;
        2'b01:  SA = ResultW;
        2'b10:  SA = EMReg_ALUOutM;   endcase
    always @(*) case (HazardUnit_ForwardBE)
        2'b00:  SB =  DEReg_RD2E;
        2'b01:  SB =  ResultW;
        2'b10:  SB =  EMReg_ALUOutM;   endcase
    
    // ALU
    // Input
    wire    [31:0]      ALU_SrcA;
    wire    [31:0]      ALU_SrcB;
    wire    [3:0]       ALU_ALUControl;
    wire                ALU_Carry;
    // Output
    wire    [31:0]      ALU_ALUResult;
    wire    [3:0]       ALU_ALUFlags;
    // Assignment
    assign  ALU_SrcA        =   SA;
    assign  ALU_SrcB        =   DEReg_ALUSrcE ? DEReg_ExtImmE : Shifter_ShOut;
    assign  ALU_ALUControl  =   DEReg_ALUControlE;
    assign  ALU_Carry       =   CondUnit_Carry;
    
    
    // MCycle
    // Input
    wire                MCycle_Start;
    wire                MCycle_MCycleOp;
    wire    [31:0]      MCycle_Operand1;
    wire    [31:0]      MCycle_Operand2;
    wire    [3:0]       MCycle_WA3;
    wire                MCycle_MCycleHazard;
    // Output
    wire    [31:0]      MCycle_Result;
    wire                MCycle_Busy;
    wire                MCycle_Done;
    wire    [3:0]       MCycle_MCycleWA3;
    wire                MCycle_MPushIn;
    // Assignment
    assign  MCycle_Start        =   CondUnit_MStart;
    assign  MCycle_MCycleOp     =   DEReg_MCycleOpE;
    assign  MCycle_Operand1     =   SA;
    assign  MCycle_Operand2     =   SB;
    assign  MCycle_WA3          =   DEReg_WA3E;
    assign  MCycle_MCycleHazard =   HazardUnit_MCycleHazard;
    
    
    // EMReg
    // Input
    wire                EMReg_RegWriteE;
    wire                EMReg_MemWriteE;
    wire                EMReg_MemtoRegE;
    wire    [31:0]      EMReg_ALUResultE;
    wire    [31:0]      EMReg_WriteDataE;
    wire    [3:0]       EMReg_WA3E;
    wire    [3:0]       EMReg_RA2E;
    // Output
    wire                EMReg_RegWriteM;
    wire                EMReg_MemWriteM;
    wire                EMReg_MemtoRegM;
    wire    [31:0]      EMReg_ALUOutM;
    wire    [31:0]      EMReg_WriteDataM;
    wire    [3:0]       EMReg_WA3M;
    wire    [3:0]       EMReg_RA2M;
    // Assignment
    assign  EMReg_RegWriteE     =   MCycle_MPushIn | (~(MCycle_Busy & DEReg_MCycleHazardE) & CondUnit_RegWrite);
    assign  EMReg_MemWriteE     =   CondUnit_MemWrite;
    assign  EMReg_MemtoRegE     =   DEReg_MemtoRegE;
    assign  EMReg_ALUResultE    =   MCycle_MPushIn ? MCycle_Result : ALU_ALUResult;
    assign  EMReg_WriteDataE    =   SB;
    assign  EMReg_WA3E          =   MCycle_MPushIn ? MCycle_MCycleWA3 : DEReg_WA3E;
    assign  EMReg_RA2E          =   DEReg_RA2E;
    
    
    
    // DataMemory
    // Input
    wire                DataMemory_WE;
    wire    [31:0]      DataMemory_A;
    wire    [31:0]      DataMemory_WD;
    // Output
    wire    [31:0]      DataMemory_RD;
    // Assignment
    assign  DataMemory_WE   =   EMReg_MemWriteM;
    assign  DataMemory_A    =   EMReg_ALUOutM;
    assign  DataMemory_WD   =   HazardUnit_ForwardM ? ResultW : EMReg_WriteDataM;
    
    
    
    // MWReg
    // Input
    wire                MWReg_RegWriteM;
    wire                MWReg_MemtoRegM;
    wire    [31:0]      MWReg_ReadDataM;
    wire    [31:0]      MWReg_ALUOutM;
    wire    [3:0]       MWReg_WA3M;
    // Output
    wire                MWReg_RegWriteW;
    wire                MWReg_MemtoRegW;
    wire    [31:0]      MWReg_ReadDataW;
    wire    [31:0]      MWReg_ALUOutW;
    wire    [3:0]       MWReg_WA3W;
    // Assignment
    assign  MWReg_RegWriteM     =   EMReg_RegWriteM;
    assign  MWReg_MemtoRegM     =   EMReg_MemtoRegM;
    assign  MWReg_ReadDataM     =   DataMemory_RD;
    assign  MWReg_ALUOutM       =   EMReg_ALUOutM;
    assign  MWReg_WA3M          =   EMReg_WA3M;
    
    
    
    wire    [31:0]      ResultW;
    assign  ResultW  =  MWReg_MemtoRegW ? MWReg_ReadDataW : MWReg_ALUOutW;
    
    
    
    HazardUnit HazardUnit(
        .RA1D   (HazardUnit_RA1D),
        .RA2D   (HazardUnit_RA2D),
        .RA1E   (HazardUnit_RA1E),
        .RA2E   (HazardUnit_RA2E),
        .RA2M   (HazardUnit_RA2M),
        .WA3E   (HazardUnit_WA3E),
        .WA3M   (HazardUnit_WA3M),
        .WA3W   (HazardUnit_WA3W),
        .RegWriteE  (HazardUnit_RegWriteE),
        .RegWriteM  (HazardUnit_RegWriteM),
        .RegWriteW  (HazardUnit_RegWriteW),
        .MemWriteM  (HazardUnit_MemWriteM),
        .MemtoRegE  (HazardUnit_MemtoRegE),
        .MemtoRegW  (HazardUnit_MemtoRegW),
        .PCSrcE     (HazardUnit_PCSrcE),
        .MCycleWA3  (HazardUnit_MCycleWA3),
        .MCycleDone (HazardUnit_MCycleDone),
        .MCycleBusy (HazardUnit_MCycleBusy),
        .ForwardAE  (HazardUnit_ForwardAE),
        .ForwardBE  (HazardUnit_ForwardBE),
        .ForwardM   (HazardUnit_ForwardM),
        .StallF     (HazardUnit_StallF),
        .StallD     (HazardUnit_StallD),
        .FlushD     (HazardUnit_FlushD),
        .FlushE     (HazardUnit_FlushE),
        .MCycleHazard(HazardUnit_MCycleHazard));
    
    
    ControlUnit ControlUnit(
        .Instr      (ControlUnit_Instr      ),
        .FlagW      (ControlUnit_FlagW      ),
        .PCS        (ControlUnit_PCS        ),
        .RegW       (ControlUnit_RegW       ),
        .MemW       (ControlUnit_MemW       ),
        .MemtoReg   (ControlUnit_MemtoReg   ),
        .ALUSrc     (ControlUnit_ALUSrc     ),
        .ImmSrc     (ControlUnit_ImmSrc     ),
        .RegSrc     (ControlUnit_RegSrc     ),
        .ALUControl (ControlUnit_ALUControl ),
        .NoWrite    (ControlUnit_NoWrite    ),
        .MS         (ControlUnit_MS         ),
        .MCycleOp   (ControlUnit_MCycleOp   ));
        
    
    ProgramCounter ProgramCounter(
        .CLK        (CLK                        ),
        .Reset      (Reset                      ),
        .EN         (ProgramCounter_EN          ),
        .PCSrc      (ProgramCounter_PCSrc       ),
        .Result     (ProgramCounter_Result      ),
        .PC         (ProgramCounter_PC          ),
        .PCPlus4    (ProgramCounter_PCPlus4     ));
    
    
//    InstructionMemory InstructionMemory(
//        .PC     (InstructionMemory_PC       ),
//        .Instr  (InstructionMemory_Instr    ));
    
    
    FDReg FDReg(
        .CLK        (CLK            ),
        .Reset      (Reset          ),
        .EN         (FDReg_EN       ),
        .CLR        (FDReg_CLR      ),
        .InstrF     (FDReg_InstrF   ),
        .InstrD     (FDReg_InstrD   ));
    
    
    
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
        
        
    Shifter Shifter(
        .Sh     (Shifter_Sh     ),
        .Shamt5 (Shifter_Shamt5 ),
        .ShIn   (Shifter_ShIn   ),
        .ShOut  (Shifter_ShOut  ));
    
        
    Extend Extend(
        .ImmSrc     (Extend_ImmSrc      ),
        .InstrImm   (Extend_InstrImm    ),
        .ExtImm     (Extend_ExtImm      ));
        
        
    DEReg DEReg(
        .CLK            (CLK                ),
        .Reset          (Reset              ),
        .CLR            (DEReg_CLR          ),
        .CondD          (DEReg_CondD        ),
        .FlagWD         (DEReg_FlagWD       ),
        .PCSD           (DEReg_PCSD         ),
        .RegWD          (DEReg_RegWD        ),
        .MemWD          (DEReg_MemWD        ),
        .MemtoRegD      (DEReg_MemtoRegD    ),
        .WA3D           (DEReg_WA3D         ),
        .ALUSrcD        (DEReg_ALUSrcD      ),
        .ALUControlD    (DEReg_ALUControlD  ),
        .RD1D           (DEReg_RD1D         ),
        .RD2D           (DEReg_RD2D         ),
        .ExtImmD        (DEReg_ExtImmD      ),
        .RA1D           (DEReg_RA1D         ),
        .RA2D           (DEReg_RA2D         ),
        .ShD            (DEReg_ShD          ),
        .Shamt5D        (DEReg_Shamt5D      ),
        .NoWriteD       (DEReg_NoWriteD     ),
        .MSD            (DEReg_MSD          ),
        .MCycleOpD      (DEReg_MCycleOpD    ),
        .MCycleHazardD  (DEReg_MCycleHazardD),
        
        .CondE          (DEReg_CondE        ),
        .FlagWE         (DEReg_FlagWE       ),
        .PCSE           (DEReg_PCSE         ),
        .RegWE          (DEReg_RegWE        ),
        .MemWE          (DEReg_MemWE        ),
        .MemtoRegE      (DEReg_MemtoRegE    ),
        .WA3E           (DEReg_WA3E         ),
        .ALUSrcE        (DEReg_ALUSrcE      ),
        .ALUControlE    (DEReg_ALUControlE  ),
        .RA1E           (DEReg_RA1E         ),
        .RA2E           (DEReg_RA2E         ),
        .RD1E           (DEReg_RD1E         ),
        .RD2E           (DEReg_RD2E         ),
        .ExtImmE        (DEReg_ExtImmE      ),
        .ShE            (DEReg_ShE          ),
        .Shamt5E        (DEReg_Shamt5E      ),
        .NoWriteE       (DEReg_NoWriteE     ),
        .MSE            (DEReg_MSE          ),
        .MCycleOpE      (DEReg_MCycleOpE    ),
        .MCycleHazardE  (DEReg_MCycleHazardE));
        
    
    CondUnit CondUnit(
        .CLK        (CLK                ),
        .Reset      (Reset              ),
        .Cond       (CondUnit_Cond      ),
        .PCS        (CondUnit_PCS       ),
        .RegW       (CondUnit_RegW      ),
        .MemW       (CondUnit_MemW      ),
        .FlagW      (CondUnit_FlagW     ),
        .ALUFlags   (CondUnit_ALUFlags  ),
        .PCSrc      (CondUnit_PCSrc     ),
        .RegWrite   (CondUnit_RegWrite  ),
        .MemWrite   (CondUnit_MemWrite  ),
        .NoWrite    (CondUnit_NoWrite   ),
        .Carry      (CondUnit_Carry     ),
        .MS         (CondUnit_MS        ),
        .MStart     (CondUnit_MStart    ));
    
    
    ALU ALU(
        .SrcA       (ALU_SrcA       ),
        .SrcB       (ALU_SrcB       ),
        .ALUControl (ALU_ALUControl ),
        .ALUResult  (ALU_ALUResult  ),
        .ALUFlags   (ALU_ALUFlags   ),
        .Carry      (ALU_Carry      ));
        
        
    MCycle #(32)MCycle(
        .CLK        (CLK                ),
        .Reset      (Reset              ),
        .Start      (MCycle_Start       ),
        .MCycleOp   (MCycle_MCycleOp    ),
        .Operand1   (MCycle_Operand1    ),
        .Operand2   (MCycle_Operand2    ),
        .WA3        (MCycle_WA3         ),
        .Result     (MCycle_Result      ),
        .Busy       (MCycle_Busy        ),
        .Done       (MCycle_Done        ),
        .MCycleWA3  (MCycle_MCycleWA3   ),
        .MCycleHazard(MCycle_MCycleHazard),
        .MPushIn    (MCycle_MPushIn     ));
        
        
    EMReg EMReg(
        .CLK        (CLK                ),
        .Reset      (Reset              ),
        .RegWriteE  (EMReg_RegWriteE    ),
        .MemWriteE  (EMReg_MemWriteE    ),
        .MemtoRegE  (EMReg_MemtoRegE    ),
        .ALUResultE (EMReg_ALUResultE   ),
        .WriteDataE (EMReg_WriteDataE   ),
        .WA3E       (EMReg_WA3E         ),
        .RA2E       (EMReg_RA2E         ),
        .RegWriteM  (EMReg_RegWriteM    ),
        .MemWriteM  (EMReg_MemWriteM    ),
        .MemtoRegM  (EMReg_MemtoRegM    ),
        .ALUOutM    (EMReg_ALUOutM      ),
        .WriteDataM (EMReg_WriteDataM   ),
        .WA3M       (EMReg_WA3M         ),
        .RA2M       (EMReg_RA2M         ));
        
        
//    DataMemory DataMemory(
//        .CLK    (CLK            ),
//        .WE     (DataMemory_WE  ),
//        .A      (DataMemory_A   ),
//        .WD     (DataMemory_WD  ),
//        .RD     (DataMemory_RD  ));


    MWReg MWReg(
        .CLK        (CLK                ),
        .Reset      (Reset              ),
        .RegWriteM  (MWReg_RegWriteM    ),
        .MemtoRegM  (MWReg_MemtoRegM    ),
        .ReadDataM  (MWReg_ReadDataM    ),
        .ALUOutM    (MWReg_ALUOutM      ),
        .WA3M       (MWReg_WA3M         ),
        .RegWriteW  (MWReg_RegWriteW    ),
        .MemtoRegW  (MWReg_MemtoRegW    ),
        .ReadDataW  (MWReg_ReadDataW    ),
        .ALUOutW    (MWReg_ALUOutW      ),
        .WA3W       (MWReg_WA3W         ));
        
endmodule
