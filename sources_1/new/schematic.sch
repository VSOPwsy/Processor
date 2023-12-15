# File saved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:10.0 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 18
property maxzoom 7.5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 18
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new TOP work:TOP:NOFILE -nosplit
load symbol ARMcore work:ARMcore:NOFILE HIERBOX pin CLK input.left pin Cache_RW output.right pin Cache_ReadReady input.left pin Cache_Valid output.right pin IO_WE output.right pin Mem_ReadReady input.left pin Reset input.left pinBus Cache_Addr output.right [31:0] pinBus Cache_ReadData input.left [31:0] pinBus Cache_WriteData output.right [31:0] pinBus IO_Addr output.right [31:0] pinBus IO_ReadData input.left [31:0] pinBus IO_WriteData output.right [31:0] pinBus Instr input.left [31:0] pinBus Mem_ReadData input.left [31:0] pinBus PC output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Cache work:Cache:NOFILE HIERBOX pin CLK input.left pin Reset input.left pin cm_ReadReady input.left pin cm_ReadValid output.right pin cm_WriteValid output.right pin rc_RW input.left pin rc_ReadReady output.right pin rc_Valid input.left pinBus cm_ReadAddr output.right [31:0] pinBus cm_ReadData input.left [31:0] pinBus cm_WriteAddr output.right [31:0] pinBus cm_WriteData output.right [31:0] pinBus rc_Addr input.left [31:0] pinBus rc_ReadData output.right [31:0] pinBus rc_WriteData input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol DataMemory work:DataMemory:NOFILE HIERBOX pin CLK input.left pin ReadReady output.right pin ReadValid input.left pin WriteValid input.left pinBus ReadAddr input.left [31:0] pinBus ReadData output.right [31:0] pinBus WriteAddr input.left [31:0] pinBus WriteData input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol InstructionMemory work:InstructionMemory:NOFILE HIERBOX pinBus Instr output.right [31:0] pinBus PC input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol LedDriver work:LedDriver:NOFILE HIERBOX pin CLK input.left pin Reset input.left pin WE input.left pinBus LED output.right [15:0] pinBus WD input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol PeripheralConnector work:PeripheralConnector:NOFILE HIERBOX pin LED_WE output.right pin SEG_WE output.right pin WE input.left pinBus ADDR input.left [31:0] pinBus LED_WD output.right [31:0] pinBus RD output.right [31:0] pinBus SEG_WD output.right [31:0] pinBus SW_RD input.left [31:0] pinBus WD input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol SWDriver work:SWDriver:NOFILE HIERBOX pinBus RD output.right [31:0] pinBus SW input.left [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Segment work:Segment:NOFILE HIERBOX pin CLK input.left pin dp output.right pinBus anode output.right [7:0] pinBus cathode output.right [6:0] pinBus data input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol SegmentDriver work:SegmentDriver:NOFILE HIERBOX pin CLK input.left pin Reset input.left pin WE input.left pinBus SEG output.right [31:0] pinBus WD input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ALU work:ALU:NOFILE HIERBOX pin CFlag input.left pinBus ALUControl input.left [3:0] pinBus ALUFlags output.right [3:0] pinBus ALUResult output.right [31:0] pinBus SrcA input.left [31:0] pinBus SrcB input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX36 work MUX pin S input.bot pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_INV work INV pin I0 input pin O output fillcolor 1
load symbol RTL_OR4 work OR pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_AND0 work AND pin I0 input pin I1 input pin O output fillcolor 1
load symbol CondUnit work:CondUnit:NOFILE HIERBOX pin CFlag output.right pin CLK input.left pin FPUS input.left pin FPUStart output.right pin MS input.left pin MStart output.right pin MemW input.left pin MemWrite output.right pin NoWrite input.left pin PCS input.left pin PCSrc output.right pin RegW input.left pin RegWrite output.right pin Reset input.left pin ShifterCarry input.left pinBus ALUControl input.left [3:0] pinBus ALUFlags input.left [3:0] pinBus Cond input.left [3:0] pinBus FlagW input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ControlUnit work:ControlUnit:NOFILE HIERBOX pin ALUSrc output.right pin FPUOp output.right pin FPUS output.right pin MCycleOp output.right pin MS output.right pin MemW output.right pin MemtoReg output.right pin NoWrite output.right pin PCS output.right pin RegW output.right pinBus ALUControl output.right [3:0] pinBus FlagW output.right [3:0] pinBus ImmSrc output.right [1:0] pinBus Instr input.left [31:0] pinBus RegSrc output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol DEReg work:DEReg:NOFILE HIERBOX pin ALUSrcD input.left pin ALUSrcE output.right pin CLK input.left pin CLR input.left pin EN input.left pin FPUHazardD input.left pin FPUHazardE output.right pin FPUOpD input.left pin FPUOpE output.right pin FPUSD input.left pin FPUSE output.right pin MCycleHazardD input.left pin MCycleHazardE output.right pin MCycleOpD input.left pin MCycleOpE output.right pin MSD input.left pin MSE output.right pin MemWD input.left pin MemWE output.right pin MemtoRegD input.left pin MemtoRegE output.right pin NoWriteD input.left pin NoWriteE output.right pin PCSD input.left pin PCSE output.right pin RegWD input.left pin RegWE output.right pin Reset input.left pinBus ALUControlD input.left [3:0] pinBus ALUControlE output.right [3:0] pinBus CondD input.left [3:0] pinBus CondE output.right [3:0] pinBus ExtImmD input.left [31:0] pinBus ExtImmE output.right [31:0] pinBus FlagWD input.left [3:0] pinBus FlagWE output.right [3:0] pinBus RA1D input.left [3:0] pinBus RA1E output.right [3:0] pinBus RA2D input.left [3:0] pinBus RA2E output.right [3:0] pinBus RD1D input.left [31:0] pinBus RD1E output.right [31:0] pinBus RD2D input.left [31:0] pinBus RD2E output.right [31:0] pinBus ShD input.left [1:0] pinBus ShE output.right [1:0] pinBus Shamt5D input.left [4:0] pinBus Shamt5E output.right [4:0] pinBus WA3D input.left [3:0] pinBus WA3E output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX6 work MUX pin S input.bot pinBus I0 input.left [3:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol EMReg work:EMReg:NOFILE HIERBOX pin CLK input.left pin EN input.left pin MemWriteE input.left pin MemWriteM output.right pin MemtoRegE input.left pin MemtoRegM output.right pin RegWriteE input.left pin RegWriteM output.right pin Reset input.left pinBus ALUOutM output.right [31:0] pinBus ALUResultE input.left [31:0] pinBus RA2E input.left [3:0] pinBus RA2M output.right [3:0] pinBus WA3E input.left [3:0] pinBus WA3M output.right [3:0] pinBus WriteDataE input.left [31:0] pinBus WriteDataM output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_AND0 workI1 AND pin I0 input pin I1 input.neg pin O output fillcolor 1
load symbol RTL_AND23 workI0 AND pin I0 input.neg pin I1 input pin O output fillcolor 1
load symbol Extend work:Extend:NOFILE HIERBOX pinBus ExtImm output.right [31:0] pinBus ImmSrc input.left [1:0] pinBus InstrImm input.left [23:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol FDReg work:FDReg:NOFILE HIERBOX pin CLK input.left pin CLR input.left pin EN input.left pin Reset input.left pinBus InstrD output.right [31:0] pinBus InstrF input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol FPU work:FPU:NOFILE HIERBOX pin Busy output.right pin CLK input.left pin Done output.right pin FPUOp input.left pin FPUPushIn output.right pin Reset input.left pin Start input.left pinBus FPUWA3 output.right [3:0] pinBus Operand1 input.left [31:0] pinBus Operand2 input.left [31:0] pinBus Result output.right [31:0] pinBus WA3 input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol HazardUnit work:HazardUnit:NOFILE HIERBOX pin Cache_ReadReady input.left pin FPUBusy input.left pin FPUDone input.left pin FPUHazard output.right pin FPUS input.left pin FPUStart input.left pin FlushD output.right pin FlushE output.right pin ForwardM output.right pin MCycleBusy input.left pin MCycleDone input.left pin MCycleHazard output.right pin MS input.left pin MStart input.left pin MemWriteM input.left pin Mem_ReadReady input.left pin MemtoRegE input.left pin MemtoRegM input.left pin MemtoRegW input.left pin PCSrcE input.left pin RW input.left pin RegWriteE input.left pin RegWriteM input.left pin RegWriteW input.left pin StallD output.right pin StallE output.right pin StallF output.right pin StallM output.right pin dec_mem input.left pinBus FPUWA3 input.left [3:0] pinBus ForwardAE output.right [2:0] pinBus ForwardBE output.right [2:0] pinBus MCycleWA3 input.left [3:0] pinBus RA1D input.left [3:0] pinBus RA1E input.left [3:0] pinBus RA2D input.left [3:0] pinBus RA2E input.left [3:0] pinBus RA2M input.left [3:0] pinBus WA3D input.left [3:0] pinBus WA3E input.left [3:0] pinBus WA3M input.left [3:0] pinBus WA3W input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol MCycle work:MCycle:NOFILE HIERBOX pin Busy output.right pin CLK input.left pin Done output.right pin MCycleOp input.left pin MPushIn output.right pin Reset input.left pin Start input.left pinBus MCycleWA3 output.right [3:0] pinBus Operand1 input.left [31:0] pinBus Operand2 input.left [31:0] pinBus Result output.right [31:0] pinBus WA3 input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol MWReg work:MWReg:NOFILE HIERBOX pin CLK input.left pin MemtoRegM input.left pin MemtoRegW output.right pin RegWriteM input.left pin RegWriteW output.right pin Reset input.left pinBus ALUOutM input.left [31:0] pinBus ALUOutW output.right [31:0] pinBus ReadDataM input.left [31:0] pinBus ReadDataW output.right [31:0] pinBus WA3M input.left [3:0] pinBus WA3W output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol MemOrIO work:MemOrIO:NOFILE HIERBOX pin dec_mem output.right pin io_we output.right pin m_we output.right pin we input.left pinBus addr_in input.left [31:0] pinBus io_addr output.right [31:0] pinBus io_rdata input.left [31:0] pinBus io_wdata output.right [31:0] pinBus m_addr output.right [31:0] pinBus m_rdata input.left [31:0] pinBus m_wdata output.right [31:0] pinBus r_rdata input.left [31:0] pinBus r_wdata output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ProgramCounter work:ProgramCounter:NOFILE HIERBOX pin CLK input.left pin EN input.left pin PCSrc input.left pin Reset input.left pinBus PC output.right [31:0] pinBus PCPlus4 output.right [31:0] pinBus Result input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RegisterFile work:RegisterFile:NOFILE HIERBOX pin CLK_n input.left pin Reset input.left pin WE3 input.left pinBus A1 input.left [3:0] pinBus A2 input.left [3:0] pinBus A3 input.left [3:0] pinBus R15 input.left [31:0] pinBus RD1 output.right [31:0] pinBus RD2 output.right [31:0] pinBus WD3 input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX303 work MUX pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus I2 input.left [31:0] pinBus I3 input.left [31:0] pinBus O output.right [31:0] pinBus S input.bot [2:0] fillcolor 1
load symbol Shifter work:Shifter:NOFILE HIERBOX pin CFlag input.left pin Carry output.right pinBus Sh input.left [1:0] pinBus ShIn input.left [31:0] pinBus ShOut output.right [31:0] pinBus Shamt5 input.left [4:0] boxcolor 1 fillcolor 2 minwidth 13%
load port CLK input -pg 1 -lvl 0 -x 0 -y 20
load port Reset input -pg 1 -lvl 0 -x 0 -y 310
load portBus LED output [15:0] -attr @name LED[15:0] -pg 1 -lvl 7 -x 12810 -y 650
load portBus SW input [15:0] -attr @name SW[15:0] -pg 1 -lvl 0 -x 0 -y 690
load portBus SevenSegAn output [7:0] -attr @name SevenSegAn[7:0] -pg 1 -lvl 7 -x 12810 -y 780
load portBus SevenSegCat output [6:0] -attr @name SevenSegCat[6:0] -pg 1 -lvl 7 -x 12810 -y 800
load inst ARMcore ARMcore work:ARMcore:NOFILE -autohide -attr @cell(#000000) ARMcore -attr @fillcolor #fafafa -pinBusAttr Cache_Addr @name Cache_Addr[31:0] -pinBusAttr Cache_ReadData @name Cache_ReadData[31:0] -pinBusAttr Cache_WriteData @name Cache_WriteData[31:0] -pinBusAttr IO_Addr @name IO_Addr[31:0] -pinBusAttr IO_ReadData @name IO_ReadData[31:0] -pinBusAttr IO_WriteData @name IO_WriteData[31:0] -pinBusAttr Instr @name Instr[31:0] -pinBusAttr Mem_ReadData @name Mem_ReadData[31:0] -pinBusAttr PC @name PC[31:0] -pg 1 -lvl 3 -x 1220 -y 428
load inst Cache Cache work:Cache:NOFILE -autohide -attr @cell(#000000) Cache -pinBusAttr cm_ReadAddr @name cm_ReadAddr[31:0] -pinBusAttr cm_ReadData @name cm_ReadData[31:0] -pinBusAttr cm_WriteAddr @name cm_WriteAddr[31:0] -pinBusAttr cm_WriteData @name cm_WriteData[31:0] -pinBusAttr rc_Addr @name rc_Addr[31:0] -pinBusAttr rc_ReadData @name rc_ReadData[31:0] -pinBusAttr rc_WriteData @name rc_WriteData[31:0] -pg 1 -lvl 2 -x 660 -y 200
load inst DataMemory DataMemory work:DataMemory:NOFILE -autohide -attr @cell(#000000) DataMemory -pinBusAttr ReadAddr @name ReadAddr[31:0] -pinBusAttr ReadData @name ReadData[31:0] -pinBusAttr WriteAddr @name WriteAddr[31:0] -pinBusAttr WriteData @name WriteData[31:0] -pg 1 -lvl 1 -x 240 -y 160
load inst InstructionMemory InstructionMemory work:InstructionMemory:NOFILE -autohide -attr @cell(#000000) InstructionMemory -pinBusAttr Instr @name Instr[31:0] -pinBusAttr PC @name PC[31:0] -pg 1 -lvl 2 -x 660 -y 480
load inst LedDriver LedDriver work:LedDriver:NOFILE -autohide -attr @cell(#000000) LedDriver -pinBusAttr LED @name LED[15:0] -pinBusAttr WD @name WD[31:0] -pg 1 -lvl 6 -x 12650 -y 620
load inst PeripheralConnector PeripheralConnector work:PeripheralConnector:NOFILE -autohide -attr @cell(#000000) PeripheralConnector -pinBusAttr ADDR @name ADDR[31:0] -pinBusAttr LED_WD @name LED_WD[31:0] -pinBusAttr RD @name RD[31:0] -pinBusAttr SEG_WD @name SEG_WD[31:0] -pinBusAttr SW_RD @name SW_RD[31:0] -pinBusAttr WD @name WD[31:0] -pg 1 -lvl 4 -x 12060 -y 660
load inst SWDriver SWDriver work:SWDriver:NOFILE -autohide -attr @cell(#000000) SWDriver -pinBusAttr RD @name RD[31:0] -pinBusAttr SW @name SW[15:0] -pg 1 -lvl 3 -x 1220 -y 2558
load inst Segment Segment work:Segment:NOFILE -autohide -attr @cell(#000000) Segment -pinAttr dp @attr n/c -pinBusAttr anode @name anode[7:0] -pinBusAttr cathode @name cathode[6:0] -pinBusAttr data @name data[31:0] -pg 1 -lvl 6 -x 12650 -y 770
load inst SegmentDriver SegmentDriver work:SegmentDriver:NOFILE -autohide -attr @cell(#000000) SegmentDriver -pinBusAttr SEG @name SEG[31:0] -pinBusAttr WD @name WD[31:0] -pg 1 -lvl 5 -x 12390 -y 740
load inst ARMcore|ALU ALU work:ALU:NOFILE -hier ARMcore -autohide -attr @cell(#000000) ALU -attr @name ALU -pinBusAttr ALUControl @name ALUControl[3:0] -pinBusAttr ALUFlags @name ALUFlags[3:0] -pinBusAttr ALUResult @name ALUResult[31:0] -pinBusAttr SrcA @name SrcA[31:0] -pinBusAttr SrcB @name SrcB[31:0] -pg 1 -lvl 11 -x 5900 -y 1558
load inst ARMcore|ALU_SrcB_i RTL_MUX36 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name ALU_SrcB_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 10 -x 5490 -y 1348
load inst ARMcore|CLK_n0_i RTL_INV work -hier ARMcore -attr @cell(#000000) RTL_INV -attr @name CLK_n0_i -pg 1 -lvl 5 -x 2680 -y 2048
load inst ARMcore|Cache_Valid0_i RTL_OR4 work -hier ARMcore -attr @cell(#000000) RTL_OR -attr @name Cache_Valid0_i -pg 1 -lvl 19 -x 10860 -y 1518
load inst ARMcore|Cache_Valid_i RTL_AND0 work -hier ARMcore -attr @cell(#000000) RTL_AND -attr @name Cache_Valid_i -pg 1 -lvl 20 -x 11280 -y 1508
load inst ARMcore|CondUnit CondUnit work:CondUnit:NOFILE -hier ARMcore -autohide -attr @cell(#000000) CondUnit -attr @name CondUnit -pinBusAttr ALUControl @name ALUControl[3:0] -pinBusAttr ALUFlags @name ALUFlags[3:0] -pinBusAttr Cond @name Cond[3:0] -pinBusAttr FlagW @name FlagW[3:0] -pg 1 -lvl 12 -x 6620 -y 1558
load inst ARMcore|ControlUnit ControlUnit work:ControlUnit:NOFILE -hier ARMcore -autohide -attr @cell(#000000) ControlUnit -attr @name ControlUnit -pinBusAttr ALUControl @name ALUControl[3:0] -pinBusAttr FlagW @name FlagW[3:0] -pinBusAttr ImmSrc @name ImmSrc[1:0] -pinBusAttr Instr @name Instr[31:0] -pinBusAttr RegSrc @name RegSrc[3:0] -pg 1 -lvl 3 -x 1850 -y 1318
load inst ARMcore|DEReg DEReg work:DEReg:NOFILE -hier ARMcore -autohide -attr @cell(#000000) DEReg -attr @name DEReg -pinBusAttr ALUControlD @name ALUControlD[3:0] -pinBusAttr ALUControlE @name ALUControlE[3:0] -pinBusAttr CondD @name CondD[3:0] -pinBusAttr CondE @name CondE[3:0] -pinBusAttr ExtImmD @name ExtImmD[31:0] -pinBusAttr ExtImmE @name ExtImmE[31:0] -pinBusAttr FlagWD @name FlagWD[3:0] -pinBusAttr FlagWE @name FlagWE[3:0] -pinBusAttr RA1D @name RA1D[3:0] -pinBusAttr RA1E @name RA1E[3:0] -pinBusAttr RA2D @name RA2D[3:0] -pinBusAttr RA2E @name RA2E[3:0] -pinBusAttr RD1D @name RD1D[31:0] -pinBusAttr RD1E @name RD1E[31:0] -pinBusAttr RD2D @name RD2D[31:0] -pinBusAttr RD2E @name RD2E[31:0] -pinBusAttr ShD @name ShD[1:0] -pinBusAttr ShE @name ShE[1:0] -pinBusAttr Shamt5D @name Shamt5D[4:0] -pinBusAttr Shamt5E @name Shamt5E[4:0] -pinBusAttr WA3D @name WA3D[3:0] -pinBusAttr WA3E @name WA3E[3:0] -pg 1 -lvl 7 -x 3770 -y 1258
load inst ARMcore|DEReg_EN_i RTL_INV work -hier ARMcore -attr @cell(#000000) RTL_INV -attr @name DEReg_EN_i -pg 1 -lvl 6 -x 3210 -y 1358
load inst ARMcore|DEReg_WA3D_i RTL_MUX6 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name DEReg_WA3D_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -x 3210 -y 1708
load inst ARMcore|EMReg EMReg work:EMReg:NOFILE -hier ARMcore -autohide -attr @cell(#000000) EMReg -attr @name EMReg -pinBusAttr ALUOutM @name ALUOutM[31:0] -pinBusAttr ALUResultE @name ALUResultE[31:0] -pinBusAttr RA2E @name RA2E[3:0] -pinBusAttr RA2M @name RA2M[3:0] -pinBusAttr WA3E @name WA3E[3:0] -pinBusAttr WA3M @name WA3M[3:0] -pinBusAttr WriteDataE @name WriteDataE[31:0] -pinBusAttr WriteDataM @name WriteDataM[31:0] -pg 1 -lvl 18 -x 10380 -y 1428
load inst ARMcore|EMReg_ALUResultE0_i RTL_MUX36 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name EMReg_ALUResultE0_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 16 -x 9360 -y 1638
load inst ARMcore|EMReg_ALUResultE1_i RTL_MUX36 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name EMReg_ALUResultE1_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 15 -x 8410 -y 1608
load inst ARMcore|EMReg_ALUResultE1_i__0 RTL_AND0 workI1 -hier ARMcore -attr @cell(#000000) RTL_AND -attr @name EMReg_ALUResultE1_i__0 -pg 1 -lvl 16 -x 9360 -y 1818
load inst ARMcore|EMReg_ALUResultE_i RTL_MUX36 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name EMReg_ALUResultE_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 17 -x 9870 -y 1678
load inst ARMcore|EMReg_EN_i RTL_INV work -hier ARMcore -attr @cell(#000000) RTL_INV -attr @name EMReg_EN_i -pg 1 -lvl 17 -x 9870 -y 878
load inst ARMcore|EMReg_RegWriteE0_i RTL_OR4 work -hier ARMcore -attr @cell(#000000) RTL_OR -attr @name EMReg_RegWriteE0_i -pg 1 -lvl 16 -x 9360 -y 1748
load inst ARMcore|EMReg_RegWriteE0_i__0 RTL_AND23 workI0 -hier ARMcore -attr @cell(#000000) RTL_AND -attr @name EMReg_RegWriteE0_i__0 -pg 1 -lvl 16 -x 9360 -y 1288
load inst ARMcore|EMReg_RegWriteE1_i RTL_OR4 work -hier ARMcore -attr @cell(#000000) RTL_OR -attr @name EMReg_RegWriteE1_i -pg 1 -lvl 15 -x 8410 -y 1778
load inst ARMcore|EMReg_RegWriteE1_i__0 RTL_AND23 workI0 -hier ARMcore -attr @cell(#000000) RTL_AND -attr @name EMReg_RegWriteE1_i__0 -pg 1 -lvl 15 -x 8410 -y 1998
load inst ARMcore|EMReg_RegWriteE2_i RTL_AND0 work -hier ARMcore -attr @cell(#000000) RTL_AND -attr @name EMReg_RegWriteE2_i -pg 1 -lvl 15 -x 8410 -y 1118
load inst ARMcore|EMReg_RegWriteE3_i RTL_AND0 work -hier ARMcore -attr @cell(#000000) RTL_AND -attr @name EMReg_RegWriteE3_i -pg 1 -lvl 14 -x 7880 -y 1978
load inst ARMcore|EMReg_RegWriteE_i RTL_OR4 work -hier ARMcore -attr @cell(#000000) RTL_OR -attr @name EMReg_RegWriteE_i -pg 1 -lvl 17 -x 9870 -y 1568
load inst ARMcore|EMReg_WA3E0_i RTL_MUX6 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name EMReg_WA3E0_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 14 -x 7880 -y 1608
load inst ARMcore|EMReg_WA3E_i RTL_MUX6 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name EMReg_WA3E_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 15 -x 8410 -y 1388
load inst ARMcore|Extend Extend work:Extend:NOFILE -hier ARMcore -autohide -attr @cell(#000000) Extend -attr @name Extend -pinBusAttr ExtImm @name ExtImm[31:0] -pinBusAttr ImmSrc @name ImmSrc[1:0] -pinBusAttr InstrImm @name InstrImm[23:0] -pg 1 -lvl 6 -x 3210 -y 1438
load inst ARMcore|FDReg FDReg work:FDReg:NOFILE -hier ARMcore -autohide -attr @cell(#000000) FDReg -attr @name FDReg -pinBusAttr InstrD @name InstrD[31:0] -pinBusAttr InstrF @name InstrF[31:0] -pg 1 -lvl 2 -x 1600 -y 1738
load inst ARMcore|FDReg_EN_i RTL_INV work -hier ARMcore -attr @cell(#000000) RTL_INV -attr @name FDReg_EN_i -pg 1 -lvl 1 -x 1340 -y 1788
load inst ARMcore|FPU FPU work:FPU:NOFILE -hier ARMcore -autohide -attr @cell(#000000) FPU -attr @name FPU -pinBusAttr FPUWA3 @name FPUWA3[3:0] -pinBusAttr Operand1 @name Operand1[31:0] -pinBusAttr Operand2 @name Operand2[31:0] -pinBusAttr Result @name Result[31:0] -pinBusAttr WA3 @name WA3[3:0] -pg 1 -lvl 13 -x 7190 -y 1638
load inst ARMcore|HazardUnit HazardUnit work:HazardUnit:NOFILE -hier ARMcore -autohide -attr @cell(#000000) HazardUnit -attr @name HazardUnit -pinBusAttr FPUWA3 @name FPUWA3[3:0] -pinBusAttr ForwardAE @name ForwardAE[2:0] -pinBusAttr ForwardBE @name ForwardBE[2:0] -pinBusAttr MCycleWA3 @name MCycleWA3[3:0] -pinBusAttr RA1D @name RA1D[3:0] -pinBusAttr RA1E @name RA1E[3:0] -pinBusAttr RA2D @name RA2D[3:0] -pinBusAttr RA2E @name RA2E[3:0] -pinBusAttr RA2M @name RA2M[3:0] -pinBusAttr WA3D @name WA3D[3:0] -pinBusAttr WA3E @name WA3E[3:0] -pinBusAttr WA3M @name WA3M[3:0] -pinBusAttr WA3W @name WA3W[3:0] -pg 1 -lvl 16 -x 9360 -y 448
load inst ARMcore|MCycle MCycle work:MCycle:NOFILE -hier ARMcore -autohide -attr @cell(#000000) MCycle -attr @name MCycle -pinBusAttr MCycleWA3 @name MCycleWA3[3:0] -pinBusAttr Operand1 @name Operand1[31:0] -pinBusAttr Operand2 @name Operand2[31:0] -pinBusAttr Result @name Result[31:0] -pinBusAttr WA3 @name WA3[3:0] -pg 1 -lvl 13 -x 7190 -y 1298
load inst ARMcore|MWReg MWReg work:MWReg:NOFILE -hier ARMcore -autohide -attr @cell(#000000) MWReg -attr @name MWReg -pinBusAttr ALUOutM @name ALUOutM[31:0] -pinBusAttr ALUOutW @name ALUOutW[31:0] -pinBusAttr ReadDataM @name ReadDataM[31:0] -pinBusAttr ReadDataW @name ReadDataW[31:0] -pinBusAttr WA3M @name WA3M[3:0] -pinBusAttr WA3W @name WA3W[3:0] -pg 1 -lvl 4 -x 2260 -y 2258
load inst ARMcore|MemOrIO MemOrIO work:MemOrIO:NOFILE -hier ARMcore -autohide -attr @cell(#000000) MemOrIO -attr @name MemOrIO -pinBusAttr addr_in @name addr_in[31:0] -pinBusAttr io_addr @name io_addr[31:0] -pinBusAttr io_rdata @name io_rdata[31:0] -pinBusAttr io_wdata @name io_wdata[31:0] -pinBusAttr m_addr @name m_addr[31:0] -pinBusAttr m_rdata @name m_rdata[31:0] -pinBusAttr m_wdata @name m_wdata[31:0] -pinBusAttr r_rdata @name r_rdata[31:0] -pinBusAttr r_wdata @name r_wdata[31:0] -pg 1 -lvl 20 -x 11280 -y 1608
load inst ARMcore|MemOrIO_m_rdata_i RTL_MUX36 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name MemOrIO_m_rdata_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 19 -x 10860 -y 1988
load inst ARMcore|MemOrIO_r_rdata_i RTL_MUX36 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name MemOrIO_r_rdata_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 19 -x 10860 -y 1758
load inst ARMcore|ProgramCounter ProgramCounter work:ProgramCounter:NOFILE -hier ARMcore -autohide -attr @cell(#000000) ProgramCounter -attr @name ProgramCounter -pinBusAttr PC @name PC[31:0] -pinBusAttr PCPlus4 @name PCPlus4[31:0] -pinBusAttr Result @name Result[31:0] -pg 1 -lvl 20 -x 11280 -y 1838
load inst ARMcore|ProgramCounter_EN_i RTL_INV work -hier ARMcore -attr @cell(#000000) RTL_INV -attr @name ProgramCounter_EN_i -pg 1 -lvl 19 -x 10860 -y 838
load inst ARMcore|RegisterFile RegisterFile work:RegisterFile:NOFILE -hier ARMcore -autohide -attr @cell(#000000) RegisterFile -attr @name RegisterFile -pinBusAttr A1 @name A1[3:0] -pinBusAttr A2 @name A2[3:0] -pinBusAttr A3 @name A3[3:0] -pinBusAttr R15 @name R15[31:0] -pinBusAttr RD1 @name RD1[31:0] -pinBusAttr RD2 @name RD2[31:0] -pinBusAttr WD3 @name WD3[31:0] -pg 1 -lvl 6 -x 3210 -y 1978
load inst ARMcore|RegisterFile_A10_i RTL_MUX6 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name RegisterFile_A10_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 4 -x 2260 -y 1688
load inst ARMcore|RegisterFile_A1_i RTL_MUX6 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name RegisterFile_A1_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 5 -x 2680 -y 1668
load inst ARMcore|RegisterFile_A20_i RTL_MUX6 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name RegisterFile_A20_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 4 -x 2260 -y 1808
load inst ARMcore|RegisterFile_A2_i RTL_MUX6 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name RegisterFile_A2_i -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 5 -x 2680 -y 1788
load inst ARMcore|ResultW_i RTL_MUX36 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name ResultW_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 5 -x 2680 -y 2248
load inst ARMcore|SA_i RTL_MUX303 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name SA_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=3'b000 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=3'b001 -pinBusAttr I2 @name I2[31:0] -pinBusAttr I2 @attr S=3'b010 -pinBusAttr I3 @name I3[31:0] -pinBusAttr I3 @attr S=default -pinBusAttr O @name O[31:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 10 -x 5490 -y 1608
load inst ARMcore|SB_i RTL_MUX303 work -hier ARMcore -attr @cell(#000000) RTL_MUX -attr @name SB_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=3'b000 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=3'b001 -pinBusAttr I2 @name I2[31:0] -pinBusAttr I2 @attr S=3'b010 -pinBusAttr I3 @name I3[31:0] -pinBusAttr I3 @attr S=default -pinBusAttr O @name O[31:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 8 -x 4550 -y 1728
load inst ARMcore|Shifter Shifter work:Shifter:NOFILE -hier ARMcore -autohide -attr @cell(#000000) Shifter -attr @name Shifter -pinBusAttr Sh @name Sh[1:0] -pinBusAttr ShIn @name ShIn[31:0] -pinBusAttr ShOut @name ShOut[31:0] -pinBusAttr Shamt5 @name Shamt5[4:0] -pg 1 -lvl 9 -x 4880 -y 1838
load net ARMcore_Cache_Addr[0] -attr @rip Cache_Addr[0] -pin ARMcore Cache_Addr[0] -pin Cache rc_Addr[0]
load net ARMcore_Cache_Addr[10] -attr @rip Cache_Addr[10] -pin ARMcore Cache_Addr[10] -pin Cache rc_Addr[10]
load net ARMcore_Cache_Addr[11] -attr @rip Cache_Addr[11] -pin ARMcore Cache_Addr[11] -pin Cache rc_Addr[11]
load net ARMcore_Cache_Addr[12] -attr @rip Cache_Addr[12] -pin ARMcore Cache_Addr[12] -pin Cache rc_Addr[12]
load net ARMcore_Cache_Addr[13] -attr @rip Cache_Addr[13] -pin ARMcore Cache_Addr[13] -pin Cache rc_Addr[13]
load net ARMcore_Cache_Addr[14] -attr @rip Cache_Addr[14] -pin ARMcore Cache_Addr[14] -pin Cache rc_Addr[14]
load net ARMcore_Cache_Addr[15] -attr @rip Cache_Addr[15] -pin ARMcore Cache_Addr[15] -pin Cache rc_Addr[15]
load net ARMcore_Cache_Addr[16] -attr @rip Cache_Addr[16] -pin ARMcore Cache_Addr[16] -pin Cache rc_Addr[16]
load net ARMcore_Cache_Addr[17] -attr @rip Cache_Addr[17] -pin ARMcore Cache_Addr[17] -pin Cache rc_Addr[17]
load net ARMcore_Cache_Addr[18] -attr @rip Cache_Addr[18] -pin ARMcore Cache_Addr[18] -pin Cache rc_Addr[18]
load net ARMcore_Cache_Addr[19] -attr @rip Cache_Addr[19] -pin ARMcore Cache_Addr[19] -pin Cache rc_Addr[19]
load net ARMcore_Cache_Addr[1] -attr @rip Cache_Addr[1] -pin ARMcore Cache_Addr[1] -pin Cache rc_Addr[1]
load net ARMcore_Cache_Addr[20] -attr @rip Cache_Addr[20] -pin ARMcore Cache_Addr[20] -pin Cache rc_Addr[20]
load net ARMcore_Cache_Addr[21] -attr @rip Cache_Addr[21] -pin ARMcore Cache_Addr[21] -pin Cache rc_Addr[21]
load net ARMcore_Cache_Addr[22] -attr @rip Cache_Addr[22] -pin ARMcore Cache_Addr[22] -pin Cache rc_Addr[22]
load net ARMcore_Cache_Addr[23] -attr @rip Cache_Addr[23] -pin ARMcore Cache_Addr[23] -pin Cache rc_Addr[23]
load net ARMcore_Cache_Addr[24] -attr @rip Cache_Addr[24] -pin ARMcore Cache_Addr[24] -pin Cache rc_Addr[24]
load net ARMcore_Cache_Addr[25] -attr @rip Cache_Addr[25] -pin ARMcore Cache_Addr[25] -pin Cache rc_Addr[25]
load net ARMcore_Cache_Addr[26] -attr @rip Cache_Addr[26] -pin ARMcore Cache_Addr[26] -pin Cache rc_Addr[26]
load net ARMcore_Cache_Addr[27] -attr @rip Cache_Addr[27] -pin ARMcore Cache_Addr[27] -pin Cache rc_Addr[27]
load net ARMcore_Cache_Addr[28] -attr @rip Cache_Addr[28] -pin ARMcore Cache_Addr[28] -pin Cache rc_Addr[28]
load net ARMcore_Cache_Addr[29] -attr @rip Cache_Addr[29] -pin ARMcore Cache_Addr[29] -pin Cache rc_Addr[29]
load net ARMcore_Cache_Addr[2] -attr @rip Cache_Addr[2] -pin ARMcore Cache_Addr[2] -pin Cache rc_Addr[2]
load net ARMcore_Cache_Addr[30] -attr @rip Cache_Addr[30] -pin ARMcore Cache_Addr[30] -pin Cache rc_Addr[30]
load net ARMcore_Cache_Addr[31] -attr @rip Cache_Addr[31] -pin ARMcore Cache_Addr[31] -pin Cache rc_Addr[31]
load net ARMcore_Cache_Addr[3] -attr @rip Cache_Addr[3] -pin ARMcore Cache_Addr[3] -pin Cache rc_Addr[3]
load net ARMcore_Cache_Addr[4] -attr @rip Cache_Addr[4] -pin ARMcore Cache_Addr[4] -pin Cache rc_Addr[4]
load net ARMcore_Cache_Addr[5] -attr @rip Cache_Addr[5] -pin ARMcore Cache_Addr[5] -pin Cache rc_Addr[5]
load net ARMcore_Cache_Addr[6] -attr @rip Cache_Addr[6] -pin ARMcore Cache_Addr[6] -pin Cache rc_Addr[6]
load net ARMcore_Cache_Addr[7] -attr @rip Cache_Addr[7] -pin ARMcore Cache_Addr[7] -pin Cache rc_Addr[7]
load net ARMcore_Cache_Addr[8] -attr @rip Cache_Addr[8] -pin ARMcore Cache_Addr[8] -pin Cache rc_Addr[8]
load net ARMcore_Cache_Addr[9] -attr @rip Cache_Addr[9] -pin ARMcore Cache_Addr[9] -pin Cache rc_Addr[9]
load net ARMcore_Cache_RW -pin ARMcore Cache_RW -pin Cache rc_RW
netloc ARMcore_Cache_RW 1 1 3 520 150 NJ 150 11790
load net ARMcore_Cache_ReadData[0] -attr @rip rc_ReadData[0] -pin ARMcore Cache_ReadData[0] -pin Cache rc_ReadData[0]
load net ARMcore_Cache_ReadData[10] -attr @rip rc_ReadData[10] -pin ARMcore Cache_ReadData[10] -pin Cache rc_ReadData[10]
load net ARMcore_Cache_ReadData[11] -attr @rip rc_ReadData[11] -pin ARMcore Cache_ReadData[11] -pin Cache rc_ReadData[11]
load net ARMcore_Cache_ReadData[12] -attr @rip rc_ReadData[12] -pin ARMcore Cache_ReadData[12] -pin Cache rc_ReadData[12]
load net ARMcore_Cache_ReadData[13] -attr @rip rc_ReadData[13] -pin ARMcore Cache_ReadData[13] -pin Cache rc_ReadData[13]
load net ARMcore_Cache_ReadData[14] -attr @rip rc_ReadData[14] -pin ARMcore Cache_ReadData[14] -pin Cache rc_ReadData[14]
load net ARMcore_Cache_ReadData[15] -attr @rip rc_ReadData[15] -pin ARMcore Cache_ReadData[15] -pin Cache rc_ReadData[15]
load net ARMcore_Cache_ReadData[16] -attr @rip rc_ReadData[16] -pin ARMcore Cache_ReadData[16] -pin Cache rc_ReadData[16]
load net ARMcore_Cache_ReadData[17] -attr @rip rc_ReadData[17] -pin ARMcore Cache_ReadData[17] -pin Cache rc_ReadData[17]
load net ARMcore_Cache_ReadData[18] -attr @rip rc_ReadData[18] -pin ARMcore Cache_ReadData[18] -pin Cache rc_ReadData[18]
load net ARMcore_Cache_ReadData[19] -attr @rip rc_ReadData[19] -pin ARMcore Cache_ReadData[19] -pin Cache rc_ReadData[19]
load net ARMcore_Cache_ReadData[1] -attr @rip rc_ReadData[1] -pin ARMcore Cache_ReadData[1] -pin Cache rc_ReadData[1]
load net ARMcore_Cache_ReadData[20] -attr @rip rc_ReadData[20] -pin ARMcore Cache_ReadData[20] -pin Cache rc_ReadData[20]
load net ARMcore_Cache_ReadData[21] -attr @rip rc_ReadData[21] -pin ARMcore Cache_ReadData[21] -pin Cache rc_ReadData[21]
load net ARMcore_Cache_ReadData[22] -attr @rip rc_ReadData[22] -pin ARMcore Cache_ReadData[22] -pin Cache rc_ReadData[22]
load net ARMcore_Cache_ReadData[23] -attr @rip rc_ReadData[23] -pin ARMcore Cache_ReadData[23] -pin Cache rc_ReadData[23]
load net ARMcore_Cache_ReadData[24] -attr @rip rc_ReadData[24] -pin ARMcore Cache_ReadData[24] -pin Cache rc_ReadData[24]
load net ARMcore_Cache_ReadData[25] -attr @rip rc_ReadData[25] -pin ARMcore Cache_ReadData[25] -pin Cache rc_ReadData[25]
load net ARMcore_Cache_ReadData[26] -attr @rip rc_ReadData[26] -pin ARMcore Cache_ReadData[26] -pin Cache rc_ReadData[26]
load net ARMcore_Cache_ReadData[27] -attr @rip rc_ReadData[27] -pin ARMcore Cache_ReadData[27] -pin Cache rc_ReadData[27]
load net ARMcore_Cache_ReadData[28] -attr @rip rc_ReadData[28] -pin ARMcore Cache_ReadData[28] -pin Cache rc_ReadData[28]
load net ARMcore_Cache_ReadData[29] -attr @rip rc_ReadData[29] -pin ARMcore Cache_ReadData[29] -pin Cache rc_ReadData[29]
load net ARMcore_Cache_ReadData[2] -attr @rip rc_ReadData[2] -pin ARMcore Cache_ReadData[2] -pin Cache rc_ReadData[2]
load net ARMcore_Cache_ReadData[30] -attr @rip rc_ReadData[30] -pin ARMcore Cache_ReadData[30] -pin Cache rc_ReadData[30]
load net ARMcore_Cache_ReadData[31] -attr @rip rc_ReadData[31] -pin ARMcore Cache_ReadData[31] -pin Cache rc_ReadData[31]
load net ARMcore_Cache_ReadData[3] -attr @rip rc_ReadData[3] -pin ARMcore Cache_ReadData[3] -pin Cache rc_ReadData[3]
load net ARMcore_Cache_ReadData[4] -attr @rip rc_ReadData[4] -pin ARMcore Cache_ReadData[4] -pin Cache rc_ReadData[4]
load net ARMcore_Cache_ReadData[5] -attr @rip rc_ReadData[5] -pin ARMcore Cache_ReadData[5] -pin Cache rc_ReadData[5]
load net ARMcore_Cache_ReadData[6] -attr @rip rc_ReadData[6] -pin ARMcore Cache_ReadData[6] -pin Cache rc_ReadData[6]
load net ARMcore_Cache_ReadData[7] -attr @rip rc_ReadData[7] -pin ARMcore Cache_ReadData[7] -pin Cache rc_ReadData[7]
load net ARMcore_Cache_ReadData[8] -attr @rip rc_ReadData[8] -pin ARMcore Cache_ReadData[8] -pin Cache rc_ReadData[8]
load net ARMcore_Cache_ReadData[9] -attr @rip rc_ReadData[9] -pin ARMcore Cache_ReadData[9] -pin Cache rc_ReadData[9]
load net ARMcore_Cache_ReadReady -pin ARMcore Cache_ReadReady -pin Cache rc_ReadReady
netloc ARMcore_Cache_ReadReady 1 2 1 1000 330n
load net ARMcore_Cache_Valid -pin ARMcore Cache_Valid -pin Cache rc_Valid
netloc ARMcore_Cache_Valid 1 1 3 500 390 1020J 348 11770
load net ARMcore_Cache_WriteData[0] -attr @rip Cache_WriteData[0] -pin ARMcore Cache_WriteData[0] -pin Cache rc_WriteData[0]
load net ARMcore_Cache_WriteData[10] -attr @rip Cache_WriteData[10] -pin ARMcore Cache_WriteData[10] -pin Cache rc_WriteData[10]
load net ARMcore_Cache_WriteData[11] -attr @rip Cache_WriteData[11] -pin ARMcore Cache_WriteData[11] -pin Cache rc_WriteData[11]
load net ARMcore_Cache_WriteData[12] -attr @rip Cache_WriteData[12] -pin ARMcore Cache_WriteData[12] -pin Cache rc_WriteData[12]
load net ARMcore_Cache_WriteData[13] -attr @rip Cache_WriteData[13] -pin ARMcore Cache_WriteData[13] -pin Cache rc_WriteData[13]
load net ARMcore_Cache_WriteData[14] -attr @rip Cache_WriteData[14] -pin ARMcore Cache_WriteData[14] -pin Cache rc_WriteData[14]
load net ARMcore_Cache_WriteData[15] -attr @rip Cache_WriteData[15] -pin ARMcore Cache_WriteData[15] -pin Cache rc_WriteData[15]
load net ARMcore_Cache_WriteData[16] -attr @rip Cache_WriteData[16] -pin ARMcore Cache_WriteData[16] -pin Cache rc_WriteData[16]
load net ARMcore_Cache_WriteData[17] -attr @rip Cache_WriteData[17] -pin ARMcore Cache_WriteData[17] -pin Cache rc_WriteData[17]
load net ARMcore_Cache_WriteData[18] -attr @rip Cache_WriteData[18] -pin ARMcore Cache_WriteData[18] -pin Cache rc_WriteData[18]
load net ARMcore_Cache_WriteData[19] -attr @rip Cache_WriteData[19] -pin ARMcore Cache_WriteData[19] -pin Cache rc_WriteData[19]
load net ARMcore_Cache_WriteData[1] -attr @rip Cache_WriteData[1] -pin ARMcore Cache_WriteData[1] -pin Cache rc_WriteData[1]
load net ARMcore_Cache_WriteData[20] -attr @rip Cache_WriteData[20] -pin ARMcore Cache_WriteData[20] -pin Cache rc_WriteData[20]
load net ARMcore_Cache_WriteData[21] -attr @rip Cache_WriteData[21] -pin ARMcore Cache_WriteData[21] -pin Cache rc_WriteData[21]
load net ARMcore_Cache_WriteData[22] -attr @rip Cache_WriteData[22] -pin ARMcore Cache_WriteData[22] -pin Cache rc_WriteData[22]
load net ARMcore_Cache_WriteData[23] -attr @rip Cache_WriteData[23] -pin ARMcore Cache_WriteData[23] -pin Cache rc_WriteData[23]
load net ARMcore_Cache_WriteData[24] -attr @rip Cache_WriteData[24] -pin ARMcore Cache_WriteData[24] -pin Cache rc_WriteData[24]
load net ARMcore_Cache_WriteData[25] -attr @rip Cache_WriteData[25] -pin ARMcore Cache_WriteData[25] -pin Cache rc_WriteData[25]
load net ARMcore_Cache_WriteData[26] -attr @rip Cache_WriteData[26] -pin ARMcore Cache_WriteData[26] -pin Cache rc_WriteData[26]
load net ARMcore_Cache_WriteData[27] -attr @rip Cache_WriteData[27] -pin ARMcore Cache_WriteData[27] -pin Cache rc_WriteData[27]
load net ARMcore_Cache_WriteData[28] -attr @rip Cache_WriteData[28] -pin ARMcore Cache_WriteData[28] -pin Cache rc_WriteData[28]
load net ARMcore_Cache_WriteData[29] -attr @rip Cache_WriteData[29] -pin ARMcore Cache_WriteData[29] -pin Cache rc_WriteData[29]
load net ARMcore_Cache_WriteData[2] -attr @rip Cache_WriteData[2] -pin ARMcore Cache_WriteData[2] -pin Cache rc_WriteData[2]
load net ARMcore_Cache_WriteData[30] -attr @rip Cache_WriteData[30] -pin ARMcore Cache_WriteData[30] -pin Cache rc_WriteData[30]
load net ARMcore_Cache_WriteData[31] -attr @rip Cache_WriteData[31] -pin ARMcore Cache_WriteData[31] -pin Cache rc_WriteData[31]
load net ARMcore_Cache_WriteData[3] -attr @rip Cache_WriteData[3] -pin ARMcore Cache_WriteData[3] -pin Cache rc_WriteData[3]
load net ARMcore_Cache_WriteData[4] -attr @rip Cache_WriteData[4] -pin ARMcore Cache_WriteData[4] -pin Cache rc_WriteData[4]
load net ARMcore_Cache_WriteData[5] -attr @rip Cache_WriteData[5] -pin ARMcore Cache_WriteData[5] -pin Cache rc_WriteData[5]
load net ARMcore_Cache_WriteData[6] -attr @rip Cache_WriteData[6] -pin ARMcore Cache_WriteData[6] -pin Cache rc_WriteData[6]
load net ARMcore_Cache_WriteData[7] -attr @rip Cache_WriteData[7] -pin ARMcore Cache_WriteData[7] -pin Cache rc_WriteData[7]
load net ARMcore_Cache_WriteData[8] -attr @rip Cache_WriteData[8] -pin ARMcore Cache_WriteData[8] -pin Cache rc_WriteData[8]
load net ARMcore_Cache_WriteData[9] -attr @rip Cache_WriteData[9] -pin ARMcore Cache_WriteData[9] -pin Cache rc_WriteData[9]
load net ARMcore_IO_Addr[0] -attr @rip IO_Addr[0] -pin ARMcore IO_Addr[0] -pin PeripheralConnector ADDR[0]
load net ARMcore_IO_Addr[10] -attr @rip IO_Addr[10] -pin ARMcore IO_Addr[10] -pin PeripheralConnector ADDR[10]
load net ARMcore_IO_Addr[11] -attr @rip IO_Addr[11] -pin ARMcore IO_Addr[11] -pin PeripheralConnector ADDR[11]
load net ARMcore_IO_Addr[12] -attr @rip IO_Addr[12] -pin ARMcore IO_Addr[12] -pin PeripheralConnector ADDR[12]
load net ARMcore_IO_Addr[13] -attr @rip IO_Addr[13] -pin ARMcore IO_Addr[13] -pin PeripheralConnector ADDR[13]
load net ARMcore_IO_Addr[14] -attr @rip IO_Addr[14] -pin ARMcore IO_Addr[14] -pin PeripheralConnector ADDR[14]
load net ARMcore_IO_Addr[15] -attr @rip IO_Addr[15] -pin ARMcore IO_Addr[15] -pin PeripheralConnector ADDR[15]
load net ARMcore_IO_Addr[16] -attr @rip IO_Addr[16] -pin ARMcore IO_Addr[16] -pin PeripheralConnector ADDR[16]
load net ARMcore_IO_Addr[17] -attr @rip IO_Addr[17] -pin ARMcore IO_Addr[17] -pin PeripheralConnector ADDR[17]
load net ARMcore_IO_Addr[18] -attr @rip IO_Addr[18] -pin ARMcore IO_Addr[18] -pin PeripheralConnector ADDR[18]
load net ARMcore_IO_Addr[19] -attr @rip IO_Addr[19] -pin ARMcore IO_Addr[19] -pin PeripheralConnector ADDR[19]
load net ARMcore_IO_Addr[1] -attr @rip IO_Addr[1] -pin ARMcore IO_Addr[1] -pin PeripheralConnector ADDR[1]
load net ARMcore_IO_Addr[20] -attr @rip IO_Addr[20] -pin ARMcore IO_Addr[20] -pin PeripheralConnector ADDR[20]
load net ARMcore_IO_Addr[21] -attr @rip IO_Addr[21] -pin ARMcore IO_Addr[21] -pin PeripheralConnector ADDR[21]
load net ARMcore_IO_Addr[22] -attr @rip IO_Addr[22] -pin ARMcore IO_Addr[22] -pin PeripheralConnector ADDR[22]
load net ARMcore_IO_Addr[23] -attr @rip IO_Addr[23] -pin ARMcore IO_Addr[23] -pin PeripheralConnector ADDR[23]
load net ARMcore_IO_Addr[24] -attr @rip IO_Addr[24] -pin ARMcore IO_Addr[24] -pin PeripheralConnector ADDR[24]
load net ARMcore_IO_Addr[25] -attr @rip IO_Addr[25] -pin ARMcore IO_Addr[25] -pin PeripheralConnector ADDR[25]
load net ARMcore_IO_Addr[26] -attr @rip IO_Addr[26] -pin ARMcore IO_Addr[26] -pin PeripheralConnector ADDR[26]
load net ARMcore_IO_Addr[27] -attr @rip IO_Addr[27] -pin ARMcore IO_Addr[27] -pin PeripheralConnector ADDR[27]
load net ARMcore_IO_Addr[28] -attr @rip IO_Addr[28] -pin ARMcore IO_Addr[28] -pin PeripheralConnector ADDR[28]
load net ARMcore_IO_Addr[29] -attr @rip IO_Addr[29] -pin ARMcore IO_Addr[29] -pin PeripheralConnector ADDR[29]
load net ARMcore_IO_Addr[2] -attr @rip IO_Addr[2] -pin ARMcore IO_Addr[2] -pin PeripheralConnector ADDR[2]
load net ARMcore_IO_Addr[30] -attr @rip IO_Addr[30] -pin ARMcore IO_Addr[30] -pin PeripheralConnector ADDR[30]
load net ARMcore_IO_Addr[31] -attr @rip IO_Addr[31] -pin ARMcore IO_Addr[31] -pin PeripheralConnector ADDR[31]
load net ARMcore_IO_Addr[3] -attr @rip IO_Addr[3] -pin ARMcore IO_Addr[3] -pin PeripheralConnector ADDR[3]
load net ARMcore_IO_Addr[4] -attr @rip IO_Addr[4] -pin ARMcore IO_Addr[4] -pin PeripheralConnector ADDR[4]
load net ARMcore_IO_Addr[5] -attr @rip IO_Addr[5] -pin ARMcore IO_Addr[5] -pin PeripheralConnector ADDR[5]
load net ARMcore_IO_Addr[6] -attr @rip IO_Addr[6] -pin ARMcore IO_Addr[6] -pin PeripheralConnector ADDR[6]
load net ARMcore_IO_Addr[7] -attr @rip IO_Addr[7] -pin ARMcore IO_Addr[7] -pin PeripheralConnector ADDR[7]
load net ARMcore_IO_Addr[8] -attr @rip IO_Addr[8] -pin ARMcore IO_Addr[8] -pin PeripheralConnector ADDR[8]
load net ARMcore_IO_Addr[9] -attr @rip IO_Addr[9] -pin ARMcore IO_Addr[9] -pin PeripheralConnector ADDR[9]
load net ARMcore_IO_ReadData[0] -attr @rip RD[0] -pin ARMcore IO_ReadData[0] -pin PeripheralConnector RD[0]
load net ARMcore_IO_ReadData[10] -attr @rip RD[10] -pin ARMcore IO_ReadData[10] -pin PeripheralConnector RD[10]
load net ARMcore_IO_ReadData[11] -attr @rip RD[11] -pin ARMcore IO_ReadData[11] -pin PeripheralConnector RD[11]
load net ARMcore_IO_ReadData[12] -attr @rip RD[12] -pin ARMcore IO_ReadData[12] -pin PeripheralConnector RD[12]
load net ARMcore_IO_ReadData[13] -attr @rip RD[13] -pin ARMcore IO_ReadData[13] -pin PeripheralConnector RD[13]
load net ARMcore_IO_ReadData[14] -attr @rip RD[14] -pin ARMcore IO_ReadData[14] -pin PeripheralConnector RD[14]
load net ARMcore_IO_ReadData[15] -attr @rip RD[15] -pin ARMcore IO_ReadData[15] -pin PeripheralConnector RD[15]
load net ARMcore_IO_ReadData[16] -attr @rip RD[16] -pin ARMcore IO_ReadData[16] -pin PeripheralConnector RD[16]
load net ARMcore_IO_ReadData[17] -attr @rip RD[17] -pin ARMcore IO_ReadData[17] -pin PeripheralConnector RD[17]
load net ARMcore_IO_ReadData[18] -attr @rip RD[18] -pin ARMcore IO_ReadData[18] -pin PeripheralConnector RD[18]
load net ARMcore_IO_ReadData[19] -attr @rip RD[19] -pin ARMcore IO_ReadData[19] -pin PeripheralConnector RD[19]
load net ARMcore_IO_ReadData[1] -attr @rip RD[1] -pin ARMcore IO_ReadData[1] -pin PeripheralConnector RD[1]
load net ARMcore_IO_ReadData[20] -attr @rip RD[20] -pin ARMcore IO_ReadData[20] -pin PeripheralConnector RD[20]
load net ARMcore_IO_ReadData[21] -attr @rip RD[21] -pin ARMcore IO_ReadData[21] -pin PeripheralConnector RD[21]
load net ARMcore_IO_ReadData[22] -attr @rip RD[22] -pin ARMcore IO_ReadData[22] -pin PeripheralConnector RD[22]
load net ARMcore_IO_ReadData[23] -attr @rip RD[23] -pin ARMcore IO_ReadData[23] -pin PeripheralConnector RD[23]
load net ARMcore_IO_ReadData[24] -attr @rip RD[24] -pin ARMcore IO_ReadData[24] -pin PeripheralConnector RD[24]
load net ARMcore_IO_ReadData[25] -attr @rip RD[25] -pin ARMcore IO_ReadData[25] -pin PeripheralConnector RD[25]
load net ARMcore_IO_ReadData[26] -attr @rip RD[26] -pin ARMcore IO_ReadData[26] -pin PeripheralConnector RD[26]
load net ARMcore_IO_ReadData[27] -attr @rip RD[27] -pin ARMcore IO_ReadData[27] -pin PeripheralConnector RD[27]
load net ARMcore_IO_ReadData[28] -attr @rip RD[28] -pin ARMcore IO_ReadData[28] -pin PeripheralConnector RD[28]
load net ARMcore_IO_ReadData[29] -attr @rip RD[29] -pin ARMcore IO_ReadData[29] -pin PeripheralConnector RD[29]
load net ARMcore_IO_ReadData[2] -attr @rip RD[2] -pin ARMcore IO_ReadData[2] -pin PeripheralConnector RD[2]
load net ARMcore_IO_ReadData[30] -attr @rip RD[30] -pin ARMcore IO_ReadData[30] -pin PeripheralConnector RD[30]
load net ARMcore_IO_ReadData[31] -attr @rip RD[31] -pin ARMcore IO_ReadData[31] -pin PeripheralConnector RD[31]
load net ARMcore_IO_ReadData[3] -attr @rip RD[3] -pin ARMcore IO_ReadData[3] -pin PeripheralConnector RD[3]
load net ARMcore_IO_ReadData[4] -attr @rip RD[4] -pin ARMcore IO_ReadData[4] -pin PeripheralConnector RD[4]
load net ARMcore_IO_ReadData[5] -attr @rip RD[5] -pin ARMcore IO_ReadData[5] -pin PeripheralConnector RD[5]
load net ARMcore_IO_ReadData[6] -attr @rip RD[6] -pin ARMcore IO_ReadData[6] -pin PeripheralConnector RD[6]
load net ARMcore_IO_ReadData[7] -attr @rip RD[7] -pin ARMcore IO_ReadData[7] -pin PeripheralConnector RD[7]
load net ARMcore_IO_ReadData[8] -attr @rip RD[8] -pin ARMcore IO_ReadData[8] -pin PeripheralConnector RD[8]
load net ARMcore_IO_ReadData[9] -attr @rip RD[9] -pin ARMcore IO_ReadData[9] -pin PeripheralConnector RD[9]
load net ARMcore_IO_WE -pin ARMcore IO_WE -pin PeripheralConnector WE
netloc ARMcore_IO_WE 1 3 1 11890 730n
load net ARMcore_IO_WriteData[0] -attr @rip IO_WriteData[0] -pin ARMcore IO_WriteData[0] -pin PeripheralConnector WD[0]
load net ARMcore_IO_WriteData[10] -attr @rip IO_WriteData[10] -pin ARMcore IO_WriteData[10] -pin PeripheralConnector WD[10]
load net ARMcore_IO_WriteData[11] -attr @rip IO_WriteData[11] -pin ARMcore IO_WriteData[11] -pin PeripheralConnector WD[11]
load net ARMcore_IO_WriteData[12] -attr @rip IO_WriteData[12] -pin ARMcore IO_WriteData[12] -pin PeripheralConnector WD[12]
load net ARMcore_IO_WriteData[13] -attr @rip IO_WriteData[13] -pin ARMcore IO_WriteData[13] -pin PeripheralConnector WD[13]
load net ARMcore_IO_WriteData[14] -attr @rip IO_WriteData[14] -pin ARMcore IO_WriteData[14] -pin PeripheralConnector WD[14]
load net ARMcore_IO_WriteData[15] -attr @rip IO_WriteData[15] -pin ARMcore IO_WriteData[15] -pin PeripheralConnector WD[15]
load net ARMcore_IO_WriteData[16] -attr @rip IO_WriteData[16] -pin ARMcore IO_WriteData[16] -pin PeripheralConnector WD[16]
load net ARMcore_IO_WriteData[17] -attr @rip IO_WriteData[17] -pin ARMcore IO_WriteData[17] -pin PeripheralConnector WD[17]
load net ARMcore_IO_WriteData[18] -attr @rip IO_WriteData[18] -pin ARMcore IO_WriteData[18] -pin PeripheralConnector WD[18]
load net ARMcore_IO_WriteData[19] -attr @rip IO_WriteData[19] -pin ARMcore IO_WriteData[19] -pin PeripheralConnector WD[19]
load net ARMcore_IO_WriteData[1] -attr @rip IO_WriteData[1] -pin ARMcore IO_WriteData[1] -pin PeripheralConnector WD[1]
load net ARMcore_IO_WriteData[20] -attr @rip IO_WriteData[20] -pin ARMcore IO_WriteData[20] -pin PeripheralConnector WD[20]
load net ARMcore_IO_WriteData[21] -attr @rip IO_WriteData[21] -pin ARMcore IO_WriteData[21] -pin PeripheralConnector WD[21]
load net ARMcore_IO_WriteData[22] -attr @rip IO_WriteData[22] -pin ARMcore IO_WriteData[22] -pin PeripheralConnector WD[22]
load net ARMcore_IO_WriteData[23] -attr @rip IO_WriteData[23] -pin ARMcore IO_WriteData[23] -pin PeripheralConnector WD[23]
load net ARMcore_IO_WriteData[24] -attr @rip IO_WriteData[24] -pin ARMcore IO_WriteData[24] -pin PeripheralConnector WD[24]
load net ARMcore_IO_WriteData[25] -attr @rip IO_WriteData[25] -pin ARMcore IO_WriteData[25] -pin PeripheralConnector WD[25]
load net ARMcore_IO_WriteData[26] -attr @rip IO_WriteData[26] -pin ARMcore IO_WriteData[26] -pin PeripheralConnector WD[26]
load net ARMcore_IO_WriteData[27] -attr @rip IO_WriteData[27] -pin ARMcore IO_WriteData[27] -pin PeripheralConnector WD[27]
load net ARMcore_IO_WriteData[28] -attr @rip IO_WriteData[28] -pin ARMcore IO_WriteData[28] -pin PeripheralConnector WD[28]
load net ARMcore_IO_WriteData[29] -attr @rip IO_WriteData[29] -pin ARMcore IO_WriteData[29] -pin PeripheralConnector WD[29]
load net ARMcore_IO_WriteData[2] -attr @rip IO_WriteData[2] -pin ARMcore IO_WriteData[2] -pin PeripheralConnector WD[2]
load net ARMcore_IO_WriteData[30] -attr @rip IO_WriteData[30] -pin ARMcore IO_WriteData[30] -pin PeripheralConnector WD[30]
load net ARMcore_IO_WriteData[31] -attr @rip IO_WriteData[31] -pin ARMcore IO_WriteData[31] -pin PeripheralConnector WD[31]
load net ARMcore_IO_WriteData[3] -attr @rip IO_WriteData[3] -pin ARMcore IO_WriteData[3] -pin PeripheralConnector WD[3]
load net ARMcore_IO_WriteData[4] -attr @rip IO_WriteData[4] -pin ARMcore IO_WriteData[4] -pin PeripheralConnector WD[4]
load net ARMcore_IO_WriteData[5] -attr @rip IO_WriteData[5] -pin ARMcore IO_WriteData[5] -pin PeripheralConnector WD[5]
load net ARMcore_IO_WriteData[6] -attr @rip IO_WriteData[6] -pin ARMcore IO_WriteData[6] -pin PeripheralConnector WD[6]
load net ARMcore_IO_WriteData[7] -attr @rip IO_WriteData[7] -pin ARMcore IO_WriteData[7] -pin PeripheralConnector WD[7]
load net ARMcore_IO_WriteData[8] -attr @rip IO_WriteData[8] -pin ARMcore IO_WriteData[8] -pin PeripheralConnector WD[8]
load net ARMcore_IO_WriteData[9] -attr @rip IO_WriteData[9] -pin ARMcore IO_WriteData[9] -pin PeripheralConnector WD[9]
load net ARMcore_Mem_ReadData[0] -attr @rip ReadData[0] -pin ARMcore Mem_ReadData[0] -pin Cache cm_ReadData[0] -pin DataMemory ReadData[0]
load net ARMcore_Mem_ReadData[10] -attr @rip ReadData[10] -pin ARMcore Mem_ReadData[10] -pin Cache cm_ReadData[10] -pin DataMemory ReadData[10]
load net ARMcore_Mem_ReadData[11] -attr @rip ReadData[11] -pin ARMcore Mem_ReadData[11] -pin Cache cm_ReadData[11] -pin DataMemory ReadData[11]
load net ARMcore_Mem_ReadData[12] -attr @rip ReadData[12] -pin ARMcore Mem_ReadData[12] -pin Cache cm_ReadData[12] -pin DataMemory ReadData[12]
load net ARMcore_Mem_ReadData[13] -attr @rip ReadData[13] -pin ARMcore Mem_ReadData[13] -pin Cache cm_ReadData[13] -pin DataMemory ReadData[13]
load net ARMcore_Mem_ReadData[14] -attr @rip ReadData[14] -pin ARMcore Mem_ReadData[14] -pin Cache cm_ReadData[14] -pin DataMemory ReadData[14]
load net ARMcore_Mem_ReadData[15] -attr @rip ReadData[15] -pin ARMcore Mem_ReadData[15] -pin Cache cm_ReadData[15] -pin DataMemory ReadData[15]
load net ARMcore_Mem_ReadData[16] -attr @rip ReadData[16] -pin ARMcore Mem_ReadData[16] -pin Cache cm_ReadData[16] -pin DataMemory ReadData[16]
load net ARMcore_Mem_ReadData[17] -attr @rip ReadData[17] -pin ARMcore Mem_ReadData[17] -pin Cache cm_ReadData[17] -pin DataMemory ReadData[17]
load net ARMcore_Mem_ReadData[18] -attr @rip ReadData[18] -pin ARMcore Mem_ReadData[18] -pin Cache cm_ReadData[18] -pin DataMemory ReadData[18]
load net ARMcore_Mem_ReadData[19] -attr @rip ReadData[19] -pin ARMcore Mem_ReadData[19] -pin Cache cm_ReadData[19] -pin DataMemory ReadData[19]
load net ARMcore_Mem_ReadData[1] -attr @rip ReadData[1] -pin ARMcore Mem_ReadData[1] -pin Cache cm_ReadData[1] -pin DataMemory ReadData[1]
load net ARMcore_Mem_ReadData[20] -attr @rip ReadData[20] -pin ARMcore Mem_ReadData[20] -pin Cache cm_ReadData[20] -pin DataMemory ReadData[20]
load net ARMcore_Mem_ReadData[21] -attr @rip ReadData[21] -pin ARMcore Mem_ReadData[21] -pin Cache cm_ReadData[21] -pin DataMemory ReadData[21]
load net ARMcore_Mem_ReadData[22] -attr @rip ReadData[22] -pin ARMcore Mem_ReadData[22] -pin Cache cm_ReadData[22] -pin DataMemory ReadData[22]
load net ARMcore_Mem_ReadData[23] -attr @rip ReadData[23] -pin ARMcore Mem_ReadData[23] -pin Cache cm_ReadData[23] -pin DataMemory ReadData[23]
load net ARMcore_Mem_ReadData[24] -attr @rip ReadData[24] -pin ARMcore Mem_ReadData[24] -pin Cache cm_ReadData[24] -pin DataMemory ReadData[24]
load net ARMcore_Mem_ReadData[25] -attr @rip ReadData[25] -pin ARMcore Mem_ReadData[25] -pin Cache cm_ReadData[25] -pin DataMemory ReadData[25]
load net ARMcore_Mem_ReadData[26] -attr @rip ReadData[26] -pin ARMcore Mem_ReadData[26] -pin Cache cm_ReadData[26] -pin DataMemory ReadData[26]
load net ARMcore_Mem_ReadData[27] -attr @rip ReadData[27] -pin ARMcore Mem_ReadData[27] -pin Cache cm_ReadData[27] -pin DataMemory ReadData[27]
load net ARMcore_Mem_ReadData[28] -attr @rip ReadData[28] -pin ARMcore Mem_ReadData[28] -pin Cache cm_ReadData[28] -pin DataMemory ReadData[28]
load net ARMcore_Mem_ReadData[29] -attr @rip ReadData[29] -pin ARMcore Mem_ReadData[29] -pin Cache cm_ReadData[29] -pin DataMemory ReadData[29]
load net ARMcore_Mem_ReadData[2] -attr @rip ReadData[2] -pin ARMcore Mem_ReadData[2] -pin Cache cm_ReadData[2] -pin DataMemory ReadData[2]
load net ARMcore_Mem_ReadData[30] -attr @rip ReadData[30] -pin ARMcore Mem_ReadData[30] -pin Cache cm_ReadData[30] -pin DataMemory ReadData[30]
load net ARMcore_Mem_ReadData[31] -attr @rip ReadData[31] -pin ARMcore Mem_ReadData[31] -pin Cache cm_ReadData[31] -pin DataMemory ReadData[31]
load net ARMcore_Mem_ReadData[3] -attr @rip ReadData[3] -pin ARMcore Mem_ReadData[3] -pin Cache cm_ReadData[3] -pin DataMemory ReadData[3]
load net ARMcore_Mem_ReadData[4] -attr @rip ReadData[4] -pin ARMcore Mem_ReadData[4] -pin Cache cm_ReadData[4] -pin DataMemory ReadData[4]
load net ARMcore_Mem_ReadData[5] -attr @rip ReadData[5] -pin ARMcore Mem_ReadData[5] -pin Cache cm_ReadData[5] -pin DataMemory ReadData[5]
load net ARMcore_Mem_ReadData[6] -attr @rip ReadData[6] -pin ARMcore Mem_ReadData[6] -pin Cache cm_ReadData[6] -pin DataMemory ReadData[6]
load net ARMcore_Mem_ReadData[7] -attr @rip ReadData[7] -pin ARMcore Mem_ReadData[7] -pin Cache cm_ReadData[7] -pin DataMemory ReadData[7]
load net ARMcore_Mem_ReadData[8] -attr @rip ReadData[8] -pin ARMcore Mem_ReadData[8] -pin Cache cm_ReadData[8] -pin DataMemory ReadData[8]
load net ARMcore_Mem_ReadData[9] -attr @rip ReadData[9] -pin ARMcore Mem_ReadData[9] -pin Cache cm_ReadData[9] -pin DataMemory ReadData[9]
load net ARMcore_Mem_ReadReady -pin ARMcore Mem_ReadReady -pin Cache cm_ReadReady -pin DataMemory ReadReady
netloc ARMcore_Mem_ReadReady 1 1 2 420 550 920J
load net CLK -pin ARMcore CLK -port CLK -pin Cache CLK -pin DataMemory CLK -pin LedDriver CLK -pin Segment CLK -pin SegmentDriver CLK
netloc CLK 1 0 6 20 10 480 430 940 2668 11930J 790 12280 630 12560
load net Cache_cm_ReadAddr[0] -attr @rip cm_ReadAddr[0] -pin Cache cm_ReadAddr[0] -pin DataMemory ReadAddr[0]
load net Cache_cm_ReadAddr[10] -attr @rip cm_ReadAddr[10] -pin Cache cm_ReadAddr[10] -pin DataMemory ReadAddr[10]
load net Cache_cm_ReadAddr[11] -attr @rip cm_ReadAddr[11] -pin Cache cm_ReadAddr[11] -pin DataMemory ReadAddr[11]
load net Cache_cm_ReadAddr[12] -attr @rip cm_ReadAddr[12] -pin Cache cm_ReadAddr[12] -pin DataMemory ReadAddr[12]
load net Cache_cm_ReadAddr[13] -attr @rip cm_ReadAddr[13] -pin Cache cm_ReadAddr[13] -pin DataMemory ReadAddr[13]
load net Cache_cm_ReadAddr[14] -attr @rip cm_ReadAddr[14] -pin Cache cm_ReadAddr[14] -pin DataMemory ReadAddr[14]
load net Cache_cm_ReadAddr[15] -attr @rip cm_ReadAddr[15] -pin Cache cm_ReadAddr[15] -pin DataMemory ReadAddr[15]
load net Cache_cm_ReadAddr[16] -attr @rip cm_ReadAddr[16] -pin Cache cm_ReadAddr[16] -pin DataMemory ReadAddr[16]
load net Cache_cm_ReadAddr[17] -attr @rip cm_ReadAddr[17] -pin Cache cm_ReadAddr[17] -pin DataMemory ReadAddr[17]
load net Cache_cm_ReadAddr[18] -attr @rip cm_ReadAddr[18] -pin Cache cm_ReadAddr[18] -pin DataMemory ReadAddr[18]
load net Cache_cm_ReadAddr[19] -attr @rip cm_ReadAddr[19] -pin Cache cm_ReadAddr[19] -pin DataMemory ReadAddr[19]
load net Cache_cm_ReadAddr[1] -attr @rip cm_ReadAddr[1] -pin Cache cm_ReadAddr[1] -pin DataMemory ReadAddr[1]
load net Cache_cm_ReadAddr[20] -attr @rip cm_ReadAddr[20] -pin Cache cm_ReadAddr[20] -pin DataMemory ReadAddr[20]
load net Cache_cm_ReadAddr[21] -attr @rip cm_ReadAddr[21] -pin Cache cm_ReadAddr[21] -pin DataMemory ReadAddr[21]
load net Cache_cm_ReadAddr[22] -attr @rip cm_ReadAddr[22] -pin Cache cm_ReadAddr[22] -pin DataMemory ReadAddr[22]
load net Cache_cm_ReadAddr[23] -attr @rip cm_ReadAddr[23] -pin Cache cm_ReadAddr[23] -pin DataMemory ReadAddr[23]
load net Cache_cm_ReadAddr[24] -attr @rip cm_ReadAddr[24] -pin Cache cm_ReadAddr[24] -pin DataMemory ReadAddr[24]
load net Cache_cm_ReadAddr[25] -attr @rip cm_ReadAddr[25] -pin Cache cm_ReadAddr[25] -pin DataMemory ReadAddr[25]
load net Cache_cm_ReadAddr[26] -attr @rip cm_ReadAddr[26] -pin Cache cm_ReadAddr[26] -pin DataMemory ReadAddr[26]
load net Cache_cm_ReadAddr[27] -attr @rip cm_ReadAddr[27] -pin Cache cm_ReadAddr[27] -pin DataMemory ReadAddr[27]
load net Cache_cm_ReadAddr[28] -attr @rip cm_ReadAddr[28] -pin Cache cm_ReadAddr[28] -pin DataMemory ReadAddr[28]
load net Cache_cm_ReadAddr[29] -attr @rip cm_ReadAddr[29] -pin Cache cm_ReadAddr[29] -pin DataMemory ReadAddr[29]
load net Cache_cm_ReadAddr[2] -attr @rip cm_ReadAddr[2] -pin Cache cm_ReadAddr[2] -pin DataMemory ReadAddr[2]
load net Cache_cm_ReadAddr[30] -attr @rip cm_ReadAddr[30] -pin Cache cm_ReadAddr[30] -pin DataMemory ReadAddr[30]
load net Cache_cm_ReadAddr[31] -attr @rip cm_ReadAddr[31] -pin Cache cm_ReadAddr[31] -pin DataMemory ReadAddr[31]
load net Cache_cm_ReadAddr[3] -attr @rip cm_ReadAddr[3] -pin Cache cm_ReadAddr[3] -pin DataMemory ReadAddr[3]
load net Cache_cm_ReadAddr[4] -attr @rip cm_ReadAddr[4] -pin Cache cm_ReadAddr[4] -pin DataMemory ReadAddr[4]
load net Cache_cm_ReadAddr[5] -attr @rip cm_ReadAddr[5] -pin Cache cm_ReadAddr[5] -pin DataMemory ReadAddr[5]
load net Cache_cm_ReadAddr[6] -attr @rip cm_ReadAddr[6] -pin Cache cm_ReadAddr[6] -pin DataMemory ReadAddr[6]
load net Cache_cm_ReadAddr[7] -attr @rip cm_ReadAddr[7] -pin Cache cm_ReadAddr[7] -pin DataMemory ReadAddr[7]
load net Cache_cm_ReadAddr[8] -attr @rip cm_ReadAddr[8] -pin Cache cm_ReadAddr[8] -pin DataMemory ReadAddr[8]
load net Cache_cm_ReadAddr[9] -attr @rip cm_ReadAddr[9] -pin Cache cm_ReadAddr[9] -pin DataMemory ReadAddr[9]
load net Cache_cm_ReadValid -pin Cache cm_ReadValid -pin DataMemory ReadValid
netloc Cache_cm_ReadValid 1 0 3 60 50 NJ 50 1040
load net Cache_cm_WriteAddr[0] -attr @rip cm_WriteAddr[0] -pin Cache cm_WriteAddr[0] -pin DataMemory WriteAddr[0]
load net Cache_cm_WriteAddr[10] -attr @rip cm_WriteAddr[10] -pin Cache cm_WriteAddr[10] -pin DataMemory WriteAddr[10]
load net Cache_cm_WriteAddr[11] -attr @rip cm_WriteAddr[11] -pin Cache cm_WriteAddr[11] -pin DataMemory WriteAddr[11]
load net Cache_cm_WriteAddr[12] -attr @rip cm_WriteAddr[12] -pin Cache cm_WriteAddr[12] -pin DataMemory WriteAddr[12]
load net Cache_cm_WriteAddr[13] -attr @rip cm_WriteAddr[13] -pin Cache cm_WriteAddr[13] -pin DataMemory WriteAddr[13]
load net Cache_cm_WriteAddr[14] -attr @rip cm_WriteAddr[14] -pin Cache cm_WriteAddr[14] -pin DataMemory WriteAddr[14]
load net Cache_cm_WriteAddr[15] -attr @rip cm_WriteAddr[15] -pin Cache cm_WriteAddr[15] -pin DataMemory WriteAddr[15]
load net Cache_cm_WriteAddr[16] -attr @rip cm_WriteAddr[16] -pin Cache cm_WriteAddr[16] -pin DataMemory WriteAddr[16]
load net Cache_cm_WriteAddr[17] -attr @rip cm_WriteAddr[17] -pin Cache cm_WriteAddr[17] -pin DataMemory WriteAddr[17]
load net Cache_cm_WriteAddr[18] -attr @rip cm_WriteAddr[18] -pin Cache cm_WriteAddr[18] -pin DataMemory WriteAddr[18]
load net Cache_cm_WriteAddr[19] -attr @rip cm_WriteAddr[19] -pin Cache cm_WriteAddr[19] -pin DataMemory WriteAddr[19]
load net Cache_cm_WriteAddr[1] -attr @rip cm_WriteAddr[1] -pin Cache cm_WriteAddr[1] -pin DataMemory WriteAddr[1]
load net Cache_cm_WriteAddr[20] -attr @rip cm_WriteAddr[20] -pin Cache cm_WriteAddr[20] -pin DataMemory WriteAddr[20]
load net Cache_cm_WriteAddr[21] -attr @rip cm_WriteAddr[21] -pin Cache cm_WriteAddr[21] -pin DataMemory WriteAddr[21]
load net Cache_cm_WriteAddr[22] -attr @rip cm_WriteAddr[22] -pin Cache cm_WriteAddr[22] -pin DataMemory WriteAddr[22]
load net Cache_cm_WriteAddr[23] -attr @rip cm_WriteAddr[23] -pin Cache cm_WriteAddr[23] -pin DataMemory WriteAddr[23]
load net Cache_cm_WriteAddr[24] -attr @rip cm_WriteAddr[24] -pin Cache cm_WriteAddr[24] -pin DataMemory WriteAddr[24]
load net Cache_cm_WriteAddr[25] -attr @rip cm_WriteAddr[25] -pin Cache cm_WriteAddr[25] -pin DataMemory WriteAddr[25]
load net Cache_cm_WriteAddr[26] -attr @rip cm_WriteAddr[26] -pin Cache cm_WriteAddr[26] -pin DataMemory WriteAddr[26]
load net Cache_cm_WriteAddr[27] -attr @rip cm_WriteAddr[27] -pin Cache cm_WriteAddr[27] -pin DataMemory WriteAddr[27]
load net Cache_cm_WriteAddr[28] -attr @rip cm_WriteAddr[28] -pin Cache cm_WriteAddr[28] -pin DataMemory WriteAddr[28]
load net Cache_cm_WriteAddr[29] -attr @rip cm_WriteAddr[29] -pin Cache cm_WriteAddr[29] -pin DataMemory WriteAddr[29]
load net Cache_cm_WriteAddr[2] -attr @rip cm_WriteAddr[2] -pin Cache cm_WriteAddr[2] -pin DataMemory WriteAddr[2]
load net Cache_cm_WriteAddr[30] -attr @rip cm_WriteAddr[30] -pin Cache cm_WriteAddr[30] -pin DataMemory WriteAddr[30]
load net Cache_cm_WriteAddr[31] -attr @rip cm_WriteAddr[31] -pin Cache cm_WriteAddr[31] -pin DataMemory WriteAddr[31]
load net Cache_cm_WriteAddr[3] -attr @rip cm_WriteAddr[3] -pin Cache cm_WriteAddr[3] -pin DataMemory WriteAddr[3]
load net Cache_cm_WriteAddr[4] -attr @rip cm_WriteAddr[4] -pin Cache cm_WriteAddr[4] -pin DataMemory WriteAddr[4]
load net Cache_cm_WriteAddr[5] -attr @rip cm_WriteAddr[5] -pin Cache cm_WriteAddr[5] -pin DataMemory WriteAddr[5]
load net Cache_cm_WriteAddr[6] -attr @rip cm_WriteAddr[6] -pin Cache cm_WriteAddr[6] -pin DataMemory WriteAddr[6]
load net Cache_cm_WriteAddr[7] -attr @rip cm_WriteAddr[7] -pin Cache cm_WriteAddr[7] -pin DataMemory WriteAddr[7]
load net Cache_cm_WriteAddr[8] -attr @rip cm_WriteAddr[8] -pin Cache cm_WriteAddr[8] -pin DataMemory WriteAddr[8]
load net Cache_cm_WriteAddr[9] -attr @rip cm_WriteAddr[9] -pin Cache cm_WriteAddr[9] -pin DataMemory WriteAddr[9]
load net Cache_cm_WriteData[0] -attr @rip cm_WriteData[0] -pin Cache cm_WriteData[0] -pin DataMemory WriteData[0]
load net Cache_cm_WriteData[10] -attr @rip cm_WriteData[10] -pin Cache cm_WriteData[10] -pin DataMemory WriteData[10]
load net Cache_cm_WriteData[11] -attr @rip cm_WriteData[11] -pin Cache cm_WriteData[11] -pin DataMemory WriteData[11]
load net Cache_cm_WriteData[12] -attr @rip cm_WriteData[12] -pin Cache cm_WriteData[12] -pin DataMemory WriteData[12]
load net Cache_cm_WriteData[13] -attr @rip cm_WriteData[13] -pin Cache cm_WriteData[13] -pin DataMemory WriteData[13]
load net Cache_cm_WriteData[14] -attr @rip cm_WriteData[14] -pin Cache cm_WriteData[14] -pin DataMemory WriteData[14]
load net Cache_cm_WriteData[15] -attr @rip cm_WriteData[15] -pin Cache cm_WriteData[15] -pin DataMemory WriteData[15]
load net Cache_cm_WriteData[16] -attr @rip cm_WriteData[16] -pin Cache cm_WriteData[16] -pin DataMemory WriteData[16]
load net Cache_cm_WriteData[17] -attr @rip cm_WriteData[17] -pin Cache cm_WriteData[17] -pin DataMemory WriteData[17]
load net Cache_cm_WriteData[18] -attr @rip cm_WriteData[18] -pin Cache cm_WriteData[18] -pin DataMemory WriteData[18]
load net Cache_cm_WriteData[19] -attr @rip cm_WriteData[19] -pin Cache cm_WriteData[19] -pin DataMemory WriteData[19]
load net Cache_cm_WriteData[1] -attr @rip cm_WriteData[1] -pin Cache cm_WriteData[1] -pin DataMemory WriteData[1]
load net Cache_cm_WriteData[20] -attr @rip cm_WriteData[20] -pin Cache cm_WriteData[20] -pin DataMemory WriteData[20]
load net Cache_cm_WriteData[21] -attr @rip cm_WriteData[21] -pin Cache cm_WriteData[21] -pin DataMemory WriteData[21]
load net Cache_cm_WriteData[22] -attr @rip cm_WriteData[22] -pin Cache cm_WriteData[22] -pin DataMemory WriteData[22]
load net Cache_cm_WriteData[23] -attr @rip cm_WriteData[23] -pin Cache cm_WriteData[23] -pin DataMemory WriteData[23]
load net Cache_cm_WriteData[24] -attr @rip cm_WriteData[24] -pin Cache cm_WriteData[24] -pin DataMemory WriteData[24]
load net Cache_cm_WriteData[25] -attr @rip cm_WriteData[25] -pin Cache cm_WriteData[25] -pin DataMemory WriteData[25]
load net Cache_cm_WriteData[26] -attr @rip cm_WriteData[26] -pin Cache cm_WriteData[26] -pin DataMemory WriteData[26]
load net Cache_cm_WriteData[27] -attr @rip cm_WriteData[27] -pin Cache cm_WriteData[27] -pin DataMemory WriteData[27]
load net Cache_cm_WriteData[28] -attr @rip cm_WriteData[28] -pin Cache cm_WriteData[28] -pin DataMemory WriteData[28]
load net Cache_cm_WriteData[29] -attr @rip cm_WriteData[29] -pin Cache cm_WriteData[29] -pin DataMemory WriteData[29]
load net Cache_cm_WriteData[2] -attr @rip cm_WriteData[2] -pin Cache cm_WriteData[2] -pin DataMemory WriteData[2]
load net Cache_cm_WriteData[30] -attr @rip cm_WriteData[30] -pin Cache cm_WriteData[30] -pin DataMemory WriteData[30]
load net Cache_cm_WriteData[31] -attr @rip cm_WriteData[31] -pin Cache cm_WriteData[31] -pin DataMemory WriteData[31]
load net Cache_cm_WriteData[3] -attr @rip cm_WriteData[3] -pin Cache cm_WriteData[3] -pin DataMemory WriteData[3]
load net Cache_cm_WriteData[4] -attr @rip cm_WriteData[4] -pin Cache cm_WriteData[4] -pin DataMemory WriteData[4]
load net Cache_cm_WriteData[5] -attr @rip cm_WriteData[5] -pin Cache cm_WriteData[5] -pin DataMemory WriteData[5]
load net Cache_cm_WriteData[6] -attr @rip cm_WriteData[6] -pin Cache cm_WriteData[6] -pin DataMemory WriteData[6]
load net Cache_cm_WriteData[7] -attr @rip cm_WriteData[7] -pin Cache cm_WriteData[7] -pin DataMemory WriteData[7]
load net Cache_cm_WriteData[8] -attr @rip cm_WriteData[8] -pin Cache cm_WriteData[8] -pin DataMemory WriteData[8]
load net Cache_cm_WriteData[9] -attr @rip cm_WriteData[9] -pin Cache cm_WriteData[9] -pin DataMemory WriteData[9]
load net Cache_cm_WriteValid -pin Cache cm_WriteValid -pin DataMemory WriteValid
netloc Cache_cm_WriteValid 1 0 3 120 110 NJ 110 860
load net Instr[0] -attr @rip Instr[0] -pin ARMcore Instr[0] -pin InstructionMemory Instr[0]
load net Instr[10] -attr @rip Instr[10] -pin ARMcore Instr[10] -pin InstructionMemory Instr[10]
load net Instr[11] -attr @rip Instr[11] -pin ARMcore Instr[11] -pin InstructionMemory Instr[11]
load net Instr[12] -attr @rip Instr[12] -pin ARMcore Instr[12] -pin InstructionMemory Instr[12]
load net Instr[13] -attr @rip Instr[13] -pin ARMcore Instr[13] -pin InstructionMemory Instr[13]
load net Instr[14] -attr @rip Instr[14] -pin ARMcore Instr[14] -pin InstructionMemory Instr[14]
load net Instr[15] -attr @rip Instr[15] -pin ARMcore Instr[15] -pin InstructionMemory Instr[15]
load net Instr[16] -attr @rip Instr[16] -pin ARMcore Instr[16] -pin InstructionMemory Instr[16]
load net Instr[17] -attr @rip Instr[17] -pin ARMcore Instr[17] -pin InstructionMemory Instr[17]
load net Instr[18] -attr @rip Instr[18] -pin ARMcore Instr[18] -pin InstructionMemory Instr[18]
load net Instr[19] -attr @rip Instr[19] -pin ARMcore Instr[19] -pin InstructionMemory Instr[19]
load net Instr[1] -attr @rip Instr[1] -pin ARMcore Instr[1] -pin InstructionMemory Instr[1]
load net Instr[20] -attr @rip Instr[20] -pin ARMcore Instr[20] -pin InstructionMemory Instr[20]
load net Instr[21] -attr @rip Instr[21] -pin ARMcore Instr[21] -pin InstructionMemory Instr[21]
load net Instr[22] -attr @rip Instr[22] -pin ARMcore Instr[22] -pin InstructionMemory Instr[22]
load net Instr[23] -attr @rip Instr[23] -pin ARMcore Instr[23] -pin InstructionMemory Instr[23]
load net Instr[24] -attr @rip Instr[24] -pin ARMcore Instr[24] -pin InstructionMemory Instr[24]
load net Instr[25] -attr @rip Instr[25] -pin ARMcore Instr[25] -pin InstructionMemory Instr[25]
load net Instr[26] -attr @rip Instr[26] -pin ARMcore Instr[26] -pin InstructionMemory Instr[26]
load net Instr[27] -attr @rip Instr[27] -pin ARMcore Instr[27] -pin InstructionMemory Instr[27]
load net Instr[28] -attr @rip Instr[28] -pin ARMcore Instr[28] -pin InstructionMemory Instr[28]
load net Instr[29] -attr @rip Instr[29] -pin ARMcore Instr[29] -pin InstructionMemory Instr[29]
load net Instr[2] -attr @rip Instr[2] -pin ARMcore Instr[2] -pin InstructionMemory Instr[2]
load net Instr[30] -attr @rip Instr[30] -pin ARMcore Instr[30] -pin InstructionMemory Instr[30]
load net Instr[31] -attr @rip Instr[31] -pin ARMcore Instr[31] -pin InstructionMemory Instr[31]
load net Instr[3] -attr @rip Instr[3] -pin ARMcore Instr[3] -pin InstructionMemory Instr[3]
load net Instr[4] -attr @rip Instr[4] -pin ARMcore Instr[4] -pin InstructionMemory Instr[4]
load net Instr[5] -attr @rip Instr[5] -pin ARMcore Instr[5] -pin InstructionMemory Instr[5]
load net Instr[6] -attr @rip Instr[6] -pin ARMcore Instr[6] -pin InstructionMemory Instr[6]
load net Instr[7] -attr @rip Instr[7] -pin ARMcore Instr[7] -pin InstructionMemory Instr[7]
load net Instr[8] -attr @rip Instr[8] -pin ARMcore Instr[8] -pin InstructionMemory Instr[8]
load net Instr[9] -attr @rip Instr[9] -pin ARMcore Instr[9] -pin InstructionMemory Instr[9]
load net LED[0] -attr @rip LED[0] -port LED[0] -pin LedDriver LED[0]
load net LED[10] -attr @rip LED[10] -port LED[10] -pin LedDriver LED[10]
load net LED[11] -attr @rip LED[11] -port LED[11] -pin LedDriver LED[11]
load net LED[12] -attr @rip LED[12] -port LED[12] -pin LedDriver LED[12]
load net LED[13] -attr @rip LED[13] -port LED[13] -pin LedDriver LED[13]
load net LED[14] -attr @rip LED[14] -port LED[14] -pin LedDriver LED[14]
load net LED[15] -attr @rip LED[15] -port LED[15] -pin LedDriver LED[15]
load net LED[1] -attr @rip LED[1] -port LED[1] -pin LedDriver LED[1]
load net LED[2] -attr @rip LED[2] -port LED[2] -pin LedDriver LED[2]
load net LED[3] -attr @rip LED[3] -port LED[3] -pin LedDriver LED[3]
load net LED[4] -attr @rip LED[4] -port LED[4] -pin LedDriver LED[4]
load net LED[5] -attr @rip LED[5] -port LED[5] -pin LedDriver LED[5]
load net LED[6] -attr @rip LED[6] -port LED[6] -pin LedDriver LED[6]
load net LED[7] -attr @rip LED[7] -port LED[7] -pin LedDriver LED[7]
load net LED[8] -attr @rip LED[8] -port LED[8] -pin LedDriver LED[8]
load net LED[9] -attr @rip LED[9] -port LED[9] -pin LedDriver LED[9]
load net PC[0] -attr @rip PC[0] -pin ARMcore PC[0] -pin InstructionMemory PC[0]
load net PC[10] -attr @rip PC[10] -pin ARMcore PC[10] -pin InstructionMemory PC[10]
load net PC[11] -attr @rip PC[11] -pin ARMcore PC[11] -pin InstructionMemory PC[11]
load net PC[12] -attr @rip PC[12] -pin ARMcore PC[12] -pin InstructionMemory PC[12]
load net PC[13] -attr @rip PC[13] -pin ARMcore PC[13] -pin InstructionMemory PC[13]
load net PC[14] -attr @rip PC[14] -pin ARMcore PC[14] -pin InstructionMemory PC[14]
load net PC[15] -attr @rip PC[15] -pin ARMcore PC[15] -pin InstructionMemory PC[15]
load net PC[16] -attr @rip PC[16] -pin ARMcore PC[16] -pin InstructionMemory PC[16]
load net PC[17] -attr @rip PC[17] -pin ARMcore PC[17] -pin InstructionMemory PC[17]
load net PC[18] -attr @rip PC[18] -pin ARMcore PC[18] -pin InstructionMemory PC[18]
load net PC[19] -attr @rip PC[19] -pin ARMcore PC[19] -pin InstructionMemory PC[19]
load net PC[1] -attr @rip PC[1] -pin ARMcore PC[1] -pin InstructionMemory PC[1]
load net PC[20] -attr @rip PC[20] -pin ARMcore PC[20] -pin InstructionMemory PC[20]
load net PC[21] -attr @rip PC[21] -pin ARMcore PC[21] -pin InstructionMemory PC[21]
load net PC[22] -attr @rip PC[22] -pin ARMcore PC[22] -pin InstructionMemory PC[22]
load net PC[23] -attr @rip PC[23] -pin ARMcore PC[23] -pin InstructionMemory PC[23]
load net PC[24] -attr @rip PC[24] -pin ARMcore PC[24] -pin InstructionMemory PC[24]
load net PC[25] -attr @rip PC[25] -pin ARMcore PC[25] -pin InstructionMemory PC[25]
load net PC[26] -attr @rip PC[26] -pin ARMcore PC[26] -pin InstructionMemory PC[26]
load net PC[27] -attr @rip PC[27] -pin ARMcore PC[27] -pin InstructionMemory PC[27]
load net PC[28] -attr @rip PC[28] -pin ARMcore PC[28] -pin InstructionMemory PC[28]
load net PC[29] -attr @rip PC[29] -pin ARMcore PC[29] -pin InstructionMemory PC[29]
load net PC[2] -attr @rip PC[2] -pin ARMcore PC[2] -pin InstructionMemory PC[2]
load net PC[30] -attr @rip PC[30] -pin ARMcore PC[30] -pin InstructionMemory PC[30]
load net PC[31] -attr @rip PC[31] -pin ARMcore PC[31] -pin InstructionMemory PC[31]
load net PC[3] -attr @rip PC[3] -pin ARMcore PC[3] -pin InstructionMemory PC[3]
load net PC[4] -attr @rip PC[4] -pin ARMcore PC[4] -pin InstructionMemory PC[4]
load net PC[5] -attr @rip PC[5] -pin ARMcore PC[5] -pin InstructionMemory PC[5]
load net PC[6] -attr @rip PC[6] -pin ARMcore PC[6] -pin InstructionMemory PC[6]
load net PC[7] -attr @rip PC[7] -pin ARMcore PC[7] -pin InstructionMemory PC[7]
load net PC[8] -attr @rip PC[8] -pin ARMcore PC[8] -pin InstructionMemory PC[8]
load net PC[9] -attr @rip PC[9] -pin ARMcore PC[9] -pin InstructionMemory PC[9]
load net PeripheralConnector_LED_WD[0] -attr @rip LED_WD[0] -pin LedDriver WD[0] -pin PeripheralConnector LED_WD[0]
load net PeripheralConnector_LED_WD[10] -attr @rip LED_WD[10] -pin LedDriver WD[10] -pin PeripheralConnector LED_WD[10]
load net PeripheralConnector_LED_WD[11] -attr @rip LED_WD[11] -pin LedDriver WD[11] -pin PeripheralConnector LED_WD[11]
load net PeripheralConnector_LED_WD[12] -attr @rip LED_WD[12] -pin LedDriver WD[12] -pin PeripheralConnector LED_WD[12]
load net PeripheralConnector_LED_WD[13] -attr @rip LED_WD[13] -pin LedDriver WD[13] -pin PeripheralConnector LED_WD[13]
load net PeripheralConnector_LED_WD[14] -attr @rip LED_WD[14] -pin LedDriver WD[14] -pin PeripheralConnector LED_WD[14]
load net PeripheralConnector_LED_WD[15] -attr @rip LED_WD[15] -pin LedDriver WD[15] -pin PeripheralConnector LED_WD[15]
load net PeripheralConnector_LED_WD[16] -attr @rip LED_WD[16] -pin LedDriver WD[16] -pin PeripheralConnector LED_WD[16]
load net PeripheralConnector_LED_WD[17] -attr @rip LED_WD[17] -pin LedDriver WD[17] -pin PeripheralConnector LED_WD[17]
load net PeripheralConnector_LED_WD[18] -attr @rip LED_WD[18] -pin LedDriver WD[18] -pin PeripheralConnector LED_WD[18]
load net PeripheralConnector_LED_WD[19] -attr @rip LED_WD[19] -pin LedDriver WD[19] -pin PeripheralConnector LED_WD[19]
load net PeripheralConnector_LED_WD[1] -attr @rip LED_WD[1] -pin LedDriver WD[1] -pin PeripheralConnector LED_WD[1]
load net PeripheralConnector_LED_WD[20] -attr @rip LED_WD[20] -pin LedDriver WD[20] -pin PeripheralConnector LED_WD[20]
load net PeripheralConnector_LED_WD[21] -attr @rip LED_WD[21] -pin LedDriver WD[21] -pin PeripheralConnector LED_WD[21]
load net PeripheralConnector_LED_WD[22] -attr @rip LED_WD[22] -pin LedDriver WD[22] -pin PeripheralConnector LED_WD[22]
load net PeripheralConnector_LED_WD[23] -attr @rip LED_WD[23] -pin LedDriver WD[23] -pin PeripheralConnector LED_WD[23]
load net PeripheralConnector_LED_WD[24] -attr @rip LED_WD[24] -pin LedDriver WD[24] -pin PeripheralConnector LED_WD[24]
load net PeripheralConnector_LED_WD[25] -attr @rip LED_WD[25] -pin LedDriver WD[25] -pin PeripheralConnector LED_WD[25]
load net PeripheralConnector_LED_WD[26] -attr @rip LED_WD[26] -pin LedDriver WD[26] -pin PeripheralConnector LED_WD[26]
load net PeripheralConnector_LED_WD[27] -attr @rip LED_WD[27] -pin LedDriver WD[27] -pin PeripheralConnector LED_WD[27]
load net PeripheralConnector_LED_WD[28] -attr @rip LED_WD[28] -pin LedDriver WD[28] -pin PeripheralConnector LED_WD[28]
load net PeripheralConnector_LED_WD[29] -attr @rip LED_WD[29] -pin LedDriver WD[29] -pin PeripheralConnector LED_WD[29]
load net PeripheralConnector_LED_WD[2] -attr @rip LED_WD[2] -pin LedDriver WD[2] -pin PeripheralConnector LED_WD[2]
load net PeripheralConnector_LED_WD[30] -attr @rip LED_WD[30] -pin LedDriver WD[30] -pin PeripheralConnector LED_WD[30]
load net PeripheralConnector_LED_WD[31] -attr @rip LED_WD[31] -pin LedDriver WD[31] -pin PeripheralConnector LED_WD[31]
load net PeripheralConnector_LED_WD[3] -attr @rip LED_WD[3] -pin LedDriver WD[3] -pin PeripheralConnector LED_WD[3]
load net PeripheralConnector_LED_WD[4] -attr @rip LED_WD[4] -pin LedDriver WD[4] -pin PeripheralConnector LED_WD[4]
load net PeripheralConnector_LED_WD[5] -attr @rip LED_WD[5] -pin LedDriver WD[5] -pin PeripheralConnector LED_WD[5]
load net PeripheralConnector_LED_WD[6] -attr @rip LED_WD[6] -pin LedDriver WD[6] -pin PeripheralConnector LED_WD[6]
load net PeripheralConnector_LED_WD[7] -attr @rip LED_WD[7] -pin LedDriver WD[7] -pin PeripheralConnector LED_WD[7]
load net PeripheralConnector_LED_WD[8] -attr @rip LED_WD[8] -pin LedDriver WD[8] -pin PeripheralConnector LED_WD[8]
load net PeripheralConnector_LED_WD[9] -attr @rip LED_WD[9] -pin LedDriver WD[9] -pin PeripheralConnector LED_WD[9]
load net PeripheralConnector_LED_WE -pin LedDriver WE -pin PeripheralConnector LED_WE
netloc PeripheralConnector_LED_WE 1 4 2 N 690 NJ
load net PeripheralConnector_SEG_WD[0] -attr @rip SEG_WD[0] -pin PeripheralConnector SEG_WD[0] -pin SegmentDriver WD[0]
load net PeripheralConnector_SEG_WD[10] -attr @rip SEG_WD[10] -pin PeripheralConnector SEG_WD[10] -pin SegmentDriver WD[10]
load net PeripheralConnector_SEG_WD[11] -attr @rip SEG_WD[11] -pin PeripheralConnector SEG_WD[11] -pin SegmentDriver WD[11]
load net PeripheralConnector_SEG_WD[12] -attr @rip SEG_WD[12] -pin PeripheralConnector SEG_WD[12] -pin SegmentDriver WD[12]
load net PeripheralConnector_SEG_WD[13] -attr @rip SEG_WD[13] -pin PeripheralConnector SEG_WD[13] -pin SegmentDriver WD[13]
load net PeripheralConnector_SEG_WD[14] -attr @rip SEG_WD[14] -pin PeripheralConnector SEG_WD[14] -pin SegmentDriver WD[14]
load net PeripheralConnector_SEG_WD[15] -attr @rip SEG_WD[15] -pin PeripheralConnector SEG_WD[15] -pin SegmentDriver WD[15]
load net PeripheralConnector_SEG_WD[16] -attr @rip SEG_WD[16] -pin PeripheralConnector SEG_WD[16] -pin SegmentDriver WD[16]
load net PeripheralConnector_SEG_WD[17] -attr @rip SEG_WD[17] -pin PeripheralConnector SEG_WD[17] -pin SegmentDriver WD[17]
load net PeripheralConnector_SEG_WD[18] -attr @rip SEG_WD[18] -pin PeripheralConnector SEG_WD[18] -pin SegmentDriver WD[18]
load net PeripheralConnector_SEG_WD[19] -attr @rip SEG_WD[19] -pin PeripheralConnector SEG_WD[19] -pin SegmentDriver WD[19]
load net PeripheralConnector_SEG_WD[1] -attr @rip SEG_WD[1] -pin PeripheralConnector SEG_WD[1] -pin SegmentDriver WD[1]
load net PeripheralConnector_SEG_WD[20] -attr @rip SEG_WD[20] -pin PeripheralConnector SEG_WD[20] -pin SegmentDriver WD[20]
load net PeripheralConnector_SEG_WD[21] -attr @rip SEG_WD[21] -pin PeripheralConnector SEG_WD[21] -pin SegmentDriver WD[21]
load net PeripheralConnector_SEG_WD[22] -attr @rip SEG_WD[22] -pin PeripheralConnector SEG_WD[22] -pin SegmentDriver WD[22]
load net PeripheralConnector_SEG_WD[23] -attr @rip SEG_WD[23] -pin PeripheralConnector SEG_WD[23] -pin SegmentDriver WD[23]
load net PeripheralConnector_SEG_WD[24] -attr @rip SEG_WD[24] -pin PeripheralConnector SEG_WD[24] -pin SegmentDriver WD[24]
load net PeripheralConnector_SEG_WD[25] -attr @rip SEG_WD[25] -pin PeripheralConnector SEG_WD[25] -pin SegmentDriver WD[25]
load net PeripheralConnector_SEG_WD[26] -attr @rip SEG_WD[26] -pin PeripheralConnector SEG_WD[26] -pin SegmentDriver WD[26]
load net PeripheralConnector_SEG_WD[27] -attr @rip SEG_WD[27] -pin PeripheralConnector SEG_WD[27] -pin SegmentDriver WD[27]
load net PeripheralConnector_SEG_WD[28] -attr @rip SEG_WD[28] -pin PeripheralConnector SEG_WD[28] -pin SegmentDriver WD[28]
load net PeripheralConnector_SEG_WD[29] -attr @rip SEG_WD[29] -pin PeripheralConnector SEG_WD[29] -pin SegmentDriver WD[29]
load net PeripheralConnector_SEG_WD[2] -attr @rip SEG_WD[2] -pin PeripheralConnector SEG_WD[2] -pin SegmentDriver WD[2]
load net PeripheralConnector_SEG_WD[30] -attr @rip SEG_WD[30] -pin PeripheralConnector SEG_WD[30] -pin SegmentDriver WD[30]
load net PeripheralConnector_SEG_WD[31] -attr @rip SEG_WD[31] -pin PeripheralConnector SEG_WD[31] -pin SegmentDriver WD[31]
load net PeripheralConnector_SEG_WD[3] -attr @rip SEG_WD[3] -pin PeripheralConnector SEG_WD[3] -pin SegmentDriver WD[3]
load net PeripheralConnector_SEG_WD[4] -attr @rip SEG_WD[4] -pin PeripheralConnector SEG_WD[4] -pin SegmentDriver WD[4]
load net PeripheralConnector_SEG_WD[5] -attr @rip SEG_WD[5] -pin PeripheralConnector SEG_WD[5] -pin SegmentDriver WD[5]
load net PeripheralConnector_SEG_WD[6] -attr @rip SEG_WD[6] -pin PeripheralConnector SEG_WD[6] -pin SegmentDriver WD[6]
load net PeripheralConnector_SEG_WD[7] -attr @rip SEG_WD[7] -pin PeripheralConnector SEG_WD[7] -pin SegmentDriver WD[7]
load net PeripheralConnector_SEG_WD[8] -attr @rip SEG_WD[8] -pin PeripheralConnector SEG_WD[8] -pin SegmentDriver WD[8]
load net PeripheralConnector_SEG_WD[9] -attr @rip SEG_WD[9] -pin PeripheralConnector SEG_WD[9] -pin SegmentDriver WD[9]
load net PeripheralConnector_SEG_WE -pin PeripheralConnector SEG_WE -pin SegmentDriver WE
netloc PeripheralConnector_SEG_WE 1 4 1 12260 750n
load net PeripheralConnector_SW_RD[0] -attr @rip RD[0] -pin PeripheralConnector SW_RD[0] -pin SWDriver RD[0]
load net PeripheralConnector_SW_RD[10] -attr @rip RD[10] -pin PeripheralConnector SW_RD[10] -pin SWDriver RD[10]
load net PeripheralConnector_SW_RD[11] -attr @rip RD[11] -pin PeripheralConnector SW_RD[11] -pin SWDriver RD[11]
load net PeripheralConnector_SW_RD[12] -attr @rip RD[12] -pin PeripheralConnector SW_RD[12] -pin SWDriver RD[12]
load net PeripheralConnector_SW_RD[13] -attr @rip RD[13] -pin PeripheralConnector SW_RD[13] -pin SWDriver RD[13]
load net PeripheralConnector_SW_RD[14] -attr @rip RD[14] -pin PeripheralConnector SW_RD[14] -pin SWDriver RD[14]
load net PeripheralConnector_SW_RD[15] -attr @rip RD[15] -pin PeripheralConnector SW_RD[15] -pin SWDriver RD[15]
load net PeripheralConnector_SW_RD[16] -attr @rip RD[16] -pin PeripheralConnector SW_RD[16] -pin SWDriver RD[16]
load net PeripheralConnector_SW_RD[17] -attr @rip RD[17] -pin PeripheralConnector SW_RD[17] -pin SWDriver RD[17]
load net PeripheralConnector_SW_RD[18] -attr @rip RD[18] -pin PeripheralConnector SW_RD[18] -pin SWDriver RD[18]
load net PeripheralConnector_SW_RD[19] -attr @rip RD[19] -pin PeripheralConnector SW_RD[19] -pin SWDriver RD[19]
load net PeripheralConnector_SW_RD[1] -attr @rip RD[1] -pin PeripheralConnector SW_RD[1] -pin SWDriver RD[1]
load net PeripheralConnector_SW_RD[20] -attr @rip RD[20] -pin PeripheralConnector SW_RD[20] -pin SWDriver RD[20]
load net PeripheralConnector_SW_RD[21] -attr @rip RD[21] -pin PeripheralConnector SW_RD[21] -pin SWDriver RD[21]
load net PeripheralConnector_SW_RD[22] -attr @rip RD[22] -pin PeripheralConnector SW_RD[22] -pin SWDriver RD[22]
load net PeripheralConnector_SW_RD[23] -attr @rip RD[23] -pin PeripheralConnector SW_RD[23] -pin SWDriver RD[23]
load net PeripheralConnector_SW_RD[24] -attr @rip RD[24] -pin PeripheralConnector SW_RD[24] -pin SWDriver RD[24]
load net PeripheralConnector_SW_RD[25] -attr @rip RD[25] -pin PeripheralConnector SW_RD[25] -pin SWDriver RD[25]
load net PeripheralConnector_SW_RD[26] -attr @rip RD[26] -pin PeripheralConnector SW_RD[26] -pin SWDriver RD[26]
load net PeripheralConnector_SW_RD[27] -attr @rip RD[27] -pin PeripheralConnector SW_RD[27] -pin SWDriver RD[27]
load net PeripheralConnector_SW_RD[28] -attr @rip RD[28] -pin PeripheralConnector SW_RD[28] -pin SWDriver RD[28]
load net PeripheralConnector_SW_RD[29] -attr @rip RD[29] -pin PeripheralConnector SW_RD[29] -pin SWDriver RD[29]
load net PeripheralConnector_SW_RD[2] -attr @rip RD[2] -pin PeripheralConnector SW_RD[2] -pin SWDriver RD[2]
load net PeripheralConnector_SW_RD[30] -attr @rip RD[30] -pin PeripheralConnector SW_RD[30] -pin SWDriver RD[30]
load net PeripheralConnector_SW_RD[31] -attr @rip RD[31] -pin PeripheralConnector SW_RD[31] -pin SWDriver RD[31]
load net PeripheralConnector_SW_RD[3] -attr @rip RD[3] -pin PeripheralConnector SW_RD[3] -pin SWDriver RD[3]
load net PeripheralConnector_SW_RD[4] -attr @rip RD[4] -pin PeripheralConnector SW_RD[4] -pin SWDriver RD[4]
load net PeripheralConnector_SW_RD[5] -attr @rip RD[5] -pin PeripheralConnector SW_RD[5] -pin SWDriver RD[5]
load net PeripheralConnector_SW_RD[6] -attr @rip RD[6] -pin PeripheralConnector SW_RD[6] -pin SWDriver RD[6]
load net PeripheralConnector_SW_RD[7] -attr @rip RD[7] -pin PeripheralConnector SW_RD[7] -pin SWDriver RD[7]
load net PeripheralConnector_SW_RD[8] -attr @rip RD[8] -pin PeripheralConnector SW_RD[8] -pin SWDriver RD[8]
load net PeripheralConnector_SW_RD[9] -attr @rip RD[9] -pin PeripheralConnector SW_RD[9] -pin SWDriver RD[9]
load net Reset -pin ARMcore Reset -pin Cache Reset -pin LedDriver Reset -port Reset -pin SegmentDriver Reset
netloc Reset 1 0 6 NJ 310 460 570 880 2688 11950J 810 12240 650 NJ
load net SEG[0] -attr @rip SEG[0] -pin Segment data[0] -pin SegmentDriver SEG[0]
load net SEG[10] -attr @rip SEG[10] -pin Segment data[10] -pin SegmentDriver SEG[10]
load net SEG[11] -attr @rip SEG[11] -pin Segment data[11] -pin SegmentDriver SEG[11]
load net SEG[12] -attr @rip SEG[12] -pin Segment data[12] -pin SegmentDriver SEG[12]
load net SEG[13] -attr @rip SEG[13] -pin Segment data[13] -pin SegmentDriver SEG[13]
load net SEG[14] -attr @rip SEG[14] -pin Segment data[14] -pin SegmentDriver SEG[14]
load net SEG[15] -attr @rip SEG[15] -pin Segment data[15] -pin SegmentDriver SEG[15]
load net SEG[16] -attr @rip SEG[16] -pin Segment data[16] -pin SegmentDriver SEG[16]
load net SEG[17] -attr @rip SEG[17] -pin Segment data[17] -pin SegmentDriver SEG[17]
load net SEG[18] -attr @rip SEG[18] -pin Segment data[18] -pin SegmentDriver SEG[18]
load net SEG[19] -attr @rip SEG[19] -pin Segment data[19] -pin SegmentDriver SEG[19]
load net SEG[1] -attr @rip SEG[1] -pin Segment data[1] -pin SegmentDriver SEG[1]
load net SEG[20] -attr @rip SEG[20] -pin Segment data[20] -pin SegmentDriver SEG[20]
load net SEG[21] -attr @rip SEG[21] -pin Segment data[21] -pin SegmentDriver SEG[21]
load net SEG[22] -attr @rip SEG[22] -pin Segment data[22] -pin SegmentDriver SEG[22]
load net SEG[23] -attr @rip SEG[23] -pin Segment data[23] -pin SegmentDriver SEG[23]
load net SEG[24] -attr @rip SEG[24] -pin Segment data[24] -pin SegmentDriver SEG[24]
load net SEG[25] -attr @rip SEG[25] -pin Segment data[25] -pin SegmentDriver SEG[25]
load net SEG[26] -attr @rip SEG[26] -pin Segment data[26] -pin SegmentDriver SEG[26]
load net SEG[27] -attr @rip SEG[27] -pin Segment data[27] -pin SegmentDriver SEG[27]
load net SEG[28] -attr @rip SEG[28] -pin Segment data[28] -pin SegmentDriver SEG[28]
load net SEG[29] -attr @rip SEG[29] -pin Segment data[29] -pin SegmentDriver SEG[29]
load net SEG[2] -attr @rip SEG[2] -pin Segment data[2] -pin SegmentDriver SEG[2]
load net SEG[30] -attr @rip SEG[30] -pin Segment data[30] -pin SegmentDriver SEG[30]
load net SEG[31] -attr @rip SEG[31] -pin Segment data[31] -pin SegmentDriver SEG[31]
load net SEG[3] -attr @rip SEG[3] -pin Segment data[3] -pin SegmentDriver SEG[3]
load net SEG[4] -attr @rip SEG[4] -pin Segment data[4] -pin SegmentDriver SEG[4]
load net SEG[5] -attr @rip SEG[5] -pin Segment data[5] -pin SegmentDriver SEG[5]
load net SEG[6] -attr @rip SEG[6] -pin Segment data[6] -pin SegmentDriver SEG[6]
load net SEG[7] -attr @rip SEG[7] -pin Segment data[7] -pin SegmentDriver SEG[7]
load net SEG[8] -attr @rip SEG[8] -pin Segment data[8] -pin SegmentDriver SEG[8]
load net SEG[9] -attr @rip SEG[9] -pin Segment data[9] -pin SegmentDriver SEG[9]
load net SW[0] -attr @rip SW[0] -port SW[0] -pin SWDriver SW[0]
load net SW[10] -attr @rip SW[10] -port SW[10] -pin SWDriver SW[10]
load net SW[11] -attr @rip SW[11] -port SW[11] -pin SWDriver SW[11]
load net SW[12] -attr @rip SW[12] -port SW[12] -pin SWDriver SW[12]
load net SW[13] -attr @rip SW[13] -port SW[13] -pin SWDriver SW[13]
load net SW[14] -attr @rip SW[14] -port SW[14] -pin SWDriver SW[14]
load net SW[15] -attr @rip SW[15] -port SW[15] -pin SWDriver SW[15]
load net SW[1] -attr @rip SW[1] -port SW[1] -pin SWDriver SW[1]
load net SW[2] -attr @rip SW[2] -port SW[2] -pin SWDriver SW[2]
load net SW[3] -attr @rip SW[3] -port SW[3] -pin SWDriver SW[3]
load net SW[4] -attr @rip SW[4] -port SW[4] -pin SWDriver SW[4]
load net SW[5] -attr @rip SW[5] -port SW[5] -pin SWDriver SW[5]
load net SW[6] -attr @rip SW[6] -port SW[6] -pin SWDriver SW[6]
load net SW[7] -attr @rip SW[7] -port SW[7] -pin SWDriver SW[7]
load net SW[8] -attr @rip SW[8] -port SW[8] -pin SWDriver SW[8]
load net SW[9] -attr @rip SW[9] -port SW[9] -pin SWDriver SW[9]
load net SevenSegAn[0] -attr @rip anode[0] -pin Segment anode[0] -port SevenSegAn[0]
load net SevenSegAn[1] -attr @rip anode[1] -pin Segment anode[1] -port SevenSegAn[1]
load net SevenSegAn[2] -attr @rip anode[2] -pin Segment anode[2] -port SevenSegAn[2]
load net SevenSegAn[3] -attr @rip anode[3] -pin Segment anode[3] -port SevenSegAn[3]
load net SevenSegAn[4] -attr @rip anode[4] -pin Segment anode[4] -port SevenSegAn[4]
load net SevenSegAn[5] -attr @rip anode[5] -pin Segment anode[5] -port SevenSegAn[5]
load net SevenSegAn[6] -attr @rip anode[6] -pin Segment anode[6] -port SevenSegAn[6]
load net SevenSegAn[7] -attr @rip anode[7] -pin Segment anode[7] -port SevenSegAn[7]
load net SevenSegCat[0] -attr @rip cathode[0] -pin Segment cathode[0] -port SevenSegCat[0]
load net SevenSegCat[1] -attr @rip cathode[1] -pin Segment cathode[1] -port SevenSegCat[1]
load net SevenSegCat[2] -attr @rip cathode[2] -pin Segment cathode[2] -port SevenSegCat[2]
load net SevenSegCat[3] -attr @rip cathode[3] -pin Segment cathode[3] -port SevenSegCat[3]
load net SevenSegCat[4] -attr @rip cathode[4] -pin Segment cathode[4] -port SevenSegCat[4]
load net SevenSegCat[5] -attr @rip cathode[5] -pin Segment cathode[5] -port SevenSegCat[5]
load net SevenSegCat[6] -attr @rip cathode[6] -pin Segment cathode[6] -port SevenSegCat[6]
load net ARMcore|<const1> -power -attr @name <const1> -pin ARMcore|RegisterFile_A10_i I0[3] -pin ARMcore|RegisterFile_A10_i I0[2] -pin ARMcore|RegisterFile_A10_i I0[1] -pin ARMcore|RegisterFile_A10_i I0[0]
load net ARMcore|ALU_SrcA[0] -attr @rip O[0] -attr @name ALU_SrcA[0] -pin ARMcore|ALU SrcA[0] -pin ARMcore|FPU Operand1[0] -pin ARMcore|MCycle Operand1[0] -pin ARMcore|SA_i O[0]
load net ARMcore|ALU_SrcA[10] -attr @rip O[10] -attr @name ALU_SrcA[10] -pin ARMcore|ALU SrcA[10] -pin ARMcore|FPU Operand1[10] -pin ARMcore|MCycle Operand1[10] -pin ARMcore|SA_i O[10]
load net ARMcore|ALU_SrcA[11] -attr @rip O[11] -attr @name ALU_SrcA[11] -pin ARMcore|ALU SrcA[11] -pin ARMcore|FPU Operand1[11] -pin ARMcore|MCycle Operand1[11] -pin ARMcore|SA_i O[11]
load net ARMcore|ALU_SrcA[12] -attr @rip O[12] -attr @name ALU_SrcA[12] -pin ARMcore|ALU SrcA[12] -pin ARMcore|FPU Operand1[12] -pin ARMcore|MCycle Operand1[12] -pin ARMcore|SA_i O[12]
load net ARMcore|ALU_SrcA[13] -attr @rip O[13] -attr @name ALU_SrcA[13] -pin ARMcore|ALU SrcA[13] -pin ARMcore|FPU Operand1[13] -pin ARMcore|MCycle Operand1[13] -pin ARMcore|SA_i O[13]
load net ARMcore|ALU_SrcA[14] -attr @rip O[14] -attr @name ALU_SrcA[14] -pin ARMcore|ALU SrcA[14] -pin ARMcore|FPU Operand1[14] -pin ARMcore|MCycle Operand1[14] -pin ARMcore|SA_i O[14]
load net ARMcore|ALU_SrcA[15] -attr @rip O[15] -attr @name ALU_SrcA[15] -pin ARMcore|ALU SrcA[15] -pin ARMcore|FPU Operand1[15] -pin ARMcore|MCycle Operand1[15] -pin ARMcore|SA_i O[15]
load net ARMcore|ALU_SrcA[16] -attr @rip O[16] -attr @name ALU_SrcA[16] -pin ARMcore|ALU SrcA[16] -pin ARMcore|FPU Operand1[16] -pin ARMcore|MCycle Operand1[16] -pin ARMcore|SA_i O[16]
load net ARMcore|ALU_SrcA[17] -attr @rip O[17] -attr @name ALU_SrcA[17] -pin ARMcore|ALU SrcA[17] -pin ARMcore|FPU Operand1[17] -pin ARMcore|MCycle Operand1[17] -pin ARMcore|SA_i O[17]
load net ARMcore|ALU_SrcA[18] -attr @rip O[18] -attr @name ALU_SrcA[18] -pin ARMcore|ALU SrcA[18] -pin ARMcore|FPU Operand1[18] -pin ARMcore|MCycle Operand1[18] -pin ARMcore|SA_i O[18]
load net ARMcore|ALU_SrcA[19] -attr @rip O[19] -attr @name ALU_SrcA[19] -pin ARMcore|ALU SrcA[19] -pin ARMcore|FPU Operand1[19] -pin ARMcore|MCycle Operand1[19] -pin ARMcore|SA_i O[19]
load net ARMcore|ALU_SrcA[1] -attr @rip O[1] -attr @name ALU_SrcA[1] -pin ARMcore|ALU SrcA[1] -pin ARMcore|FPU Operand1[1] -pin ARMcore|MCycle Operand1[1] -pin ARMcore|SA_i O[1]
load net ARMcore|ALU_SrcA[20] -attr @rip O[20] -attr @name ALU_SrcA[20] -pin ARMcore|ALU SrcA[20] -pin ARMcore|FPU Operand1[20] -pin ARMcore|MCycle Operand1[20] -pin ARMcore|SA_i O[20]
load net ARMcore|ALU_SrcA[21] -attr @rip O[21] -attr @name ALU_SrcA[21] -pin ARMcore|ALU SrcA[21] -pin ARMcore|FPU Operand1[21] -pin ARMcore|MCycle Operand1[21] -pin ARMcore|SA_i O[21]
load net ARMcore|ALU_SrcA[22] -attr @rip O[22] -attr @name ALU_SrcA[22] -pin ARMcore|ALU SrcA[22] -pin ARMcore|FPU Operand1[22] -pin ARMcore|MCycle Operand1[22] -pin ARMcore|SA_i O[22]
load net ARMcore|ALU_SrcA[23] -attr @rip O[23] -attr @name ALU_SrcA[23] -pin ARMcore|ALU SrcA[23] -pin ARMcore|FPU Operand1[23] -pin ARMcore|MCycle Operand1[23] -pin ARMcore|SA_i O[23]
load net ARMcore|ALU_SrcA[24] -attr @rip O[24] -attr @name ALU_SrcA[24] -pin ARMcore|ALU SrcA[24] -pin ARMcore|FPU Operand1[24] -pin ARMcore|MCycle Operand1[24] -pin ARMcore|SA_i O[24]
load net ARMcore|ALU_SrcA[25] -attr @rip O[25] -attr @name ALU_SrcA[25] -pin ARMcore|ALU SrcA[25] -pin ARMcore|FPU Operand1[25] -pin ARMcore|MCycle Operand1[25] -pin ARMcore|SA_i O[25]
load net ARMcore|ALU_SrcA[26] -attr @rip O[26] -attr @name ALU_SrcA[26] -pin ARMcore|ALU SrcA[26] -pin ARMcore|FPU Operand1[26] -pin ARMcore|MCycle Operand1[26] -pin ARMcore|SA_i O[26]
load net ARMcore|ALU_SrcA[27] -attr @rip O[27] -attr @name ALU_SrcA[27] -pin ARMcore|ALU SrcA[27] -pin ARMcore|FPU Operand1[27] -pin ARMcore|MCycle Operand1[27] -pin ARMcore|SA_i O[27]
load net ARMcore|ALU_SrcA[28] -attr @rip O[28] -attr @name ALU_SrcA[28] -pin ARMcore|ALU SrcA[28] -pin ARMcore|FPU Operand1[28] -pin ARMcore|MCycle Operand1[28] -pin ARMcore|SA_i O[28]
load net ARMcore|ALU_SrcA[29] -attr @rip O[29] -attr @name ALU_SrcA[29] -pin ARMcore|ALU SrcA[29] -pin ARMcore|FPU Operand1[29] -pin ARMcore|MCycle Operand1[29] -pin ARMcore|SA_i O[29]
load net ARMcore|ALU_SrcA[2] -attr @rip O[2] -attr @name ALU_SrcA[2] -pin ARMcore|ALU SrcA[2] -pin ARMcore|FPU Operand1[2] -pin ARMcore|MCycle Operand1[2] -pin ARMcore|SA_i O[2]
load net ARMcore|ALU_SrcA[30] -attr @rip O[30] -attr @name ALU_SrcA[30] -pin ARMcore|ALU SrcA[30] -pin ARMcore|FPU Operand1[30] -pin ARMcore|MCycle Operand1[30] -pin ARMcore|SA_i O[30]
load net ARMcore|ALU_SrcA[31] -attr @rip O[31] -attr @name ALU_SrcA[31] -pin ARMcore|ALU SrcA[31] -pin ARMcore|FPU Operand1[31] -pin ARMcore|MCycle Operand1[31] -pin ARMcore|SA_i O[31]
load net ARMcore|ALU_SrcA[3] -attr @rip O[3] -attr @name ALU_SrcA[3] -pin ARMcore|ALU SrcA[3] -pin ARMcore|FPU Operand1[3] -pin ARMcore|MCycle Operand1[3] -pin ARMcore|SA_i O[3]
load net ARMcore|ALU_SrcA[4] -attr @rip O[4] -attr @name ALU_SrcA[4] -pin ARMcore|ALU SrcA[4] -pin ARMcore|FPU Operand1[4] -pin ARMcore|MCycle Operand1[4] -pin ARMcore|SA_i O[4]
load net ARMcore|ALU_SrcA[5] -attr @rip O[5] -attr @name ALU_SrcA[5] -pin ARMcore|ALU SrcA[5] -pin ARMcore|FPU Operand1[5] -pin ARMcore|MCycle Operand1[5] -pin ARMcore|SA_i O[5]
load net ARMcore|ALU_SrcA[6] -attr @rip O[6] -attr @name ALU_SrcA[6] -pin ARMcore|ALU SrcA[6] -pin ARMcore|FPU Operand1[6] -pin ARMcore|MCycle Operand1[6] -pin ARMcore|SA_i O[6]
load net ARMcore|ALU_SrcA[7] -attr @rip O[7] -attr @name ALU_SrcA[7] -pin ARMcore|ALU SrcA[7] -pin ARMcore|FPU Operand1[7] -pin ARMcore|MCycle Operand1[7] -pin ARMcore|SA_i O[7]
load net ARMcore|ALU_SrcA[8] -attr @rip O[8] -attr @name ALU_SrcA[8] -pin ARMcore|ALU SrcA[8] -pin ARMcore|FPU Operand1[8] -pin ARMcore|MCycle Operand1[8] -pin ARMcore|SA_i O[8]
load net ARMcore|ALU_SrcA[9] -attr @rip O[9] -attr @name ALU_SrcA[9] -pin ARMcore|ALU SrcA[9] -pin ARMcore|FPU Operand1[9] -pin ARMcore|MCycle Operand1[9] -pin ARMcore|SA_i O[9]
load net ARMcore|ALU_SrcB[0] -attr @rip O[0] -attr @name ALU_SrcB[0] -pin ARMcore|ALU SrcB[0] -pin ARMcore|ALU_SrcB_i O[0]
load net ARMcore|ALU_SrcB[10] -attr @rip O[10] -attr @name ALU_SrcB[10] -pin ARMcore|ALU SrcB[10] -pin ARMcore|ALU_SrcB_i O[10]
load net ARMcore|ALU_SrcB[11] -attr @rip O[11] -attr @name ALU_SrcB[11] -pin ARMcore|ALU SrcB[11] -pin ARMcore|ALU_SrcB_i O[11]
load net ARMcore|ALU_SrcB[12] -attr @rip O[12] -attr @name ALU_SrcB[12] -pin ARMcore|ALU SrcB[12] -pin ARMcore|ALU_SrcB_i O[12]
load net ARMcore|ALU_SrcB[13] -attr @rip O[13] -attr @name ALU_SrcB[13] -pin ARMcore|ALU SrcB[13] -pin ARMcore|ALU_SrcB_i O[13]
load net ARMcore|ALU_SrcB[14] -attr @rip O[14] -attr @name ALU_SrcB[14] -pin ARMcore|ALU SrcB[14] -pin ARMcore|ALU_SrcB_i O[14]
load net ARMcore|ALU_SrcB[15] -attr @rip O[15] -attr @name ALU_SrcB[15] -pin ARMcore|ALU SrcB[15] -pin ARMcore|ALU_SrcB_i O[15]
load net ARMcore|ALU_SrcB[16] -attr @rip O[16] -attr @name ALU_SrcB[16] -pin ARMcore|ALU SrcB[16] -pin ARMcore|ALU_SrcB_i O[16]
load net ARMcore|ALU_SrcB[17] -attr @rip O[17] -attr @name ALU_SrcB[17] -pin ARMcore|ALU SrcB[17] -pin ARMcore|ALU_SrcB_i O[17]
load net ARMcore|ALU_SrcB[18] -attr @rip O[18] -attr @name ALU_SrcB[18] -pin ARMcore|ALU SrcB[18] -pin ARMcore|ALU_SrcB_i O[18]
load net ARMcore|ALU_SrcB[19] -attr @rip O[19] -attr @name ALU_SrcB[19] -pin ARMcore|ALU SrcB[19] -pin ARMcore|ALU_SrcB_i O[19]
load net ARMcore|ALU_SrcB[1] -attr @rip O[1] -attr @name ALU_SrcB[1] -pin ARMcore|ALU SrcB[1] -pin ARMcore|ALU_SrcB_i O[1]
load net ARMcore|ALU_SrcB[20] -attr @rip O[20] -attr @name ALU_SrcB[20] -pin ARMcore|ALU SrcB[20] -pin ARMcore|ALU_SrcB_i O[20]
load net ARMcore|ALU_SrcB[21] -attr @rip O[21] -attr @name ALU_SrcB[21] -pin ARMcore|ALU SrcB[21] -pin ARMcore|ALU_SrcB_i O[21]
load net ARMcore|ALU_SrcB[22] -attr @rip O[22] -attr @name ALU_SrcB[22] -pin ARMcore|ALU SrcB[22] -pin ARMcore|ALU_SrcB_i O[22]
load net ARMcore|ALU_SrcB[23] -attr @rip O[23] -attr @name ALU_SrcB[23] -pin ARMcore|ALU SrcB[23] -pin ARMcore|ALU_SrcB_i O[23]
load net ARMcore|ALU_SrcB[24] -attr @rip O[24] -attr @name ALU_SrcB[24] -pin ARMcore|ALU SrcB[24] -pin ARMcore|ALU_SrcB_i O[24]
load net ARMcore|ALU_SrcB[25] -attr @rip O[25] -attr @name ALU_SrcB[25] -pin ARMcore|ALU SrcB[25] -pin ARMcore|ALU_SrcB_i O[25]
load net ARMcore|ALU_SrcB[26] -attr @rip O[26] -attr @name ALU_SrcB[26] -pin ARMcore|ALU SrcB[26] -pin ARMcore|ALU_SrcB_i O[26]
load net ARMcore|ALU_SrcB[27] -attr @rip O[27] -attr @name ALU_SrcB[27] -pin ARMcore|ALU SrcB[27] -pin ARMcore|ALU_SrcB_i O[27]
load net ARMcore|ALU_SrcB[28] -attr @rip O[28] -attr @name ALU_SrcB[28] -pin ARMcore|ALU SrcB[28] -pin ARMcore|ALU_SrcB_i O[28]
load net ARMcore|ALU_SrcB[29] -attr @rip O[29] -attr @name ALU_SrcB[29] -pin ARMcore|ALU SrcB[29] -pin ARMcore|ALU_SrcB_i O[29]
load net ARMcore|ALU_SrcB[2] -attr @rip O[2] -attr @name ALU_SrcB[2] -pin ARMcore|ALU SrcB[2] -pin ARMcore|ALU_SrcB_i O[2]
load net ARMcore|ALU_SrcB[30] -attr @rip O[30] -attr @name ALU_SrcB[30] -pin ARMcore|ALU SrcB[30] -pin ARMcore|ALU_SrcB_i O[30]
load net ARMcore|ALU_SrcB[31] -attr @rip O[31] -attr @name ALU_SrcB[31] -pin ARMcore|ALU SrcB[31] -pin ARMcore|ALU_SrcB_i O[31]
load net ARMcore|ALU_SrcB[3] -attr @rip O[3] -attr @name ALU_SrcB[3] -pin ARMcore|ALU SrcB[3] -pin ARMcore|ALU_SrcB_i O[3]
load net ARMcore|ALU_SrcB[4] -attr @rip O[4] -attr @name ALU_SrcB[4] -pin ARMcore|ALU SrcB[4] -pin ARMcore|ALU_SrcB_i O[4]
load net ARMcore|ALU_SrcB[5] -attr @rip O[5] -attr @name ALU_SrcB[5] -pin ARMcore|ALU SrcB[5] -pin ARMcore|ALU_SrcB_i O[5]
load net ARMcore|ALU_SrcB[6] -attr @rip O[6] -attr @name ALU_SrcB[6] -pin ARMcore|ALU SrcB[6] -pin ARMcore|ALU_SrcB_i O[6]
load net ARMcore|ALU_SrcB[7] -attr @rip O[7] -attr @name ALU_SrcB[7] -pin ARMcore|ALU SrcB[7] -pin ARMcore|ALU_SrcB_i O[7]
load net ARMcore|ALU_SrcB[8] -attr @rip O[8] -attr @name ALU_SrcB[8] -pin ARMcore|ALU SrcB[8] -pin ARMcore|ALU_SrcB_i O[8]
load net ARMcore|ALU_SrcB[9] -attr @rip O[9] -attr @name ALU_SrcB[9] -pin ARMcore|ALU SrcB[9] -pin ARMcore|ALU_SrcB_i O[9]
load net ARMcore|CLK -attr @name CLK -hierPin ARMcore CLK -pin ARMcore|CLK_n0_i I0 -pin ARMcore|CondUnit CLK -pin ARMcore|DEReg CLK -pin ARMcore|EMReg CLK -pin ARMcore|FDReg CLK -pin ARMcore|FPU CLK -pin ARMcore|MCycle CLK -pin ARMcore|MWReg CLK -pin ARMcore|ProgramCounter CLK
netloc ARMcore|CLK 1 0 20 NJ 1828 1480 1988 NJ 1988 2050 2208 2470 1868 NJ 1868 3500 2008 NJ 2008 NJ 2008 NJ 2008 NJ 2008 6320 1848 6930 1148 7520J 1168 8200J 1248 9020J 1378 NJ 1378 10090 1658 NJ 1658 11090
load net ARMcore|CLK_n0 -attr @name CLK_n0 -pin ARMcore|CLK_n0_i O -pin ARMcore|RegisterFile CLK_n
netloc ARMcore|CLK_n0 1 5 1 NJ 2048
load net ARMcore|Cache_Addr[0] -attr @rip m_addr[0] -attr @name Cache_Addr[0] -hierPin ARMcore Cache_Addr[0] -pin ARMcore|MemOrIO m_addr[0]
load net ARMcore|Cache_Addr[10] -attr @rip m_addr[10] -attr @name Cache_Addr[10] -hierPin ARMcore Cache_Addr[10] -pin ARMcore|MemOrIO m_addr[10]
load net ARMcore|Cache_Addr[11] -attr @rip m_addr[11] -attr @name Cache_Addr[11] -hierPin ARMcore Cache_Addr[11] -pin ARMcore|MemOrIO m_addr[11]
load net ARMcore|Cache_Addr[12] -attr @rip m_addr[12] -attr @name Cache_Addr[12] -hierPin ARMcore Cache_Addr[12] -pin ARMcore|MemOrIO m_addr[12]
load net ARMcore|Cache_Addr[13] -attr @rip m_addr[13] -attr @name Cache_Addr[13] -hierPin ARMcore Cache_Addr[13] -pin ARMcore|MemOrIO m_addr[13]
load net ARMcore|Cache_Addr[14] -attr @rip m_addr[14] -attr @name Cache_Addr[14] -hierPin ARMcore Cache_Addr[14] -pin ARMcore|MemOrIO m_addr[14]
load net ARMcore|Cache_Addr[15] -attr @rip m_addr[15] -attr @name Cache_Addr[15] -hierPin ARMcore Cache_Addr[15] -pin ARMcore|MemOrIO m_addr[15]
load net ARMcore|Cache_Addr[16] -attr @rip m_addr[16] -attr @name Cache_Addr[16] -hierPin ARMcore Cache_Addr[16] -pin ARMcore|MemOrIO m_addr[16]
load net ARMcore|Cache_Addr[17] -attr @rip m_addr[17] -attr @name Cache_Addr[17] -hierPin ARMcore Cache_Addr[17] -pin ARMcore|MemOrIO m_addr[17]
load net ARMcore|Cache_Addr[18] -attr @rip m_addr[18] -attr @name Cache_Addr[18] -hierPin ARMcore Cache_Addr[18] -pin ARMcore|MemOrIO m_addr[18]
load net ARMcore|Cache_Addr[19] -attr @rip m_addr[19] -attr @name Cache_Addr[19] -hierPin ARMcore Cache_Addr[19] -pin ARMcore|MemOrIO m_addr[19]
load net ARMcore|Cache_Addr[1] -attr @rip m_addr[1] -attr @name Cache_Addr[1] -hierPin ARMcore Cache_Addr[1] -pin ARMcore|MemOrIO m_addr[1]
load net ARMcore|Cache_Addr[20] -attr @rip m_addr[20] -attr @name Cache_Addr[20] -hierPin ARMcore Cache_Addr[20] -pin ARMcore|MemOrIO m_addr[20]
load net ARMcore|Cache_Addr[21] -attr @rip m_addr[21] -attr @name Cache_Addr[21] -hierPin ARMcore Cache_Addr[21] -pin ARMcore|MemOrIO m_addr[21]
load net ARMcore|Cache_Addr[22] -attr @rip m_addr[22] -attr @name Cache_Addr[22] -hierPin ARMcore Cache_Addr[22] -pin ARMcore|MemOrIO m_addr[22]
load net ARMcore|Cache_Addr[23] -attr @rip m_addr[23] -attr @name Cache_Addr[23] -hierPin ARMcore Cache_Addr[23] -pin ARMcore|MemOrIO m_addr[23]
load net ARMcore|Cache_Addr[24] -attr @rip m_addr[24] -attr @name Cache_Addr[24] -hierPin ARMcore Cache_Addr[24] -pin ARMcore|MemOrIO m_addr[24]
load net ARMcore|Cache_Addr[25] -attr @rip m_addr[25] -attr @name Cache_Addr[25] -hierPin ARMcore Cache_Addr[25] -pin ARMcore|MemOrIO m_addr[25]
load net ARMcore|Cache_Addr[26] -attr @rip m_addr[26] -attr @name Cache_Addr[26] -hierPin ARMcore Cache_Addr[26] -pin ARMcore|MemOrIO m_addr[26]
load net ARMcore|Cache_Addr[27] -attr @rip m_addr[27] -attr @name Cache_Addr[27] -hierPin ARMcore Cache_Addr[27] -pin ARMcore|MemOrIO m_addr[27]
load net ARMcore|Cache_Addr[28] -attr @rip m_addr[28] -attr @name Cache_Addr[28] -hierPin ARMcore Cache_Addr[28] -pin ARMcore|MemOrIO m_addr[28]
load net ARMcore|Cache_Addr[29] -attr @rip m_addr[29] -attr @name Cache_Addr[29] -hierPin ARMcore Cache_Addr[29] -pin ARMcore|MemOrIO m_addr[29]
load net ARMcore|Cache_Addr[2] -attr @rip m_addr[2] -attr @name Cache_Addr[2] -hierPin ARMcore Cache_Addr[2] -pin ARMcore|MemOrIO m_addr[2]
load net ARMcore|Cache_Addr[30] -attr @rip m_addr[30] -attr @name Cache_Addr[30] -hierPin ARMcore Cache_Addr[30] -pin ARMcore|MemOrIO m_addr[30]
load net ARMcore|Cache_Addr[31] -attr @rip m_addr[31] -attr @name Cache_Addr[31] -hierPin ARMcore Cache_Addr[31] -pin ARMcore|MemOrIO m_addr[31]
load net ARMcore|Cache_Addr[3] -attr @rip m_addr[3] -attr @name Cache_Addr[3] -hierPin ARMcore Cache_Addr[3] -pin ARMcore|MemOrIO m_addr[3]
load net ARMcore|Cache_Addr[4] -attr @rip m_addr[4] -attr @name Cache_Addr[4] -hierPin ARMcore Cache_Addr[4] -pin ARMcore|MemOrIO m_addr[4]
load net ARMcore|Cache_Addr[5] -attr @rip m_addr[5] -attr @name Cache_Addr[5] -hierPin ARMcore Cache_Addr[5] -pin ARMcore|MemOrIO m_addr[5]
load net ARMcore|Cache_Addr[6] -attr @rip m_addr[6] -attr @name Cache_Addr[6] -hierPin ARMcore Cache_Addr[6] -pin ARMcore|MemOrIO m_addr[6]
load net ARMcore|Cache_Addr[7] -attr @rip m_addr[7] -attr @name Cache_Addr[7] -hierPin ARMcore Cache_Addr[7] -pin ARMcore|MemOrIO m_addr[7]
load net ARMcore|Cache_Addr[8] -attr @rip m_addr[8] -attr @name Cache_Addr[8] -hierPin ARMcore Cache_Addr[8] -pin ARMcore|MemOrIO m_addr[8]
load net ARMcore|Cache_Addr[9] -attr @rip m_addr[9] -attr @name Cache_Addr[9] -hierPin ARMcore Cache_Addr[9] -pin ARMcore|MemOrIO m_addr[9]
load net ARMcore|Cache_RW -attr @name Cache_RW -hierPin ARMcore Cache_RW -pin ARMcore|HazardUnit RW -pin ARMcore|MemOrIO m_we
netloc ARMcore|Cache_RW 1 15 6 9160 1238 NJ 1238 NJ 1238 NJ 1238 NJ 1238 11520
load net ARMcore|Cache_ReadData[0] -attr @rip Cache_ReadData[0] -attr @name Cache_ReadData[0] -hierPin ARMcore Cache_ReadData[0] -pin ARMcore|MemOrIO_m_rdata_i I0[0]
load net ARMcore|Cache_ReadData[10] -attr @rip Cache_ReadData[10] -attr @name Cache_ReadData[10] -hierPin ARMcore Cache_ReadData[10] -pin ARMcore|MemOrIO_m_rdata_i I0[10]
load net ARMcore|Cache_ReadData[11] -attr @rip Cache_ReadData[11] -attr @name Cache_ReadData[11] -hierPin ARMcore Cache_ReadData[11] -pin ARMcore|MemOrIO_m_rdata_i I0[11]
load net ARMcore|Cache_ReadData[12] -attr @rip Cache_ReadData[12] -attr @name Cache_ReadData[12] -hierPin ARMcore Cache_ReadData[12] -pin ARMcore|MemOrIO_m_rdata_i I0[12]
load net ARMcore|Cache_ReadData[13] -attr @rip Cache_ReadData[13] -attr @name Cache_ReadData[13] -hierPin ARMcore Cache_ReadData[13] -pin ARMcore|MemOrIO_m_rdata_i I0[13]
load net ARMcore|Cache_ReadData[14] -attr @rip Cache_ReadData[14] -attr @name Cache_ReadData[14] -hierPin ARMcore Cache_ReadData[14] -pin ARMcore|MemOrIO_m_rdata_i I0[14]
load net ARMcore|Cache_ReadData[15] -attr @rip Cache_ReadData[15] -attr @name Cache_ReadData[15] -hierPin ARMcore Cache_ReadData[15] -pin ARMcore|MemOrIO_m_rdata_i I0[15]
load net ARMcore|Cache_ReadData[16] -attr @rip Cache_ReadData[16] -attr @name Cache_ReadData[16] -hierPin ARMcore Cache_ReadData[16] -pin ARMcore|MemOrIO_m_rdata_i I0[16]
load net ARMcore|Cache_ReadData[17] -attr @rip Cache_ReadData[17] -attr @name Cache_ReadData[17] -hierPin ARMcore Cache_ReadData[17] -pin ARMcore|MemOrIO_m_rdata_i I0[17]
load net ARMcore|Cache_ReadData[18] -attr @rip Cache_ReadData[18] -attr @name Cache_ReadData[18] -hierPin ARMcore Cache_ReadData[18] -pin ARMcore|MemOrIO_m_rdata_i I0[18]
load net ARMcore|Cache_ReadData[19] -attr @rip Cache_ReadData[19] -attr @name Cache_ReadData[19] -hierPin ARMcore Cache_ReadData[19] -pin ARMcore|MemOrIO_m_rdata_i I0[19]
load net ARMcore|Cache_ReadData[1] -attr @rip Cache_ReadData[1] -attr @name Cache_ReadData[1] -hierPin ARMcore Cache_ReadData[1] -pin ARMcore|MemOrIO_m_rdata_i I0[1]
load net ARMcore|Cache_ReadData[20] -attr @rip Cache_ReadData[20] -attr @name Cache_ReadData[20] -hierPin ARMcore Cache_ReadData[20] -pin ARMcore|MemOrIO_m_rdata_i I0[20]
load net ARMcore|Cache_ReadData[21] -attr @rip Cache_ReadData[21] -attr @name Cache_ReadData[21] -hierPin ARMcore Cache_ReadData[21] -pin ARMcore|MemOrIO_m_rdata_i I0[21]
load net ARMcore|Cache_ReadData[22] -attr @rip Cache_ReadData[22] -attr @name Cache_ReadData[22] -hierPin ARMcore Cache_ReadData[22] -pin ARMcore|MemOrIO_m_rdata_i I0[22]
load net ARMcore|Cache_ReadData[23] -attr @rip Cache_ReadData[23] -attr @name Cache_ReadData[23] -hierPin ARMcore Cache_ReadData[23] -pin ARMcore|MemOrIO_m_rdata_i I0[23]
load net ARMcore|Cache_ReadData[24] -attr @rip Cache_ReadData[24] -attr @name Cache_ReadData[24] -hierPin ARMcore Cache_ReadData[24] -pin ARMcore|MemOrIO_m_rdata_i I0[24]
load net ARMcore|Cache_ReadData[25] -attr @rip Cache_ReadData[25] -attr @name Cache_ReadData[25] -hierPin ARMcore Cache_ReadData[25] -pin ARMcore|MemOrIO_m_rdata_i I0[25]
load net ARMcore|Cache_ReadData[26] -attr @rip Cache_ReadData[26] -attr @name Cache_ReadData[26] -hierPin ARMcore Cache_ReadData[26] -pin ARMcore|MemOrIO_m_rdata_i I0[26]
load net ARMcore|Cache_ReadData[27] -attr @rip Cache_ReadData[27] -attr @name Cache_ReadData[27] -hierPin ARMcore Cache_ReadData[27] -pin ARMcore|MemOrIO_m_rdata_i I0[27]
load net ARMcore|Cache_ReadData[28] -attr @rip Cache_ReadData[28] -attr @name Cache_ReadData[28] -hierPin ARMcore Cache_ReadData[28] -pin ARMcore|MemOrIO_m_rdata_i I0[28]
load net ARMcore|Cache_ReadData[29] -attr @rip Cache_ReadData[29] -attr @name Cache_ReadData[29] -hierPin ARMcore Cache_ReadData[29] -pin ARMcore|MemOrIO_m_rdata_i I0[29]
load net ARMcore|Cache_ReadData[2] -attr @rip Cache_ReadData[2] -attr @name Cache_ReadData[2] -hierPin ARMcore Cache_ReadData[2] -pin ARMcore|MemOrIO_m_rdata_i I0[2]
load net ARMcore|Cache_ReadData[30] -attr @rip Cache_ReadData[30] -attr @name Cache_ReadData[30] -hierPin ARMcore Cache_ReadData[30] -pin ARMcore|MemOrIO_m_rdata_i I0[30]
load net ARMcore|Cache_ReadData[31] -attr @rip Cache_ReadData[31] -attr @name Cache_ReadData[31] -hierPin ARMcore Cache_ReadData[31] -pin ARMcore|MemOrIO_m_rdata_i I0[31]
load net ARMcore|Cache_ReadData[3] -attr @rip Cache_ReadData[3] -attr @name Cache_ReadData[3] -hierPin ARMcore Cache_ReadData[3] -pin ARMcore|MemOrIO_m_rdata_i I0[3]
load net ARMcore|Cache_ReadData[4] -attr @rip Cache_ReadData[4] -attr @name Cache_ReadData[4] -hierPin ARMcore Cache_ReadData[4] -pin ARMcore|MemOrIO_m_rdata_i I0[4]
load net ARMcore|Cache_ReadData[5] -attr @rip Cache_ReadData[5] -attr @name Cache_ReadData[5] -hierPin ARMcore Cache_ReadData[5] -pin ARMcore|MemOrIO_m_rdata_i I0[5]
load net ARMcore|Cache_ReadData[6] -attr @rip Cache_ReadData[6] -attr @name Cache_ReadData[6] -hierPin ARMcore Cache_ReadData[6] -pin ARMcore|MemOrIO_m_rdata_i I0[6]
load net ARMcore|Cache_ReadData[7] -attr @rip Cache_ReadData[7] -attr @name Cache_ReadData[7] -hierPin ARMcore Cache_ReadData[7] -pin ARMcore|MemOrIO_m_rdata_i I0[7]
load net ARMcore|Cache_ReadData[8] -attr @rip Cache_ReadData[8] -attr @name Cache_ReadData[8] -hierPin ARMcore Cache_ReadData[8] -pin ARMcore|MemOrIO_m_rdata_i I0[8]
load net ARMcore|Cache_ReadData[9] -attr @rip Cache_ReadData[9] -attr @name Cache_ReadData[9] -hierPin ARMcore Cache_ReadData[9] -pin ARMcore|MemOrIO_m_rdata_i I0[9]
load net ARMcore|Cache_ReadReady -attr @name Cache_ReadReady -hierPin ARMcore Cache_ReadReady -pin ARMcore|HazardUnit Cache_ReadReady -pin ARMcore|MemOrIO_m_rdata_i S
netloc ARMcore|Cache_ReadReady 1 0 19 NJ 1908 NJ 1908 NJ 1908 NJ 1908 NJ 1908 NJ 1908 3420J 1958 NJ 1958 4700J 1968 NJ 1968 NJ 1968 6360J 1988 NJ 1988 7740J 1928 8060J 1948 9000 1958 NJ 1958 NJ 1958 10590J
load net ARMcore|Cache_Valid -attr @name Cache_Valid -hierPin ARMcore Cache_Valid -pin ARMcore|Cache_Valid_i O
netloc ARMcore|Cache_Valid 1 20 1 N 1508
load net ARMcore|Cache_Valid0 -attr @name Cache_Valid0 -pin ARMcore|Cache_Valid0_i O -pin ARMcore|Cache_Valid_i I1
netloc ARMcore|Cache_Valid0 1 19 1 N 1518
load net ARMcore|Cache_WriteData[0] -attr @rip m_wdata[0] -attr @name Cache_WriteData[0] -hierPin ARMcore Cache_WriteData[0] -pin ARMcore|MemOrIO m_wdata[0]
load net ARMcore|Cache_WriteData[10] -attr @rip m_wdata[10] -attr @name Cache_WriteData[10] -hierPin ARMcore Cache_WriteData[10] -pin ARMcore|MemOrIO m_wdata[10]
load net ARMcore|Cache_WriteData[11] -attr @rip m_wdata[11] -attr @name Cache_WriteData[11] -hierPin ARMcore Cache_WriteData[11] -pin ARMcore|MemOrIO m_wdata[11]
load net ARMcore|Cache_WriteData[12] -attr @rip m_wdata[12] -attr @name Cache_WriteData[12] -hierPin ARMcore Cache_WriteData[12] -pin ARMcore|MemOrIO m_wdata[12]
load net ARMcore|Cache_WriteData[13] -attr @rip m_wdata[13] -attr @name Cache_WriteData[13] -hierPin ARMcore Cache_WriteData[13] -pin ARMcore|MemOrIO m_wdata[13]
load net ARMcore|Cache_WriteData[14] -attr @rip m_wdata[14] -attr @name Cache_WriteData[14] -hierPin ARMcore Cache_WriteData[14] -pin ARMcore|MemOrIO m_wdata[14]
load net ARMcore|Cache_WriteData[15] -attr @rip m_wdata[15] -attr @name Cache_WriteData[15] -hierPin ARMcore Cache_WriteData[15] -pin ARMcore|MemOrIO m_wdata[15]
load net ARMcore|Cache_WriteData[16] -attr @rip m_wdata[16] -attr @name Cache_WriteData[16] -hierPin ARMcore Cache_WriteData[16] -pin ARMcore|MemOrIO m_wdata[16]
load net ARMcore|Cache_WriteData[17] -attr @rip m_wdata[17] -attr @name Cache_WriteData[17] -hierPin ARMcore Cache_WriteData[17] -pin ARMcore|MemOrIO m_wdata[17]
load net ARMcore|Cache_WriteData[18] -attr @rip m_wdata[18] -attr @name Cache_WriteData[18] -hierPin ARMcore Cache_WriteData[18] -pin ARMcore|MemOrIO m_wdata[18]
load net ARMcore|Cache_WriteData[19] -attr @rip m_wdata[19] -attr @name Cache_WriteData[19] -hierPin ARMcore Cache_WriteData[19] -pin ARMcore|MemOrIO m_wdata[19]
load net ARMcore|Cache_WriteData[1] -attr @rip m_wdata[1] -attr @name Cache_WriteData[1] -hierPin ARMcore Cache_WriteData[1] -pin ARMcore|MemOrIO m_wdata[1]
load net ARMcore|Cache_WriteData[20] -attr @rip m_wdata[20] -attr @name Cache_WriteData[20] -hierPin ARMcore Cache_WriteData[20] -pin ARMcore|MemOrIO m_wdata[20]
load net ARMcore|Cache_WriteData[21] -attr @rip m_wdata[21] -attr @name Cache_WriteData[21] -hierPin ARMcore Cache_WriteData[21] -pin ARMcore|MemOrIO m_wdata[21]
load net ARMcore|Cache_WriteData[22] -attr @rip m_wdata[22] -attr @name Cache_WriteData[22] -hierPin ARMcore Cache_WriteData[22] -pin ARMcore|MemOrIO m_wdata[22]
load net ARMcore|Cache_WriteData[23] -attr @rip m_wdata[23] -attr @name Cache_WriteData[23] -hierPin ARMcore Cache_WriteData[23] -pin ARMcore|MemOrIO m_wdata[23]
load net ARMcore|Cache_WriteData[24] -attr @rip m_wdata[24] -attr @name Cache_WriteData[24] -hierPin ARMcore Cache_WriteData[24] -pin ARMcore|MemOrIO m_wdata[24]
load net ARMcore|Cache_WriteData[25] -attr @rip m_wdata[25] -attr @name Cache_WriteData[25] -hierPin ARMcore Cache_WriteData[25] -pin ARMcore|MemOrIO m_wdata[25]
load net ARMcore|Cache_WriteData[26] -attr @rip m_wdata[26] -attr @name Cache_WriteData[26] -hierPin ARMcore Cache_WriteData[26] -pin ARMcore|MemOrIO m_wdata[26]
load net ARMcore|Cache_WriteData[27] -attr @rip m_wdata[27] -attr @name Cache_WriteData[27] -hierPin ARMcore Cache_WriteData[27] -pin ARMcore|MemOrIO m_wdata[27]
load net ARMcore|Cache_WriteData[28] -attr @rip m_wdata[28] -attr @name Cache_WriteData[28] -hierPin ARMcore Cache_WriteData[28] -pin ARMcore|MemOrIO m_wdata[28]
load net ARMcore|Cache_WriteData[29] -attr @rip m_wdata[29] -attr @name Cache_WriteData[29] -hierPin ARMcore Cache_WriteData[29] -pin ARMcore|MemOrIO m_wdata[29]
load net ARMcore|Cache_WriteData[2] -attr @rip m_wdata[2] -attr @name Cache_WriteData[2] -hierPin ARMcore Cache_WriteData[2] -pin ARMcore|MemOrIO m_wdata[2]
load net ARMcore|Cache_WriteData[30] -attr @rip m_wdata[30] -attr @name Cache_WriteData[30] -hierPin ARMcore Cache_WriteData[30] -pin ARMcore|MemOrIO m_wdata[30]
load net ARMcore|Cache_WriteData[31] -attr @rip m_wdata[31] -attr @name Cache_WriteData[31] -hierPin ARMcore Cache_WriteData[31] -pin ARMcore|MemOrIO m_wdata[31]
load net ARMcore|Cache_WriteData[3] -attr @rip m_wdata[3] -attr @name Cache_WriteData[3] -hierPin ARMcore Cache_WriteData[3] -pin ARMcore|MemOrIO m_wdata[3]
load net ARMcore|Cache_WriteData[4] -attr @rip m_wdata[4] -attr @name Cache_WriteData[4] -hierPin ARMcore Cache_WriteData[4] -pin ARMcore|MemOrIO m_wdata[4]
load net ARMcore|Cache_WriteData[5] -attr @rip m_wdata[5] -attr @name Cache_WriteData[5] -hierPin ARMcore Cache_WriteData[5] -pin ARMcore|MemOrIO m_wdata[5]
load net ARMcore|Cache_WriteData[6] -attr @rip m_wdata[6] -attr @name Cache_WriteData[6] -hierPin ARMcore Cache_WriteData[6] -pin ARMcore|MemOrIO m_wdata[6]
load net ARMcore|Cache_WriteData[7] -attr @rip m_wdata[7] -attr @name Cache_WriteData[7] -hierPin ARMcore Cache_WriteData[7] -pin ARMcore|MemOrIO m_wdata[7]
load net ARMcore|Cache_WriteData[8] -attr @rip m_wdata[8] -attr @name Cache_WriteData[8] -hierPin ARMcore Cache_WriteData[8] -pin ARMcore|MemOrIO m_wdata[8]
load net ARMcore|Cache_WriteData[9] -attr @rip m_wdata[9] -attr @name Cache_WriteData[9] -hierPin ARMcore Cache_WriteData[9] -pin ARMcore|MemOrIO m_wdata[9]
load net ARMcore|CondUnit_ALUFlags[0] -attr @rip ALUFlags[0] -attr @name CondUnit_ALUFlags[0] -pin ARMcore|ALU ALUFlags[0] -pin ARMcore|CondUnit ALUFlags[0]
load net ARMcore|CondUnit_ALUFlags[1] -attr @rip ALUFlags[1] -attr @name CondUnit_ALUFlags[1] -pin ARMcore|ALU ALUFlags[1] -pin ARMcore|CondUnit ALUFlags[1]
load net ARMcore|CondUnit_ALUFlags[2] -attr @rip ALUFlags[2] -attr @name CondUnit_ALUFlags[2] -pin ARMcore|ALU ALUFlags[2] -pin ARMcore|CondUnit ALUFlags[2]
load net ARMcore|CondUnit_ALUFlags[3] -attr @rip ALUFlags[3] -attr @name CondUnit_ALUFlags[3] -pin ARMcore|ALU ALUFlags[3] -pin ARMcore|CondUnit ALUFlags[3]
load net ARMcore|CondUnit_MemWrite -attr @name CondUnit_MemWrite -pin ARMcore|CondUnit MemWrite -pin ARMcore|EMReg MemWriteE
netloc ARMcore|CondUnit_MemWrite 1 12 6 6890J 2068 NJ 2068 NJ 2068 NJ 2068 NJ 2068 10190
load net ARMcore|ControlUnit_ALUControl[0] -attr @rip ALUControl[0] -attr @name ControlUnit_ALUControl[0] -pin ARMcore|ControlUnit ALUControl[0] -pin ARMcore|DEReg ALUControlD[0]
load net ARMcore|ControlUnit_ALUControl[1] -attr @rip ALUControl[1] -attr @name ControlUnit_ALUControl[1] -pin ARMcore|ControlUnit ALUControl[1] -pin ARMcore|DEReg ALUControlD[1]
load net ARMcore|ControlUnit_ALUControl[2] -attr @rip ALUControl[2] -attr @name ControlUnit_ALUControl[2] -pin ARMcore|ControlUnit ALUControl[2] -pin ARMcore|DEReg ALUControlD[2]
load net ARMcore|ControlUnit_ALUControl[3] -attr @rip ALUControl[3] -attr @name ControlUnit_ALUControl[3] -pin ARMcore|ControlUnit ALUControl[3] -pin ARMcore|DEReg ALUControlD[3]
load net ARMcore|ControlUnit_ALUSrc -attr @name ControlUnit_ALUSrc -pin ARMcore|ControlUnit ALUSrc -pin ARMcore|DEReg ALUSrcD
netloc ARMcore|ControlUnit_ALUSrc 1 3 4 2070J 1258 NJ 1258 NJ 1258 3560
load net ARMcore|ControlUnit_FPUOp -attr @name ControlUnit_FPUOp -pin ARMcore|ControlUnit FPUOp -pin ARMcore|DEReg FPUOpD
netloc ARMcore|ControlUnit_FPUOp 1 3 4 2090J 1278 NJ 1278 NJ 1278 3540
load net ARMcore|ControlUnit_FlagW[0] -attr @rip FlagW[0] -attr @name ControlUnit_FlagW[0] -pin ARMcore|ControlUnit FlagW[0] -pin ARMcore|DEReg FlagWD[0]
load net ARMcore|ControlUnit_FlagW[1] -attr @rip FlagW[1] -attr @name ControlUnit_FlagW[1] -pin ARMcore|ControlUnit FlagW[1] -pin ARMcore|DEReg FlagWD[1]
load net ARMcore|ControlUnit_FlagW[2] -attr @rip FlagW[2] -attr @name ControlUnit_FlagW[2] -pin ARMcore|ControlUnit FlagW[2] -pin ARMcore|DEReg FlagWD[2]
load net ARMcore|ControlUnit_FlagW[3] -attr @rip FlagW[3] -attr @name ControlUnit_FlagW[3] -pin ARMcore|ControlUnit FlagW[3] -pin ARMcore|DEReg FlagWD[3]
load net ARMcore|ControlUnit_ImmSrc[0] -attr @rip ImmSrc[0] -attr @name ControlUnit_ImmSrc[0] -pin ARMcore|ControlUnit ImmSrc[0] -pin ARMcore|Extend ImmSrc[0]
load net ARMcore|ControlUnit_ImmSrc[1] -attr @rip ImmSrc[1] -attr @name ControlUnit_ImmSrc[1] -pin ARMcore|ControlUnit ImmSrc[1] -pin ARMcore|Extend ImmSrc[1]
load net ARMcore|ControlUnit_MCycleOp -attr @name ControlUnit_MCycleOp -pin ARMcore|ControlUnit MCycleOp -pin ARMcore|DEReg MCycleOpD
netloc ARMcore|ControlUnit_MCycleOp 1 3 4 2130J 1488 NJ 1488 3090J 1528 3480
load net ARMcore|ControlUnit_MemW -attr @name ControlUnit_MemW -pin ARMcore|ControlUnit MemW -pin ARMcore|DEReg MemWD
netloc ARMcore|ControlUnit_MemW 1 3 4 2110J 1508 NJ 1508 2970J 1548 N
load net ARMcore|ControlUnit_MemtoReg -attr @name ControlUnit_MemtoReg -pin ARMcore|ControlUnit MemtoReg -pin ARMcore|DEReg MemtoRegD
netloc ARMcore|ControlUnit_MemtoReg 1 3 4 2090J 1528 NJ 1528 3070J 1568 N
load net ARMcore|ControlUnit_NoWrite -attr @name ControlUnit_NoWrite -pin ARMcore|ControlUnit NoWrite -pin ARMcore|DEReg NoWriteD
netloc ARMcore|ControlUnit_NoWrite 1 3 4 2070J 1548 NJ 1548 2950J 1588 N
load net ARMcore|ControlUnit_PCS -attr @name ControlUnit_PCS -pin ARMcore|ControlUnit PCS -pin ARMcore|DEReg PCSD
netloc ARMcore|ControlUnit_PCS 1 3 4 2050J 1568 NJ 1568 3030J 1608 N
load net ARMcore|ControlUnit_RegSrc[0] -attr @rip RegSrc[0] -attr @name ControlUnit_RegSrc[0] -pin ARMcore|ControlUnit RegSrc[0] -pin ARMcore|RegisterFile_A10_i S
load net ARMcore|ControlUnit_RegSrc[1] -attr @rip RegSrc[1] -attr @name ControlUnit_RegSrc[1] -pin ARMcore|ControlUnit RegSrc[1] -pin ARMcore|RegisterFile_A20_i S
load net ARMcore|ControlUnit_RegSrc[2] -attr @rip RegSrc[2] -attr @name ControlUnit_RegSrc[2] -pin ARMcore|ControlUnit RegSrc[2] -pin ARMcore|DEReg_WA3D_i S -pin ARMcore|RegisterFile_A1_i S -pin ARMcore|RegisterFile_A2_i S
load net ARMcore|ControlUnit_RegW -attr @name ControlUnit_RegW -pin ARMcore|ControlUnit RegW -pin ARMcore|DEReg RegWD
netloc ARMcore|ControlUnit_RegW 1 3 4 NJ 1588 NJ 1588 2930J 1628 3460
load net ARMcore|DEReg_ALUControlE[0] -attr @rip ALUControlE[0] -attr @name DEReg_ALUControlE[0] -pin ARMcore|ALU ALUControl[0] -pin ARMcore|CondUnit ALUControl[0] -pin ARMcore|DEReg ALUControlE[0]
load net ARMcore|DEReg_ALUControlE[1] -attr @rip ALUControlE[1] -attr @name DEReg_ALUControlE[1] -pin ARMcore|ALU ALUControl[1] -pin ARMcore|CondUnit ALUControl[1] -pin ARMcore|DEReg ALUControlE[1]
load net ARMcore|DEReg_ALUControlE[2] -attr @rip ALUControlE[2] -attr @name DEReg_ALUControlE[2] -pin ARMcore|ALU ALUControl[2] -pin ARMcore|CondUnit ALUControl[2] -pin ARMcore|DEReg ALUControlE[2]
load net ARMcore|DEReg_ALUControlE[3] -attr @rip ALUControlE[3] -attr @name DEReg_ALUControlE[3] -pin ARMcore|ALU ALUControl[3] -pin ARMcore|CondUnit ALUControl[3] -pin ARMcore|DEReg ALUControlE[3]
load net ARMcore|DEReg_ALUSrcE -attr @name DEReg_ALUSrcE -pin ARMcore|ALU_SrcB_i S -pin ARMcore|DEReg ALUSrcE
netloc ARMcore|DEReg_ALUSrcE 1 7 3 NJ 1328 NJ 1328 5040
load net ARMcore|DEReg_CondE[0] -attr @rip CondE[0] -attr @name DEReg_CondE[0] -pin ARMcore|CondUnit Cond[0] -pin ARMcore|DEReg CondE[0]
load net ARMcore|DEReg_CondE[1] -attr @rip CondE[1] -attr @name DEReg_CondE[1] -pin ARMcore|CondUnit Cond[1] -pin ARMcore|DEReg CondE[1]
load net ARMcore|DEReg_CondE[2] -attr @rip CondE[2] -attr @name DEReg_CondE[2] -pin ARMcore|CondUnit Cond[2] -pin ARMcore|DEReg CondE[2]
load net ARMcore|DEReg_CondE[3] -attr @rip CondE[3] -attr @name DEReg_CondE[3] -pin ARMcore|CondUnit Cond[3] -pin ARMcore|DEReg CondE[3]
load net ARMcore|DEReg_EN -attr @name DEReg_EN -pin ARMcore|DEReg EN -pin ARMcore|DEReg_EN_i O
netloc ARMcore|DEReg_EN 1 6 1 3520J 1358n
load net ARMcore|DEReg_ExtImmE[0] -attr @rip ExtImmE[0] -attr @name DEReg_ExtImmE[0] -pin ARMcore|ALU_SrcB_i I0[0] -pin ARMcore|DEReg ExtImmE[0]
load net ARMcore|DEReg_ExtImmE[10] -attr @rip ExtImmE[10] -attr @name DEReg_ExtImmE[10] -pin ARMcore|ALU_SrcB_i I0[10] -pin ARMcore|DEReg ExtImmE[10]
load net ARMcore|DEReg_ExtImmE[11] -attr @rip ExtImmE[11] -attr @name DEReg_ExtImmE[11] -pin ARMcore|ALU_SrcB_i I0[11] -pin ARMcore|DEReg ExtImmE[11]
load net ARMcore|DEReg_ExtImmE[12] -attr @rip ExtImmE[12] -attr @name DEReg_ExtImmE[12] -pin ARMcore|ALU_SrcB_i I0[12] -pin ARMcore|DEReg ExtImmE[12]
load net ARMcore|DEReg_ExtImmE[13] -attr @rip ExtImmE[13] -attr @name DEReg_ExtImmE[13] -pin ARMcore|ALU_SrcB_i I0[13] -pin ARMcore|DEReg ExtImmE[13]
load net ARMcore|DEReg_ExtImmE[14] -attr @rip ExtImmE[14] -attr @name DEReg_ExtImmE[14] -pin ARMcore|ALU_SrcB_i I0[14] -pin ARMcore|DEReg ExtImmE[14]
load net ARMcore|DEReg_ExtImmE[15] -attr @rip ExtImmE[15] -attr @name DEReg_ExtImmE[15] -pin ARMcore|ALU_SrcB_i I0[15] -pin ARMcore|DEReg ExtImmE[15]
load net ARMcore|DEReg_ExtImmE[16] -attr @rip ExtImmE[16] -attr @name DEReg_ExtImmE[16] -pin ARMcore|ALU_SrcB_i I0[16] -pin ARMcore|DEReg ExtImmE[16]
load net ARMcore|DEReg_ExtImmE[17] -attr @rip ExtImmE[17] -attr @name DEReg_ExtImmE[17] -pin ARMcore|ALU_SrcB_i I0[17] -pin ARMcore|DEReg ExtImmE[17]
load net ARMcore|DEReg_ExtImmE[18] -attr @rip ExtImmE[18] -attr @name DEReg_ExtImmE[18] -pin ARMcore|ALU_SrcB_i I0[18] -pin ARMcore|DEReg ExtImmE[18]
load net ARMcore|DEReg_ExtImmE[19] -attr @rip ExtImmE[19] -attr @name DEReg_ExtImmE[19] -pin ARMcore|ALU_SrcB_i I0[19] -pin ARMcore|DEReg ExtImmE[19]
load net ARMcore|DEReg_ExtImmE[1] -attr @rip ExtImmE[1] -attr @name DEReg_ExtImmE[1] -pin ARMcore|ALU_SrcB_i I0[1] -pin ARMcore|DEReg ExtImmE[1]
load net ARMcore|DEReg_ExtImmE[20] -attr @rip ExtImmE[20] -attr @name DEReg_ExtImmE[20] -pin ARMcore|ALU_SrcB_i I0[20] -pin ARMcore|DEReg ExtImmE[20]
load net ARMcore|DEReg_ExtImmE[21] -attr @rip ExtImmE[21] -attr @name DEReg_ExtImmE[21] -pin ARMcore|ALU_SrcB_i I0[21] -pin ARMcore|DEReg ExtImmE[21]
load net ARMcore|DEReg_ExtImmE[22] -attr @rip ExtImmE[22] -attr @name DEReg_ExtImmE[22] -pin ARMcore|ALU_SrcB_i I0[22] -pin ARMcore|DEReg ExtImmE[22]
load net ARMcore|DEReg_ExtImmE[23] -attr @rip ExtImmE[23] -attr @name DEReg_ExtImmE[23] -pin ARMcore|ALU_SrcB_i I0[23] -pin ARMcore|DEReg ExtImmE[23]
load net ARMcore|DEReg_ExtImmE[24] -attr @rip ExtImmE[24] -attr @name DEReg_ExtImmE[24] -pin ARMcore|ALU_SrcB_i I0[24] -pin ARMcore|DEReg ExtImmE[24]
load net ARMcore|DEReg_ExtImmE[25] -attr @rip ExtImmE[25] -attr @name DEReg_ExtImmE[25] -pin ARMcore|ALU_SrcB_i I0[25] -pin ARMcore|DEReg ExtImmE[25]
load net ARMcore|DEReg_ExtImmE[26] -attr @rip ExtImmE[26] -attr @name DEReg_ExtImmE[26] -pin ARMcore|ALU_SrcB_i I0[26] -pin ARMcore|DEReg ExtImmE[26]
load net ARMcore|DEReg_ExtImmE[27] -attr @rip ExtImmE[27] -attr @name DEReg_ExtImmE[27] -pin ARMcore|ALU_SrcB_i I0[27] -pin ARMcore|DEReg ExtImmE[27]
load net ARMcore|DEReg_ExtImmE[28] -attr @rip ExtImmE[28] -attr @name DEReg_ExtImmE[28] -pin ARMcore|ALU_SrcB_i I0[28] -pin ARMcore|DEReg ExtImmE[28]
load net ARMcore|DEReg_ExtImmE[29] -attr @rip ExtImmE[29] -attr @name DEReg_ExtImmE[29] -pin ARMcore|ALU_SrcB_i I0[29] -pin ARMcore|DEReg ExtImmE[29]
load net ARMcore|DEReg_ExtImmE[2] -attr @rip ExtImmE[2] -attr @name DEReg_ExtImmE[2] -pin ARMcore|ALU_SrcB_i I0[2] -pin ARMcore|DEReg ExtImmE[2]
load net ARMcore|DEReg_ExtImmE[30] -attr @rip ExtImmE[30] -attr @name DEReg_ExtImmE[30] -pin ARMcore|ALU_SrcB_i I0[30] -pin ARMcore|DEReg ExtImmE[30]
load net ARMcore|DEReg_ExtImmE[31] -attr @rip ExtImmE[31] -attr @name DEReg_ExtImmE[31] -pin ARMcore|ALU_SrcB_i I0[31] -pin ARMcore|DEReg ExtImmE[31]
load net ARMcore|DEReg_ExtImmE[3] -attr @rip ExtImmE[3] -attr @name DEReg_ExtImmE[3] -pin ARMcore|ALU_SrcB_i I0[3] -pin ARMcore|DEReg ExtImmE[3]
load net ARMcore|DEReg_ExtImmE[4] -attr @rip ExtImmE[4] -attr @name DEReg_ExtImmE[4] -pin ARMcore|ALU_SrcB_i I0[4] -pin ARMcore|DEReg ExtImmE[4]
load net ARMcore|DEReg_ExtImmE[5] -attr @rip ExtImmE[5] -attr @name DEReg_ExtImmE[5] -pin ARMcore|ALU_SrcB_i I0[5] -pin ARMcore|DEReg ExtImmE[5]
load net ARMcore|DEReg_ExtImmE[6] -attr @rip ExtImmE[6] -attr @name DEReg_ExtImmE[6] -pin ARMcore|ALU_SrcB_i I0[6] -pin ARMcore|DEReg ExtImmE[6]
load net ARMcore|DEReg_ExtImmE[7] -attr @rip ExtImmE[7] -attr @name DEReg_ExtImmE[7] -pin ARMcore|ALU_SrcB_i I0[7] -pin ARMcore|DEReg ExtImmE[7]
load net ARMcore|DEReg_ExtImmE[8] -attr @rip ExtImmE[8] -attr @name DEReg_ExtImmE[8] -pin ARMcore|ALU_SrcB_i I0[8] -pin ARMcore|DEReg ExtImmE[8]
load net ARMcore|DEReg_ExtImmE[9] -attr @rip ExtImmE[9] -attr @name DEReg_ExtImmE[9] -pin ARMcore|ALU_SrcB_i I0[9] -pin ARMcore|DEReg ExtImmE[9]
load net ARMcore|DEReg_FPUHazardE -attr @name DEReg_FPUHazardE -pin ARMcore|DEReg FPUHazardE -pin ARMcore|EMReg_RegWriteE2_i I1
netloc ARMcore|DEReg_FPUHazardE 1 7 8 4040J 1188 NJ 1188 NJ 1188 NJ 1188 NJ 1188 6770J 1228 7440J 1248 8140
load net ARMcore|DEReg_FPUOpE -attr @name DEReg_FPUOpE -pin ARMcore|DEReg FPUOpE -pin ARMcore|EMReg_ALUResultE1_i__0 I1 -pin ARMcore|FPU FPUOp
netloc ARMcore|DEReg_FPUOpE 1 7 9 4320J 1978 4680J 1988 NJ 1988 NJ 1988 6340J 2008 6830 1828 NJ 1828 NJ 1828 NJ
load net ARMcore|DEReg_FPUSE -attr @name DEReg_FPUSE -pin ARMcore|CondUnit FPUS -pin ARMcore|DEReg FPUSE
netloc ARMcore|DEReg_FPUSE 1 7 5 4280J 1288 NJ 1288 NJ 1288 NJ 1288 6480
load net ARMcore|DEReg_FlagWE[0] -attr @rip FlagWE[0] -attr @name DEReg_FlagWE[0] -pin ARMcore|CondUnit FlagW[0] -pin ARMcore|DEReg FlagWE[0]
load net ARMcore|DEReg_FlagWE[1] -attr @rip FlagWE[1] -attr @name DEReg_FlagWE[1] -pin ARMcore|CondUnit FlagW[1] -pin ARMcore|DEReg FlagWE[1]
load net ARMcore|DEReg_FlagWE[2] -attr @rip FlagWE[2] -attr @name DEReg_FlagWE[2] -pin ARMcore|CondUnit FlagW[2] -pin ARMcore|DEReg FlagWE[2]
load net ARMcore|DEReg_FlagWE[3] -attr @rip FlagWE[3] -attr @name DEReg_FlagWE[3] -pin ARMcore|CondUnit FlagW[3] -pin ARMcore|DEReg FlagWE[3]
load net ARMcore|DEReg_MCycleHazardE -attr @name DEReg_MCycleHazardE -pin ARMcore|DEReg MCycleHazardE -pin ARMcore|EMReg_RegWriteE3_i I1
netloc ARMcore|DEReg_MCycleHazardE 1 7 7 4280J 2028 NJ 2028 NJ 2028 NJ 2028 NJ 2028 6850J 2008 7760
load net ARMcore|DEReg_MCycleOpE -attr @name DEReg_MCycleOpE -pin ARMcore|DEReg MCycleOpE -pin ARMcore|MCycle MCycleOp
netloc ARMcore|DEReg_MCycleOpE 1 7 6 4080J 1268 NJ 1268 NJ 1268 NJ 1268 NJ 1268 7070
load net ARMcore|DEReg_MSE -attr @name DEReg_MSE -pin ARMcore|CondUnit MS -pin ARMcore|DEReg MSE
netloc ARMcore|DEReg_MSE 1 7 5 4360J 1568 NJ 1568 5280J 1708 NJ 1708 6220
load net ARMcore|DEReg_MemWE -attr @name DEReg_MemWE -pin ARMcore|CondUnit MemW -pin ARMcore|DEReg MemWE
netloc ARMcore|DEReg_MemWE 1 7 5 4140J 1588 NJ 1588 5240J 1728 NJ 1728 6240
load net ARMcore|DEReg_NoWriteE -attr @name DEReg_NoWriteE -pin ARMcore|CondUnit NoWrite -pin ARMcore|DEReg NoWriteE
netloc ARMcore|DEReg_NoWriteE 1 7 5 4340J 1608 NJ 1608 5220J 1748 NJ 1748 6260
load net ARMcore|DEReg_PCSE -attr @name DEReg_PCSE -pin ARMcore|CondUnit PCS -pin ARMcore|DEReg PCSE
netloc ARMcore|DEReg_PCSE 1 7 5 4120J 1628 NJ 1628 5200J 1768 NJ 1768 6280
load net ARMcore|DEReg_RD1E[0] -attr @rip RD1E[0] -attr @name DEReg_RD1E[0] -pin ARMcore|DEReg RD1E[0] -pin ARMcore|SA_i I0[0] -pin ARMcore|SA_i I3[0]
load net ARMcore|DEReg_RD1E[10] -attr @rip RD1E[10] -attr @name DEReg_RD1E[10] -pin ARMcore|DEReg RD1E[10] -pin ARMcore|SA_i I0[10] -pin ARMcore|SA_i I3[10]
load net ARMcore|DEReg_RD1E[11] -attr @rip RD1E[11] -attr @name DEReg_RD1E[11] -pin ARMcore|DEReg RD1E[11] -pin ARMcore|SA_i I0[11] -pin ARMcore|SA_i I3[11]
load net ARMcore|DEReg_RD1E[12] -attr @rip RD1E[12] -attr @name DEReg_RD1E[12] -pin ARMcore|DEReg RD1E[12] -pin ARMcore|SA_i I0[12] -pin ARMcore|SA_i I3[12]
load net ARMcore|DEReg_RD1E[13] -attr @rip RD1E[13] -attr @name DEReg_RD1E[13] -pin ARMcore|DEReg RD1E[13] -pin ARMcore|SA_i I0[13] -pin ARMcore|SA_i I3[13]
load net ARMcore|DEReg_RD1E[14] -attr @rip RD1E[14] -attr @name DEReg_RD1E[14] -pin ARMcore|DEReg RD1E[14] -pin ARMcore|SA_i I0[14] -pin ARMcore|SA_i I3[14]
load net ARMcore|DEReg_RD1E[15] -attr @rip RD1E[15] -attr @name DEReg_RD1E[15] -pin ARMcore|DEReg RD1E[15] -pin ARMcore|SA_i I0[15] -pin ARMcore|SA_i I3[15]
load net ARMcore|DEReg_RD1E[16] -attr @rip RD1E[16] -attr @name DEReg_RD1E[16] -pin ARMcore|DEReg RD1E[16] -pin ARMcore|SA_i I0[16] -pin ARMcore|SA_i I3[16]
load net ARMcore|DEReg_RD1E[17] -attr @rip RD1E[17] -attr @name DEReg_RD1E[17] -pin ARMcore|DEReg RD1E[17] -pin ARMcore|SA_i I0[17] -pin ARMcore|SA_i I3[17]
load net ARMcore|DEReg_RD1E[18] -attr @rip RD1E[18] -attr @name DEReg_RD1E[18] -pin ARMcore|DEReg RD1E[18] -pin ARMcore|SA_i I0[18] -pin ARMcore|SA_i I3[18]
load net ARMcore|DEReg_RD1E[19] -attr @rip RD1E[19] -attr @name DEReg_RD1E[19] -pin ARMcore|DEReg RD1E[19] -pin ARMcore|SA_i I0[19] -pin ARMcore|SA_i I3[19]
load net ARMcore|DEReg_RD1E[1] -attr @rip RD1E[1] -attr @name DEReg_RD1E[1] -pin ARMcore|DEReg RD1E[1] -pin ARMcore|SA_i I0[1] -pin ARMcore|SA_i I3[1]
load net ARMcore|DEReg_RD1E[20] -attr @rip RD1E[20] -attr @name DEReg_RD1E[20] -pin ARMcore|DEReg RD1E[20] -pin ARMcore|SA_i I0[20] -pin ARMcore|SA_i I3[20]
load net ARMcore|DEReg_RD1E[21] -attr @rip RD1E[21] -attr @name DEReg_RD1E[21] -pin ARMcore|DEReg RD1E[21] -pin ARMcore|SA_i I0[21] -pin ARMcore|SA_i I3[21]
load net ARMcore|DEReg_RD1E[22] -attr @rip RD1E[22] -attr @name DEReg_RD1E[22] -pin ARMcore|DEReg RD1E[22] -pin ARMcore|SA_i I0[22] -pin ARMcore|SA_i I3[22]
load net ARMcore|DEReg_RD1E[23] -attr @rip RD1E[23] -attr @name DEReg_RD1E[23] -pin ARMcore|DEReg RD1E[23] -pin ARMcore|SA_i I0[23] -pin ARMcore|SA_i I3[23]
load net ARMcore|DEReg_RD1E[24] -attr @rip RD1E[24] -attr @name DEReg_RD1E[24] -pin ARMcore|DEReg RD1E[24] -pin ARMcore|SA_i I0[24] -pin ARMcore|SA_i I3[24]
load net ARMcore|DEReg_RD1E[25] -attr @rip RD1E[25] -attr @name DEReg_RD1E[25] -pin ARMcore|DEReg RD1E[25] -pin ARMcore|SA_i I0[25] -pin ARMcore|SA_i I3[25]
load net ARMcore|DEReg_RD1E[26] -attr @rip RD1E[26] -attr @name DEReg_RD1E[26] -pin ARMcore|DEReg RD1E[26] -pin ARMcore|SA_i I0[26] -pin ARMcore|SA_i I3[26]
load net ARMcore|DEReg_RD1E[27] -attr @rip RD1E[27] -attr @name DEReg_RD1E[27] -pin ARMcore|DEReg RD1E[27] -pin ARMcore|SA_i I0[27] -pin ARMcore|SA_i I3[27]
load net ARMcore|DEReg_RD1E[28] -attr @rip RD1E[28] -attr @name DEReg_RD1E[28] -pin ARMcore|DEReg RD1E[28] -pin ARMcore|SA_i I0[28] -pin ARMcore|SA_i I3[28]
load net ARMcore|DEReg_RD1E[29] -attr @rip RD1E[29] -attr @name DEReg_RD1E[29] -pin ARMcore|DEReg RD1E[29] -pin ARMcore|SA_i I0[29] -pin ARMcore|SA_i I3[29]
load net ARMcore|DEReg_RD1E[2] -attr @rip RD1E[2] -attr @name DEReg_RD1E[2] -pin ARMcore|DEReg RD1E[2] -pin ARMcore|SA_i I0[2] -pin ARMcore|SA_i I3[2]
load net ARMcore|DEReg_RD1E[30] -attr @rip RD1E[30] -attr @name DEReg_RD1E[30] -pin ARMcore|DEReg RD1E[30] -pin ARMcore|SA_i I0[30] -pin ARMcore|SA_i I3[30]
load net ARMcore|DEReg_RD1E[31] -attr @rip RD1E[31] -attr @name DEReg_RD1E[31] -pin ARMcore|DEReg RD1E[31] -pin ARMcore|SA_i I0[31] -pin ARMcore|SA_i I3[31]
load net ARMcore|DEReg_RD1E[3] -attr @rip RD1E[3] -attr @name DEReg_RD1E[3] -pin ARMcore|DEReg RD1E[3] -pin ARMcore|SA_i I0[3] -pin ARMcore|SA_i I3[3]
load net ARMcore|DEReg_RD1E[4] -attr @rip RD1E[4] -attr @name DEReg_RD1E[4] -pin ARMcore|DEReg RD1E[4] -pin ARMcore|SA_i I0[4] -pin ARMcore|SA_i I3[4]
load net ARMcore|DEReg_RD1E[5] -attr @rip RD1E[5] -attr @name DEReg_RD1E[5] -pin ARMcore|DEReg RD1E[5] -pin ARMcore|SA_i I0[5] -pin ARMcore|SA_i I3[5]
load net ARMcore|DEReg_RD1E[6] -attr @rip RD1E[6] -attr @name DEReg_RD1E[6] -pin ARMcore|DEReg RD1E[6] -pin ARMcore|SA_i I0[6] -pin ARMcore|SA_i I3[6]
load net ARMcore|DEReg_RD1E[7] -attr @rip RD1E[7] -attr @name DEReg_RD1E[7] -pin ARMcore|DEReg RD1E[7] -pin ARMcore|SA_i I0[7] -pin ARMcore|SA_i I3[7]
load net ARMcore|DEReg_RD1E[8] -attr @rip RD1E[8] -attr @name DEReg_RD1E[8] -pin ARMcore|DEReg RD1E[8] -pin ARMcore|SA_i I0[8] -pin ARMcore|SA_i I3[8]
load net ARMcore|DEReg_RD1E[9] -attr @rip RD1E[9] -attr @name DEReg_RD1E[9] -pin ARMcore|DEReg RD1E[9] -pin ARMcore|SA_i I0[9] -pin ARMcore|SA_i I3[9]
load net ARMcore|DEReg_RD2E[0] -attr @rip RD2E[0] -attr @name DEReg_RD2E[0] -pin ARMcore|DEReg RD2E[0] -pin ARMcore|SB_i I0[0] -pin ARMcore|SB_i I3[0]
load net ARMcore|DEReg_RD2E[10] -attr @rip RD2E[10] -attr @name DEReg_RD2E[10] -pin ARMcore|DEReg RD2E[10] -pin ARMcore|SB_i I0[10] -pin ARMcore|SB_i I3[10]
load net ARMcore|DEReg_RD2E[11] -attr @rip RD2E[11] -attr @name DEReg_RD2E[11] -pin ARMcore|DEReg RD2E[11] -pin ARMcore|SB_i I0[11] -pin ARMcore|SB_i I3[11]
load net ARMcore|DEReg_RD2E[12] -attr @rip RD2E[12] -attr @name DEReg_RD2E[12] -pin ARMcore|DEReg RD2E[12] -pin ARMcore|SB_i I0[12] -pin ARMcore|SB_i I3[12]
load net ARMcore|DEReg_RD2E[13] -attr @rip RD2E[13] -attr @name DEReg_RD2E[13] -pin ARMcore|DEReg RD2E[13] -pin ARMcore|SB_i I0[13] -pin ARMcore|SB_i I3[13]
load net ARMcore|DEReg_RD2E[14] -attr @rip RD2E[14] -attr @name DEReg_RD2E[14] -pin ARMcore|DEReg RD2E[14] -pin ARMcore|SB_i I0[14] -pin ARMcore|SB_i I3[14]
load net ARMcore|DEReg_RD2E[15] -attr @rip RD2E[15] -attr @name DEReg_RD2E[15] -pin ARMcore|DEReg RD2E[15] -pin ARMcore|SB_i I0[15] -pin ARMcore|SB_i I3[15]
load net ARMcore|DEReg_RD2E[16] -attr @rip RD2E[16] -attr @name DEReg_RD2E[16] -pin ARMcore|DEReg RD2E[16] -pin ARMcore|SB_i I0[16] -pin ARMcore|SB_i I3[16]
load net ARMcore|DEReg_RD2E[17] -attr @rip RD2E[17] -attr @name DEReg_RD2E[17] -pin ARMcore|DEReg RD2E[17] -pin ARMcore|SB_i I0[17] -pin ARMcore|SB_i I3[17]
load net ARMcore|DEReg_RD2E[18] -attr @rip RD2E[18] -attr @name DEReg_RD2E[18] -pin ARMcore|DEReg RD2E[18] -pin ARMcore|SB_i I0[18] -pin ARMcore|SB_i I3[18]
load net ARMcore|DEReg_RD2E[19] -attr @rip RD2E[19] -attr @name DEReg_RD2E[19] -pin ARMcore|DEReg RD2E[19] -pin ARMcore|SB_i I0[19] -pin ARMcore|SB_i I3[19]
load net ARMcore|DEReg_RD2E[1] -attr @rip RD2E[1] -attr @name DEReg_RD2E[1] -pin ARMcore|DEReg RD2E[1] -pin ARMcore|SB_i I0[1] -pin ARMcore|SB_i I3[1]
load net ARMcore|DEReg_RD2E[20] -attr @rip RD2E[20] -attr @name DEReg_RD2E[20] -pin ARMcore|DEReg RD2E[20] -pin ARMcore|SB_i I0[20] -pin ARMcore|SB_i I3[20]
load net ARMcore|DEReg_RD2E[21] -attr @rip RD2E[21] -attr @name DEReg_RD2E[21] -pin ARMcore|DEReg RD2E[21] -pin ARMcore|SB_i I0[21] -pin ARMcore|SB_i I3[21]
load net ARMcore|DEReg_RD2E[22] -attr @rip RD2E[22] -attr @name DEReg_RD2E[22] -pin ARMcore|DEReg RD2E[22] -pin ARMcore|SB_i I0[22] -pin ARMcore|SB_i I3[22]
load net ARMcore|DEReg_RD2E[23] -attr @rip RD2E[23] -attr @name DEReg_RD2E[23] -pin ARMcore|DEReg RD2E[23] -pin ARMcore|SB_i I0[23] -pin ARMcore|SB_i I3[23]
load net ARMcore|DEReg_RD2E[24] -attr @rip RD2E[24] -attr @name DEReg_RD2E[24] -pin ARMcore|DEReg RD2E[24] -pin ARMcore|SB_i I0[24] -pin ARMcore|SB_i I3[24]
load net ARMcore|DEReg_RD2E[25] -attr @rip RD2E[25] -attr @name DEReg_RD2E[25] -pin ARMcore|DEReg RD2E[25] -pin ARMcore|SB_i I0[25] -pin ARMcore|SB_i I3[25]
load net ARMcore|DEReg_RD2E[26] -attr @rip RD2E[26] -attr @name DEReg_RD2E[26] -pin ARMcore|DEReg RD2E[26] -pin ARMcore|SB_i I0[26] -pin ARMcore|SB_i I3[26]
load net ARMcore|DEReg_RD2E[27] -attr @rip RD2E[27] -attr @name DEReg_RD2E[27] -pin ARMcore|DEReg RD2E[27] -pin ARMcore|SB_i I0[27] -pin ARMcore|SB_i I3[27]
load net ARMcore|DEReg_RD2E[28] -attr @rip RD2E[28] -attr @name DEReg_RD2E[28] -pin ARMcore|DEReg RD2E[28] -pin ARMcore|SB_i I0[28] -pin ARMcore|SB_i I3[28]
load net ARMcore|DEReg_RD2E[29] -attr @rip RD2E[29] -attr @name DEReg_RD2E[29] -pin ARMcore|DEReg RD2E[29] -pin ARMcore|SB_i I0[29] -pin ARMcore|SB_i I3[29]
load net ARMcore|DEReg_RD2E[2] -attr @rip RD2E[2] -attr @name DEReg_RD2E[2] -pin ARMcore|DEReg RD2E[2] -pin ARMcore|SB_i I0[2] -pin ARMcore|SB_i I3[2]
load net ARMcore|DEReg_RD2E[30] -attr @rip RD2E[30] -attr @name DEReg_RD2E[30] -pin ARMcore|DEReg RD2E[30] -pin ARMcore|SB_i I0[30] -pin ARMcore|SB_i I3[30]
load net ARMcore|DEReg_RD2E[31] -attr @rip RD2E[31] -attr @name DEReg_RD2E[31] -pin ARMcore|DEReg RD2E[31] -pin ARMcore|SB_i I0[31] -pin ARMcore|SB_i I3[31]
load net ARMcore|DEReg_RD2E[3] -attr @rip RD2E[3] -attr @name DEReg_RD2E[3] -pin ARMcore|DEReg RD2E[3] -pin ARMcore|SB_i I0[3] -pin ARMcore|SB_i I3[3]
load net ARMcore|DEReg_RD2E[4] -attr @rip RD2E[4] -attr @name DEReg_RD2E[4] -pin ARMcore|DEReg RD2E[4] -pin ARMcore|SB_i I0[4] -pin ARMcore|SB_i I3[4]
load net ARMcore|DEReg_RD2E[5] -attr @rip RD2E[5] -attr @name DEReg_RD2E[5] -pin ARMcore|DEReg RD2E[5] -pin ARMcore|SB_i I0[5] -pin ARMcore|SB_i I3[5]
load net ARMcore|DEReg_RD2E[6] -attr @rip RD2E[6] -attr @name DEReg_RD2E[6] -pin ARMcore|DEReg RD2E[6] -pin ARMcore|SB_i I0[6] -pin ARMcore|SB_i I3[6]
load net ARMcore|DEReg_RD2E[7] -attr @rip RD2E[7] -attr @name DEReg_RD2E[7] -pin ARMcore|DEReg RD2E[7] -pin ARMcore|SB_i I0[7] -pin ARMcore|SB_i I3[7]
load net ARMcore|DEReg_RD2E[8] -attr @rip RD2E[8] -attr @name DEReg_RD2E[8] -pin ARMcore|DEReg RD2E[8] -pin ARMcore|SB_i I0[8] -pin ARMcore|SB_i I3[8]
load net ARMcore|DEReg_RD2E[9] -attr @rip RD2E[9] -attr @name DEReg_RD2E[9] -pin ARMcore|DEReg RD2E[9] -pin ARMcore|SB_i I0[9] -pin ARMcore|SB_i I3[9]
load net ARMcore|DEReg_RegWE -attr @name DEReg_RegWE -pin ARMcore|CondUnit RegW -pin ARMcore|DEReg RegWE
netloc ARMcore|DEReg_RegWE 1 7 5 4240J 1828 4720J 1748 5160J 1828 5640J 1848 6300
load net ARMcore|DEReg_ShE[0] -attr @rip ShE[0] -attr @name DEReg_ShE[0] -pin ARMcore|DEReg ShE[0] -pin ARMcore|Shifter Sh[0]
load net ARMcore|DEReg_ShE[1] -attr @rip ShE[1] -attr @name DEReg_ShE[1] -pin ARMcore|DEReg ShE[1] -pin ARMcore|Shifter Sh[1]
load net ARMcore|DEReg_Shamt5E[0] -attr @rip Shamt5E[0] -attr @name DEReg_Shamt5E[0] -pin ARMcore|DEReg Shamt5E[0] -pin ARMcore|Shifter Shamt5[0]
load net ARMcore|DEReg_Shamt5E[1] -attr @rip Shamt5E[1] -attr @name DEReg_Shamt5E[1] -pin ARMcore|DEReg Shamt5E[1] -pin ARMcore|Shifter Shamt5[1]
load net ARMcore|DEReg_Shamt5E[2] -attr @rip Shamt5E[2] -attr @name DEReg_Shamt5E[2] -pin ARMcore|DEReg Shamt5E[2] -pin ARMcore|Shifter Shamt5[2]
load net ARMcore|DEReg_Shamt5E[3] -attr @rip Shamt5E[3] -attr @name DEReg_Shamt5E[3] -pin ARMcore|DEReg Shamt5E[3] -pin ARMcore|Shifter Shamt5[3]
load net ARMcore|DEReg_Shamt5E[4] -attr @rip Shamt5E[4] -attr @name DEReg_Shamt5E[4] -pin ARMcore|DEReg Shamt5E[4] -pin ARMcore|Shifter Shamt5[4]
load net ARMcore|DEReg_WA3D[0] -attr @rip O[0] -attr @name DEReg_WA3D[0] -pin ARMcore|DEReg WA3D[0] -pin ARMcore|DEReg_WA3D_i O[0] -pin ARMcore|HazardUnit WA3D[0]
load net ARMcore|DEReg_WA3D[1] -attr @rip O[1] -attr @name DEReg_WA3D[1] -pin ARMcore|DEReg WA3D[1] -pin ARMcore|DEReg_WA3D_i O[1] -pin ARMcore|HazardUnit WA3D[1]
load net ARMcore|DEReg_WA3D[2] -attr @rip O[2] -attr @name DEReg_WA3D[2] -pin ARMcore|DEReg WA3D[2] -pin ARMcore|DEReg_WA3D_i O[2] -pin ARMcore|HazardUnit WA3D[2]
load net ARMcore|DEReg_WA3D[3] -attr @rip O[3] -attr @name DEReg_WA3D[3] -pin ARMcore|DEReg WA3D[3] -pin ARMcore|DEReg_WA3D_i O[3] -pin ARMcore|HazardUnit WA3D[3]
load net ARMcore|DEReg_WA3E[0] -attr @rip WA3E[0] -attr @name DEReg_WA3E[0] -pin ARMcore|DEReg WA3E[0] -pin ARMcore|EMReg_WA3E0_i I1[0] -pin ARMcore|FPU WA3[0] -pin ARMcore|MCycle WA3[0]
load net ARMcore|DEReg_WA3E[1] -attr @rip WA3E[1] -attr @name DEReg_WA3E[1] -pin ARMcore|DEReg WA3E[1] -pin ARMcore|EMReg_WA3E0_i I1[1] -pin ARMcore|FPU WA3[1] -pin ARMcore|MCycle WA3[1]
load net ARMcore|DEReg_WA3E[2] -attr @rip WA3E[2] -attr @name DEReg_WA3E[2] -pin ARMcore|DEReg WA3E[2] -pin ARMcore|EMReg_WA3E0_i I1[2] -pin ARMcore|FPU WA3[2] -pin ARMcore|MCycle WA3[2]
load net ARMcore|DEReg_WA3E[3] -attr @rip WA3E[3] -attr @name DEReg_WA3E[3] -pin ARMcore|DEReg WA3E[3] -pin ARMcore|EMReg_WA3E0_i I1[3] -pin ARMcore|FPU WA3[3] -pin ARMcore|MCycle WA3[3]
load net ARMcore|EMReg_ALUOutM[0] -attr @rip ALUOutM[0] -attr @name EMReg_ALUOutM[0] -pin ARMcore|EMReg ALUOutM[0] -pin ARMcore|MWReg ALUOutM[0] -pin ARMcore|MemOrIO addr_in[0] -pin ARMcore|SA_i I2[0] -pin ARMcore|SB_i I2[0]
load net ARMcore|EMReg_ALUOutM[10] -attr @rip ALUOutM[10] -attr @name EMReg_ALUOutM[10] -pin ARMcore|EMReg ALUOutM[10] -pin ARMcore|MWReg ALUOutM[10] -pin ARMcore|MemOrIO addr_in[10] -pin ARMcore|SA_i I2[10] -pin ARMcore|SB_i I2[10]
load net ARMcore|EMReg_ALUOutM[11] -attr @rip ALUOutM[11] -attr @name EMReg_ALUOutM[11] -pin ARMcore|EMReg ALUOutM[11] -pin ARMcore|MWReg ALUOutM[11] -pin ARMcore|MemOrIO addr_in[11] -pin ARMcore|SA_i I2[11] -pin ARMcore|SB_i I2[11]
load net ARMcore|EMReg_ALUOutM[12] -attr @rip ALUOutM[12] -attr @name EMReg_ALUOutM[12] -pin ARMcore|EMReg ALUOutM[12] -pin ARMcore|MWReg ALUOutM[12] -pin ARMcore|MemOrIO addr_in[12] -pin ARMcore|SA_i I2[12] -pin ARMcore|SB_i I2[12]
load net ARMcore|EMReg_ALUOutM[13] -attr @rip ALUOutM[13] -attr @name EMReg_ALUOutM[13] -pin ARMcore|EMReg ALUOutM[13] -pin ARMcore|MWReg ALUOutM[13] -pin ARMcore|MemOrIO addr_in[13] -pin ARMcore|SA_i I2[13] -pin ARMcore|SB_i I2[13]
load net ARMcore|EMReg_ALUOutM[14] -attr @rip ALUOutM[14] -attr @name EMReg_ALUOutM[14] -pin ARMcore|EMReg ALUOutM[14] -pin ARMcore|MWReg ALUOutM[14] -pin ARMcore|MemOrIO addr_in[14] -pin ARMcore|SA_i I2[14] -pin ARMcore|SB_i I2[14]
load net ARMcore|EMReg_ALUOutM[15] -attr @rip ALUOutM[15] -attr @name EMReg_ALUOutM[15] -pin ARMcore|EMReg ALUOutM[15] -pin ARMcore|MWReg ALUOutM[15] -pin ARMcore|MemOrIO addr_in[15] -pin ARMcore|SA_i I2[15] -pin ARMcore|SB_i I2[15]
load net ARMcore|EMReg_ALUOutM[16] -attr @rip ALUOutM[16] -attr @name EMReg_ALUOutM[16] -pin ARMcore|EMReg ALUOutM[16] -pin ARMcore|MWReg ALUOutM[16] -pin ARMcore|MemOrIO addr_in[16] -pin ARMcore|SA_i I2[16] -pin ARMcore|SB_i I2[16]
load net ARMcore|EMReg_ALUOutM[17] -attr @rip ALUOutM[17] -attr @name EMReg_ALUOutM[17] -pin ARMcore|EMReg ALUOutM[17] -pin ARMcore|MWReg ALUOutM[17] -pin ARMcore|MemOrIO addr_in[17] -pin ARMcore|SA_i I2[17] -pin ARMcore|SB_i I2[17]
load net ARMcore|EMReg_ALUOutM[18] -attr @rip ALUOutM[18] -attr @name EMReg_ALUOutM[18] -pin ARMcore|EMReg ALUOutM[18] -pin ARMcore|MWReg ALUOutM[18] -pin ARMcore|MemOrIO addr_in[18] -pin ARMcore|SA_i I2[18] -pin ARMcore|SB_i I2[18]
load net ARMcore|EMReg_ALUOutM[19] -attr @rip ALUOutM[19] -attr @name EMReg_ALUOutM[19] -pin ARMcore|EMReg ALUOutM[19] -pin ARMcore|MWReg ALUOutM[19] -pin ARMcore|MemOrIO addr_in[19] -pin ARMcore|SA_i I2[19] -pin ARMcore|SB_i I2[19]
load net ARMcore|EMReg_ALUOutM[1] -attr @rip ALUOutM[1] -attr @name EMReg_ALUOutM[1] -pin ARMcore|EMReg ALUOutM[1] -pin ARMcore|MWReg ALUOutM[1] -pin ARMcore|MemOrIO addr_in[1] -pin ARMcore|SA_i I2[1] -pin ARMcore|SB_i I2[1]
load net ARMcore|EMReg_ALUOutM[20] -attr @rip ALUOutM[20] -attr @name EMReg_ALUOutM[20] -pin ARMcore|EMReg ALUOutM[20] -pin ARMcore|MWReg ALUOutM[20] -pin ARMcore|MemOrIO addr_in[20] -pin ARMcore|SA_i I2[20] -pin ARMcore|SB_i I2[20]
load net ARMcore|EMReg_ALUOutM[21] -attr @rip ALUOutM[21] -attr @name EMReg_ALUOutM[21] -pin ARMcore|EMReg ALUOutM[21] -pin ARMcore|MWReg ALUOutM[21] -pin ARMcore|MemOrIO addr_in[21] -pin ARMcore|SA_i I2[21] -pin ARMcore|SB_i I2[21]
load net ARMcore|EMReg_ALUOutM[22] -attr @rip ALUOutM[22] -attr @name EMReg_ALUOutM[22] -pin ARMcore|EMReg ALUOutM[22] -pin ARMcore|MWReg ALUOutM[22] -pin ARMcore|MemOrIO addr_in[22] -pin ARMcore|SA_i I2[22] -pin ARMcore|SB_i I2[22]
load net ARMcore|EMReg_ALUOutM[23] -attr @rip ALUOutM[23] -attr @name EMReg_ALUOutM[23] -pin ARMcore|EMReg ALUOutM[23] -pin ARMcore|MWReg ALUOutM[23] -pin ARMcore|MemOrIO addr_in[23] -pin ARMcore|SA_i I2[23] -pin ARMcore|SB_i I2[23]
load net ARMcore|EMReg_ALUOutM[24] -attr @rip ALUOutM[24] -attr @name EMReg_ALUOutM[24] -pin ARMcore|EMReg ALUOutM[24] -pin ARMcore|MWReg ALUOutM[24] -pin ARMcore|MemOrIO addr_in[24] -pin ARMcore|SA_i I2[24] -pin ARMcore|SB_i I2[24]
load net ARMcore|EMReg_ALUOutM[25] -attr @rip ALUOutM[25] -attr @name EMReg_ALUOutM[25] -pin ARMcore|EMReg ALUOutM[25] -pin ARMcore|MWReg ALUOutM[25] -pin ARMcore|MemOrIO addr_in[25] -pin ARMcore|SA_i I2[25] -pin ARMcore|SB_i I2[25]
load net ARMcore|EMReg_ALUOutM[26] -attr @rip ALUOutM[26] -attr @name EMReg_ALUOutM[26] -pin ARMcore|EMReg ALUOutM[26] -pin ARMcore|MWReg ALUOutM[26] -pin ARMcore|MemOrIO addr_in[26] -pin ARMcore|SA_i I2[26] -pin ARMcore|SB_i I2[26]
load net ARMcore|EMReg_ALUOutM[27] -attr @rip ALUOutM[27] -attr @name EMReg_ALUOutM[27] -pin ARMcore|EMReg ALUOutM[27] -pin ARMcore|MWReg ALUOutM[27] -pin ARMcore|MemOrIO addr_in[27] -pin ARMcore|SA_i I2[27] -pin ARMcore|SB_i I2[27]
load net ARMcore|EMReg_ALUOutM[28] -attr @rip ALUOutM[28] -attr @name EMReg_ALUOutM[28] -pin ARMcore|EMReg ALUOutM[28] -pin ARMcore|MWReg ALUOutM[28] -pin ARMcore|MemOrIO addr_in[28] -pin ARMcore|SA_i I2[28] -pin ARMcore|SB_i I2[28]
load net ARMcore|EMReg_ALUOutM[29] -attr @rip ALUOutM[29] -attr @name EMReg_ALUOutM[29] -pin ARMcore|EMReg ALUOutM[29] -pin ARMcore|MWReg ALUOutM[29] -pin ARMcore|MemOrIO addr_in[29] -pin ARMcore|SA_i I2[29] -pin ARMcore|SB_i I2[29]
load net ARMcore|EMReg_ALUOutM[2] -attr @rip ALUOutM[2] -attr @name EMReg_ALUOutM[2] -pin ARMcore|EMReg ALUOutM[2] -pin ARMcore|MWReg ALUOutM[2] -pin ARMcore|MemOrIO addr_in[2] -pin ARMcore|SA_i I2[2] -pin ARMcore|SB_i I2[2]
load net ARMcore|EMReg_ALUOutM[30] -attr @rip ALUOutM[30] -attr @name EMReg_ALUOutM[30] -pin ARMcore|EMReg ALUOutM[30] -pin ARMcore|MWReg ALUOutM[30] -pin ARMcore|MemOrIO addr_in[30] -pin ARMcore|SA_i I2[30] -pin ARMcore|SB_i I2[30]
load net ARMcore|EMReg_ALUOutM[31] -attr @rip ALUOutM[31] -attr @name EMReg_ALUOutM[31] -pin ARMcore|EMReg ALUOutM[31] -pin ARMcore|MWReg ALUOutM[31] -pin ARMcore|MemOrIO addr_in[31] -pin ARMcore|SA_i I2[31] -pin ARMcore|SB_i I2[31]
load net ARMcore|EMReg_ALUOutM[3] -attr @rip ALUOutM[3] -attr @name EMReg_ALUOutM[3] -pin ARMcore|EMReg ALUOutM[3] -pin ARMcore|MWReg ALUOutM[3] -pin ARMcore|MemOrIO addr_in[3] -pin ARMcore|SA_i I2[3] -pin ARMcore|SB_i I2[3]
load net ARMcore|EMReg_ALUOutM[4] -attr @rip ALUOutM[4] -attr @name EMReg_ALUOutM[4] -pin ARMcore|EMReg ALUOutM[4] -pin ARMcore|MWReg ALUOutM[4] -pin ARMcore|MemOrIO addr_in[4] -pin ARMcore|SA_i I2[4] -pin ARMcore|SB_i I2[4]
load net ARMcore|EMReg_ALUOutM[5] -attr @rip ALUOutM[5] -attr @name EMReg_ALUOutM[5] -pin ARMcore|EMReg ALUOutM[5] -pin ARMcore|MWReg ALUOutM[5] -pin ARMcore|MemOrIO addr_in[5] -pin ARMcore|SA_i I2[5] -pin ARMcore|SB_i I2[5]
load net ARMcore|EMReg_ALUOutM[6] -attr @rip ALUOutM[6] -attr @name EMReg_ALUOutM[6] -pin ARMcore|EMReg ALUOutM[6] -pin ARMcore|MWReg ALUOutM[6] -pin ARMcore|MemOrIO addr_in[6] -pin ARMcore|SA_i I2[6] -pin ARMcore|SB_i I2[6]
load net ARMcore|EMReg_ALUOutM[7] -attr @rip ALUOutM[7] -attr @name EMReg_ALUOutM[7] -pin ARMcore|EMReg ALUOutM[7] -pin ARMcore|MWReg ALUOutM[7] -pin ARMcore|MemOrIO addr_in[7] -pin ARMcore|SA_i I2[7] -pin ARMcore|SB_i I2[7]
load net ARMcore|EMReg_ALUOutM[8] -attr @rip ALUOutM[8] -attr @name EMReg_ALUOutM[8] -pin ARMcore|EMReg ALUOutM[8] -pin ARMcore|MWReg ALUOutM[8] -pin ARMcore|MemOrIO addr_in[8] -pin ARMcore|SA_i I2[8] -pin ARMcore|SB_i I2[8]
load net ARMcore|EMReg_ALUOutM[9] -attr @rip ALUOutM[9] -attr @name EMReg_ALUOutM[9] -pin ARMcore|EMReg ALUOutM[9] -pin ARMcore|MWReg ALUOutM[9] -pin ARMcore|MemOrIO addr_in[9] -pin ARMcore|SA_i I2[9] -pin ARMcore|SB_i I2[9]
load net ARMcore|EMReg_ALUResultE0_i_n_0 -attr @rip O[31] -attr @name EMReg_ALUResultE0_i_n_0 -pin ARMcore|EMReg_ALUResultE0_i O[31] -pin ARMcore|EMReg_ALUResultE_i I1[31]
load net ARMcore|EMReg_ALUResultE0_i_n_1 -attr @rip O[30] -attr @name EMReg_ALUResultE0_i_n_1 -pin ARMcore|EMReg_ALUResultE0_i O[30] -pin ARMcore|EMReg_ALUResultE_i I1[30]
load net ARMcore|EMReg_ALUResultE0_i_n_10 -attr @rip O[21] -attr @name EMReg_ALUResultE0_i_n_10 -pin ARMcore|EMReg_ALUResultE0_i O[21] -pin ARMcore|EMReg_ALUResultE_i I1[21]
load net ARMcore|EMReg_ALUResultE0_i_n_11 -attr @rip O[20] -attr @name EMReg_ALUResultE0_i_n_11 -pin ARMcore|EMReg_ALUResultE0_i O[20] -pin ARMcore|EMReg_ALUResultE_i I1[20]
load net ARMcore|EMReg_ALUResultE0_i_n_12 -attr @rip O[19] -attr @name EMReg_ALUResultE0_i_n_12 -pin ARMcore|EMReg_ALUResultE0_i O[19] -pin ARMcore|EMReg_ALUResultE_i I1[19]
load net ARMcore|EMReg_ALUResultE0_i_n_13 -attr @rip O[18] -attr @name EMReg_ALUResultE0_i_n_13 -pin ARMcore|EMReg_ALUResultE0_i O[18] -pin ARMcore|EMReg_ALUResultE_i I1[18]
load net ARMcore|EMReg_ALUResultE0_i_n_14 -attr @rip O[17] -attr @name EMReg_ALUResultE0_i_n_14 -pin ARMcore|EMReg_ALUResultE0_i O[17] -pin ARMcore|EMReg_ALUResultE_i I1[17]
load net ARMcore|EMReg_ALUResultE0_i_n_15 -attr @rip O[16] -attr @name EMReg_ALUResultE0_i_n_15 -pin ARMcore|EMReg_ALUResultE0_i O[16] -pin ARMcore|EMReg_ALUResultE_i I1[16]
load net ARMcore|EMReg_ALUResultE0_i_n_16 -attr @rip O[15] -attr @name EMReg_ALUResultE0_i_n_16 -pin ARMcore|EMReg_ALUResultE0_i O[15] -pin ARMcore|EMReg_ALUResultE_i I1[15]
load net ARMcore|EMReg_ALUResultE0_i_n_17 -attr @rip O[14] -attr @name EMReg_ALUResultE0_i_n_17 -pin ARMcore|EMReg_ALUResultE0_i O[14] -pin ARMcore|EMReg_ALUResultE_i I1[14]
load net ARMcore|EMReg_ALUResultE0_i_n_18 -attr @rip O[13] -attr @name EMReg_ALUResultE0_i_n_18 -pin ARMcore|EMReg_ALUResultE0_i O[13] -pin ARMcore|EMReg_ALUResultE_i I1[13]
load net ARMcore|EMReg_ALUResultE0_i_n_19 -attr @rip O[12] -attr @name EMReg_ALUResultE0_i_n_19 -pin ARMcore|EMReg_ALUResultE0_i O[12] -pin ARMcore|EMReg_ALUResultE_i I1[12]
load net ARMcore|EMReg_ALUResultE0_i_n_2 -attr @rip O[29] -attr @name EMReg_ALUResultE0_i_n_2 -pin ARMcore|EMReg_ALUResultE0_i O[29] -pin ARMcore|EMReg_ALUResultE_i I1[29]
load net ARMcore|EMReg_ALUResultE0_i_n_20 -attr @rip O[11] -attr @name EMReg_ALUResultE0_i_n_20 -pin ARMcore|EMReg_ALUResultE0_i O[11] -pin ARMcore|EMReg_ALUResultE_i I1[11]
load net ARMcore|EMReg_ALUResultE0_i_n_21 -attr @rip O[10] -attr @name EMReg_ALUResultE0_i_n_21 -pin ARMcore|EMReg_ALUResultE0_i O[10] -pin ARMcore|EMReg_ALUResultE_i I1[10]
load net ARMcore|EMReg_ALUResultE0_i_n_22 -attr @rip O[9] -attr @name EMReg_ALUResultE0_i_n_22 -pin ARMcore|EMReg_ALUResultE0_i O[9] -pin ARMcore|EMReg_ALUResultE_i I1[9]
load net ARMcore|EMReg_ALUResultE0_i_n_23 -attr @rip O[8] -attr @name EMReg_ALUResultE0_i_n_23 -pin ARMcore|EMReg_ALUResultE0_i O[8] -pin ARMcore|EMReg_ALUResultE_i I1[8]
load net ARMcore|EMReg_ALUResultE0_i_n_24 -attr @rip O[7] -attr @name EMReg_ALUResultE0_i_n_24 -pin ARMcore|EMReg_ALUResultE0_i O[7] -pin ARMcore|EMReg_ALUResultE_i I1[7]
load net ARMcore|EMReg_ALUResultE0_i_n_25 -attr @rip O[6] -attr @name EMReg_ALUResultE0_i_n_25 -pin ARMcore|EMReg_ALUResultE0_i O[6] -pin ARMcore|EMReg_ALUResultE_i I1[6]
load net ARMcore|EMReg_ALUResultE0_i_n_26 -attr @rip O[5] -attr @name EMReg_ALUResultE0_i_n_26 -pin ARMcore|EMReg_ALUResultE0_i O[5] -pin ARMcore|EMReg_ALUResultE_i I1[5]
load net ARMcore|EMReg_ALUResultE0_i_n_27 -attr @rip O[4] -attr @name EMReg_ALUResultE0_i_n_27 -pin ARMcore|EMReg_ALUResultE0_i O[4] -pin ARMcore|EMReg_ALUResultE_i I1[4]
load net ARMcore|EMReg_ALUResultE0_i_n_28 -attr @rip O[3] -attr @name EMReg_ALUResultE0_i_n_28 -pin ARMcore|EMReg_ALUResultE0_i O[3] -pin ARMcore|EMReg_ALUResultE_i I1[3]
load net ARMcore|EMReg_ALUResultE0_i_n_29 -attr @rip O[2] -attr @name EMReg_ALUResultE0_i_n_29 -pin ARMcore|EMReg_ALUResultE0_i O[2] -pin ARMcore|EMReg_ALUResultE_i I1[2]
load net ARMcore|EMReg_ALUResultE0_i_n_3 -attr @rip O[28] -attr @name EMReg_ALUResultE0_i_n_3 -pin ARMcore|EMReg_ALUResultE0_i O[28] -pin ARMcore|EMReg_ALUResultE_i I1[28]
load net ARMcore|EMReg_ALUResultE0_i_n_30 -attr @rip O[1] -attr @name EMReg_ALUResultE0_i_n_30 -pin ARMcore|EMReg_ALUResultE0_i O[1] -pin ARMcore|EMReg_ALUResultE_i I1[1]
load net ARMcore|EMReg_ALUResultE0_i_n_31 -attr @rip O[0] -attr @name EMReg_ALUResultE0_i_n_31 -pin ARMcore|EMReg_ALUResultE0_i O[0] -pin ARMcore|EMReg_ALUResultE_i I1[0]
load net ARMcore|EMReg_ALUResultE0_i_n_4 -attr @rip O[27] -attr @name EMReg_ALUResultE0_i_n_4 -pin ARMcore|EMReg_ALUResultE0_i O[27] -pin ARMcore|EMReg_ALUResultE_i I1[27]
load net ARMcore|EMReg_ALUResultE0_i_n_5 -attr @rip O[26] -attr @name EMReg_ALUResultE0_i_n_5 -pin ARMcore|EMReg_ALUResultE0_i O[26] -pin ARMcore|EMReg_ALUResultE_i I1[26]
load net ARMcore|EMReg_ALUResultE0_i_n_6 -attr @rip O[25] -attr @name EMReg_ALUResultE0_i_n_6 -pin ARMcore|EMReg_ALUResultE0_i O[25] -pin ARMcore|EMReg_ALUResultE_i I1[25]
load net ARMcore|EMReg_ALUResultE0_i_n_7 -attr @rip O[24] -attr @name EMReg_ALUResultE0_i_n_7 -pin ARMcore|EMReg_ALUResultE0_i O[24] -pin ARMcore|EMReg_ALUResultE_i I1[24]
load net ARMcore|EMReg_ALUResultE0_i_n_8 -attr @rip O[23] -attr @name EMReg_ALUResultE0_i_n_8 -pin ARMcore|EMReg_ALUResultE0_i O[23] -pin ARMcore|EMReg_ALUResultE_i I1[23]
load net ARMcore|EMReg_ALUResultE0_i_n_9 -attr @rip O[22] -attr @name EMReg_ALUResultE0_i_n_9 -pin ARMcore|EMReg_ALUResultE0_i O[22] -pin ARMcore|EMReg_ALUResultE_i I1[22]
load net ARMcore|EMReg_ALUResultE1 -attr @name EMReg_ALUResultE1 -pin ARMcore|EMReg_ALUResultE1_i__0 O -pin ARMcore|EMReg_ALUResultE_i S
netloc ARMcore|EMReg_ALUResultE1 1 16 1 9740 1738n
load net ARMcore|EMReg_ALUResultE1_i_n_0 -attr @rip O[31] -attr @name EMReg_ALUResultE1_i_n_0 -pin ARMcore|EMReg_ALUResultE0_i I1[31] -pin ARMcore|EMReg_ALUResultE1_i O[31]
load net ARMcore|EMReg_ALUResultE1_i_n_1 -attr @rip O[30] -attr @name EMReg_ALUResultE1_i_n_1 -pin ARMcore|EMReg_ALUResultE0_i I1[30] -pin ARMcore|EMReg_ALUResultE1_i O[30]
load net ARMcore|EMReg_ALUResultE1_i_n_10 -attr @rip O[21] -attr @name EMReg_ALUResultE1_i_n_10 -pin ARMcore|EMReg_ALUResultE0_i I1[21] -pin ARMcore|EMReg_ALUResultE1_i O[21]
load net ARMcore|EMReg_ALUResultE1_i_n_11 -attr @rip O[20] -attr @name EMReg_ALUResultE1_i_n_11 -pin ARMcore|EMReg_ALUResultE0_i I1[20] -pin ARMcore|EMReg_ALUResultE1_i O[20]
load net ARMcore|EMReg_ALUResultE1_i_n_12 -attr @rip O[19] -attr @name EMReg_ALUResultE1_i_n_12 -pin ARMcore|EMReg_ALUResultE0_i I1[19] -pin ARMcore|EMReg_ALUResultE1_i O[19]
load net ARMcore|EMReg_ALUResultE1_i_n_13 -attr @rip O[18] -attr @name EMReg_ALUResultE1_i_n_13 -pin ARMcore|EMReg_ALUResultE0_i I1[18] -pin ARMcore|EMReg_ALUResultE1_i O[18]
load net ARMcore|EMReg_ALUResultE1_i_n_14 -attr @rip O[17] -attr @name EMReg_ALUResultE1_i_n_14 -pin ARMcore|EMReg_ALUResultE0_i I1[17] -pin ARMcore|EMReg_ALUResultE1_i O[17]
load net ARMcore|EMReg_ALUResultE1_i_n_15 -attr @rip O[16] -attr @name EMReg_ALUResultE1_i_n_15 -pin ARMcore|EMReg_ALUResultE0_i I1[16] -pin ARMcore|EMReg_ALUResultE1_i O[16]
load net ARMcore|EMReg_ALUResultE1_i_n_16 -attr @rip O[15] -attr @name EMReg_ALUResultE1_i_n_16 -pin ARMcore|EMReg_ALUResultE0_i I1[15] -pin ARMcore|EMReg_ALUResultE1_i O[15]
load net ARMcore|EMReg_ALUResultE1_i_n_17 -attr @rip O[14] -attr @name EMReg_ALUResultE1_i_n_17 -pin ARMcore|EMReg_ALUResultE0_i I1[14] -pin ARMcore|EMReg_ALUResultE1_i O[14]
load net ARMcore|EMReg_ALUResultE1_i_n_18 -attr @rip O[13] -attr @name EMReg_ALUResultE1_i_n_18 -pin ARMcore|EMReg_ALUResultE0_i I1[13] -pin ARMcore|EMReg_ALUResultE1_i O[13]
load net ARMcore|EMReg_ALUResultE1_i_n_19 -attr @rip O[12] -attr @name EMReg_ALUResultE1_i_n_19 -pin ARMcore|EMReg_ALUResultE0_i I1[12] -pin ARMcore|EMReg_ALUResultE1_i O[12]
load net ARMcore|EMReg_ALUResultE1_i_n_2 -attr @rip O[29] -attr @name EMReg_ALUResultE1_i_n_2 -pin ARMcore|EMReg_ALUResultE0_i I1[29] -pin ARMcore|EMReg_ALUResultE1_i O[29]
load net ARMcore|EMReg_ALUResultE1_i_n_20 -attr @rip O[11] -attr @name EMReg_ALUResultE1_i_n_20 -pin ARMcore|EMReg_ALUResultE0_i I1[11] -pin ARMcore|EMReg_ALUResultE1_i O[11]
load net ARMcore|EMReg_ALUResultE1_i_n_21 -attr @rip O[10] -attr @name EMReg_ALUResultE1_i_n_21 -pin ARMcore|EMReg_ALUResultE0_i I1[10] -pin ARMcore|EMReg_ALUResultE1_i O[10]
load net ARMcore|EMReg_ALUResultE1_i_n_22 -attr @rip O[9] -attr @name EMReg_ALUResultE1_i_n_22 -pin ARMcore|EMReg_ALUResultE0_i I1[9] -pin ARMcore|EMReg_ALUResultE1_i O[9]
load net ARMcore|EMReg_ALUResultE1_i_n_23 -attr @rip O[8] -attr @name EMReg_ALUResultE1_i_n_23 -pin ARMcore|EMReg_ALUResultE0_i I1[8] -pin ARMcore|EMReg_ALUResultE1_i O[8]
load net ARMcore|EMReg_ALUResultE1_i_n_24 -attr @rip O[7] -attr @name EMReg_ALUResultE1_i_n_24 -pin ARMcore|EMReg_ALUResultE0_i I1[7] -pin ARMcore|EMReg_ALUResultE1_i O[7]
load net ARMcore|EMReg_ALUResultE1_i_n_25 -attr @rip O[6] -attr @name EMReg_ALUResultE1_i_n_25 -pin ARMcore|EMReg_ALUResultE0_i I1[6] -pin ARMcore|EMReg_ALUResultE1_i O[6]
load net ARMcore|EMReg_ALUResultE1_i_n_26 -attr @rip O[5] -attr @name EMReg_ALUResultE1_i_n_26 -pin ARMcore|EMReg_ALUResultE0_i I1[5] -pin ARMcore|EMReg_ALUResultE1_i O[5]
load net ARMcore|EMReg_ALUResultE1_i_n_27 -attr @rip O[4] -attr @name EMReg_ALUResultE1_i_n_27 -pin ARMcore|EMReg_ALUResultE0_i I1[4] -pin ARMcore|EMReg_ALUResultE1_i O[4]
load net ARMcore|EMReg_ALUResultE1_i_n_28 -attr @rip O[3] -attr @name EMReg_ALUResultE1_i_n_28 -pin ARMcore|EMReg_ALUResultE0_i I1[3] -pin ARMcore|EMReg_ALUResultE1_i O[3]
load net ARMcore|EMReg_ALUResultE1_i_n_29 -attr @rip O[2] -attr @name EMReg_ALUResultE1_i_n_29 -pin ARMcore|EMReg_ALUResultE0_i I1[2] -pin ARMcore|EMReg_ALUResultE1_i O[2]
load net ARMcore|EMReg_ALUResultE1_i_n_3 -attr @rip O[28] -attr @name EMReg_ALUResultE1_i_n_3 -pin ARMcore|EMReg_ALUResultE0_i I1[28] -pin ARMcore|EMReg_ALUResultE1_i O[28]
load net ARMcore|EMReg_ALUResultE1_i_n_30 -attr @rip O[1] -attr @name EMReg_ALUResultE1_i_n_30 -pin ARMcore|EMReg_ALUResultE0_i I1[1] -pin ARMcore|EMReg_ALUResultE1_i O[1]
load net ARMcore|EMReg_ALUResultE1_i_n_31 -attr @rip O[0] -attr @name EMReg_ALUResultE1_i_n_31 -pin ARMcore|EMReg_ALUResultE0_i I1[0] -pin ARMcore|EMReg_ALUResultE1_i O[0]
load net ARMcore|EMReg_ALUResultE1_i_n_4 -attr @rip O[27] -attr @name EMReg_ALUResultE1_i_n_4 -pin ARMcore|EMReg_ALUResultE0_i I1[27] -pin ARMcore|EMReg_ALUResultE1_i O[27]
load net ARMcore|EMReg_ALUResultE1_i_n_5 -attr @rip O[26] -attr @name EMReg_ALUResultE1_i_n_5 -pin ARMcore|EMReg_ALUResultE0_i I1[26] -pin ARMcore|EMReg_ALUResultE1_i O[26]
load net ARMcore|EMReg_ALUResultE1_i_n_6 -attr @rip O[25] -attr @name EMReg_ALUResultE1_i_n_6 -pin ARMcore|EMReg_ALUResultE0_i I1[25] -pin ARMcore|EMReg_ALUResultE1_i O[25]
load net ARMcore|EMReg_ALUResultE1_i_n_7 -attr @rip O[24] -attr @name EMReg_ALUResultE1_i_n_7 -pin ARMcore|EMReg_ALUResultE0_i I1[24] -pin ARMcore|EMReg_ALUResultE1_i O[24]
load net ARMcore|EMReg_ALUResultE1_i_n_8 -attr @rip O[23] -attr @name EMReg_ALUResultE1_i_n_8 -pin ARMcore|EMReg_ALUResultE0_i I1[23] -pin ARMcore|EMReg_ALUResultE1_i O[23]
load net ARMcore|EMReg_ALUResultE1_i_n_9 -attr @rip O[22] -attr @name EMReg_ALUResultE1_i_n_9 -pin ARMcore|EMReg_ALUResultE0_i I1[22] -pin ARMcore|EMReg_ALUResultE1_i O[22]
load net ARMcore|EMReg_ALUResultE[0] -attr @rip O[0] -attr @name EMReg_ALUResultE[0] -pin ARMcore|EMReg ALUResultE[0] -pin ARMcore|EMReg_ALUResultE_i O[0]
load net ARMcore|EMReg_ALUResultE[10] -attr @rip O[10] -attr @name EMReg_ALUResultE[10] -pin ARMcore|EMReg ALUResultE[10] -pin ARMcore|EMReg_ALUResultE_i O[10]
load net ARMcore|EMReg_ALUResultE[11] -attr @rip O[11] -attr @name EMReg_ALUResultE[11] -pin ARMcore|EMReg ALUResultE[11] -pin ARMcore|EMReg_ALUResultE_i O[11]
load net ARMcore|EMReg_ALUResultE[12] -attr @rip O[12] -attr @name EMReg_ALUResultE[12] -pin ARMcore|EMReg ALUResultE[12] -pin ARMcore|EMReg_ALUResultE_i O[12]
load net ARMcore|EMReg_ALUResultE[13] -attr @rip O[13] -attr @name EMReg_ALUResultE[13] -pin ARMcore|EMReg ALUResultE[13] -pin ARMcore|EMReg_ALUResultE_i O[13]
load net ARMcore|EMReg_ALUResultE[14] -attr @rip O[14] -attr @name EMReg_ALUResultE[14] -pin ARMcore|EMReg ALUResultE[14] -pin ARMcore|EMReg_ALUResultE_i O[14]
load net ARMcore|EMReg_ALUResultE[15] -attr @rip O[15] -attr @name EMReg_ALUResultE[15] -pin ARMcore|EMReg ALUResultE[15] -pin ARMcore|EMReg_ALUResultE_i O[15]
load net ARMcore|EMReg_ALUResultE[16] -attr @rip O[16] -attr @name EMReg_ALUResultE[16] -pin ARMcore|EMReg ALUResultE[16] -pin ARMcore|EMReg_ALUResultE_i O[16]
load net ARMcore|EMReg_ALUResultE[17] -attr @rip O[17] -attr @name EMReg_ALUResultE[17] -pin ARMcore|EMReg ALUResultE[17] -pin ARMcore|EMReg_ALUResultE_i O[17]
load net ARMcore|EMReg_ALUResultE[18] -attr @rip O[18] -attr @name EMReg_ALUResultE[18] -pin ARMcore|EMReg ALUResultE[18] -pin ARMcore|EMReg_ALUResultE_i O[18]
load net ARMcore|EMReg_ALUResultE[19] -attr @rip O[19] -attr @name EMReg_ALUResultE[19] -pin ARMcore|EMReg ALUResultE[19] -pin ARMcore|EMReg_ALUResultE_i O[19]
load net ARMcore|EMReg_ALUResultE[1] -attr @rip O[1] -attr @name EMReg_ALUResultE[1] -pin ARMcore|EMReg ALUResultE[1] -pin ARMcore|EMReg_ALUResultE_i O[1]
load net ARMcore|EMReg_ALUResultE[20] -attr @rip O[20] -attr @name EMReg_ALUResultE[20] -pin ARMcore|EMReg ALUResultE[20] -pin ARMcore|EMReg_ALUResultE_i O[20]
load net ARMcore|EMReg_ALUResultE[21] -attr @rip O[21] -attr @name EMReg_ALUResultE[21] -pin ARMcore|EMReg ALUResultE[21] -pin ARMcore|EMReg_ALUResultE_i O[21]
load net ARMcore|EMReg_ALUResultE[22] -attr @rip O[22] -attr @name EMReg_ALUResultE[22] -pin ARMcore|EMReg ALUResultE[22] -pin ARMcore|EMReg_ALUResultE_i O[22]
load net ARMcore|EMReg_ALUResultE[23] -attr @rip O[23] -attr @name EMReg_ALUResultE[23] -pin ARMcore|EMReg ALUResultE[23] -pin ARMcore|EMReg_ALUResultE_i O[23]
load net ARMcore|EMReg_ALUResultE[24] -attr @rip O[24] -attr @name EMReg_ALUResultE[24] -pin ARMcore|EMReg ALUResultE[24] -pin ARMcore|EMReg_ALUResultE_i O[24]
load net ARMcore|EMReg_ALUResultE[25] -attr @rip O[25] -attr @name EMReg_ALUResultE[25] -pin ARMcore|EMReg ALUResultE[25] -pin ARMcore|EMReg_ALUResultE_i O[25]
load net ARMcore|EMReg_ALUResultE[26] -attr @rip O[26] -attr @name EMReg_ALUResultE[26] -pin ARMcore|EMReg ALUResultE[26] -pin ARMcore|EMReg_ALUResultE_i O[26]
load net ARMcore|EMReg_ALUResultE[27] -attr @rip O[27] -attr @name EMReg_ALUResultE[27] -pin ARMcore|EMReg ALUResultE[27] -pin ARMcore|EMReg_ALUResultE_i O[27]
load net ARMcore|EMReg_ALUResultE[28] -attr @rip O[28] -attr @name EMReg_ALUResultE[28] -pin ARMcore|EMReg ALUResultE[28] -pin ARMcore|EMReg_ALUResultE_i O[28]
load net ARMcore|EMReg_ALUResultE[29] -attr @rip O[29] -attr @name EMReg_ALUResultE[29] -pin ARMcore|EMReg ALUResultE[29] -pin ARMcore|EMReg_ALUResultE_i O[29]
load net ARMcore|EMReg_ALUResultE[2] -attr @rip O[2] -attr @name EMReg_ALUResultE[2] -pin ARMcore|EMReg ALUResultE[2] -pin ARMcore|EMReg_ALUResultE_i O[2]
load net ARMcore|EMReg_ALUResultE[30] -attr @rip O[30] -attr @name EMReg_ALUResultE[30] -pin ARMcore|EMReg ALUResultE[30] -pin ARMcore|EMReg_ALUResultE_i O[30]
load net ARMcore|EMReg_ALUResultE[31] -attr @rip O[31] -attr @name EMReg_ALUResultE[31] -pin ARMcore|EMReg ALUResultE[31] -pin ARMcore|EMReg_ALUResultE_i O[31]
load net ARMcore|EMReg_ALUResultE[3] -attr @rip O[3] -attr @name EMReg_ALUResultE[3] -pin ARMcore|EMReg ALUResultE[3] -pin ARMcore|EMReg_ALUResultE_i O[3]
load net ARMcore|EMReg_ALUResultE[4] -attr @rip O[4] -attr @name EMReg_ALUResultE[4] -pin ARMcore|EMReg ALUResultE[4] -pin ARMcore|EMReg_ALUResultE_i O[4]
load net ARMcore|EMReg_ALUResultE[5] -attr @rip O[5] -attr @name EMReg_ALUResultE[5] -pin ARMcore|EMReg ALUResultE[5] -pin ARMcore|EMReg_ALUResultE_i O[5]
load net ARMcore|EMReg_ALUResultE[6] -attr @rip O[6] -attr @name EMReg_ALUResultE[6] -pin ARMcore|EMReg ALUResultE[6] -pin ARMcore|EMReg_ALUResultE_i O[6]
load net ARMcore|EMReg_ALUResultE[7] -attr @rip O[7] -attr @name EMReg_ALUResultE[7] -pin ARMcore|EMReg ALUResultE[7] -pin ARMcore|EMReg_ALUResultE_i O[7]
load net ARMcore|EMReg_ALUResultE[8] -attr @rip O[8] -attr @name EMReg_ALUResultE[8] -pin ARMcore|EMReg ALUResultE[8] -pin ARMcore|EMReg_ALUResultE_i O[8]
load net ARMcore|EMReg_ALUResultE[9] -attr @rip O[9] -attr @name EMReg_ALUResultE[9] -pin ARMcore|EMReg ALUResultE[9] -pin ARMcore|EMReg_ALUResultE_i O[9]
load net ARMcore|EMReg_EN -attr @name EMReg_EN -pin ARMcore|EMReg EN -pin ARMcore|EMReg_EN_i O
netloc ARMcore|EMReg_EN 1 17 1 10190 878n
load net ARMcore|EMReg_MemtoRegM -attr @name EMReg_MemtoRegM -pin ARMcore|Cache_Valid0_i I0 -pin ARMcore|EMReg MemtoRegM -pin ARMcore|HazardUnit MemtoRegM -pin ARMcore|MWReg MemtoRegM
netloc ARMcore|EMReg_MemtoRegM 1 3 16 2070 2128 NJ 2128 2890J 2248 NJ 2248 NJ 2248 NJ 2248 NJ 2248 NJ 2248 NJ 2248 NJ 2248 NJ 2248 NJ 2248 9040 1358 NJ 1358 10090J 1338 10710
load net ARMcore|EMReg_RegWriteE -attr @name EMReg_RegWriteE -pin ARMcore|EMReg RegWriteE -pin ARMcore|EMReg_RegWriteE_i O
netloc ARMcore|EMReg_RegWriteE 1 17 1 10170 1558n
load net ARMcore|EMReg_RegWriteE0 -attr @name EMReg_RegWriteE0 -pin ARMcore|EMReg_RegWriteE0_i O -pin ARMcore|EMReg_RegWriteE_i I0
netloc ARMcore|EMReg_RegWriteE0 1 16 1 9700 1558n
load net ARMcore|EMReg_RegWriteE0_i__0_n_0 -attr @name EMReg_RegWriteE0_i__0_n_0 -pin ARMcore|EMReg_RegWriteE0_i__0 O -pin ARMcore|EMReg_RegWriteE_i I1
netloc ARMcore|EMReg_RegWriteE0_i__0_n_0 1 16 1 9740 1288n
load net ARMcore|EMReg_RegWriteE1 -attr @name EMReg_RegWriteE1 -pin ARMcore|EMReg_RegWriteE0_i I0 -pin ARMcore|EMReg_RegWriteE1_i O
netloc ARMcore|EMReg_RegWriteE1 1 15 1 9100 1738n
load net ARMcore|EMReg_RegWriteE1_i__0_n_0 -attr @name EMReg_RegWriteE1_i__0_n_0 -pin ARMcore|EMReg_RegWriteE0_i I1 -pin ARMcore|EMReg_RegWriteE1_i__0 O
netloc ARMcore|EMReg_RegWriteE1_i__0_n_0 1 15 1 9220 1758n
load net ARMcore|EMReg_RegWriteE2 -attr @name EMReg_RegWriteE2 -pin ARMcore|EMReg_RegWriteE0_i__0 I0 -pin ARMcore|EMReg_RegWriteE2_i O
netloc ARMcore|EMReg_RegWriteE2 1 15 1 9080 1118n
load net ARMcore|EMReg_RegWriteE3 -attr @name EMReg_RegWriteE3 -pin ARMcore|EMReg_RegWriteE1_i__0 I0 -pin ARMcore|EMReg_RegWriteE3_i O
netloc ARMcore|EMReg_RegWriteE3 1 14 1 8100 1978n
load net ARMcore|EMReg_WA3E0_i_n_0 -attr @rip O[3] -attr @name EMReg_WA3E0_i_n_0 -pin ARMcore|EMReg_WA3E0_i O[3] -pin ARMcore|EMReg_WA3E_i I1[3]
load net ARMcore|EMReg_WA3E0_i_n_1 -attr @rip O[2] -attr @name EMReg_WA3E0_i_n_1 -pin ARMcore|EMReg_WA3E0_i O[2] -pin ARMcore|EMReg_WA3E_i I1[2]
load net ARMcore|EMReg_WA3E0_i_n_2 -attr @rip O[1] -attr @name EMReg_WA3E0_i_n_2 -pin ARMcore|EMReg_WA3E0_i O[1] -pin ARMcore|EMReg_WA3E_i I1[1]
load net ARMcore|EMReg_WA3E0_i_n_3 -attr @rip O[0] -attr @name EMReg_WA3E0_i_n_3 -pin ARMcore|EMReg_WA3E0_i O[0] -pin ARMcore|EMReg_WA3E_i I1[0]
load net ARMcore|EMReg_WA3E[0] -attr @rip O[0] -attr @name EMReg_WA3E[0] -pin ARMcore|EMReg WA3E[0] -pin ARMcore|EMReg_WA3E_i O[0] -pin ARMcore|HazardUnit WA3E[0]
load net ARMcore|EMReg_WA3E[1] -attr @rip O[1] -attr @name EMReg_WA3E[1] -pin ARMcore|EMReg WA3E[1] -pin ARMcore|EMReg_WA3E_i O[1] -pin ARMcore|HazardUnit WA3E[1]
load net ARMcore|EMReg_WA3E[2] -attr @rip O[2] -attr @name EMReg_WA3E[2] -pin ARMcore|EMReg WA3E[2] -pin ARMcore|EMReg_WA3E_i O[2] -pin ARMcore|HazardUnit WA3E[2]
load net ARMcore|EMReg_WA3E[3] -attr @rip O[3] -attr @name EMReg_WA3E[3] -pin ARMcore|EMReg WA3E[3] -pin ARMcore|EMReg_WA3E_i O[3] -pin ARMcore|HazardUnit WA3E[3]
load net ARMcore|EMReg_WriteDataM[0] -attr @rip WriteDataM[0] -attr @name EMReg_WriteDataM[0] -pin ARMcore|EMReg WriteDataM[0] -pin ARMcore|MemOrIO_r_rdata_i I1[0]
load net ARMcore|EMReg_WriteDataM[10] -attr @rip WriteDataM[10] -attr @name EMReg_WriteDataM[10] -pin ARMcore|EMReg WriteDataM[10] -pin ARMcore|MemOrIO_r_rdata_i I1[10]
load net ARMcore|EMReg_WriteDataM[11] -attr @rip WriteDataM[11] -attr @name EMReg_WriteDataM[11] -pin ARMcore|EMReg WriteDataM[11] -pin ARMcore|MemOrIO_r_rdata_i I1[11]
load net ARMcore|EMReg_WriteDataM[12] -attr @rip WriteDataM[12] -attr @name EMReg_WriteDataM[12] -pin ARMcore|EMReg WriteDataM[12] -pin ARMcore|MemOrIO_r_rdata_i I1[12]
load net ARMcore|EMReg_WriteDataM[13] -attr @rip WriteDataM[13] -attr @name EMReg_WriteDataM[13] -pin ARMcore|EMReg WriteDataM[13] -pin ARMcore|MemOrIO_r_rdata_i I1[13]
load net ARMcore|EMReg_WriteDataM[14] -attr @rip WriteDataM[14] -attr @name EMReg_WriteDataM[14] -pin ARMcore|EMReg WriteDataM[14] -pin ARMcore|MemOrIO_r_rdata_i I1[14]
load net ARMcore|EMReg_WriteDataM[15] -attr @rip WriteDataM[15] -attr @name EMReg_WriteDataM[15] -pin ARMcore|EMReg WriteDataM[15] -pin ARMcore|MemOrIO_r_rdata_i I1[15]
load net ARMcore|EMReg_WriteDataM[16] -attr @rip WriteDataM[16] -attr @name EMReg_WriteDataM[16] -pin ARMcore|EMReg WriteDataM[16] -pin ARMcore|MemOrIO_r_rdata_i I1[16]
load net ARMcore|EMReg_WriteDataM[17] -attr @rip WriteDataM[17] -attr @name EMReg_WriteDataM[17] -pin ARMcore|EMReg WriteDataM[17] -pin ARMcore|MemOrIO_r_rdata_i I1[17]
load net ARMcore|EMReg_WriteDataM[18] -attr @rip WriteDataM[18] -attr @name EMReg_WriteDataM[18] -pin ARMcore|EMReg WriteDataM[18] -pin ARMcore|MemOrIO_r_rdata_i I1[18]
load net ARMcore|EMReg_WriteDataM[19] -attr @rip WriteDataM[19] -attr @name EMReg_WriteDataM[19] -pin ARMcore|EMReg WriteDataM[19] -pin ARMcore|MemOrIO_r_rdata_i I1[19]
load net ARMcore|EMReg_WriteDataM[1] -attr @rip WriteDataM[1] -attr @name EMReg_WriteDataM[1] -pin ARMcore|EMReg WriteDataM[1] -pin ARMcore|MemOrIO_r_rdata_i I1[1]
load net ARMcore|EMReg_WriteDataM[20] -attr @rip WriteDataM[20] -attr @name EMReg_WriteDataM[20] -pin ARMcore|EMReg WriteDataM[20] -pin ARMcore|MemOrIO_r_rdata_i I1[20]
load net ARMcore|EMReg_WriteDataM[21] -attr @rip WriteDataM[21] -attr @name EMReg_WriteDataM[21] -pin ARMcore|EMReg WriteDataM[21] -pin ARMcore|MemOrIO_r_rdata_i I1[21]
load net ARMcore|EMReg_WriteDataM[22] -attr @rip WriteDataM[22] -attr @name EMReg_WriteDataM[22] -pin ARMcore|EMReg WriteDataM[22] -pin ARMcore|MemOrIO_r_rdata_i I1[22]
load net ARMcore|EMReg_WriteDataM[23] -attr @rip WriteDataM[23] -attr @name EMReg_WriteDataM[23] -pin ARMcore|EMReg WriteDataM[23] -pin ARMcore|MemOrIO_r_rdata_i I1[23]
load net ARMcore|EMReg_WriteDataM[24] -attr @rip WriteDataM[24] -attr @name EMReg_WriteDataM[24] -pin ARMcore|EMReg WriteDataM[24] -pin ARMcore|MemOrIO_r_rdata_i I1[24]
load net ARMcore|EMReg_WriteDataM[25] -attr @rip WriteDataM[25] -attr @name EMReg_WriteDataM[25] -pin ARMcore|EMReg WriteDataM[25] -pin ARMcore|MemOrIO_r_rdata_i I1[25]
load net ARMcore|EMReg_WriteDataM[26] -attr @rip WriteDataM[26] -attr @name EMReg_WriteDataM[26] -pin ARMcore|EMReg WriteDataM[26] -pin ARMcore|MemOrIO_r_rdata_i I1[26]
load net ARMcore|EMReg_WriteDataM[27] -attr @rip WriteDataM[27] -attr @name EMReg_WriteDataM[27] -pin ARMcore|EMReg WriteDataM[27] -pin ARMcore|MemOrIO_r_rdata_i I1[27]
load net ARMcore|EMReg_WriteDataM[28] -attr @rip WriteDataM[28] -attr @name EMReg_WriteDataM[28] -pin ARMcore|EMReg WriteDataM[28] -pin ARMcore|MemOrIO_r_rdata_i I1[28]
load net ARMcore|EMReg_WriteDataM[29] -attr @rip WriteDataM[29] -attr @name EMReg_WriteDataM[29] -pin ARMcore|EMReg WriteDataM[29] -pin ARMcore|MemOrIO_r_rdata_i I1[29]
load net ARMcore|EMReg_WriteDataM[2] -attr @rip WriteDataM[2] -attr @name EMReg_WriteDataM[2] -pin ARMcore|EMReg WriteDataM[2] -pin ARMcore|MemOrIO_r_rdata_i I1[2]
load net ARMcore|EMReg_WriteDataM[30] -attr @rip WriteDataM[30] -attr @name EMReg_WriteDataM[30] -pin ARMcore|EMReg WriteDataM[30] -pin ARMcore|MemOrIO_r_rdata_i I1[30]
load net ARMcore|EMReg_WriteDataM[31] -attr @rip WriteDataM[31] -attr @name EMReg_WriteDataM[31] -pin ARMcore|EMReg WriteDataM[31] -pin ARMcore|MemOrIO_r_rdata_i I1[31]
load net ARMcore|EMReg_WriteDataM[3] -attr @rip WriteDataM[3] -attr @name EMReg_WriteDataM[3] -pin ARMcore|EMReg WriteDataM[3] -pin ARMcore|MemOrIO_r_rdata_i I1[3]
load net ARMcore|EMReg_WriteDataM[4] -attr @rip WriteDataM[4] -attr @name EMReg_WriteDataM[4] -pin ARMcore|EMReg WriteDataM[4] -pin ARMcore|MemOrIO_r_rdata_i I1[4]
load net ARMcore|EMReg_WriteDataM[5] -attr @rip WriteDataM[5] -attr @name EMReg_WriteDataM[5] -pin ARMcore|EMReg WriteDataM[5] -pin ARMcore|MemOrIO_r_rdata_i I1[5]
load net ARMcore|EMReg_WriteDataM[6] -attr @rip WriteDataM[6] -attr @name EMReg_WriteDataM[6] -pin ARMcore|EMReg WriteDataM[6] -pin ARMcore|MemOrIO_r_rdata_i I1[6]
load net ARMcore|EMReg_WriteDataM[7] -attr @rip WriteDataM[7] -attr @name EMReg_WriteDataM[7] -pin ARMcore|EMReg WriteDataM[7] -pin ARMcore|MemOrIO_r_rdata_i I1[7]
load net ARMcore|EMReg_WriteDataM[8] -attr @rip WriteDataM[8] -attr @name EMReg_WriteDataM[8] -pin ARMcore|EMReg WriteDataM[8] -pin ARMcore|MemOrIO_r_rdata_i I1[8]
load net ARMcore|EMReg_WriteDataM[9] -attr @rip WriteDataM[9] -attr @name EMReg_WriteDataM[9] -pin ARMcore|EMReg WriteDataM[9] -pin ARMcore|MemOrIO_r_rdata_i I1[9]
load net ARMcore|Extend_ExtImm[0] -attr @rip ExtImm[0] -attr @name Extend_ExtImm[0] -pin ARMcore|DEReg ExtImmD[0] -pin ARMcore|Extend ExtImm[0]
load net ARMcore|Extend_ExtImm[10] -attr @rip ExtImm[10] -attr @name Extend_ExtImm[10] -pin ARMcore|DEReg ExtImmD[10] -pin ARMcore|Extend ExtImm[10]
load net ARMcore|Extend_ExtImm[11] -attr @rip ExtImm[11] -attr @name Extend_ExtImm[11] -pin ARMcore|DEReg ExtImmD[11] -pin ARMcore|Extend ExtImm[11]
load net ARMcore|Extend_ExtImm[12] -attr @rip ExtImm[12] -attr @name Extend_ExtImm[12] -pin ARMcore|DEReg ExtImmD[12] -pin ARMcore|Extend ExtImm[12]
load net ARMcore|Extend_ExtImm[13] -attr @rip ExtImm[13] -attr @name Extend_ExtImm[13] -pin ARMcore|DEReg ExtImmD[13] -pin ARMcore|Extend ExtImm[13]
load net ARMcore|Extend_ExtImm[14] -attr @rip ExtImm[14] -attr @name Extend_ExtImm[14] -pin ARMcore|DEReg ExtImmD[14] -pin ARMcore|Extend ExtImm[14]
load net ARMcore|Extend_ExtImm[15] -attr @rip ExtImm[15] -attr @name Extend_ExtImm[15] -pin ARMcore|DEReg ExtImmD[15] -pin ARMcore|Extend ExtImm[15]
load net ARMcore|Extend_ExtImm[16] -attr @rip ExtImm[16] -attr @name Extend_ExtImm[16] -pin ARMcore|DEReg ExtImmD[16] -pin ARMcore|Extend ExtImm[16]
load net ARMcore|Extend_ExtImm[17] -attr @rip ExtImm[17] -attr @name Extend_ExtImm[17] -pin ARMcore|DEReg ExtImmD[17] -pin ARMcore|Extend ExtImm[17]
load net ARMcore|Extend_ExtImm[18] -attr @rip ExtImm[18] -attr @name Extend_ExtImm[18] -pin ARMcore|DEReg ExtImmD[18] -pin ARMcore|Extend ExtImm[18]
load net ARMcore|Extend_ExtImm[19] -attr @rip ExtImm[19] -attr @name Extend_ExtImm[19] -pin ARMcore|DEReg ExtImmD[19] -pin ARMcore|Extend ExtImm[19]
load net ARMcore|Extend_ExtImm[1] -attr @rip ExtImm[1] -attr @name Extend_ExtImm[1] -pin ARMcore|DEReg ExtImmD[1] -pin ARMcore|Extend ExtImm[1]
load net ARMcore|Extend_ExtImm[20] -attr @rip ExtImm[20] -attr @name Extend_ExtImm[20] -pin ARMcore|DEReg ExtImmD[20] -pin ARMcore|Extend ExtImm[20]
load net ARMcore|Extend_ExtImm[21] -attr @rip ExtImm[21] -attr @name Extend_ExtImm[21] -pin ARMcore|DEReg ExtImmD[21] -pin ARMcore|Extend ExtImm[21]
load net ARMcore|Extend_ExtImm[22] -attr @rip ExtImm[22] -attr @name Extend_ExtImm[22] -pin ARMcore|DEReg ExtImmD[22] -pin ARMcore|Extend ExtImm[22]
load net ARMcore|Extend_ExtImm[23] -attr @rip ExtImm[23] -attr @name Extend_ExtImm[23] -pin ARMcore|DEReg ExtImmD[23] -pin ARMcore|Extend ExtImm[23]
load net ARMcore|Extend_ExtImm[24] -attr @rip ExtImm[24] -attr @name Extend_ExtImm[24] -pin ARMcore|DEReg ExtImmD[24] -pin ARMcore|Extend ExtImm[24]
load net ARMcore|Extend_ExtImm[25] -attr @rip ExtImm[25] -attr @name Extend_ExtImm[25] -pin ARMcore|DEReg ExtImmD[25] -pin ARMcore|Extend ExtImm[25]
load net ARMcore|Extend_ExtImm[26] -attr @rip ExtImm[26] -attr @name Extend_ExtImm[26] -pin ARMcore|DEReg ExtImmD[26] -pin ARMcore|Extend ExtImm[26]
load net ARMcore|Extend_ExtImm[27] -attr @rip ExtImm[27] -attr @name Extend_ExtImm[27] -pin ARMcore|DEReg ExtImmD[27] -pin ARMcore|Extend ExtImm[27]
load net ARMcore|Extend_ExtImm[28] -attr @rip ExtImm[28] -attr @name Extend_ExtImm[28] -pin ARMcore|DEReg ExtImmD[28] -pin ARMcore|Extend ExtImm[28]
load net ARMcore|Extend_ExtImm[29] -attr @rip ExtImm[29] -attr @name Extend_ExtImm[29] -pin ARMcore|DEReg ExtImmD[29] -pin ARMcore|Extend ExtImm[29]
load net ARMcore|Extend_ExtImm[2] -attr @rip ExtImm[2] -attr @name Extend_ExtImm[2] -pin ARMcore|DEReg ExtImmD[2] -pin ARMcore|Extend ExtImm[2]
load net ARMcore|Extend_ExtImm[30] -attr @rip ExtImm[30] -attr @name Extend_ExtImm[30] -pin ARMcore|DEReg ExtImmD[30] -pin ARMcore|Extend ExtImm[30]
load net ARMcore|Extend_ExtImm[31] -attr @rip ExtImm[31] -attr @name Extend_ExtImm[31] -pin ARMcore|DEReg ExtImmD[31] -pin ARMcore|Extend ExtImm[31]
load net ARMcore|Extend_ExtImm[3] -attr @rip ExtImm[3] -attr @name Extend_ExtImm[3] -pin ARMcore|DEReg ExtImmD[3] -pin ARMcore|Extend ExtImm[3]
load net ARMcore|Extend_ExtImm[4] -attr @rip ExtImm[4] -attr @name Extend_ExtImm[4] -pin ARMcore|DEReg ExtImmD[4] -pin ARMcore|Extend ExtImm[4]
load net ARMcore|Extend_ExtImm[5] -attr @rip ExtImm[5] -attr @name Extend_ExtImm[5] -pin ARMcore|DEReg ExtImmD[5] -pin ARMcore|Extend ExtImm[5]
load net ARMcore|Extend_ExtImm[6] -attr @rip ExtImm[6] -attr @name Extend_ExtImm[6] -pin ARMcore|DEReg ExtImmD[6] -pin ARMcore|Extend ExtImm[6]
load net ARMcore|Extend_ExtImm[7] -attr @rip ExtImm[7] -attr @name Extend_ExtImm[7] -pin ARMcore|DEReg ExtImmD[7] -pin ARMcore|Extend ExtImm[7]
load net ARMcore|Extend_ExtImm[8] -attr @rip ExtImm[8] -attr @name Extend_ExtImm[8] -pin ARMcore|DEReg ExtImmD[8] -pin ARMcore|Extend ExtImm[8]
load net ARMcore|Extend_ExtImm[9] -attr @rip ExtImm[9] -attr @name Extend_ExtImm[9] -pin ARMcore|DEReg ExtImmD[9] -pin ARMcore|Extend ExtImm[9]
load net ARMcore|FDReg_EN -attr @name FDReg_EN -pin ARMcore|FDReg EN -pin ARMcore|FDReg_EN_i O
netloc ARMcore|FDReg_EN 1 1 1 NJ 1788
load net ARMcore|FDReg_InstrD[0] -attr @rip InstrD[0] -attr @name FDReg_InstrD[0] -pin ARMcore|ControlUnit Instr[0] -pin ARMcore|Extend InstrImm[0] -pin ARMcore|FDReg InstrD[0] -pin ARMcore|RegisterFile_A20_i I1[0] -pin ARMcore|RegisterFile_A2_i I0[0]
load net ARMcore|FDReg_InstrD[10] -attr @rip InstrD[10] -attr @name FDReg_InstrD[10] -pin ARMcore|ControlUnit Instr[10] -pin ARMcore|DEReg Shamt5D[3] -pin ARMcore|Extend InstrImm[10] -pin ARMcore|FDReg InstrD[10] -pin ARMcore|RegisterFile_A1_i I0[2]
load net ARMcore|FDReg_InstrD[11] -attr @rip InstrD[11] -attr @name FDReg_InstrD[11] -pin ARMcore|ControlUnit Instr[11] -pin ARMcore|DEReg Shamt5D[4] -pin ARMcore|Extend InstrImm[11] -pin ARMcore|FDReg InstrD[11] -pin ARMcore|RegisterFile_A1_i I0[3]
load net ARMcore|FDReg_InstrD[12] -attr @rip InstrD[12] -attr @name FDReg_InstrD[12] -pin ARMcore|ControlUnit Instr[12] -pin ARMcore|DEReg_WA3D_i I1[0] -pin ARMcore|Extend InstrImm[12] -pin ARMcore|FDReg InstrD[12] -pin ARMcore|RegisterFile_A20_i I0[0]
load net ARMcore|FDReg_InstrD[13] -attr @rip InstrD[13] -attr @name FDReg_InstrD[13] -pin ARMcore|ControlUnit Instr[13] -pin ARMcore|DEReg_WA3D_i I1[1] -pin ARMcore|Extend InstrImm[13] -pin ARMcore|FDReg InstrD[13] -pin ARMcore|RegisterFile_A20_i I0[1]
load net ARMcore|FDReg_InstrD[14] -attr @rip InstrD[14] -attr @name FDReg_InstrD[14] -pin ARMcore|ControlUnit Instr[14] -pin ARMcore|DEReg_WA3D_i I1[2] -pin ARMcore|Extend InstrImm[14] -pin ARMcore|FDReg InstrD[14] -pin ARMcore|RegisterFile_A20_i I0[2]
load net ARMcore|FDReg_InstrD[15] -attr @rip InstrD[15] -attr @name FDReg_InstrD[15] -pin ARMcore|ControlUnit Instr[15] -pin ARMcore|DEReg_WA3D_i I1[3] -pin ARMcore|Extend InstrImm[15] -pin ARMcore|FDReg InstrD[15] -pin ARMcore|RegisterFile_A20_i I0[3]
load net ARMcore|FDReg_InstrD[16] -attr @rip InstrD[16] -attr @name FDReg_InstrD[16] -pin ARMcore|ControlUnit Instr[16] -pin ARMcore|DEReg_WA3D_i I0[0] -pin ARMcore|Extend InstrImm[16] -pin ARMcore|FDReg InstrD[16] -pin ARMcore|RegisterFile_A10_i I1[0]
load net ARMcore|FDReg_InstrD[17] -attr @rip InstrD[17] -attr @name FDReg_InstrD[17] -pin ARMcore|ControlUnit Instr[17] -pin ARMcore|DEReg_WA3D_i I0[1] -pin ARMcore|Extend InstrImm[17] -pin ARMcore|FDReg InstrD[17] -pin ARMcore|RegisterFile_A10_i I1[1]
load net ARMcore|FDReg_InstrD[18] -attr @rip InstrD[18] -attr @name FDReg_InstrD[18] -pin ARMcore|ControlUnit Instr[18] -pin ARMcore|DEReg_WA3D_i I0[2] -pin ARMcore|Extend InstrImm[18] -pin ARMcore|FDReg InstrD[18] -pin ARMcore|RegisterFile_A10_i I1[2]
load net ARMcore|FDReg_InstrD[19] -attr @rip InstrD[19] -attr @name FDReg_InstrD[19] -pin ARMcore|ControlUnit Instr[19] -pin ARMcore|DEReg_WA3D_i I0[3] -pin ARMcore|Extend InstrImm[19] -pin ARMcore|FDReg InstrD[19] -pin ARMcore|RegisterFile_A10_i I1[3]
load net ARMcore|FDReg_InstrD[1] -attr @rip InstrD[1] -attr @name FDReg_InstrD[1] -pin ARMcore|ControlUnit Instr[1] -pin ARMcore|Extend InstrImm[1] -pin ARMcore|FDReg InstrD[1] -pin ARMcore|RegisterFile_A20_i I1[1] -pin ARMcore|RegisterFile_A2_i I0[1]
load net ARMcore|FDReg_InstrD[20] -attr @rip InstrD[20] -attr @name FDReg_InstrD[20] -pin ARMcore|ControlUnit Instr[20] -pin ARMcore|Extend InstrImm[20] -pin ARMcore|FDReg InstrD[20]
load net ARMcore|FDReg_InstrD[21] -attr @rip InstrD[21] -attr @name FDReg_InstrD[21] -pin ARMcore|ControlUnit Instr[21] -pin ARMcore|Extend InstrImm[21] -pin ARMcore|FDReg InstrD[21]
load net ARMcore|FDReg_InstrD[22] -attr @rip InstrD[22] -attr @name FDReg_InstrD[22] -pin ARMcore|ControlUnit Instr[22] -pin ARMcore|Extend InstrImm[22] -pin ARMcore|FDReg InstrD[22]
load net ARMcore|FDReg_InstrD[23] -attr @rip InstrD[23] -attr @name FDReg_InstrD[23] -pin ARMcore|ControlUnit Instr[23] -pin ARMcore|Extend InstrImm[23] -pin ARMcore|FDReg InstrD[23]
load net ARMcore|FDReg_InstrD[24] -attr @rip InstrD[24] -attr @name FDReg_InstrD[24] -pin ARMcore|ControlUnit Instr[24] -pin ARMcore|FDReg InstrD[24]
load net ARMcore|FDReg_InstrD[25] -attr @rip InstrD[25] -attr @name FDReg_InstrD[25] -pin ARMcore|ControlUnit Instr[25] -pin ARMcore|FDReg InstrD[25]
load net ARMcore|FDReg_InstrD[26] -attr @rip InstrD[26] -attr @name FDReg_InstrD[26] -pin ARMcore|ControlUnit Instr[26] -pin ARMcore|FDReg InstrD[26]
load net ARMcore|FDReg_InstrD[27] -attr @rip InstrD[27] -attr @name FDReg_InstrD[27] -pin ARMcore|ControlUnit Instr[27] -pin ARMcore|FDReg InstrD[27]
load net ARMcore|FDReg_InstrD[28] -attr @rip InstrD[28] -attr @name FDReg_InstrD[28] -pin ARMcore|ControlUnit Instr[28] -pin ARMcore|DEReg CondD[0] -pin ARMcore|FDReg InstrD[28]
load net ARMcore|FDReg_InstrD[29] -attr @rip InstrD[29] -attr @name FDReg_InstrD[29] -pin ARMcore|ControlUnit Instr[29] -pin ARMcore|DEReg CondD[1] -pin ARMcore|FDReg InstrD[29]
load net ARMcore|FDReg_InstrD[2] -attr @rip InstrD[2] -attr @name FDReg_InstrD[2] -pin ARMcore|ControlUnit Instr[2] -pin ARMcore|Extend InstrImm[2] -pin ARMcore|FDReg InstrD[2] -pin ARMcore|RegisterFile_A20_i I1[2] -pin ARMcore|RegisterFile_A2_i I0[2]
load net ARMcore|FDReg_InstrD[30] -attr @rip InstrD[30] -attr @name FDReg_InstrD[30] -pin ARMcore|ControlUnit Instr[30] -pin ARMcore|DEReg CondD[2] -pin ARMcore|FDReg InstrD[30]
load net ARMcore|FDReg_InstrD[31] -attr @rip InstrD[31] -attr @name FDReg_InstrD[31] -pin ARMcore|ControlUnit Instr[31] -pin ARMcore|DEReg CondD[3] -pin ARMcore|FDReg InstrD[31]
load net ARMcore|FDReg_InstrD[3] -attr @rip InstrD[3] -attr @name FDReg_InstrD[3] -pin ARMcore|ControlUnit Instr[3] -pin ARMcore|Extend InstrImm[3] -pin ARMcore|FDReg InstrD[3] -pin ARMcore|RegisterFile_A20_i I1[3] -pin ARMcore|RegisterFile_A2_i I0[3]
load net ARMcore|FDReg_InstrD[4] -attr @rip InstrD[4] -attr @name FDReg_InstrD[4] -pin ARMcore|ControlUnit Instr[4] -pin ARMcore|Extend InstrImm[4] -pin ARMcore|FDReg InstrD[4]
load net ARMcore|FDReg_InstrD[5] -attr @rip InstrD[5] -attr @name FDReg_InstrD[5] -pin ARMcore|ControlUnit Instr[5] -pin ARMcore|DEReg ShD[0] -pin ARMcore|Extend InstrImm[5] -pin ARMcore|FDReg InstrD[5]
load net ARMcore|FDReg_InstrD[6] -attr @rip InstrD[6] -attr @name FDReg_InstrD[6] -pin ARMcore|ControlUnit Instr[6] -pin ARMcore|DEReg ShD[1] -pin ARMcore|Extend InstrImm[6] -pin ARMcore|FDReg InstrD[6]
load net ARMcore|FDReg_InstrD[7] -attr @rip InstrD[7] -attr @name FDReg_InstrD[7] -pin ARMcore|ControlUnit Instr[7] -pin ARMcore|DEReg Shamt5D[0] -pin ARMcore|Extend InstrImm[7] -pin ARMcore|FDReg InstrD[7]
load net ARMcore|FDReg_InstrD[8] -attr @rip InstrD[8] -attr @name FDReg_InstrD[8] -pin ARMcore|ControlUnit Instr[8] -pin ARMcore|DEReg Shamt5D[1] -pin ARMcore|Extend InstrImm[8] -pin ARMcore|FDReg InstrD[8] -pin ARMcore|RegisterFile_A1_i I0[0]
load net ARMcore|FDReg_InstrD[9] -attr @rip InstrD[9] -attr @name FDReg_InstrD[9] -pin ARMcore|ControlUnit Instr[9] -pin ARMcore|DEReg Shamt5D[2] -pin ARMcore|Extend InstrImm[9] -pin ARMcore|FDReg InstrD[9] -pin ARMcore|RegisterFile_A1_i I0[1]
load net ARMcore|FPU_FPUPushIn -attr @name FPU_FPUPushIn -pin ARMcore|EMReg_ALUResultE0_i S -pin ARMcore|EMReg_RegWriteE1_i I1 -pin ARMcore|EMReg_WA3E0_i S -pin ARMcore|FPU FPUPushIn
netloc ARMcore|FPU_FPUPushIn 1 13 3 7620 1668N 8080 1708 9100J
load net ARMcore|FPU_Result[0] -attr @rip Result[0] -attr @name FPU_Result[0] -pin ARMcore|EMReg_ALUResultE0_i I0[0] -pin ARMcore|EMReg_ALUResultE_i I0[0] -pin ARMcore|FPU Result[0]
load net ARMcore|FPU_Result[10] -attr @rip Result[10] -attr @name FPU_Result[10] -pin ARMcore|EMReg_ALUResultE0_i I0[10] -pin ARMcore|EMReg_ALUResultE_i I0[10] -pin ARMcore|FPU Result[10]
load net ARMcore|FPU_Result[11] -attr @rip Result[11] -attr @name FPU_Result[11] -pin ARMcore|EMReg_ALUResultE0_i I0[11] -pin ARMcore|EMReg_ALUResultE_i I0[11] -pin ARMcore|FPU Result[11]
load net ARMcore|FPU_Result[12] -attr @rip Result[12] -attr @name FPU_Result[12] -pin ARMcore|EMReg_ALUResultE0_i I0[12] -pin ARMcore|EMReg_ALUResultE_i I0[12] -pin ARMcore|FPU Result[12]
load net ARMcore|FPU_Result[13] -attr @rip Result[13] -attr @name FPU_Result[13] -pin ARMcore|EMReg_ALUResultE0_i I0[13] -pin ARMcore|EMReg_ALUResultE_i I0[13] -pin ARMcore|FPU Result[13]
load net ARMcore|FPU_Result[14] -attr @rip Result[14] -attr @name FPU_Result[14] -pin ARMcore|EMReg_ALUResultE0_i I0[14] -pin ARMcore|EMReg_ALUResultE_i I0[14] -pin ARMcore|FPU Result[14]
load net ARMcore|FPU_Result[15] -attr @rip Result[15] -attr @name FPU_Result[15] -pin ARMcore|EMReg_ALUResultE0_i I0[15] -pin ARMcore|EMReg_ALUResultE_i I0[15] -pin ARMcore|FPU Result[15]
load net ARMcore|FPU_Result[16] -attr @rip Result[16] -attr @name FPU_Result[16] -pin ARMcore|EMReg_ALUResultE0_i I0[16] -pin ARMcore|EMReg_ALUResultE_i I0[16] -pin ARMcore|FPU Result[16]
load net ARMcore|FPU_Result[17] -attr @rip Result[17] -attr @name FPU_Result[17] -pin ARMcore|EMReg_ALUResultE0_i I0[17] -pin ARMcore|EMReg_ALUResultE_i I0[17] -pin ARMcore|FPU Result[17]
load net ARMcore|FPU_Result[18] -attr @rip Result[18] -attr @name FPU_Result[18] -pin ARMcore|EMReg_ALUResultE0_i I0[18] -pin ARMcore|EMReg_ALUResultE_i I0[18] -pin ARMcore|FPU Result[18]
load net ARMcore|FPU_Result[19] -attr @rip Result[19] -attr @name FPU_Result[19] -pin ARMcore|EMReg_ALUResultE0_i I0[19] -pin ARMcore|EMReg_ALUResultE_i I0[19] -pin ARMcore|FPU Result[19]
load net ARMcore|FPU_Result[1] -attr @rip Result[1] -attr @name FPU_Result[1] -pin ARMcore|EMReg_ALUResultE0_i I0[1] -pin ARMcore|EMReg_ALUResultE_i I0[1] -pin ARMcore|FPU Result[1]
load net ARMcore|FPU_Result[20] -attr @rip Result[20] -attr @name FPU_Result[20] -pin ARMcore|EMReg_ALUResultE0_i I0[20] -pin ARMcore|EMReg_ALUResultE_i I0[20] -pin ARMcore|FPU Result[20]
load net ARMcore|FPU_Result[21] -attr @rip Result[21] -attr @name FPU_Result[21] -pin ARMcore|EMReg_ALUResultE0_i I0[21] -pin ARMcore|EMReg_ALUResultE_i I0[21] -pin ARMcore|FPU Result[21]
load net ARMcore|FPU_Result[22] -attr @rip Result[22] -attr @name FPU_Result[22] -pin ARMcore|EMReg_ALUResultE0_i I0[22] -pin ARMcore|EMReg_ALUResultE_i I0[22] -pin ARMcore|FPU Result[22]
load net ARMcore|FPU_Result[23] -attr @rip Result[23] -attr @name FPU_Result[23] -pin ARMcore|EMReg_ALUResultE0_i I0[23] -pin ARMcore|EMReg_ALUResultE_i I0[23] -pin ARMcore|FPU Result[23]
load net ARMcore|FPU_Result[24] -attr @rip Result[24] -attr @name FPU_Result[24] -pin ARMcore|EMReg_ALUResultE0_i I0[24] -pin ARMcore|EMReg_ALUResultE_i I0[24] -pin ARMcore|FPU Result[24]
load net ARMcore|FPU_Result[25] -attr @rip Result[25] -attr @name FPU_Result[25] -pin ARMcore|EMReg_ALUResultE0_i I0[25] -pin ARMcore|EMReg_ALUResultE_i I0[25] -pin ARMcore|FPU Result[25]
load net ARMcore|FPU_Result[26] -attr @rip Result[26] -attr @name FPU_Result[26] -pin ARMcore|EMReg_ALUResultE0_i I0[26] -pin ARMcore|EMReg_ALUResultE_i I0[26] -pin ARMcore|FPU Result[26]
load net ARMcore|FPU_Result[27] -attr @rip Result[27] -attr @name FPU_Result[27] -pin ARMcore|EMReg_ALUResultE0_i I0[27] -pin ARMcore|EMReg_ALUResultE_i I0[27] -pin ARMcore|FPU Result[27]
load net ARMcore|FPU_Result[28] -attr @rip Result[28] -attr @name FPU_Result[28] -pin ARMcore|EMReg_ALUResultE0_i I0[28] -pin ARMcore|EMReg_ALUResultE_i I0[28] -pin ARMcore|FPU Result[28]
load net ARMcore|FPU_Result[29] -attr @rip Result[29] -attr @name FPU_Result[29] -pin ARMcore|EMReg_ALUResultE0_i I0[29] -pin ARMcore|EMReg_ALUResultE_i I0[29] -pin ARMcore|FPU Result[29]
load net ARMcore|FPU_Result[2] -attr @rip Result[2] -attr @name FPU_Result[2] -pin ARMcore|EMReg_ALUResultE0_i I0[2] -pin ARMcore|EMReg_ALUResultE_i I0[2] -pin ARMcore|FPU Result[2]
load net ARMcore|FPU_Result[30] -attr @rip Result[30] -attr @name FPU_Result[30] -pin ARMcore|EMReg_ALUResultE0_i I0[30] -pin ARMcore|EMReg_ALUResultE_i I0[30] -pin ARMcore|FPU Result[30]
load net ARMcore|FPU_Result[31] -attr @rip Result[31] -attr @name FPU_Result[31] -pin ARMcore|EMReg_ALUResultE0_i I0[31] -pin ARMcore|EMReg_ALUResultE_i I0[31] -pin ARMcore|FPU Result[31]
load net ARMcore|FPU_Result[3] -attr @rip Result[3] -attr @name FPU_Result[3] -pin ARMcore|EMReg_ALUResultE0_i I0[3] -pin ARMcore|EMReg_ALUResultE_i I0[3] -pin ARMcore|FPU Result[3]
load net ARMcore|FPU_Result[4] -attr @rip Result[4] -attr @name FPU_Result[4] -pin ARMcore|EMReg_ALUResultE0_i I0[4] -pin ARMcore|EMReg_ALUResultE_i I0[4] -pin ARMcore|FPU Result[4]
load net ARMcore|FPU_Result[5] -attr @rip Result[5] -attr @name FPU_Result[5] -pin ARMcore|EMReg_ALUResultE0_i I0[5] -pin ARMcore|EMReg_ALUResultE_i I0[5] -pin ARMcore|FPU Result[5]
load net ARMcore|FPU_Result[6] -attr @rip Result[6] -attr @name FPU_Result[6] -pin ARMcore|EMReg_ALUResultE0_i I0[6] -pin ARMcore|EMReg_ALUResultE_i I0[6] -pin ARMcore|FPU Result[6]
load net ARMcore|FPU_Result[7] -attr @rip Result[7] -attr @name FPU_Result[7] -pin ARMcore|EMReg_ALUResultE0_i I0[7] -pin ARMcore|EMReg_ALUResultE_i I0[7] -pin ARMcore|FPU Result[7]
load net ARMcore|FPU_Result[8] -attr @rip Result[8] -attr @name FPU_Result[8] -pin ARMcore|EMReg_ALUResultE0_i I0[8] -pin ARMcore|EMReg_ALUResultE_i I0[8] -pin ARMcore|FPU Result[8]
load net ARMcore|FPU_Result[9] -attr @rip Result[9] -attr @name FPU_Result[9] -pin ARMcore|EMReg_ALUResultE0_i I0[9] -pin ARMcore|EMReg_ALUResultE_i I0[9] -pin ARMcore|FPU Result[9]
load net ARMcore|HazardUnit_FPUBusy -attr @name HazardUnit_FPUBusy -pin ARMcore|EMReg_RegWriteE2_i I0 -pin ARMcore|FPU Busy -pin ARMcore|HazardUnit FPUBusy
netloc ARMcore|HazardUnit_FPUBusy 1 13 3 7600 1088 8280 478 NJ
load net ARMcore|HazardUnit_FPUDone -attr @name HazardUnit_FPUDone -pin ARMcore|FPU Done -pin ARMcore|HazardUnit FPUDone
netloc ARMcore|HazardUnit_FPUDone 1 13 3 7380 498 NJ 498 NJ
load net ARMcore|HazardUnit_FPUHazard -attr @name HazardUnit_FPUHazard -pin ARMcore|DEReg FPUHazardD -pin ARMcore|HazardUnit FPUHazard
netloc ARMcore|HazardUnit_FPUHazard 1 6 11 3620 1168 NJ 1168 NJ 1168 NJ 1168 NJ 1168 NJ 1168 6890J 1208 7460J 1228 8160J 1308 8760J 1418 9720
load net ARMcore|HazardUnit_FPUS -attr @name HazardUnit_FPUS -pin ARMcore|ControlUnit FPUS -pin ARMcore|DEReg FPUSD -pin ARMcore|HazardUnit FPUS
netloc ARMcore|HazardUnit_FPUS 1 3 13 2110J 1298 NJ 1298 NJ 1298 3440 518 NJ 518 NJ 518 NJ 518 NJ 518 NJ 518 NJ 518 NJ 518 NJ 518 NJ
load net ARMcore|HazardUnit_FPUStart -attr @name HazardUnit_FPUStart -pin ARMcore|CondUnit FPUStart -pin ARMcore|EMReg_ALUResultE1_i__0 I0 -pin ARMcore|FPU Start -pin ARMcore|HazardUnit FPUStart
netloc ARMcore|HazardUnit_FPUStart 1 12 4 6910 1868 NJ 1868 NJ 1868 8720
load net ARMcore|HazardUnit_FPUWA3[0] -attr @rip FPUWA3[0] -attr @name HazardUnit_FPUWA3[0] -pin ARMcore|EMReg_WA3E0_i I0[0] -pin ARMcore|FPU FPUWA3[0] -pin ARMcore|HazardUnit FPUWA3[0]
load net ARMcore|HazardUnit_FPUWA3[1] -attr @rip FPUWA3[1] -attr @name HazardUnit_FPUWA3[1] -pin ARMcore|EMReg_WA3E0_i I0[1] -pin ARMcore|FPU FPUWA3[1] -pin ARMcore|HazardUnit FPUWA3[1]
load net ARMcore|HazardUnit_FPUWA3[2] -attr @rip FPUWA3[2] -attr @name HazardUnit_FPUWA3[2] -pin ARMcore|EMReg_WA3E0_i I0[2] -pin ARMcore|FPU FPUWA3[2] -pin ARMcore|HazardUnit FPUWA3[2]
load net ARMcore|HazardUnit_FPUWA3[3] -attr @rip FPUWA3[3] -attr @name HazardUnit_FPUWA3[3] -pin ARMcore|EMReg_WA3E0_i I0[3] -pin ARMcore|FPU FPUWA3[3] -pin ARMcore|HazardUnit FPUWA3[3]
load net ARMcore|HazardUnit_FlushD -attr @name HazardUnit_FlushD -pin ARMcore|FDReg CLR -pin ARMcore|HazardUnit FlushD
netloc ARMcore|HazardUnit_FlushD 1 1 16 1500 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 NJ 1008 8800J 1098 9660
load net ARMcore|HazardUnit_FlushE -attr @name HazardUnit_FlushE -pin ARMcore|DEReg CLR -pin ARMcore|HazardUnit FlushE
netloc ARMcore|HazardUnit_FlushE 1 6 11 3600 1148 NJ 1148 NJ 1148 NJ 1148 NJ 1148 NJ 1148 6910J 1168 7500J 1188 8100J 1268 8960J 1398 9700
load net ARMcore|HazardUnit_ForwardAE[0] -attr @rip ForwardAE[0] -attr @name HazardUnit_ForwardAE[0] -pin ARMcore|HazardUnit ForwardAE[0] -pin ARMcore|SA_i S[0]
load net ARMcore|HazardUnit_ForwardAE[1] -attr @rip ForwardAE[1] -attr @name HazardUnit_ForwardAE[1] -pin ARMcore|HazardUnit ForwardAE[1] -pin ARMcore|SA_i S[1]
load net ARMcore|HazardUnit_ForwardAE[2] -attr @rip ForwardAE[2] -attr @name HazardUnit_ForwardAE[2] -pin ARMcore|HazardUnit ForwardAE[2] -pin ARMcore|SA_i S[2]
load net ARMcore|HazardUnit_ForwardBE[0] -attr @rip ForwardBE[0] -attr @name HazardUnit_ForwardBE[0] -pin ARMcore|HazardUnit ForwardBE[0] -pin ARMcore|SB_i S[0]
load net ARMcore|HazardUnit_ForwardBE[1] -attr @rip ForwardBE[1] -attr @name HazardUnit_ForwardBE[1] -pin ARMcore|HazardUnit ForwardBE[1] -pin ARMcore|SB_i S[1]
load net ARMcore|HazardUnit_ForwardBE[2] -attr @rip ForwardBE[2] -attr @name HazardUnit_ForwardBE[2] -pin ARMcore|HazardUnit ForwardBE[2] -pin ARMcore|SB_i S[2]
load net ARMcore|HazardUnit_ForwardM -attr @name HazardUnit_ForwardM -pin ARMcore|HazardUnit ForwardM -pin ARMcore|MemOrIO_r_rdata_i S
netloc ARMcore|HazardUnit_ForwardM 1 16 3 NJ 758 NJ 758 10690
load net ARMcore|HazardUnit_MCycleBusy -attr @name HazardUnit_MCycleBusy -pin ARMcore|EMReg_RegWriteE3_i I0 -pin ARMcore|HazardUnit MCycleBusy -pin ARMcore|MCycle Busy
netloc ARMcore|HazardUnit_MCycleBusy 1 13 3 7720 578 NJ 578 NJ
load net ARMcore|HazardUnit_MCycleDone -attr @name HazardUnit_MCycleDone -pin ARMcore|HazardUnit MCycleDone -pin ARMcore|MCycle Done
netloc ARMcore|HazardUnit_MCycleDone 1 13 3 7420 598 NJ 598 NJ
load net ARMcore|HazardUnit_MCycleHazard -attr @name HazardUnit_MCycleHazard -pin ARMcore|DEReg MCycleHazardD -pin ARMcore|HazardUnit MCycleHazard
netloc ARMcore|HazardUnit_MCycleHazard 1 6 11 3640 1208 4000J 1308 NJ 1308 5320J 1428 5620J 1408 NJ 1408 6790J 1488 NJ 1488 NJ 1488 8660J 1558 9680
load net ARMcore|HazardUnit_MCycleWA3[0] -attr @rip MCycleWA3[0] -attr @name HazardUnit_MCycleWA3[0] -pin ARMcore|EMReg_WA3E_i I0[0] -pin ARMcore|HazardUnit MCycleWA3[0] -pin ARMcore|MCycle MCycleWA3[0]
load net ARMcore|HazardUnit_MCycleWA3[1] -attr @rip MCycleWA3[1] -attr @name HazardUnit_MCycleWA3[1] -pin ARMcore|EMReg_WA3E_i I0[1] -pin ARMcore|HazardUnit MCycleWA3[1] -pin ARMcore|MCycle MCycleWA3[1]
load net ARMcore|HazardUnit_MCycleWA3[2] -attr @rip MCycleWA3[2] -attr @name HazardUnit_MCycleWA3[2] -pin ARMcore|EMReg_WA3E_i I0[2] -pin ARMcore|HazardUnit MCycleWA3[2] -pin ARMcore|MCycle MCycleWA3[2]
load net ARMcore|HazardUnit_MCycleWA3[3] -attr @rip MCycleWA3[3] -attr @name HazardUnit_MCycleWA3[3] -pin ARMcore|EMReg_WA3E_i I0[3] -pin ARMcore|HazardUnit MCycleWA3[3] -pin ARMcore|MCycle MCycleWA3[3]
load net ARMcore|HazardUnit_MS -attr @name HazardUnit_MS -pin ARMcore|ControlUnit MS -pin ARMcore|DEReg MSD -pin ARMcore|HazardUnit MS
netloc ARMcore|HazardUnit_MS 1 3 13 NJ 1468 NJ 1468 2990J 1508 3460 1188 4020J 1208 NJ 1208 NJ 1208 NJ 1208 NJ 1208 6830J 1248 7400J 1268 8060J 1328 8660
load net ARMcore|HazardUnit_MStart -attr @name HazardUnit_MStart -pin ARMcore|CondUnit MStart -pin ARMcore|HazardUnit MStart -pin ARMcore|MCycle Start
netloc ARMcore|HazardUnit_MStart 1 12 4 6810 1188 7480J 1208 8080J 1288 8680
load net ARMcore|HazardUnit_MemWriteM -attr @name HazardUnit_MemWriteM -pin ARMcore|Cache_Valid0_i I1 -pin ARMcore|EMReg MemWriteM -pin ARMcore|HazardUnit MemWriteM -pin ARMcore|MemOrIO we
netloc ARMcore|HazardUnit_MemWriteM 1 15 5 9180 1118 NJ 1118 NJ 1118 10730 1678 11070J
load net ARMcore|HazardUnit_MemtoRegE -attr @name HazardUnit_MemtoRegE -pin ARMcore|DEReg MemtoRegE -pin ARMcore|EMReg MemtoRegE -pin ARMcore|HazardUnit MemtoRegE
netloc ARMcore|HazardUnit_MemtoRegE 1 7 11 4080J 2088 NJ 2088 NJ 2088 NJ 2088 NJ 2088 NJ 2088 NJ 2088 NJ 2088 8980 1478 NJ 1478 10170J
load net ARMcore|HazardUnit_MemtoRegW -attr @name HazardUnit_MemtoRegW -pin ARMcore|HazardUnit MemtoRegW -pin ARMcore|MWReg MemtoRegW -pin ARMcore|ResultW_i S
netloc ARMcore|HazardUnit_MemtoRegW 1 4 12 N 2308N 2910 758 NJ 758 NJ 758 NJ 758 NJ 758 NJ 758 NJ 758 NJ 758 NJ 758 NJ 758 NJ
load net ARMcore|HazardUnit_PCSrcE -attr @name HazardUnit_PCSrcE -pin ARMcore|CondUnit PCSrc -pin ARMcore|HazardUnit PCSrcE -pin ARMcore|ProgramCounter PCSrc
netloc ARMcore|HazardUnit_PCSrcE 1 12 8 6790J 2128 NJ 2128 NJ 2128 9060 1908 NJ 1908 10250J 1888 NJ 1888 NJ
load net ARMcore|HazardUnit_RA1E[0] -attr @rip RA1E[0] -attr @name HazardUnit_RA1E[0] -pin ARMcore|DEReg RA1E[0] -pin ARMcore|HazardUnit RA1E[0]
load net ARMcore|HazardUnit_RA1E[1] -attr @rip RA1E[1] -attr @name HazardUnit_RA1E[1] -pin ARMcore|DEReg RA1E[1] -pin ARMcore|HazardUnit RA1E[1]
load net ARMcore|HazardUnit_RA1E[2] -attr @rip RA1E[2] -attr @name HazardUnit_RA1E[2] -pin ARMcore|DEReg RA1E[2] -pin ARMcore|HazardUnit RA1E[2]
load net ARMcore|HazardUnit_RA1E[3] -attr @rip RA1E[3] -attr @name HazardUnit_RA1E[3] -pin ARMcore|DEReg RA1E[3] -pin ARMcore|HazardUnit RA1E[3]
load net ARMcore|HazardUnit_RA2E[0] -attr @rip RA2E[0] -attr @name HazardUnit_RA2E[0] -pin ARMcore|DEReg RA2E[0] -pin ARMcore|EMReg RA2E[0] -pin ARMcore|HazardUnit RA2E[0]
load net ARMcore|HazardUnit_RA2E[1] -attr @rip RA2E[1] -attr @name HazardUnit_RA2E[1] -pin ARMcore|DEReg RA2E[1] -pin ARMcore|EMReg RA2E[1] -pin ARMcore|HazardUnit RA2E[1]
load net ARMcore|HazardUnit_RA2E[2] -attr @rip RA2E[2] -attr @name HazardUnit_RA2E[2] -pin ARMcore|DEReg RA2E[2] -pin ARMcore|EMReg RA2E[2] -pin ARMcore|HazardUnit RA2E[2]
load net ARMcore|HazardUnit_RA2E[3] -attr @rip RA2E[3] -attr @name HazardUnit_RA2E[3] -pin ARMcore|DEReg RA2E[3] -pin ARMcore|EMReg RA2E[3] -pin ARMcore|HazardUnit RA2E[3]
load net ARMcore|HazardUnit_RA2M[0] -attr @rip RA2M[0] -attr @name HazardUnit_RA2M[0] -pin ARMcore|EMReg RA2M[0] -pin ARMcore|HazardUnit RA2M[0]
load net ARMcore|HazardUnit_RA2M[1] -attr @rip RA2M[1] -attr @name HazardUnit_RA2M[1] -pin ARMcore|EMReg RA2M[1] -pin ARMcore|HazardUnit RA2M[1]
load net ARMcore|HazardUnit_RA2M[2] -attr @rip RA2M[2] -attr @name HazardUnit_RA2M[2] -pin ARMcore|EMReg RA2M[2] -pin ARMcore|HazardUnit RA2M[2]
load net ARMcore|HazardUnit_RA2M[3] -attr @rip RA2M[3] -attr @name HazardUnit_RA2M[3] -pin ARMcore|EMReg RA2M[3] -pin ARMcore|HazardUnit RA2M[3]
load net ARMcore|HazardUnit_RegWriteE -attr @name HazardUnit_RegWriteE -pin ARMcore|CondUnit RegWrite -pin ARMcore|EMReg_RegWriteE0_i__0 I1 -pin ARMcore|EMReg_RegWriteE1_i__0 I1 -pin ARMcore|HazardUnit RegWriteE
netloc ARMcore|HazardUnit_RegWriteE 1 12 4 6870J 2028 NJ 2028 8180 1208 8780
load net ARMcore|HazardUnit_RegWriteM -attr @name HazardUnit_RegWriteM -pin ARMcore|EMReg RegWriteM -pin ARMcore|HazardUnit RegWriteM -pin ARMcore|MWReg RegWriteM
netloc ARMcore|HazardUnit_RegWriteM 1 3 16 2130 2448 NJ 2448 NJ 2448 NJ 2448 NJ 2448 NJ 2448 NJ 2448 NJ 2448 NJ 2448 NJ 2448 NJ 2448 NJ 2448 9120 1438 NJ 1438 10110J 1358 10590
load net ARMcore|HazardUnit_RegWriteW -attr @name HazardUnit_RegWriteW -pin ARMcore|HazardUnit RegWriteW -pin ARMcore|MWReg RegWriteW -pin ARMcore|RegisterFile WE3
netloc ARMcore|HazardUnit_RegWriteW 1 4 12 2510 2088 3050 958 NJ 958 NJ 958 NJ 958 NJ 958 NJ 958 NJ 958 NJ 958 NJ 958 NJ 958 NJ
load net ARMcore|HazardUnit_StallD -attr @name HazardUnit_StallD -pin ARMcore|FDReg_EN_i I0 -pin ARMcore|HazardUnit StallD
netloc ARMcore|HazardUnit_StallD 1 0 17 1290 1088 NJ 1088 NJ 1088 NJ 1088 NJ 1088 NJ 1088 NJ 1088 NJ 1088 NJ 1088 NJ 1088 NJ 1088 NJ 1088 NJ 1088 7580J 1108 8260J 1168 8800J 1218 9600
load net ARMcore|HazardUnit_StallE -attr @name HazardUnit_StallE -pin ARMcore|DEReg_EN_i I0 -pin ARMcore|HazardUnit StallE
netloc ARMcore|HazardUnit_StallE 1 5 12 3090 1128 NJ 1128 NJ 1128 NJ 1128 NJ 1128 NJ 1128 NJ 1128 NJ 1128 7540J 1148 8240J 1228 8700J 1338 9580
load net ARMcore|HazardUnit_StallF -attr @name HazardUnit_StallF -pin ARMcore|HazardUnit StallF -pin ARMcore|ProgramCounter_EN_i I0
netloc ARMcore|HazardUnit_StallF 1 16 3 NJ 838 NJ 838 NJ
load net ARMcore|HazardUnit_StallM -attr @name HazardUnit_StallM -pin ARMcore|EMReg_EN_i I0 -pin ARMcore|HazardUnit StallM
netloc ARMcore|HazardUnit_StallM 1 16 1 9740J 858n
load net ARMcore|HazardUnit_WA3M[0] -attr @rip WA3M[0] -attr @name HazardUnit_WA3M[0] -pin ARMcore|EMReg WA3M[0] -pin ARMcore|HazardUnit WA3M[0] -pin ARMcore|MWReg WA3M[0]
load net ARMcore|HazardUnit_WA3M[1] -attr @rip WA3M[1] -attr @name HazardUnit_WA3M[1] -pin ARMcore|EMReg WA3M[1] -pin ARMcore|HazardUnit WA3M[1] -pin ARMcore|MWReg WA3M[1]
load net ARMcore|HazardUnit_WA3M[2] -attr @rip WA3M[2] -attr @name HazardUnit_WA3M[2] -pin ARMcore|EMReg WA3M[2] -pin ARMcore|HazardUnit WA3M[2] -pin ARMcore|MWReg WA3M[2]
load net ARMcore|HazardUnit_WA3M[3] -attr @rip WA3M[3] -attr @name HazardUnit_WA3M[3] -pin ARMcore|EMReg WA3M[3] -pin ARMcore|HazardUnit WA3M[3] -pin ARMcore|MWReg WA3M[3]
load net ARMcore|HazardUnit_WA3W[0] -attr @rip WA3W[0] -attr @name HazardUnit_WA3W[0] -pin ARMcore|HazardUnit WA3W[0] -pin ARMcore|MWReg WA3W[0] -pin ARMcore|RegisterFile A3[0]
load net ARMcore|HazardUnit_WA3W[1] -attr @rip WA3W[1] -attr @name HazardUnit_WA3W[1] -pin ARMcore|HazardUnit WA3W[1] -pin ARMcore|MWReg WA3W[1] -pin ARMcore|RegisterFile A3[1]
load net ARMcore|HazardUnit_WA3W[2] -attr @rip WA3W[2] -attr @name HazardUnit_WA3W[2] -pin ARMcore|HazardUnit WA3W[2] -pin ARMcore|MWReg WA3W[2] -pin ARMcore|RegisterFile A3[2]
load net ARMcore|HazardUnit_WA3W[3] -attr @rip WA3W[3] -attr @name HazardUnit_WA3W[3] -pin ARMcore|HazardUnit WA3W[3] -pin ARMcore|MWReg WA3W[3] -pin ARMcore|RegisterFile A3[3]
load net ARMcore|HazardUnit_dec_mem -attr @name HazardUnit_dec_mem -pin ARMcore|Cache_Valid_i I0 -pin ARMcore|HazardUnit dec_mem -pin ARMcore|MemOrIO dec_mem
netloc ARMcore|HazardUnit_dec_mem 1 15 6 9220 1158 NJ 1158 NJ 1158 NJ 1158 11170 1558 11460
load net ARMcore|IO_Addr[0] -attr @rip io_addr[0] -attr @name IO_Addr[0] -hierPin ARMcore IO_Addr[0] -pin ARMcore|MemOrIO io_addr[0]
load net ARMcore|IO_Addr[10] -attr @rip io_addr[10] -attr @name IO_Addr[10] -hierPin ARMcore IO_Addr[10] -pin ARMcore|MemOrIO io_addr[10]
load net ARMcore|IO_Addr[11] -attr @rip io_addr[11] -attr @name IO_Addr[11] -hierPin ARMcore IO_Addr[11] -pin ARMcore|MemOrIO io_addr[11]
load net ARMcore|IO_Addr[12] -attr @rip io_addr[12] -attr @name IO_Addr[12] -hierPin ARMcore IO_Addr[12] -pin ARMcore|MemOrIO io_addr[12]
load net ARMcore|IO_Addr[13] -attr @rip io_addr[13] -attr @name IO_Addr[13] -hierPin ARMcore IO_Addr[13] -pin ARMcore|MemOrIO io_addr[13]
load net ARMcore|IO_Addr[14] -attr @rip io_addr[14] -attr @name IO_Addr[14] -hierPin ARMcore IO_Addr[14] -pin ARMcore|MemOrIO io_addr[14]
load net ARMcore|IO_Addr[15] -attr @rip io_addr[15] -attr @name IO_Addr[15] -hierPin ARMcore IO_Addr[15] -pin ARMcore|MemOrIO io_addr[15]
load net ARMcore|IO_Addr[16] -attr @rip io_addr[16] -attr @name IO_Addr[16] -hierPin ARMcore IO_Addr[16] -pin ARMcore|MemOrIO io_addr[16]
load net ARMcore|IO_Addr[17] -attr @rip io_addr[17] -attr @name IO_Addr[17] -hierPin ARMcore IO_Addr[17] -pin ARMcore|MemOrIO io_addr[17]
load net ARMcore|IO_Addr[18] -attr @rip io_addr[18] -attr @name IO_Addr[18] -hierPin ARMcore IO_Addr[18] -pin ARMcore|MemOrIO io_addr[18]
load net ARMcore|IO_Addr[19] -attr @rip io_addr[19] -attr @name IO_Addr[19] -hierPin ARMcore IO_Addr[19] -pin ARMcore|MemOrIO io_addr[19]
load net ARMcore|IO_Addr[1] -attr @rip io_addr[1] -attr @name IO_Addr[1] -hierPin ARMcore IO_Addr[1] -pin ARMcore|MemOrIO io_addr[1]
load net ARMcore|IO_Addr[20] -attr @rip io_addr[20] -attr @name IO_Addr[20] -hierPin ARMcore IO_Addr[20] -pin ARMcore|MemOrIO io_addr[20]
load net ARMcore|IO_Addr[21] -attr @rip io_addr[21] -attr @name IO_Addr[21] -hierPin ARMcore IO_Addr[21] -pin ARMcore|MemOrIO io_addr[21]
load net ARMcore|IO_Addr[22] -attr @rip io_addr[22] -attr @name IO_Addr[22] -hierPin ARMcore IO_Addr[22] -pin ARMcore|MemOrIO io_addr[22]
load net ARMcore|IO_Addr[23] -attr @rip io_addr[23] -attr @name IO_Addr[23] -hierPin ARMcore IO_Addr[23] -pin ARMcore|MemOrIO io_addr[23]
load net ARMcore|IO_Addr[24] -attr @rip io_addr[24] -attr @name IO_Addr[24] -hierPin ARMcore IO_Addr[24] -pin ARMcore|MemOrIO io_addr[24]
load net ARMcore|IO_Addr[25] -attr @rip io_addr[25] -attr @name IO_Addr[25] -hierPin ARMcore IO_Addr[25] -pin ARMcore|MemOrIO io_addr[25]
load net ARMcore|IO_Addr[26] -attr @rip io_addr[26] -attr @name IO_Addr[26] -hierPin ARMcore IO_Addr[26] -pin ARMcore|MemOrIO io_addr[26]
load net ARMcore|IO_Addr[27] -attr @rip io_addr[27] -attr @name IO_Addr[27] -hierPin ARMcore IO_Addr[27] -pin ARMcore|MemOrIO io_addr[27]
load net ARMcore|IO_Addr[28] -attr @rip io_addr[28] -attr @name IO_Addr[28] -hierPin ARMcore IO_Addr[28] -pin ARMcore|MemOrIO io_addr[28]
load net ARMcore|IO_Addr[29] -attr @rip io_addr[29] -attr @name IO_Addr[29] -hierPin ARMcore IO_Addr[29] -pin ARMcore|MemOrIO io_addr[29]
load net ARMcore|IO_Addr[2] -attr @rip io_addr[2] -attr @name IO_Addr[2] -hierPin ARMcore IO_Addr[2] -pin ARMcore|MemOrIO io_addr[2]
load net ARMcore|IO_Addr[30] -attr @rip io_addr[30] -attr @name IO_Addr[30] -hierPin ARMcore IO_Addr[30] -pin ARMcore|MemOrIO io_addr[30]
load net ARMcore|IO_Addr[31] -attr @rip io_addr[31] -attr @name IO_Addr[31] -hierPin ARMcore IO_Addr[31] -pin ARMcore|MemOrIO io_addr[31]
load net ARMcore|IO_Addr[3] -attr @rip io_addr[3] -attr @name IO_Addr[3] -hierPin ARMcore IO_Addr[3] -pin ARMcore|MemOrIO io_addr[3]
load net ARMcore|IO_Addr[4] -attr @rip io_addr[4] -attr @name IO_Addr[4] -hierPin ARMcore IO_Addr[4] -pin ARMcore|MemOrIO io_addr[4]
load net ARMcore|IO_Addr[5] -attr @rip io_addr[5] -attr @name IO_Addr[5] -hierPin ARMcore IO_Addr[5] -pin ARMcore|MemOrIO io_addr[5]
load net ARMcore|IO_Addr[6] -attr @rip io_addr[6] -attr @name IO_Addr[6] -hierPin ARMcore IO_Addr[6] -pin ARMcore|MemOrIO io_addr[6]
load net ARMcore|IO_Addr[7] -attr @rip io_addr[7] -attr @name IO_Addr[7] -hierPin ARMcore IO_Addr[7] -pin ARMcore|MemOrIO io_addr[7]
load net ARMcore|IO_Addr[8] -attr @rip io_addr[8] -attr @name IO_Addr[8] -hierPin ARMcore IO_Addr[8] -pin ARMcore|MemOrIO io_addr[8]
load net ARMcore|IO_Addr[9] -attr @rip io_addr[9] -attr @name IO_Addr[9] -hierPin ARMcore IO_Addr[9] -pin ARMcore|MemOrIO io_addr[9]
load net ARMcore|IO_ReadData[0] -attr @rip IO_ReadData[0] -attr @name IO_ReadData[0] -hierPin ARMcore IO_ReadData[0] -pin ARMcore|MemOrIO io_rdata[0]
load net ARMcore|IO_ReadData[10] -attr @rip IO_ReadData[10] -attr @name IO_ReadData[10] -hierPin ARMcore IO_ReadData[10] -pin ARMcore|MemOrIO io_rdata[10]
load net ARMcore|IO_ReadData[11] -attr @rip IO_ReadData[11] -attr @name IO_ReadData[11] -hierPin ARMcore IO_ReadData[11] -pin ARMcore|MemOrIO io_rdata[11]
load net ARMcore|IO_ReadData[12] -attr @rip IO_ReadData[12] -attr @name IO_ReadData[12] -hierPin ARMcore IO_ReadData[12] -pin ARMcore|MemOrIO io_rdata[12]
load net ARMcore|IO_ReadData[13] -attr @rip IO_ReadData[13] -attr @name IO_ReadData[13] -hierPin ARMcore IO_ReadData[13] -pin ARMcore|MemOrIO io_rdata[13]
load net ARMcore|IO_ReadData[14] -attr @rip IO_ReadData[14] -attr @name IO_ReadData[14] -hierPin ARMcore IO_ReadData[14] -pin ARMcore|MemOrIO io_rdata[14]
load net ARMcore|IO_ReadData[15] -attr @rip IO_ReadData[15] -attr @name IO_ReadData[15] -hierPin ARMcore IO_ReadData[15] -pin ARMcore|MemOrIO io_rdata[15]
load net ARMcore|IO_ReadData[16] -attr @rip IO_ReadData[16] -attr @name IO_ReadData[16] -hierPin ARMcore IO_ReadData[16] -pin ARMcore|MemOrIO io_rdata[16]
load net ARMcore|IO_ReadData[17] -attr @rip IO_ReadData[17] -attr @name IO_ReadData[17] -hierPin ARMcore IO_ReadData[17] -pin ARMcore|MemOrIO io_rdata[17]
load net ARMcore|IO_ReadData[18] -attr @rip IO_ReadData[18] -attr @name IO_ReadData[18] -hierPin ARMcore IO_ReadData[18] -pin ARMcore|MemOrIO io_rdata[18]
load net ARMcore|IO_ReadData[19] -attr @rip IO_ReadData[19] -attr @name IO_ReadData[19] -hierPin ARMcore IO_ReadData[19] -pin ARMcore|MemOrIO io_rdata[19]
load net ARMcore|IO_ReadData[1] -attr @rip IO_ReadData[1] -attr @name IO_ReadData[1] -hierPin ARMcore IO_ReadData[1] -pin ARMcore|MemOrIO io_rdata[1]
load net ARMcore|IO_ReadData[20] -attr @rip IO_ReadData[20] -attr @name IO_ReadData[20] -hierPin ARMcore IO_ReadData[20] -pin ARMcore|MemOrIO io_rdata[20]
load net ARMcore|IO_ReadData[21] -attr @rip IO_ReadData[21] -attr @name IO_ReadData[21] -hierPin ARMcore IO_ReadData[21] -pin ARMcore|MemOrIO io_rdata[21]
load net ARMcore|IO_ReadData[22] -attr @rip IO_ReadData[22] -attr @name IO_ReadData[22] -hierPin ARMcore IO_ReadData[22] -pin ARMcore|MemOrIO io_rdata[22]
load net ARMcore|IO_ReadData[23] -attr @rip IO_ReadData[23] -attr @name IO_ReadData[23] -hierPin ARMcore IO_ReadData[23] -pin ARMcore|MemOrIO io_rdata[23]
load net ARMcore|IO_ReadData[24] -attr @rip IO_ReadData[24] -attr @name IO_ReadData[24] -hierPin ARMcore IO_ReadData[24] -pin ARMcore|MemOrIO io_rdata[24]
load net ARMcore|IO_ReadData[25] -attr @rip IO_ReadData[25] -attr @name IO_ReadData[25] -hierPin ARMcore IO_ReadData[25] -pin ARMcore|MemOrIO io_rdata[25]
load net ARMcore|IO_ReadData[26] -attr @rip IO_ReadData[26] -attr @name IO_ReadData[26] -hierPin ARMcore IO_ReadData[26] -pin ARMcore|MemOrIO io_rdata[26]
load net ARMcore|IO_ReadData[27] -attr @rip IO_ReadData[27] -attr @name IO_ReadData[27] -hierPin ARMcore IO_ReadData[27] -pin ARMcore|MemOrIO io_rdata[27]
load net ARMcore|IO_ReadData[28] -attr @rip IO_ReadData[28] -attr @name IO_ReadData[28] -hierPin ARMcore IO_ReadData[28] -pin ARMcore|MemOrIO io_rdata[28]
load net ARMcore|IO_ReadData[29] -attr @rip IO_ReadData[29] -attr @name IO_ReadData[29] -hierPin ARMcore IO_ReadData[29] -pin ARMcore|MemOrIO io_rdata[29]
load net ARMcore|IO_ReadData[2] -attr @rip IO_ReadData[2] -attr @name IO_ReadData[2] -hierPin ARMcore IO_ReadData[2] -pin ARMcore|MemOrIO io_rdata[2]
load net ARMcore|IO_ReadData[30] -attr @rip IO_ReadData[30] -attr @name IO_ReadData[30] -hierPin ARMcore IO_ReadData[30] -pin ARMcore|MemOrIO io_rdata[30]
load net ARMcore|IO_ReadData[31] -attr @rip IO_ReadData[31] -attr @name IO_ReadData[31] -hierPin ARMcore IO_ReadData[31] -pin ARMcore|MemOrIO io_rdata[31]
load net ARMcore|IO_ReadData[3] -attr @rip IO_ReadData[3] -attr @name IO_ReadData[3] -hierPin ARMcore IO_ReadData[3] -pin ARMcore|MemOrIO io_rdata[3]
load net ARMcore|IO_ReadData[4] -attr @rip IO_ReadData[4] -attr @name IO_ReadData[4] -hierPin ARMcore IO_ReadData[4] -pin ARMcore|MemOrIO io_rdata[4]
load net ARMcore|IO_ReadData[5] -attr @rip IO_ReadData[5] -attr @name IO_ReadData[5] -hierPin ARMcore IO_ReadData[5] -pin ARMcore|MemOrIO io_rdata[5]
load net ARMcore|IO_ReadData[6] -attr @rip IO_ReadData[6] -attr @name IO_ReadData[6] -hierPin ARMcore IO_ReadData[6] -pin ARMcore|MemOrIO io_rdata[6]
load net ARMcore|IO_ReadData[7] -attr @rip IO_ReadData[7] -attr @name IO_ReadData[7] -hierPin ARMcore IO_ReadData[7] -pin ARMcore|MemOrIO io_rdata[7]
load net ARMcore|IO_ReadData[8] -attr @rip IO_ReadData[8] -attr @name IO_ReadData[8] -hierPin ARMcore IO_ReadData[8] -pin ARMcore|MemOrIO io_rdata[8]
load net ARMcore|IO_ReadData[9] -attr @rip IO_ReadData[9] -attr @name IO_ReadData[9] -hierPin ARMcore IO_ReadData[9] -pin ARMcore|MemOrIO io_rdata[9]
load net ARMcore|IO_WE -attr @name IO_WE -hierPin ARMcore IO_WE -pin ARMcore|MemOrIO io_we
netloc ARMcore|IO_WE 1 20 1 11540 1658n
load net ARMcore|IO_WriteData[0] -attr @rip io_wdata[0] -attr @name IO_WriteData[0] -hierPin ARMcore IO_WriteData[0] -pin ARMcore|MemOrIO io_wdata[0]
load net ARMcore|IO_WriteData[10] -attr @rip io_wdata[10] -attr @name IO_WriteData[10] -hierPin ARMcore IO_WriteData[10] -pin ARMcore|MemOrIO io_wdata[10]
load net ARMcore|IO_WriteData[11] -attr @rip io_wdata[11] -attr @name IO_WriteData[11] -hierPin ARMcore IO_WriteData[11] -pin ARMcore|MemOrIO io_wdata[11]
load net ARMcore|IO_WriteData[12] -attr @rip io_wdata[12] -attr @name IO_WriteData[12] -hierPin ARMcore IO_WriteData[12] -pin ARMcore|MemOrIO io_wdata[12]
load net ARMcore|IO_WriteData[13] -attr @rip io_wdata[13] -attr @name IO_WriteData[13] -hierPin ARMcore IO_WriteData[13] -pin ARMcore|MemOrIO io_wdata[13]
load net ARMcore|IO_WriteData[14] -attr @rip io_wdata[14] -attr @name IO_WriteData[14] -hierPin ARMcore IO_WriteData[14] -pin ARMcore|MemOrIO io_wdata[14]
load net ARMcore|IO_WriteData[15] -attr @rip io_wdata[15] -attr @name IO_WriteData[15] -hierPin ARMcore IO_WriteData[15] -pin ARMcore|MemOrIO io_wdata[15]
load net ARMcore|IO_WriteData[16] -attr @rip io_wdata[16] -attr @name IO_WriteData[16] -hierPin ARMcore IO_WriteData[16] -pin ARMcore|MemOrIO io_wdata[16]
load net ARMcore|IO_WriteData[17] -attr @rip io_wdata[17] -attr @name IO_WriteData[17] -hierPin ARMcore IO_WriteData[17] -pin ARMcore|MemOrIO io_wdata[17]
load net ARMcore|IO_WriteData[18] -attr @rip io_wdata[18] -attr @name IO_WriteData[18] -hierPin ARMcore IO_WriteData[18] -pin ARMcore|MemOrIO io_wdata[18]
load net ARMcore|IO_WriteData[19] -attr @rip io_wdata[19] -attr @name IO_WriteData[19] -hierPin ARMcore IO_WriteData[19] -pin ARMcore|MemOrIO io_wdata[19]
load net ARMcore|IO_WriteData[1] -attr @rip io_wdata[1] -attr @name IO_WriteData[1] -hierPin ARMcore IO_WriteData[1] -pin ARMcore|MemOrIO io_wdata[1]
load net ARMcore|IO_WriteData[20] -attr @rip io_wdata[20] -attr @name IO_WriteData[20] -hierPin ARMcore IO_WriteData[20] -pin ARMcore|MemOrIO io_wdata[20]
load net ARMcore|IO_WriteData[21] -attr @rip io_wdata[21] -attr @name IO_WriteData[21] -hierPin ARMcore IO_WriteData[21] -pin ARMcore|MemOrIO io_wdata[21]
load net ARMcore|IO_WriteData[22] -attr @rip io_wdata[22] -attr @name IO_WriteData[22] -hierPin ARMcore IO_WriteData[22] -pin ARMcore|MemOrIO io_wdata[22]
load net ARMcore|IO_WriteData[23] -attr @rip io_wdata[23] -attr @name IO_WriteData[23] -hierPin ARMcore IO_WriteData[23] -pin ARMcore|MemOrIO io_wdata[23]
load net ARMcore|IO_WriteData[24] -attr @rip io_wdata[24] -attr @name IO_WriteData[24] -hierPin ARMcore IO_WriteData[24] -pin ARMcore|MemOrIO io_wdata[24]
load net ARMcore|IO_WriteData[25] -attr @rip io_wdata[25] -attr @name IO_WriteData[25] -hierPin ARMcore IO_WriteData[25] -pin ARMcore|MemOrIO io_wdata[25]
load net ARMcore|IO_WriteData[26] -attr @rip io_wdata[26] -attr @name IO_WriteData[26] -hierPin ARMcore IO_WriteData[26] -pin ARMcore|MemOrIO io_wdata[26]
load net ARMcore|IO_WriteData[27] -attr @rip io_wdata[27] -attr @name IO_WriteData[27] -hierPin ARMcore IO_WriteData[27] -pin ARMcore|MemOrIO io_wdata[27]
load net ARMcore|IO_WriteData[28] -attr @rip io_wdata[28] -attr @name IO_WriteData[28] -hierPin ARMcore IO_WriteData[28] -pin ARMcore|MemOrIO io_wdata[28]
load net ARMcore|IO_WriteData[29] -attr @rip io_wdata[29] -attr @name IO_WriteData[29] -hierPin ARMcore IO_WriteData[29] -pin ARMcore|MemOrIO io_wdata[29]
load net ARMcore|IO_WriteData[2] -attr @rip io_wdata[2] -attr @name IO_WriteData[2] -hierPin ARMcore IO_WriteData[2] -pin ARMcore|MemOrIO io_wdata[2]
load net ARMcore|IO_WriteData[30] -attr @rip io_wdata[30] -attr @name IO_WriteData[30] -hierPin ARMcore IO_WriteData[30] -pin ARMcore|MemOrIO io_wdata[30]
load net ARMcore|IO_WriteData[31] -attr @rip io_wdata[31] -attr @name IO_WriteData[31] -hierPin ARMcore IO_WriteData[31] -pin ARMcore|MemOrIO io_wdata[31]
load net ARMcore|IO_WriteData[3] -attr @rip io_wdata[3] -attr @name IO_WriteData[3] -hierPin ARMcore IO_WriteData[3] -pin ARMcore|MemOrIO io_wdata[3]
load net ARMcore|IO_WriteData[4] -attr @rip io_wdata[4] -attr @name IO_WriteData[4] -hierPin ARMcore IO_WriteData[4] -pin ARMcore|MemOrIO io_wdata[4]
load net ARMcore|IO_WriteData[5] -attr @rip io_wdata[5] -attr @name IO_WriteData[5] -hierPin ARMcore IO_WriteData[5] -pin ARMcore|MemOrIO io_wdata[5]
load net ARMcore|IO_WriteData[6] -attr @rip io_wdata[6] -attr @name IO_WriteData[6] -hierPin ARMcore IO_WriteData[6] -pin ARMcore|MemOrIO io_wdata[6]
load net ARMcore|IO_WriteData[7] -attr @rip io_wdata[7] -attr @name IO_WriteData[7] -hierPin ARMcore IO_WriteData[7] -pin ARMcore|MemOrIO io_wdata[7]
load net ARMcore|IO_WriteData[8] -attr @rip io_wdata[8] -attr @name IO_WriteData[8] -hierPin ARMcore IO_WriteData[8] -pin ARMcore|MemOrIO io_wdata[8]
load net ARMcore|IO_WriteData[9] -attr @rip io_wdata[9] -attr @name IO_WriteData[9] -hierPin ARMcore IO_WriteData[9] -pin ARMcore|MemOrIO io_wdata[9]
load net ARMcore|Instr[0] -attr @rip Instr[0] -attr @name Instr[0] -hierPin ARMcore Instr[0] -pin ARMcore|FDReg InstrF[0]
load net ARMcore|Instr[10] -attr @rip Instr[10] -attr @name Instr[10] -hierPin ARMcore Instr[10] -pin ARMcore|FDReg InstrF[10]
load net ARMcore|Instr[11] -attr @rip Instr[11] -attr @name Instr[11] -hierPin ARMcore Instr[11] -pin ARMcore|FDReg InstrF[11]
load net ARMcore|Instr[12] -attr @rip Instr[12] -attr @name Instr[12] -hierPin ARMcore Instr[12] -pin ARMcore|FDReg InstrF[12]
load net ARMcore|Instr[13] -attr @rip Instr[13] -attr @name Instr[13] -hierPin ARMcore Instr[13] -pin ARMcore|FDReg InstrF[13]
load net ARMcore|Instr[14] -attr @rip Instr[14] -attr @name Instr[14] -hierPin ARMcore Instr[14] -pin ARMcore|FDReg InstrF[14]
load net ARMcore|Instr[15] -attr @rip Instr[15] -attr @name Instr[15] -hierPin ARMcore Instr[15] -pin ARMcore|FDReg InstrF[15]
load net ARMcore|Instr[16] -attr @rip Instr[16] -attr @name Instr[16] -hierPin ARMcore Instr[16] -pin ARMcore|FDReg InstrF[16]
load net ARMcore|Instr[17] -attr @rip Instr[17] -attr @name Instr[17] -hierPin ARMcore Instr[17] -pin ARMcore|FDReg InstrF[17]
load net ARMcore|Instr[18] -attr @rip Instr[18] -attr @name Instr[18] -hierPin ARMcore Instr[18] -pin ARMcore|FDReg InstrF[18]
load net ARMcore|Instr[19] -attr @rip Instr[19] -attr @name Instr[19] -hierPin ARMcore Instr[19] -pin ARMcore|FDReg InstrF[19]
load net ARMcore|Instr[1] -attr @rip Instr[1] -attr @name Instr[1] -hierPin ARMcore Instr[1] -pin ARMcore|FDReg InstrF[1]
load net ARMcore|Instr[20] -attr @rip Instr[20] -attr @name Instr[20] -hierPin ARMcore Instr[20] -pin ARMcore|FDReg InstrF[20]
load net ARMcore|Instr[21] -attr @rip Instr[21] -attr @name Instr[21] -hierPin ARMcore Instr[21] -pin ARMcore|FDReg InstrF[21]
load net ARMcore|Instr[22] -attr @rip Instr[22] -attr @name Instr[22] -hierPin ARMcore Instr[22] -pin ARMcore|FDReg InstrF[22]
load net ARMcore|Instr[23] -attr @rip Instr[23] -attr @name Instr[23] -hierPin ARMcore Instr[23] -pin ARMcore|FDReg InstrF[23]
load net ARMcore|Instr[24] -attr @rip Instr[24] -attr @name Instr[24] -hierPin ARMcore Instr[24] -pin ARMcore|FDReg InstrF[24]
load net ARMcore|Instr[25] -attr @rip Instr[25] -attr @name Instr[25] -hierPin ARMcore Instr[25] -pin ARMcore|FDReg InstrF[25]
load net ARMcore|Instr[26] -attr @rip Instr[26] -attr @name Instr[26] -hierPin ARMcore Instr[26] -pin ARMcore|FDReg InstrF[26]
load net ARMcore|Instr[27] -attr @rip Instr[27] -attr @name Instr[27] -hierPin ARMcore Instr[27] -pin ARMcore|FDReg InstrF[27]
load net ARMcore|Instr[28] -attr @rip Instr[28] -attr @name Instr[28] -hierPin ARMcore Instr[28] -pin ARMcore|FDReg InstrF[28]
load net ARMcore|Instr[29] -attr @rip Instr[29] -attr @name Instr[29] -hierPin ARMcore Instr[29] -pin ARMcore|FDReg InstrF[29]
load net ARMcore|Instr[2] -attr @rip Instr[2] -attr @name Instr[2] -hierPin ARMcore Instr[2] -pin ARMcore|FDReg InstrF[2]
load net ARMcore|Instr[30] -attr @rip Instr[30] -attr @name Instr[30] -hierPin ARMcore Instr[30] -pin ARMcore|FDReg InstrF[30]
load net ARMcore|Instr[31] -attr @rip Instr[31] -attr @name Instr[31] -hierPin ARMcore Instr[31] -pin ARMcore|FDReg InstrF[31]
load net ARMcore|Instr[3] -attr @rip Instr[3] -attr @name Instr[3] -hierPin ARMcore Instr[3] -pin ARMcore|FDReg InstrF[3]
load net ARMcore|Instr[4] -attr @rip Instr[4] -attr @name Instr[4] -hierPin ARMcore Instr[4] -pin ARMcore|FDReg InstrF[4]
load net ARMcore|Instr[5] -attr @rip Instr[5] -attr @name Instr[5] -hierPin ARMcore Instr[5] -pin ARMcore|FDReg InstrF[5]
load net ARMcore|Instr[6] -attr @rip Instr[6] -attr @name Instr[6] -hierPin ARMcore Instr[6] -pin ARMcore|FDReg InstrF[6]
load net ARMcore|Instr[7] -attr @rip Instr[7] -attr @name Instr[7] -hierPin ARMcore Instr[7] -pin ARMcore|FDReg InstrF[7]
load net ARMcore|Instr[8] -attr @rip Instr[8] -attr @name Instr[8] -hierPin ARMcore Instr[8] -pin ARMcore|FDReg InstrF[8]
load net ARMcore|Instr[9] -attr @rip Instr[9] -attr @name Instr[9] -hierPin ARMcore Instr[9] -pin ARMcore|FDReg InstrF[9]
load net ARMcore|MCycle_MPushIn -attr @name MCycle_MPushIn -pin ARMcore|EMReg_ALUResultE1_i S -pin ARMcore|EMReg_RegWriteE1_i I0 -pin ARMcore|EMReg_WA3E_i S -pin ARMcore|MCycle MPushIn
netloc ARMcore|MCycle_MPushIn 1 13 2 N 1388 8100
load net ARMcore|MCycle_Result[0] -attr @rip Result[0] -attr @name MCycle_Result[0] -pin ARMcore|EMReg_ALUResultE1_i I0[0] -pin ARMcore|MCycle Result[0]
load net ARMcore|MCycle_Result[10] -attr @rip Result[10] -attr @name MCycle_Result[10] -pin ARMcore|EMReg_ALUResultE1_i I0[10] -pin ARMcore|MCycle Result[10]
load net ARMcore|MCycle_Result[11] -attr @rip Result[11] -attr @name MCycle_Result[11] -pin ARMcore|EMReg_ALUResultE1_i I0[11] -pin ARMcore|MCycle Result[11]
load net ARMcore|MCycle_Result[12] -attr @rip Result[12] -attr @name MCycle_Result[12] -pin ARMcore|EMReg_ALUResultE1_i I0[12] -pin ARMcore|MCycle Result[12]
load net ARMcore|MCycle_Result[13] -attr @rip Result[13] -attr @name MCycle_Result[13] -pin ARMcore|EMReg_ALUResultE1_i I0[13] -pin ARMcore|MCycle Result[13]
load net ARMcore|MCycle_Result[14] -attr @rip Result[14] -attr @name MCycle_Result[14] -pin ARMcore|EMReg_ALUResultE1_i I0[14] -pin ARMcore|MCycle Result[14]
load net ARMcore|MCycle_Result[15] -attr @rip Result[15] -attr @name MCycle_Result[15] -pin ARMcore|EMReg_ALUResultE1_i I0[15] -pin ARMcore|MCycle Result[15]
load net ARMcore|MCycle_Result[16] -attr @rip Result[16] -attr @name MCycle_Result[16] -pin ARMcore|EMReg_ALUResultE1_i I0[16] -pin ARMcore|MCycle Result[16]
load net ARMcore|MCycle_Result[17] -attr @rip Result[17] -attr @name MCycle_Result[17] -pin ARMcore|EMReg_ALUResultE1_i I0[17] -pin ARMcore|MCycle Result[17]
load net ARMcore|MCycle_Result[18] -attr @rip Result[18] -attr @name MCycle_Result[18] -pin ARMcore|EMReg_ALUResultE1_i I0[18] -pin ARMcore|MCycle Result[18]
load net ARMcore|MCycle_Result[19] -attr @rip Result[19] -attr @name MCycle_Result[19] -pin ARMcore|EMReg_ALUResultE1_i I0[19] -pin ARMcore|MCycle Result[19]
load net ARMcore|MCycle_Result[1] -attr @rip Result[1] -attr @name MCycle_Result[1] -pin ARMcore|EMReg_ALUResultE1_i I0[1] -pin ARMcore|MCycle Result[1]
load net ARMcore|MCycle_Result[20] -attr @rip Result[20] -attr @name MCycle_Result[20] -pin ARMcore|EMReg_ALUResultE1_i I0[20] -pin ARMcore|MCycle Result[20]
load net ARMcore|MCycle_Result[21] -attr @rip Result[21] -attr @name MCycle_Result[21] -pin ARMcore|EMReg_ALUResultE1_i I0[21] -pin ARMcore|MCycle Result[21]
load net ARMcore|MCycle_Result[22] -attr @rip Result[22] -attr @name MCycle_Result[22] -pin ARMcore|EMReg_ALUResultE1_i I0[22] -pin ARMcore|MCycle Result[22]
load net ARMcore|MCycle_Result[23] -attr @rip Result[23] -attr @name MCycle_Result[23] -pin ARMcore|EMReg_ALUResultE1_i I0[23] -pin ARMcore|MCycle Result[23]
load net ARMcore|MCycle_Result[24] -attr @rip Result[24] -attr @name MCycle_Result[24] -pin ARMcore|EMReg_ALUResultE1_i I0[24] -pin ARMcore|MCycle Result[24]
load net ARMcore|MCycle_Result[25] -attr @rip Result[25] -attr @name MCycle_Result[25] -pin ARMcore|EMReg_ALUResultE1_i I0[25] -pin ARMcore|MCycle Result[25]
load net ARMcore|MCycle_Result[26] -attr @rip Result[26] -attr @name MCycle_Result[26] -pin ARMcore|EMReg_ALUResultE1_i I0[26] -pin ARMcore|MCycle Result[26]
load net ARMcore|MCycle_Result[27] -attr @rip Result[27] -attr @name MCycle_Result[27] -pin ARMcore|EMReg_ALUResultE1_i I0[27] -pin ARMcore|MCycle Result[27]
load net ARMcore|MCycle_Result[28] -attr @rip Result[28] -attr @name MCycle_Result[28] -pin ARMcore|EMReg_ALUResultE1_i I0[28] -pin ARMcore|MCycle Result[28]
load net ARMcore|MCycle_Result[29] -attr @rip Result[29] -attr @name MCycle_Result[29] -pin ARMcore|EMReg_ALUResultE1_i I0[29] -pin ARMcore|MCycle Result[29]
load net ARMcore|MCycle_Result[2] -attr @rip Result[2] -attr @name MCycle_Result[2] -pin ARMcore|EMReg_ALUResultE1_i I0[2] -pin ARMcore|MCycle Result[2]
load net ARMcore|MCycle_Result[30] -attr @rip Result[30] -attr @name MCycle_Result[30] -pin ARMcore|EMReg_ALUResultE1_i I0[30] -pin ARMcore|MCycle Result[30]
load net ARMcore|MCycle_Result[31] -attr @rip Result[31] -attr @name MCycle_Result[31] -pin ARMcore|EMReg_ALUResultE1_i I0[31] -pin ARMcore|MCycle Result[31]
load net ARMcore|MCycle_Result[3] -attr @rip Result[3] -attr @name MCycle_Result[3] -pin ARMcore|EMReg_ALUResultE1_i I0[3] -pin ARMcore|MCycle Result[3]
load net ARMcore|MCycle_Result[4] -attr @rip Result[4] -attr @name MCycle_Result[4] -pin ARMcore|EMReg_ALUResultE1_i I0[4] -pin ARMcore|MCycle Result[4]
load net ARMcore|MCycle_Result[5] -attr @rip Result[5] -attr @name MCycle_Result[5] -pin ARMcore|EMReg_ALUResultE1_i I0[5] -pin ARMcore|MCycle Result[5]
load net ARMcore|MCycle_Result[6] -attr @rip Result[6] -attr @name MCycle_Result[6] -pin ARMcore|EMReg_ALUResultE1_i I0[6] -pin ARMcore|MCycle Result[6]
load net ARMcore|MCycle_Result[7] -attr @rip Result[7] -attr @name MCycle_Result[7] -pin ARMcore|EMReg_ALUResultE1_i I0[7] -pin ARMcore|MCycle Result[7]
load net ARMcore|MCycle_Result[8] -attr @rip Result[8] -attr @name MCycle_Result[8] -pin ARMcore|EMReg_ALUResultE1_i I0[8] -pin ARMcore|MCycle Result[8]
load net ARMcore|MCycle_Result[9] -attr @rip Result[9] -attr @name MCycle_Result[9] -pin ARMcore|EMReg_ALUResultE1_i I0[9] -pin ARMcore|MCycle Result[9]
load net ARMcore|MWReg_ALUOutW[0] -attr @rip ALUOutW[0] -attr @name MWReg_ALUOutW[0] -pin ARMcore|MWReg ALUOutW[0] -pin ARMcore|ResultW_i I1[0]
load net ARMcore|MWReg_ALUOutW[10] -attr @rip ALUOutW[10] -attr @name MWReg_ALUOutW[10] -pin ARMcore|MWReg ALUOutW[10] -pin ARMcore|ResultW_i I1[10]
load net ARMcore|MWReg_ALUOutW[11] -attr @rip ALUOutW[11] -attr @name MWReg_ALUOutW[11] -pin ARMcore|MWReg ALUOutW[11] -pin ARMcore|ResultW_i I1[11]
load net ARMcore|MWReg_ALUOutW[12] -attr @rip ALUOutW[12] -attr @name MWReg_ALUOutW[12] -pin ARMcore|MWReg ALUOutW[12] -pin ARMcore|ResultW_i I1[12]
load net ARMcore|MWReg_ALUOutW[13] -attr @rip ALUOutW[13] -attr @name MWReg_ALUOutW[13] -pin ARMcore|MWReg ALUOutW[13] -pin ARMcore|ResultW_i I1[13]
load net ARMcore|MWReg_ALUOutW[14] -attr @rip ALUOutW[14] -attr @name MWReg_ALUOutW[14] -pin ARMcore|MWReg ALUOutW[14] -pin ARMcore|ResultW_i I1[14]
load net ARMcore|MWReg_ALUOutW[15] -attr @rip ALUOutW[15] -attr @name MWReg_ALUOutW[15] -pin ARMcore|MWReg ALUOutW[15] -pin ARMcore|ResultW_i I1[15]
load net ARMcore|MWReg_ALUOutW[16] -attr @rip ALUOutW[16] -attr @name MWReg_ALUOutW[16] -pin ARMcore|MWReg ALUOutW[16] -pin ARMcore|ResultW_i I1[16]
load net ARMcore|MWReg_ALUOutW[17] -attr @rip ALUOutW[17] -attr @name MWReg_ALUOutW[17] -pin ARMcore|MWReg ALUOutW[17] -pin ARMcore|ResultW_i I1[17]
load net ARMcore|MWReg_ALUOutW[18] -attr @rip ALUOutW[18] -attr @name MWReg_ALUOutW[18] -pin ARMcore|MWReg ALUOutW[18] -pin ARMcore|ResultW_i I1[18]
load net ARMcore|MWReg_ALUOutW[19] -attr @rip ALUOutW[19] -attr @name MWReg_ALUOutW[19] -pin ARMcore|MWReg ALUOutW[19] -pin ARMcore|ResultW_i I1[19]
load net ARMcore|MWReg_ALUOutW[1] -attr @rip ALUOutW[1] -attr @name MWReg_ALUOutW[1] -pin ARMcore|MWReg ALUOutW[1] -pin ARMcore|ResultW_i I1[1]
load net ARMcore|MWReg_ALUOutW[20] -attr @rip ALUOutW[20] -attr @name MWReg_ALUOutW[20] -pin ARMcore|MWReg ALUOutW[20] -pin ARMcore|ResultW_i I1[20]
load net ARMcore|MWReg_ALUOutW[21] -attr @rip ALUOutW[21] -attr @name MWReg_ALUOutW[21] -pin ARMcore|MWReg ALUOutW[21] -pin ARMcore|ResultW_i I1[21]
load net ARMcore|MWReg_ALUOutW[22] -attr @rip ALUOutW[22] -attr @name MWReg_ALUOutW[22] -pin ARMcore|MWReg ALUOutW[22] -pin ARMcore|ResultW_i I1[22]
load net ARMcore|MWReg_ALUOutW[23] -attr @rip ALUOutW[23] -attr @name MWReg_ALUOutW[23] -pin ARMcore|MWReg ALUOutW[23] -pin ARMcore|ResultW_i I1[23]
load net ARMcore|MWReg_ALUOutW[24] -attr @rip ALUOutW[24] -attr @name MWReg_ALUOutW[24] -pin ARMcore|MWReg ALUOutW[24] -pin ARMcore|ResultW_i I1[24]
load net ARMcore|MWReg_ALUOutW[25] -attr @rip ALUOutW[25] -attr @name MWReg_ALUOutW[25] -pin ARMcore|MWReg ALUOutW[25] -pin ARMcore|ResultW_i I1[25]
load net ARMcore|MWReg_ALUOutW[26] -attr @rip ALUOutW[26] -attr @name MWReg_ALUOutW[26] -pin ARMcore|MWReg ALUOutW[26] -pin ARMcore|ResultW_i I1[26]
load net ARMcore|MWReg_ALUOutW[27] -attr @rip ALUOutW[27] -attr @name MWReg_ALUOutW[27] -pin ARMcore|MWReg ALUOutW[27] -pin ARMcore|ResultW_i I1[27]
load net ARMcore|MWReg_ALUOutW[28] -attr @rip ALUOutW[28] -attr @name MWReg_ALUOutW[28] -pin ARMcore|MWReg ALUOutW[28] -pin ARMcore|ResultW_i I1[28]
load net ARMcore|MWReg_ALUOutW[29] -attr @rip ALUOutW[29] -attr @name MWReg_ALUOutW[29] -pin ARMcore|MWReg ALUOutW[29] -pin ARMcore|ResultW_i I1[29]
load net ARMcore|MWReg_ALUOutW[2] -attr @rip ALUOutW[2] -attr @name MWReg_ALUOutW[2] -pin ARMcore|MWReg ALUOutW[2] -pin ARMcore|ResultW_i I1[2]
load net ARMcore|MWReg_ALUOutW[30] -attr @rip ALUOutW[30] -attr @name MWReg_ALUOutW[30] -pin ARMcore|MWReg ALUOutW[30] -pin ARMcore|ResultW_i I1[30]
load net ARMcore|MWReg_ALUOutW[31] -attr @rip ALUOutW[31] -attr @name MWReg_ALUOutW[31] -pin ARMcore|MWReg ALUOutW[31] -pin ARMcore|ResultW_i I1[31]
load net ARMcore|MWReg_ALUOutW[3] -attr @rip ALUOutW[3] -attr @name MWReg_ALUOutW[3] -pin ARMcore|MWReg ALUOutW[3] -pin ARMcore|ResultW_i I1[3]
load net ARMcore|MWReg_ALUOutW[4] -attr @rip ALUOutW[4] -attr @name MWReg_ALUOutW[4] -pin ARMcore|MWReg ALUOutW[4] -pin ARMcore|ResultW_i I1[4]
load net ARMcore|MWReg_ALUOutW[5] -attr @rip ALUOutW[5] -attr @name MWReg_ALUOutW[5] -pin ARMcore|MWReg ALUOutW[5] -pin ARMcore|ResultW_i I1[5]
load net ARMcore|MWReg_ALUOutW[6] -attr @rip ALUOutW[6] -attr @name MWReg_ALUOutW[6] -pin ARMcore|MWReg ALUOutW[6] -pin ARMcore|ResultW_i I1[6]
load net ARMcore|MWReg_ALUOutW[7] -attr @rip ALUOutW[7] -attr @name MWReg_ALUOutW[7] -pin ARMcore|MWReg ALUOutW[7] -pin ARMcore|ResultW_i I1[7]
load net ARMcore|MWReg_ALUOutW[8] -attr @rip ALUOutW[8] -attr @name MWReg_ALUOutW[8] -pin ARMcore|MWReg ALUOutW[8] -pin ARMcore|ResultW_i I1[8]
load net ARMcore|MWReg_ALUOutW[9] -attr @rip ALUOutW[9] -attr @name MWReg_ALUOutW[9] -pin ARMcore|MWReg ALUOutW[9] -pin ARMcore|ResultW_i I1[9]
load net ARMcore|MWReg_ReadDataW[0] -attr @rip ReadDataW[0] -attr @name MWReg_ReadDataW[0] -pin ARMcore|MWReg ReadDataW[0] -pin ARMcore|ResultW_i I0[0]
load net ARMcore|MWReg_ReadDataW[10] -attr @rip ReadDataW[10] -attr @name MWReg_ReadDataW[10] -pin ARMcore|MWReg ReadDataW[10] -pin ARMcore|ResultW_i I0[10]
load net ARMcore|MWReg_ReadDataW[11] -attr @rip ReadDataW[11] -attr @name MWReg_ReadDataW[11] -pin ARMcore|MWReg ReadDataW[11] -pin ARMcore|ResultW_i I0[11]
load net ARMcore|MWReg_ReadDataW[12] -attr @rip ReadDataW[12] -attr @name MWReg_ReadDataW[12] -pin ARMcore|MWReg ReadDataW[12] -pin ARMcore|ResultW_i I0[12]
load net ARMcore|MWReg_ReadDataW[13] -attr @rip ReadDataW[13] -attr @name MWReg_ReadDataW[13] -pin ARMcore|MWReg ReadDataW[13] -pin ARMcore|ResultW_i I0[13]
load net ARMcore|MWReg_ReadDataW[14] -attr @rip ReadDataW[14] -attr @name MWReg_ReadDataW[14] -pin ARMcore|MWReg ReadDataW[14] -pin ARMcore|ResultW_i I0[14]
load net ARMcore|MWReg_ReadDataW[15] -attr @rip ReadDataW[15] -attr @name MWReg_ReadDataW[15] -pin ARMcore|MWReg ReadDataW[15] -pin ARMcore|ResultW_i I0[15]
load net ARMcore|MWReg_ReadDataW[16] -attr @rip ReadDataW[16] -attr @name MWReg_ReadDataW[16] -pin ARMcore|MWReg ReadDataW[16] -pin ARMcore|ResultW_i I0[16]
load net ARMcore|MWReg_ReadDataW[17] -attr @rip ReadDataW[17] -attr @name MWReg_ReadDataW[17] -pin ARMcore|MWReg ReadDataW[17] -pin ARMcore|ResultW_i I0[17]
load net ARMcore|MWReg_ReadDataW[18] -attr @rip ReadDataW[18] -attr @name MWReg_ReadDataW[18] -pin ARMcore|MWReg ReadDataW[18] -pin ARMcore|ResultW_i I0[18]
load net ARMcore|MWReg_ReadDataW[19] -attr @rip ReadDataW[19] -attr @name MWReg_ReadDataW[19] -pin ARMcore|MWReg ReadDataW[19] -pin ARMcore|ResultW_i I0[19]
load net ARMcore|MWReg_ReadDataW[1] -attr @rip ReadDataW[1] -attr @name MWReg_ReadDataW[1] -pin ARMcore|MWReg ReadDataW[1] -pin ARMcore|ResultW_i I0[1]
load net ARMcore|MWReg_ReadDataW[20] -attr @rip ReadDataW[20] -attr @name MWReg_ReadDataW[20] -pin ARMcore|MWReg ReadDataW[20] -pin ARMcore|ResultW_i I0[20]
load net ARMcore|MWReg_ReadDataW[21] -attr @rip ReadDataW[21] -attr @name MWReg_ReadDataW[21] -pin ARMcore|MWReg ReadDataW[21] -pin ARMcore|ResultW_i I0[21]
load net ARMcore|MWReg_ReadDataW[22] -attr @rip ReadDataW[22] -attr @name MWReg_ReadDataW[22] -pin ARMcore|MWReg ReadDataW[22] -pin ARMcore|ResultW_i I0[22]
load net ARMcore|MWReg_ReadDataW[23] -attr @rip ReadDataW[23] -attr @name MWReg_ReadDataW[23] -pin ARMcore|MWReg ReadDataW[23] -pin ARMcore|ResultW_i I0[23]
load net ARMcore|MWReg_ReadDataW[24] -attr @rip ReadDataW[24] -attr @name MWReg_ReadDataW[24] -pin ARMcore|MWReg ReadDataW[24] -pin ARMcore|ResultW_i I0[24]
load net ARMcore|MWReg_ReadDataW[25] -attr @rip ReadDataW[25] -attr @name MWReg_ReadDataW[25] -pin ARMcore|MWReg ReadDataW[25] -pin ARMcore|ResultW_i I0[25]
load net ARMcore|MWReg_ReadDataW[26] -attr @rip ReadDataW[26] -attr @name MWReg_ReadDataW[26] -pin ARMcore|MWReg ReadDataW[26] -pin ARMcore|ResultW_i I0[26]
load net ARMcore|MWReg_ReadDataW[27] -attr @rip ReadDataW[27] -attr @name MWReg_ReadDataW[27] -pin ARMcore|MWReg ReadDataW[27] -pin ARMcore|ResultW_i I0[27]
load net ARMcore|MWReg_ReadDataW[28] -attr @rip ReadDataW[28] -attr @name MWReg_ReadDataW[28] -pin ARMcore|MWReg ReadDataW[28] -pin ARMcore|ResultW_i I0[28]
load net ARMcore|MWReg_ReadDataW[29] -attr @rip ReadDataW[29] -attr @name MWReg_ReadDataW[29] -pin ARMcore|MWReg ReadDataW[29] -pin ARMcore|ResultW_i I0[29]
load net ARMcore|MWReg_ReadDataW[2] -attr @rip ReadDataW[2] -attr @name MWReg_ReadDataW[2] -pin ARMcore|MWReg ReadDataW[2] -pin ARMcore|ResultW_i I0[2]
load net ARMcore|MWReg_ReadDataW[30] -attr @rip ReadDataW[30] -attr @name MWReg_ReadDataW[30] -pin ARMcore|MWReg ReadDataW[30] -pin ARMcore|ResultW_i I0[30]
load net ARMcore|MWReg_ReadDataW[31] -attr @rip ReadDataW[31] -attr @name MWReg_ReadDataW[31] -pin ARMcore|MWReg ReadDataW[31] -pin ARMcore|ResultW_i I0[31]
load net ARMcore|MWReg_ReadDataW[3] -attr @rip ReadDataW[3] -attr @name MWReg_ReadDataW[3] -pin ARMcore|MWReg ReadDataW[3] -pin ARMcore|ResultW_i I0[3]
load net ARMcore|MWReg_ReadDataW[4] -attr @rip ReadDataW[4] -attr @name MWReg_ReadDataW[4] -pin ARMcore|MWReg ReadDataW[4] -pin ARMcore|ResultW_i I0[4]
load net ARMcore|MWReg_ReadDataW[5] -attr @rip ReadDataW[5] -attr @name MWReg_ReadDataW[5] -pin ARMcore|MWReg ReadDataW[5] -pin ARMcore|ResultW_i I0[5]
load net ARMcore|MWReg_ReadDataW[6] -attr @rip ReadDataW[6] -attr @name MWReg_ReadDataW[6] -pin ARMcore|MWReg ReadDataW[6] -pin ARMcore|ResultW_i I0[6]
load net ARMcore|MWReg_ReadDataW[7] -attr @rip ReadDataW[7] -attr @name MWReg_ReadDataW[7] -pin ARMcore|MWReg ReadDataW[7] -pin ARMcore|ResultW_i I0[7]
load net ARMcore|MWReg_ReadDataW[8] -attr @rip ReadDataW[8] -attr @name MWReg_ReadDataW[8] -pin ARMcore|MWReg ReadDataW[8] -pin ARMcore|ResultW_i I0[8]
load net ARMcore|MWReg_ReadDataW[9] -attr @rip ReadDataW[9] -attr @name MWReg_ReadDataW[9] -pin ARMcore|MWReg ReadDataW[9] -pin ARMcore|ResultW_i I0[9]
load net ARMcore|MemOrIO_m_rdata[0] -attr @rip O[0] -attr @name MemOrIO_m_rdata[0] -pin ARMcore|MemOrIO m_rdata[0] -pin ARMcore|MemOrIO_m_rdata_i O[0]
load net ARMcore|MemOrIO_m_rdata[10] -attr @rip O[10] -attr @name MemOrIO_m_rdata[10] -pin ARMcore|MemOrIO m_rdata[10] -pin ARMcore|MemOrIO_m_rdata_i O[10]
load net ARMcore|MemOrIO_m_rdata[11] -attr @rip O[11] -attr @name MemOrIO_m_rdata[11] -pin ARMcore|MemOrIO m_rdata[11] -pin ARMcore|MemOrIO_m_rdata_i O[11]
load net ARMcore|MemOrIO_m_rdata[12] -attr @rip O[12] -attr @name MemOrIO_m_rdata[12] -pin ARMcore|MemOrIO m_rdata[12] -pin ARMcore|MemOrIO_m_rdata_i O[12]
load net ARMcore|MemOrIO_m_rdata[13] -attr @rip O[13] -attr @name MemOrIO_m_rdata[13] -pin ARMcore|MemOrIO m_rdata[13] -pin ARMcore|MemOrIO_m_rdata_i O[13]
load net ARMcore|MemOrIO_m_rdata[14] -attr @rip O[14] -attr @name MemOrIO_m_rdata[14] -pin ARMcore|MemOrIO m_rdata[14] -pin ARMcore|MemOrIO_m_rdata_i O[14]
load net ARMcore|MemOrIO_m_rdata[15] -attr @rip O[15] -attr @name MemOrIO_m_rdata[15] -pin ARMcore|MemOrIO m_rdata[15] -pin ARMcore|MemOrIO_m_rdata_i O[15]
load net ARMcore|MemOrIO_m_rdata[16] -attr @rip O[16] -attr @name MemOrIO_m_rdata[16] -pin ARMcore|MemOrIO m_rdata[16] -pin ARMcore|MemOrIO_m_rdata_i O[16]
load net ARMcore|MemOrIO_m_rdata[17] -attr @rip O[17] -attr @name MemOrIO_m_rdata[17] -pin ARMcore|MemOrIO m_rdata[17] -pin ARMcore|MemOrIO_m_rdata_i O[17]
load net ARMcore|MemOrIO_m_rdata[18] -attr @rip O[18] -attr @name MemOrIO_m_rdata[18] -pin ARMcore|MemOrIO m_rdata[18] -pin ARMcore|MemOrIO_m_rdata_i O[18]
load net ARMcore|MemOrIO_m_rdata[19] -attr @rip O[19] -attr @name MemOrIO_m_rdata[19] -pin ARMcore|MemOrIO m_rdata[19] -pin ARMcore|MemOrIO_m_rdata_i O[19]
load net ARMcore|MemOrIO_m_rdata[1] -attr @rip O[1] -attr @name MemOrIO_m_rdata[1] -pin ARMcore|MemOrIO m_rdata[1] -pin ARMcore|MemOrIO_m_rdata_i O[1]
load net ARMcore|MemOrIO_m_rdata[20] -attr @rip O[20] -attr @name MemOrIO_m_rdata[20] -pin ARMcore|MemOrIO m_rdata[20] -pin ARMcore|MemOrIO_m_rdata_i O[20]
load net ARMcore|MemOrIO_m_rdata[21] -attr @rip O[21] -attr @name MemOrIO_m_rdata[21] -pin ARMcore|MemOrIO m_rdata[21] -pin ARMcore|MemOrIO_m_rdata_i O[21]
load net ARMcore|MemOrIO_m_rdata[22] -attr @rip O[22] -attr @name MemOrIO_m_rdata[22] -pin ARMcore|MemOrIO m_rdata[22] -pin ARMcore|MemOrIO_m_rdata_i O[22]
load net ARMcore|MemOrIO_m_rdata[23] -attr @rip O[23] -attr @name MemOrIO_m_rdata[23] -pin ARMcore|MemOrIO m_rdata[23] -pin ARMcore|MemOrIO_m_rdata_i O[23]
load net ARMcore|MemOrIO_m_rdata[24] -attr @rip O[24] -attr @name MemOrIO_m_rdata[24] -pin ARMcore|MemOrIO m_rdata[24] -pin ARMcore|MemOrIO_m_rdata_i O[24]
load net ARMcore|MemOrIO_m_rdata[25] -attr @rip O[25] -attr @name MemOrIO_m_rdata[25] -pin ARMcore|MemOrIO m_rdata[25] -pin ARMcore|MemOrIO_m_rdata_i O[25]
load net ARMcore|MemOrIO_m_rdata[26] -attr @rip O[26] -attr @name MemOrIO_m_rdata[26] -pin ARMcore|MemOrIO m_rdata[26] -pin ARMcore|MemOrIO_m_rdata_i O[26]
load net ARMcore|MemOrIO_m_rdata[27] -attr @rip O[27] -attr @name MemOrIO_m_rdata[27] -pin ARMcore|MemOrIO m_rdata[27] -pin ARMcore|MemOrIO_m_rdata_i O[27]
load net ARMcore|MemOrIO_m_rdata[28] -attr @rip O[28] -attr @name MemOrIO_m_rdata[28] -pin ARMcore|MemOrIO m_rdata[28] -pin ARMcore|MemOrIO_m_rdata_i O[28]
load net ARMcore|MemOrIO_m_rdata[29] -attr @rip O[29] -attr @name MemOrIO_m_rdata[29] -pin ARMcore|MemOrIO m_rdata[29] -pin ARMcore|MemOrIO_m_rdata_i O[29]
load net ARMcore|MemOrIO_m_rdata[2] -attr @rip O[2] -attr @name MemOrIO_m_rdata[2] -pin ARMcore|MemOrIO m_rdata[2] -pin ARMcore|MemOrIO_m_rdata_i O[2]
load net ARMcore|MemOrIO_m_rdata[30] -attr @rip O[30] -attr @name MemOrIO_m_rdata[30] -pin ARMcore|MemOrIO m_rdata[30] -pin ARMcore|MemOrIO_m_rdata_i O[30]
load net ARMcore|MemOrIO_m_rdata[31] -attr @rip O[31] -attr @name MemOrIO_m_rdata[31] -pin ARMcore|MemOrIO m_rdata[31] -pin ARMcore|MemOrIO_m_rdata_i O[31]
load net ARMcore|MemOrIO_m_rdata[3] -attr @rip O[3] -attr @name MemOrIO_m_rdata[3] -pin ARMcore|MemOrIO m_rdata[3] -pin ARMcore|MemOrIO_m_rdata_i O[3]
load net ARMcore|MemOrIO_m_rdata[4] -attr @rip O[4] -attr @name MemOrIO_m_rdata[4] -pin ARMcore|MemOrIO m_rdata[4] -pin ARMcore|MemOrIO_m_rdata_i O[4]
load net ARMcore|MemOrIO_m_rdata[5] -attr @rip O[5] -attr @name MemOrIO_m_rdata[5] -pin ARMcore|MemOrIO m_rdata[5] -pin ARMcore|MemOrIO_m_rdata_i O[5]
load net ARMcore|MemOrIO_m_rdata[6] -attr @rip O[6] -attr @name MemOrIO_m_rdata[6] -pin ARMcore|MemOrIO m_rdata[6] -pin ARMcore|MemOrIO_m_rdata_i O[6]
load net ARMcore|MemOrIO_m_rdata[7] -attr @rip O[7] -attr @name MemOrIO_m_rdata[7] -pin ARMcore|MemOrIO m_rdata[7] -pin ARMcore|MemOrIO_m_rdata_i O[7]
load net ARMcore|MemOrIO_m_rdata[8] -attr @rip O[8] -attr @name MemOrIO_m_rdata[8] -pin ARMcore|MemOrIO m_rdata[8] -pin ARMcore|MemOrIO_m_rdata_i O[8]
load net ARMcore|MemOrIO_m_rdata[9] -attr @rip O[9] -attr @name MemOrIO_m_rdata[9] -pin ARMcore|MemOrIO m_rdata[9] -pin ARMcore|MemOrIO_m_rdata_i O[9]
load net ARMcore|MemOrIO_r_rdata[0] -attr @rip O[0] -attr @name MemOrIO_r_rdata[0] -pin ARMcore|MemOrIO r_rdata[0] -pin ARMcore|MemOrIO_r_rdata_i O[0]
load net ARMcore|MemOrIO_r_rdata[10] -attr @rip O[10] -attr @name MemOrIO_r_rdata[10] -pin ARMcore|MemOrIO r_rdata[10] -pin ARMcore|MemOrIO_r_rdata_i O[10]
load net ARMcore|MemOrIO_r_rdata[11] -attr @rip O[11] -attr @name MemOrIO_r_rdata[11] -pin ARMcore|MemOrIO r_rdata[11] -pin ARMcore|MemOrIO_r_rdata_i O[11]
load net ARMcore|MemOrIO_r_rdata[12] -attr @rip O[12] -attr @name MemOrIO_r_rdata[12] -pin ARMcore|MemOrIO r_rdata[12] -pin ARMcore|MemOrIO_r_rdata_i O[12]
load net ARMcore|MemOrIO_r_rdata[13] -attr @rip O[13] -attr @name MemOrIO_r_rdata[13] -pin ARMcore|MemOrIO r_rdata[13] -pin ARMcore|MemOrIO_r_rdata_i O[13]
load net ARMcore|MemOrIO_r_rdata[14] -attr @rip O[14] -attr @name MemOrIO_r_rdata[14] -pin ARMcore|MemOrIO r_rdata[14] -pin ARMcore|MemOrIO_r_rdata_i O[14]
load net ARMcore|MemOrIO_r_rdata[15] -attr @rip O[15] -attr @name MemOrIO_r_rdata[15] -pin ARMcore|MemOrIO r_rdata[15] -pin ARMcore|MemOrIO_r_rdata_i O[15]
load net ARMcore|MemOrIO_r_rdata[16] -attr @rip O[16] -attr @name MemOrIO_r_rdata[16] -pin ARMcore|MemOrIO r_rdata[16] -pin ARMcore|MemOrIO_r_rdata_i O[16]
load net ARMcore|MemOrIO_r_rdata[17] -attr @rip O[17] -attr @name MemOrIO_r_rdata[17] -pin ARMcore|MemOrIO r_rdata[17] -pin ARMcore|MemOrIO_r_rdata_i O[17]
load net ARMcore|MemOrIO_r_rdata[18] -attr @rip O[18] -attr @name MemOrIO_r_rdata[18] -pin ARMcore|MemOrIO r_rdata[18] -pin ARMcore|MemOrIO_r_rdata_i O[18]
load net ARMcore|MemOrIO_r_rdata[19] -attr @rip O[19] -attr @name MemOrIO_r_rdata[19] -pin ARMcore|MemOrIO r_rdata[19] -pin ARMcore|MemOrIO_r_rdata_i O[19]
load net ARMcore|MemOrIO_r_rdata[1] -attr @rip O[1] -attr @name MemOrIO_r_rdata[1] -pin ARMcore|MemOrIO r_rdata[1] -pin ARMcore|MemOrIO_r_rdata_i O[1]
load net ARMcore|MemOrIO_r_rdata[20] -attr @rip O[20] -attr @name MemOrIO_r_rdata[20] -pin ARMcore|MemOrIO r_rdata[20] -pin ARMcore|MemOrIO_r_rdata_i O[20]
load net ARMcore|MemOrIO_r_rdata[21] -attr @rip O[21] -attr @name MemOrIO_r_rdata[21] -pin ARMcore|MemOrIO r_rdata[21] -pin ARMcore|MemOrIO_r_rdata_i O[21]
load net ARMcore|MemOrIO_r_rdata[22] -attr @rip O[22] -attr @name MemOrIO_r_rdata[22] -pin ARMcore|MemOrIO r_rdata[22] -pin ARMcore|MemOrIO_r_rdata_i O[22]
load net ARMcore|MemOrIO_r_rdata[23] -attr @rip O[23] -attr @name MemOrIO_r_rdata[23] -pin ARMcore|MemOrIO r_rdata[23] -pin ARMcore|MemOrIO_r_rdata_i O[23]
load net ARMcore|MemOrIO_r_rdata[24] -attr @rip O[24] -attr @name MemOrIO_r_rdata[24] -pin ARMcore|MemOrIO r_rdata[24] -pin ARMcore|MemOrIO_r_rdata_i O[24]
load net ARMcore|MemOrIO_r_rdata[25] -attr @rip O[25] -attr @name MemOrIO_r_rdata[25] -pin ARMcore|MemOrIO r_rdata[25] -pin ARMcore|MemOrIO_r_rdata_i O[25]
load net ARMcore|MemOrIO_r_rdata[26] -attr @rip O[26] -attr @name MemOrIO_r_rdata[26] -pin ARMcore|MemOrIO r_rdata[26] -pin ARMcore|MemOrIO_r_rdata_i O[26]
load net ARMcore|MemOrIO_r_rdata[27] -attr @rip O[27] -attr @name MemOrIO_r_rdata[27] -pin ARMcore|MemOrIO r_rdata[27] -pin ARMcore|MemOrIO_r_rdata_i O[27]
load net ARMcore|MemOrIO_r_rdata[28] -attr @rip O[28] -attr @name MemOrIO_r_rdata[28] -pin ARMcore|MemOrIO r_rdata[28] -pin ARMcore|MemOrIO_r_rdata_i O[28]
load net ARMcore|MemOrIO_r_rdata[29] -attr @rip O[29] -attr @name MemOrIO_r_rdata[29] -pin ARMcore|MemOrIO r_rdata[29] -pin ARMcore|MemOrIO_r_rdata_i O[29]
load net ARMcore|MemOrIO_r_rdata[2] -attr @rip O[2] -attr @name MemOrIO_r_rdata[2] -pin ARMcore|MemOrIO r_rdata[2] -pin ARMcore|MemOrIO_r_rdata_i O[2]
load net ARMcore|MemOrIO_r_rdata[30] -attr @rip O[30] -attr @name MemOrIO_r_rdata[30] -pin ARMcore|MemOrIO r_rdata[30] -pin ARMcore|MemOrIO_r_rdata_i O[30]
load net ARMcore|MemOrIO_r_rdata[31] -attr @rip O[31] -attr @name MemOrIO_r_rdata[31] -pin ARMcore|MemOrIO r_rdata[31] -pin ARMcore|MemOrIO_r_rdata_i O[31]
load net ARMcore|MemOrIO_r_rdata[3] -attr @rip O[3] -attr @name MemOrIO_r_rdata[3] -pin ARMcore|MemOrIO r_rdata[3] -pin ARMcore|MemOrIO_r_rdata_i O[3]
load net ARMcore|MemOrIO_r_rdata[4] -attr @rip O[4] -attr @name MemOrIO_r_rdata[4] -pin ARMcore|MemOrIO r_rdata[4] -pin ARMcore|MemOrIO_r_rdata_i O[4]
load net ARMcore|MemOrIO_r_rdata[5] -attr @rip O[5] -attr @name MemOrIO_r_rdata[5] -pin ARMcore|MemOrIO r_rdata[5] -pin ARMcore|MemOrIO_r_rdata_i O[5]
load net ARMcore|MemOrIO_r_rdata[6] -attr @rip O[6] -attr @name MemOrIO_r_rdata[6] -pin ARMcore|MemOrIO r_rdata[6] -pin ARMcore|MemOrIO_r_rdata_i O[6]
load net ARMcore|MemOrIO_r_rdata[7] -attr @rip O[7] -attr @name MemOrIO_r_rdata[7] -pin ARMcore|MemOrIO r_rdata[7] -pin ARMcore|MemOrIO_r_rdata_i O[7]
load net ARMcore|MemOrIO_r_rdata[8] -attr @rip O[8] -attr @name MemOrIO_r_rdata[8] -pin ARMcore|MemOrIO r_rdata[8] -pin ARMcore|MemOrIO_r_rdata_i O[8]
load net ARMcore|MemOrIO_r_rdata[9] -attr @rip O[9] -attr @name MemOrIO_r_rdata[9] -pin ARMcore|MemOrIO r_rdata[9] -pin ARMcore|MemOrIO_r_rdata_i O[9]
load net ARMcore|MemOrIO_r_wdata[0] -attr @rip r_wdata[0] -attr @name MemOrIO_r_wdata[0] -pin ARMcore|MWReg ReadDataM[0] -pin ARMcore|MemOrIO r_wdata[0]
load net ARMcore|MemOrIO_r_wdata[10] -attr @rip r_wdata[10] -attr @name MemOrIO_r_wdata[10] -pin ARMcore|MWReg ReadDataM[10] -pin ARMcore|MemOrIO r_wdata[10]
load net ARMcore|MemOrIO_r_wdata[11] -attr @rip r_wdata[11] -attr @name MemOrIO_r_wdata[11] -pin ARMcore|MWReg ReadDataM[11] -pin ARMcore|MemOrIO r_wdata[11]
load net ARMcore|MemOrIO_r_wdata[12] -attr @rip r_wdata[12] -attr @name MemOrIO_r_wdata[12] -pin ARMcore|MWReg ReadDataM[12] -pin ARMcore|MemOrIO r_wdata[12]
load net ARMcore|MemOrIO_r_wdata[13] -attr @rip r_wdata[13] -attr @name MemOrIO_r_wdata[13] -pin ARMcore|MWReg ReadDataM[13] -pin ARMcore|MemOrIO r_wdata[13]
load net ARMcore|MemOrIO_r_wdata[14] -attr @rip r_wdata[14] -attr @name MemOrIO_r_wdata[14] -pin ARMcore|MWReg ReadDataM[14] -pin ARMcore|MemOrIO r_wdata[14]
load net ARMcore|MemOrIO_r_wdata[15] -attr @rip r_wdata[15] -attr @name MemOrIO_r_wdata[15] -pin ARMcore|MWReg ReadDataM[15] -pin ARMcore|MemOrIO r_wdata[15]
load net ARMcore|MemOrIO_r_wdata[16] -attr @rip r_wdata[16] -attr @name MemOrIO_r_wdata[16] -pin ARMcore|MWReg ReadDataM[16] -pin ARMcore|MemOrIO r_wdata[16]
load net ARMcore|MemOrIO_r_wdata[17] -attr @rip r_wdata[17] -attr @name MemOrIO_r_wdata[17] -pin ARMcore|MWReg ReadDataM[17] -pin ARMcore|MemOrIO r_wdata[17]
load net ARMcore|MemOrIO_r_wdata[18] -attr @rip r_wdata[18] -attr @name MemOrIO_r_wdata[18] -pin ARMcore|MWReg ReadDataM[18] -pin ARMcore|MemOrIO r_wdata[18]
load net ARMcore|MemOrIO_r_wdata[19] -attr @rip r_wdata[19] -attr @name MemOrIO_r_wdata[19] -pin ARMcore|MWReg ReadDataM[19] -pin ARMcore|MemOrIO r_wdata[19]
load net ARMcore|MemOrIO_r_wdata[1] -attr @rip r_wdata[1] -attr @name MemOrIO_r_wdata[1] -pin ARMcore|MWReg ReadDataM[1] -pin ARMcore|MemOrIO r_wdata[1]
load net ARMcore|MemOrIO_r_wdata[20] -attr @rip r_wdata[20] -attr @name MemOrIO_r_wdata[20] -pin ARMcore|MWReg ReadDataM[20] -pin ARMcore|MemOrIO r_wdata[20]
load net ARMcore|MemOrIO_r_wdata[21] -attr @rip r_wdata[21] -attr @name MemOrIO_r_wdata[21] -pin ARMcore|MWReg ReadDataM[21] -pin ARMcore|MemOrIO r_wdata[21]
load net ARMcore|MemOrIO_r_wdata[22] -attr @rip r_wdata[22] -attr @name MemOrIO_r_wdata[22] -pin ARMcore|MWReg ReadDataM[22] -pin ARMcore|MemOrIO r_wdata[22]
load net ARMcore|MemOrIO_r_wdata[23] -attr @rip r_wdata[23] -attr @name MemOrIO_r_wdata[23] -pin ARMcore|MWReg ReadDataM[23] -pin ARMcore|MemOrIO r_wdata[23]
load net ARMcore|MemOrIO_r_wdata[24] -attr @rip r_wdata[24] -attr @name MemOrIO_r_wdata[24] -pin ARMcore|MWReg ReadDataM[24] -pin ARMcore|MemOrIO r_wdata[24]
load net ARMcore|MemOrIO_r_wdata[25] -attr @rip r_wdata[25] -attr @name MemOrIO_r_wdata[25] -pin ARMcore|MWReg ReadDataM[25] -pin ARMcore|MemOrIO r_wdata[25]
load net ARMcore|MemOrIO_r_wdata[26] -attr @rip r_wdata[26] -attr @name MemOrIO_r_wdata[26] -pin ARMcore|MWReg ReadDataM[26] -pin ARMcore|MemOrIO r_wdata[26]
load net ARMcore|MemOrIO_r_wdata[27] -attr @rip r_wdata[27] -attr @name MemOrIO_r_wdata[27] -pin ARMcore|MWReg ReadDataM[27] -pin ARMcore|MemOrIO r_wdata[27]
load net ARMcore|MemOrIO_r_wdata[28] -attr @rip r_wdata[28] -attr @name MemOrIO_r_wdata[28] -pin ARMcore|MWReg ReadDataM[28] -pin ARMcore|MemOrIO r_wdata[28]
load net ARMcore|MemOrIO_r_wdata[29] -attr @rip r_wdata[29] -attr @name MemOrIO_r_wdata[29] -pin ARMcore|MWReg ReadDataM[29] -pin ARMcore|MemOrIO r_wdata[29]
load net ARMcore|MemOrIO_r_wdata[2] -attr @rip r_wdata[2] -attr @name MemOrIO_r_wdata[2] -pin ARMcore|MWReg ReadDataM[2] -pin ARMcore|MemOrIO r_wdata[2]
load net ARMcore|MemOrIO_r_wdata[30] -attr @rip r_wdata[30] -attr @name MemOrIO_r_wdata[30] -pin ARMcore|MWReg ReadDataM[30] -pin ARMcore|MemOrIO r_wdata[30]
load net ARMcore|MemOrIO_r_wdata[31] -attr @rip r_wdata[31] -attr @name MemOrIO_r_wdata[31] -pin ARMcore|MWReg ReadDataM[31] -pin ARMcore|MemOrIO r_wdata[31]
load net ARMcore|MemOrIO_r_wdata[3] -attr @rip r_wdata[3] -attr @name MemOrIO_r_wdata[3] -pin ARMcore|MWReg ReadDataM[3] -pin ARMcore|MemOrIO r_wdata[3]
load net ARMcore|MemOrIO_r_wdata[4] -attr @rip r_wdata[4] -attr @name MemOrIO_r_wdata[4] -pin ARMcore|MWReg ReadDataM[4] -pin ARMcore|MemOrIO r_wdata[4]
load net ARMcore|MemOrIO_r_wdata[5] -attr @rip r_wdata[5] -attr @name MemOrIO_r_wdata[5] -pin ARMcore|MWReg ReadDataM[5] -pin ARMcore|MemOrIO r_wdata[5]
load net ARMcore|MemOrIO_r_wdata[6] -attr @rip r_wdata[6] -attr @name MemOrIO_r_wdata[6] -pin ARMcore|MWReg ReadDataM[6] -pin ARMcore|MemOrIO r_wdata[6]
load net ARMcore|MemOrIO_r_wdata[7] -attr @rip r_wdata[7] -attr @name MemOrIO_r_wdata[7] -pin ARMcore|MWReg ReadDataM[7] -pin ARMcore|MemOrIO r_wdata[7]
load net ARMcore|MemOrIO_r_wdata[8] -attr @rip r_wdata[8] -attr @name MemOrIO_r_wdata[8] -pin ARMcore|MWReg ReadDataM[8] -pin ARMcore|MemOrIO r_wdata[8]
load net ARMcore|MemOrIO_r_wdata[9] -attr @rip r_wdata[9] -attr @name MemOrIO_r_wdata[9] -pin ARMcore|MWReg ReadDataM[9] -pin ARMcore|MemOrIO r_wdata[9]
load net ARMcore|Mem_ReadData[0] -attr @rip Mem_ReadData[0] -attr @name Mem_ReadData[0] -hierPin ARMcore Mem_ReadData[0] -pin ARMcore|MemOrIO_m_rdata_i I1[0]
load net ARMcore|Mem_ReadData[10] -attr @rip Mem_ReadData[10] -attr @name Mem_ReadData[10] -hierPin ARMcore Mem_ReadData[10] -pin ARMcore|MemOrIO_m_rdata_i I1[10]
load net ARMcore|Mem_ReadData[11] -attr @rip Mem_ReadData[11] -attr @name Mem_ReadData[11] -hierPin ARMcore Mem_ReadData[11] -pin ARMcore|MemOrIO_m_rdata_i I1[11]
load net ARMcore|Mem_ReadData[12] -attr @rip Mem_ReadData[12] -attr @name Mem_ReadData[12] -hierPin ARMcore Mem_ReadData[12] -pin ARMcore|MemOrIO_m_rdata_i I1[12]
load net ARMcore|Mem_ReadData[13] -attr @rip Mem_ReadData[13] -attr @name Mem_ReadData[13] -hierPin ARMcore Mem_ReadData[13] -pin ARMcore|MemOrIO_m_rdata_i I1[13]
load net ARMcore|Mem_ReadData[14] -attr @rip Mem_ReadData[14] -attr @name Mem_ReadData[14] -hierPin ARMcore Mem_ReadData[14] -pin ARMcore|MemOrIO_m_rdata_i I1[14]
load net ARMcore|Mem_ReadData[15] -attr @rip Mem_ReadData[15] -attr @name Mem_ReadData[15] -hierPin ARMcore Mem_ReadData[15] -pin ARMcore|MemOrIO_m_rdata_i I1[15]
load net ARMcore|Mem_ReadData[16] -attr @rip Mem_ReadData[16] -attr @name Mem_ReadData[16] -hierPin ARMcore Mem_ReadData[16] -pin ARMcore|MemOrIO_m_rdata_i I1[16]
load net ARMcore|Mem_ReadData[17] -attr @rip Mem_ReadData[17] -attr @name Mem_ReadData[17] -hierPin ARMcore Mem_ReadData[17] -pin ARMcore|MemOrIO_m_rdata_i I1[17]
load net ARMcore|Mem_ReadData[18] -attr @rip Mem_ReadData[18] -attr @name Mem_ReadData[18] -hierPin ARMcore Mem_ReadData[18] -pin ARMcore|MemOrIO_m_rdata_i I1[18]
load net ARMcore|Mem_ReadData[19] -attr @rip Mem_ReadData[19] -attr @name Mem_ReadData[19] -hierPin ARMcore Mem_ReadData[19] -pin ARMcore|MemOrIO_m_rdata_i I1[19]
load net ARMcore|Mem_ReadData[1] -attr @rip Mem_ReadData[1] -attr @name Mem_ReadData[1] -hierPin ARMcore Mem_ReadData[1] -pin ARMcore|MemOrIO_m_rdata_i I1[1]
load net ARMcore|Mem_ReadData[20] -attr @rip Mem_ReadData[20] -attr @name Mem_ReadData[20] -hierPin ARMcore Mem_ReadData[20] -pin ARMcore|MemOrIO_m_rdata_i I1[20]
load net ARMcore|Mem_ReadData[21] -attr @rip Mem_ReadData[21] -attr @name Mem_ReadData[21] -hierPin ARMcore Mem_ReadData[21] -pin ARMcore|MemOrIO_m_rdata_i I1[21]
load net ARMcore|Mem_ReadData[22] -attr @rip Mem_ReadData[22] -attr @name Mem_ReadData[22] -hierPin ARMcore Mem_ReadData[22] -pin ARMcore|MemOrIO_m_rdata_i I1[22]
load net ARMcore|Mem_ReadData[23] -attr @rip Mem_ReadData[23] -attr @name Mem_ReadData[23] -hierPin ARMcore Mem_ReadData[23] -pin ARMcore|MemOrIO_m_rdata_i I1[23]
load net ARMcore|Mem_ReadData[24] -attr @rip Mem_ReadData[24] -attr @name Mem_ReadData[24] -hierPin ARMcore Mem_ReadData[24] -pin ARMcore|MemOrIO_m_rdata_i I1[24]
load net ARMcore|Mem_ReadData[25] -attr @rip Mem_ReadData[25] -attr @name Mem_ReadData[25] -hierPin ARMcore Mem_ReadData[25] -pin ARMcore|MemOrIO_m_rdata_i I1[25]
load net ARMcore|Mem_ReadData[26] -attr @rip Mem_ReadData[26] -attr @name Mem_ReadData[26] -hierPin ARMcore Mem_ReadData[26] -pin ARMcore|MemOrIO_m_rdata_i I1[26]
load net ARMcore|Mem_ReadData[27] -attr @rip Mem_ReadData[27] -attr @name Mem_ReadData[27] -hierPin ARMcore Mem_ReadData[27] -pin ARMcore|MemOrIO_m_rdata_i I1[27]
load net ARMcore|Mem_ReadData[28] -attr @rip Mem_ReadData[28] -attr @name Mem_ReadData[28] -hierPin ARMcore Mem_ReadData[28] -pin ARMcore|MemOrIO_m_rdata_i I1[28]
load net ARMcore|Mem_ReadData[29] -attr @rip Mem_ReadData[29] -attr @name Mem_ReadData[29] -hierPin ARMcore Mem_ReadData[29] -pin ARMcore|MemOrIO_m_rdata_i I1[29]
load net ARMcore|Mem_ReadData[2] -attr @rip Mem_ReadData[2] -attr @name Mem_ReadData[2] -hierPin ARMcore Mem_ReadData[2] -pin ARMcore|MemOrIO_m_rdata_i I1[2]
load net ARMcore|Mem_ReadData[30] -attr @rip Mem_ReadData[30] -attr @name Mem_ReadData[30] -hierPin ARMcore Mem_ReadData[30] -pin ARMcore|MemOrIO_m_rdata_i I1[30]
load net ARMcore|Mem_ReadData[31] -attr @rip Mem_ReadData[31] -attr @name Mem_ReadData[31] -hierPin ARMcore Mem_ReadData[31] -pin ARMcore|MemOrIO_m_rdata_i I1[31]
load net ARMcore|Mem_ReadData[3] -attr @rip Mem_ReadData[3] -attr @name Mem_ReadData[3] -hierPin ARMcore Mem_ReadData[3] -pin ARMcore|MemOrIO_m_rdata_i I1[3]
load net ARMcore|Mem_ReadData[4] -attr @rip Mem_ReadData[4] -attr @name Mem_ReadData[4] -hierPin ARMcore Mem_ReadData[4] -pin ARMcore|MemOrIO_m_rdata_i I1[4]
load net ARMcore|Mem_ReadData[5] -attr @rip Mem_ReadData[5] -attr @name Mem_ReadData[5] -hierPin ARMcore Mem_ReadData[5] -pin ARMcore|MemOrIO_m_rdata_i I1[5]
load net ARMcore|Mem_ReadData[6] -attr @rip Mem_ReadData[6] -attr @name Mem_ReadData[6] -hierPin ARMcore Mem_ReadData[6] -pin ARMcore|MemOrIO_m_rdata_i I1[6]
load net ARMcore|Mem_ReadData[7] -attr @rip Mem_ReadData[7] -attr @name Mem_ReadData[7] -hierPin ARMcore Mem_ReadData[7] -pin ARMcore|MemOrIO_m_rdata_i I1[7]
load net ARMcore|Mem_ReadData[8] -attr @rip Mem_ReadData[8] -attr @name Mem_ReadData[8] -hierPin ARMcore Mem_ReadData[8] -pin ARMcore|MemOrIO_m_rdata_i I1[8]
load net ARMcore|Mem_ReadData[9] -attr @rip Mem_ReadData[9] -attr @name Mem_ReadData[9] -hierPin ARMcore Mem_ReadData[9] -pin ARMcore|MemOrIO_m_rdata_i I1[9]
load net ARMcore|Mem_ReadReady -attr @name Mem_ReadReady -hierPin ARMcore Mem_ReadReady -pin ARMcore|HazardUnit Mem_ReadReady
netloc ARMcore|Mem_ReadReady 1 0 16 1250J 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 NJ 1028 8620
load net ARMcore|PC[0] -attr @rip PC[0] -attr @name PC[0] -hierPin ARMcore PC[0] -pin ARMcore|ProgramCounter PC[0]
load net ARMcore|PC[10] -attr @rip PC[10] -attr @name PC[10] -hierPin ARMcore PC[10] -pin ARMcore|ProgramCounter PC[10]
load net ARMcore|PC[11] -attr @rip PC[11] -attr @name PC[11] -hierPin ARMcore PC[11] -pin ARMcore|ProgramCounter PC[11]
load net ARMcore|PC[12] -attr @rip PC[12] -attr @name PC[12] -hierPin ARMcore PC[12] -pin ARMcore|ProgramCounter PC[12]
load net ARMcore|PC[13] -attr @rip PC[13] -attr @name PC[13] -hierPin ARMcore PC[13] -pin ARMcore|ProgramCounter PC[13]
load net ARMcore|PC[14] -attr @rip PC[14] -attr @name PC[14] -hierPin ARMcore PC[14] -pin ARMcore|ProgramCounter PC[14]
load net ARMcore|PC[15] -attr @rip PC[15] -attr @name PC[15] -hierPin ARMcore PC[15] -pin ARMcore|ProgramCounter PC[15]
load net ARMcore|PC[16] -attr @rip PC[16] -attr @name PC[16] -hierPin ARMcore PC[16] -pin ARMcore|ProgramCounter PC[16]
load net ARMcore|PC[17] -attr @rip PC[17] -attr @name PC[17] -hierPin ARMcore PC[17] -pin ARMcore|ProgramCounter PC[17]
load net ARMcore|PC[18] -attr @rip PC[18] -attr @name PC[18] -hierPin ARMcore PC[18] -pin ARMcore|ProgramCounter PC[18]
load net ARMcore|PC[19] -attr @rip PC[19] -attr @name PC[19] -hierPin ARMcore PC[19] -pin ARMcore|ProgramCounter PC[19]
load net ARMcore|PC[1] -attr @rip PC[1] -attr @name PC[1] -hierPin ARMcore PC[1] -pin ARMcore|ProgramCounter PC[1]
load net ARMcore|PC[20] -attr @rip PC[20] -attr @name PC[20] -hierPin ARMcore PC[20] -pin ARMcore|ProgramCounter PC[20]
load net ARMcore|PC[21] -attr @rip PC[21] -attr @name PC[21] -hierPin ARMcore PC[21] -pin ARMcore|ProgramCounter PC[21]
load net ARMcore|PC[22] -attr @rip PC[22] -attr @name PC[22] -hierPin ARMcore PC[22] -pin ARMcore|ProgramCounter PC[22]
load net ARMcore|PC[23] -attr @rip PC[23] -attr @name PC[23] -hierPin ARMcore PC[23] -pin ARMcore|ProgramCounter PC[23]
load net ARMcore|PC[24] -attr @rip PC[24] -attr @name PC[24] -hierPin ARMcore PC[24] -pin ARMcore|ProgramCounter PC[24]
load net ARMcore|PC[25] -attr @rip PC[25] -attr @name PC[25] -hierPin ARMcore PC[25] -pin ARMcore|ProgramCounter PC[25]
load net ARMcore|PC[26] -attr @rip PC[26] -attr @name PC[26] -hierPin ARMcore PC[26] -pin ARMcore|ProgramCounter PC[26]
load net ARMcore|PC[27] -attr @rip PC[27] -attr @name PC[27] -hierPin ARMcore PC[27] -pin ARMcore|ProgramCounter PC[27]
load net ARMcore|PC[28] -attr @rip PC[28] -attr @name PC[28] -hierPin ARMcore PC[28] -pin ARMcore|ProgramCounter PC[28]
load net ARMcore|PC[29] -attr @rip PC[29] -attr @name PC[29] -hierPin ARMcore PC[29] -pin ARMcore|ProgramCounter PC[29]
load net ARMcore|PC[2] -attr @rip PC[2] -attr @name PC[2] -hierPin ARMcore PC[2] -pin ARMcore|ProgramCounter PC[2]
load net ARMcore|PC[30] -attr @rip PC[30] -attr @name PC[30] -hierPin ARMcore PC[30] -pin ARMcore|ProgramCounter PC[30]
load net ARMcore|PC[31] -attr @rip PC[31] -attr @name PC[31] -hierPin ARMcore PC[31] -pin ARMcore|ProgramCounter PC[31]
load net ARMcore|PC[3] -attr @rip PC[3] -attr @name PC[3] -hierPin ARMcore PC[3] -pin ARMcore|ProgramCounter PC[3]
load net ARMcore|PC[4] -attr @rip PC[4] -attr @name PC[4] -hierPin ARMcore PC[4] -pin ARMcore|ProgramCounter PC[4]
load net ARMcore|PC[5] -attr @rip PC[5] -attr @name PC[5] -hierPin ARMcore PC[5] -pin ARMcore|ProgramCounter PC[5]
load net ARMcore|PC[6] -attr @rip PC[6] -attr @name PC[6] -hierPin ARMcore PC[6] -pin ARMcore|ProgramCounter PC[6]
load net ARMcore|PC[7] -attr @rip PC[7] -attr @name PC[7] -hierPin ARMcore PC[7] -pin ARMcore|ProgramCounter PC[7]
load net ARMcore|PC[8] -attr @rip PC[8] -attr @name PC[8] -hierPin ARMcore PC[8] -pin ARMcore|ProgramCounter PC[8]
load net ARMcore|PC[9] -attr @rip PC[9] -attr @name PC[9] -hierPin ARMcore PC[9] -pin ARMcore|ProgramCounter PC[9]
load net ARMcore|ProgramCounter_EN -attr @name ProgramCounter_EN -pin ARMcore|ProgramCounter EN -pin ARMcore|ProgramCounter_EN_i O
netloc ARMcore|ProgramCounter_EN 1 19 1 11110 838n
load net ARMcore|ProgramCounter_PCPlus4[0] -attr @rip PCPlus4[0] -attr @name ProgramCounter_PCPlus4[0] -pin ARMcore|ProgramCounter PCPlus4[0] -pin ARMcore|RegisterFile R15[0]
load net ARMcore|ProgramCounter_PCPlus4[10] -attr @rip PCPlus4[10] -attr @name ProgramCounter_PCPlus4[10] -pin ARMcore|ProgramCounter PCPlus4[10] -pin ARMcore|RegisterFile R15[10]
load net ARMcore|ProgramCounter_PCPlus4[11] -attr @rip PCPlus4[11] -attr @name ProgramCounter_PCPlus4[11] -pin ARMcore|ProgramCounter PCPlus4[11] -pin ARMcore|RegisterFile R15[11]
load net ARMcore|ProgramCounter_PCPlus4[12] -attr @rip PCPlus4[12] -attr @name ProgramCounter_PCPlus4[12] -pin ARMcore|ProgramCounter PCPlus4[12] -pin ARMcore|RegisterFile R15[12]
load net ARMcore|ProgramCounter_PCPlus4[13] -attr @rip PCPlus4[13] -attr @name ProgramCounter_PCPlus4[13] -pin ARMcore|ProgramCounter PCPlus4[13] -pin ARMcore|RegisterFile R15[13]
load net ARMcore|ProgramCounter_PCPlus4[14] -attr @rip PCPlus4[14] -attr @name ProgramCounter_PCPlus4[14] -pin ARMcore|ProgramCounter PCPlus4[14] -pin ARMcore|RegisterFile R15[14]
load net ARMcore|ProgramCounter_PCPlus4[15] -attr @rip PCPlus4[15] -attr @name ProgramCounter_PCPlus4[15] -pin ARMcore|ProgramCounter PCPlus4[15] -pin ARMcore|RegisterFile R15[15]
load net ARMcore|ProgramCounter_PCPlus4[16] -attr @rip PCPlus4[16] -attr @name ProgramCounter_PCPlus4[16] -pin ARMcore|ProgramCounter PCPlus4[16] -pin ARMcore|RegisterFile R15[16]
load net ARMcore|ProgramCounter_PCPlus4[17] -attr @rip PCPlus4[17] -attr @name ProgramCounter_PCPlus4[17] -pin ARMcore|ProgramCounter PCPlus4[17] -pin ARMcore|RegisterFile R15[17]
load net ARMcore|ProgramCounter_PCPlus4[18] -attr @rip PCPlus4[18] -attr @name ProgramCounter_PCPlus4[18] -pin ARMcore|ProgramCounter PCPlus4[18] -pin ARMcore|RegisterFile R15[18]
load net ARMcore|ProgramCounter_PCPlus4[19] -attr @rip PCPlus4[19] -attr @name ProgramCounter_PCPlus4[19] -pin ARMcore|ProgramCounter PCPlus4[19] -pin ARMcore|RegisterFile R15[19]
load net ARMcore|ProgramCounter_PCPlus4[1] -attr @rip PCPlus4[1] -attr @name ProgramCounter_PCPlus4[1] -pin ARMcore|ProgramCounter PCPlus4[1] -pin ARMcore|RegisterFile R15[1]
load net ARMcore|ProgramCounter_PCPlus4[20] -attr @rip PCPlus4[20] -attr @name ProgramCounter_PCPlus4[20] -pin ARMcore|ProgramCounter PCPlus4[20] -pin ARMcore|RegisterFile R15[20]
load net ARMcore|ProgramCounter_PCPlus4[21] -attr @rip PCPlus4[21] -attr @name ProgramCounter_PCPlus4[21] -pin ARMcore|ProgramCounter PCPlus4[21] -pin ARMcore|RegisterFile R15[21]
load net ARMcore|ProgramCounter_PCPlus4[22] -attr @rip PCPlus4[22] -attr @name ProgramCounter_PCPlus4[22] -pin ARMcore|ProgramCounter PCPlus4[22] -pin ARMcore|RegisterFile R15[22]
load net ARMcore|ProgramCounter_PCPlus4[23] -attr @rip PCPlus4[23] -attr @name ProgramCounter_PCPlus4[23] -pin ARMcore|ProgramCounter PCPlus4[23] -pin ARMcore|RegisterFile R15[23]
load net ARMcore|ProgramCounter_PCPlus4[24] -attr @rip PCPlus4[24] -attr @name ProgramCounter_PCPlus4[24] -pin ARMcore|ProgramCounter PCPlus4[24] -pin ARMcore|RegisterFile R15[24]
load net ARMcore|ProgramCounter_PCPlus4[25] -attr @rip PCPlus4[25] -attr @name ProgramCounter_PCPlus4[25] -pin ARMcore|ProgramCounter PCPlus4[25] -pin ARMcore|RegisterFile R15[25]
load net ARMcore|ProgramCounter_PCPlus4[26] -attr @rip PCPlus4[26] -attr @name ProgramCounter_PCPlus4[26] -pin ARMcore|ProgramCounter PCPlus4[26] -pin ARMcore|RegisterFile R15[26]
load net ARMcore|ProgramCounter_PCPlus4[27] -attr @rip PCPlus4[27] -attr @name ProgramCounter_PCPlus4[27] -pin ARMcore|ProgramCounter PCPlus4[27] -pin ARMcore|RegisterFile R15[27]
load net ARMcore|ProgramCounter_PCPlus4[28] -attr @rip PCPlus4[28] -attr @name ProgramCounter_PCPlus4[28] -pin ARMcore|ProgramCounter PCPlus4[28] -pin ARMcore|RegisterFile R15[28]
load net ARMcore|ProgramCounter_PCPlus4[29] -attr @rip PCPlus4[29] -attr @name ProgramCounter_PCPlus4[29] -pin ARMcore|ProgramCounter PCPlus4[29] -pin ARMcore|RegisterFile R15[29]
load net ARMcore|ProgramCounter_PCPlus4[2] -attr @rip PCPlus4[2] -attr @name ProgramCounter_PCPlus4[2] -pin ARMcore|ProgramCounter PCPlus4[2] -pin ARMcore|RegisterFile R15[2]
load net ARMcore|ProgramCounter_PCPlus4[30] -attr @rip PCPlus4[30] -attr @name ProgramCounter_PCPlus4[30] -pin ARMcore|ProgramCounter PCPlus4[30] -pin ARMcore|RegisterFile R15[30]
load net ARMcore|ProgramCounter_PCPlus4[31] -attr @rip PCPlus4[31] -attr @name ProgramCounter_PCPlus4[31] -pin ARMcore|ProgramCounter PCPlus4[31] -pin ARMcore|RegisterFile R15[31]
load net ARMcore|ProgramCounter_PCPlus4[3] -attr @rip PCPlus4[3] -attr @name ProgramCounter_PCPlus4[3] -pin ARMcore|ProgramCounter PCPlus4[3] -pin ARMcore|RegisterFile R15[3]
load net ARMcore|ProgramCounter_PCPlus4[4] -attr @rip PCPlus4[4] -attr @name ProgramCounter_PCPlus4[4] -pin ARMcore|ProgramCounter PCPlus4[4] -pin ARMcore|RegisterFile R15[4]
load net ARMcore|ProgramCounter_PCPlus4[5] -attr @rip PCPlus4[5] -attr @name ProgramCounter_PCPlus4[5] -pin ARMcore|ProgramCounter PCPlus4[5] -pin ARMcore|RegisterFile R15[5]
load net ARMcore|ProgramCounter_PCPlus4[6] -attr @rip PCPlus4[6] -attr @name ProgramCounter_PCPlus4[6] -pin ARMcore|ProgramCounter PCPlus4[6] -pin ARMcore|RegisterFile R15[6]
load net ARMcore|ProgramCounter_PCPlus4[7] -attr @rip PCPlus4[7] -attr @name ProgramCounter_PCPlus4[7] -pin ARMcore|ProgramCounter PCPlus4[7] -pin ARMcore|RegisterFile R15[7]
load net ARMcore|ProgramCounter_PCPlus4[8] -attr @rip PCPlus4[8] -attr @name ProgramCounter_PCPlus4[8] -pin ARMcore|ProgramCounter PCPlus4[8] -pin ARMcore|RegisterFile R15[8]
load net ARMcore|ProgramCounter_PCPlus4[9] -attr @rip PCPlus4[9] -attr @name ProgramCounter_PCPlus4[9] -pin ARMcore|ProgramCounter PCPlus4[9] -pin ARMcore|RegisterFile R15[9]
load net ARMcore|ProgramCounter_Result[0] -attr @rip ALUResult[0] -attr @name ProgramCounter_Result[0] -pin ARMcore|ALU ALUResult[0] -pin ARMcore|EMReg_ALUResultE1_i I1[0] -pin ARMcore|ProgramCounter Result[0]
load net ARMcore|ProgramCounter_Result[10] -attr @rip ALUResult[10] -attr @name ProgramCounter_Result[10] -pin ARMcore|ALU ALUResult[10] -pin ARMcore|EMReg_ALUResultE1_i I1[10] -pin ARMcore|ProgramCounter Result[10]
load net ARMcore|ProgramCounter_Result[11] -attr @rip ALUResult[11] -attr @name ProgramCounter_Result[11] -pin ARMcore|ALU ALUResult[11] -pin ARMcore|EMReg_ALUResultE1_i I1[11] -pin ARMcore|ProgramCounter Result[11]
load net ARMcore|ProgramCounter_Result[12] -attr @rip ALUResult[12] -attr @name ProgramCounter_Result[12] -pin ARMcore|ALU ALUResult[12] -pin ARMcore|EMReg_ALUResultE1_i I1[12] -pin ARMcore|ProgramCounter Result[12]
load net ARMcore|ProgramCounter_Result[13] -attr @rip ALUResult[13] -attr @name ProgramCounter_Result[13] -pin ARMcore|ALU ALUResult[13] -pin ARMcore|EMReg_ALUResultE1_i I1[13] -pin ARMcore|ProgramCounter Result[13]
load net ARMcore|ProgramCounter_Result[14] -attr @rip ALUResult[14] -attr @name ProgramCounter_Result[14] -pin ARMcore|ALU ALUResult[14] -pin ARMcore|EMReg_ALUResultE1_i I1[14] -pin ARMcore|ProgramCounter Result[14]
load net ARMcore|ProgramCounter_Result[15] -attr @rip ALUResult[15] -attr @name ProgramCounter_Result[15] -pin ARMcore|ALU ALUResult[15] -pin ARMcore|EMReg_ALUResultE1_i I1[15] -pin ARMcore|ProgramCounter Result[15]
load net ARMcore|ProgramCounter_Result[16] -attr @rip ALUResult[16] -attr @name ProgramCounter_Result[16] -pin ARMcore|ALU ALUResult[16] -pin ARMcore|EMReg_ALUResultE1_i I1[16] -pin ARMcore|ProgramCounter Result[16]
load net ARMcore|ProgramCounter_Result[17] -attr @rip ALUResult[17] -attr @name ProgramCounter_Result[17] -pin ARMcore|ALU ALUResult[17] -pin ARMcore|EMReg_ALUResultE1_i I1[17] -pin ARMcore|ProgramCounter Result[17]
load net ARMcore|ProgramCounter_Result[18] -attr @rip ALUResult[18] -attr @name ProgramCounter_Result[18] -pin ARMcore|ALU ALUResult[18] -pin ARMcore|EMReg_ALUResultE1_i I1[18] -pin ARMcore|ProgramCounter Result[18]
load net ARMcore|ProgramCounter_Result[19] -attr @rip ALUResult[19] -attr @name ProgramCounter_Result[19] -pin ARMcore|ALU ALUResult[19] -pin ARMcore|EMReg_ALUResultE1_i I1[19] -pin ARMcore|ProgramCounter Result[19]
load net ARMcore|ProgramCounter_Result[1] -attr @rip ALUResult[1] -attr @name ProgramCounter_Result[1] -pin ARMcore|ALU ALUResult[1] -pin ARMcore|EMReg_ALUResultE1_i I1[1] -pin ARMcore|ProgramCounter Result[1]
load net ARMcore|ProgramCounter_Result[20] -attr @rip ALUResult[20] -attr @name ProgramCounter_Result[20] -pin ARMcore|ALU ALUResult[20] -pin ARMcore|EMReg_ALUResultE1_i I1[20] -pin ARMcore|ProgramCounter Result[20]
load net ARMcore|ProgramCounter_Result[21] -attr @rip ALUResult[21] -attr @name ProgramCounter_Result[21] -pin ARMcore|ALU ALUResult[21] -pin ARMcore|EMReg_ALUResultE1_i I1[21] -pin ARMcore|ProgramCounter Result[21]
load net ARMcore|ProgramCounter_Result[22] -attr @rip ALUResult[22] -attr @name ProgramCounter_Result[22] -pin ARMcore|ALU ALUResult[22] -pin ARMcore|EMReg_ALUResultE1_i I1[22] -pin ARMcore|ProgramCounter Result[22]
load net ARMcore|ProgramCounter_Result[23] -attr @rip ALUResult[23] -attr @name ProgramCounter_Result[23] -pin ARMcore|ALU ALUResult[23] -pin ARMcore|EMReg_ALUResultE1_i I1[23] -pin ARMcore|ProgramCounter Result[23]
load net ARMcore|ProgramCounter_Result[24] -attr @rip ALUResult[24] -attr @name ProgramCounter_Result[24] -pin ARMcore|ALU ALUResult[24] -pin ARMcore|EMReg_ALUResultE1_i I1[24] -pin ARMcore|ProgramCounter Result[24]
load net ARMcore|ProgramCounter_Result[25] -attr @rip ALUResult[25] -attr @name ProgramCounter_Result[25] -pin ARMcore|ALU ALUResult[25] -pin ARMcore|EMReg_ALUResultE1_i I1[25] -pin ARMcore|ProgramCounter Result[25]
load net ARMcore|ProgramCounter_Result[26] -attr @rip ALUResult[26] -attr @name ProgramCounter_Result[26] -pin ARMcore|ALU ALUResult[26] -pin ARMcore|EMReg_ALUResultE1_i I1[26] -pin ARMcore|ProgramCounter Result[26]
load net ARMcore|ProgramCounter_Result[27] -attr @rip ALUResult[27] -attr @name ProgramCounter_Result[27] -pin ARMcore|ALU ALUResult[27] -pin ARMcore|EMReg_ALUResultE1_i I1[27] -pin ARMcore|ProgramCounter Result[27]
load net ARMcore|ProgramCounter_Result[28] -attr @rip ALUResult[28] -attr @name ProgramCounter_Result[28] -pin ARMcore|ALU ALUResult[28] -pin ARMcore|EMReg_ALUResultE1_i I1[28] -pin ARMcore|ProgramCounter Result[28]
load net ARMcore|ProgramCounter_Result[29] -attr @rip ALUResult[29] -attr @name ProgramCounter_Result[29] -pin ARMcore|ALU ALUResult[29] -pin ARMcore|EMReg_ALUResultE1_i I1[29] -pin ARMcore|ProgramCounter Result[29]
load net ARMcore|ProgramCounter_Result[2] -attr @rip ALUResult[2] -attr @name ProgramCounter_Result[2] -pin ARMcore|ALU ALUResult[2] -pin ARMcore|EMReg_ALUResultE1_i I1[2] -pin ARMcore|ProgramCounter Result[2]
load net ARMcore|ProgramCounter_Result[30] -attr @rip ALUResult[30] -attr @name ProgramCounter_Result[30] -pin ARMcore|ALU ALUResult[30] -pin ARMcore|EMReg_ALUResultE1_i I1[30] -pin ARMcore|ProgramCounter Result[30]
load net ARMcore|ProgramCounter_Result[31] -attr @rip ALUResult[31] -attr @name ProgramCounter_Result[31] -pin ARMcore|ALU ALUResult[31] -pin ARMcore|EMReg_ALUResultE1_i I1[31] -pin ARMcore|ProgramCounter Result[31]
load net ARMcore|ProgramCounter_Result[3] -attr @rip ALUResult[3] -attr @name ProgramCounter_Result[3] -pin ARMcore|ALU ALUResult[3] -pin ARMcore|EMReg_ALUResultE1_i I1[3] -pin ARMcore|ProgramCounter Result[3]
load net ARMcore|ProgramCounter_Result[4] -attr @rip ALUResult[4] -attr @name ProgramCounter_Result[4] -pin ARMcore|ALU ALUResult[4] -pin ARMcore|EMReg_ALUResultE1_i I1[4] -pin ARMcore|ProgramCounter Result[4]
load net ARMcore|ProgramCounter_Result[5] -attr @rip ALUResult[5] -attr @name ProgramCounter_Result[5] -pin ARMcore|ALU ALUResult[5] -pin ARMcore|EMReg_ALUResultE1_i I1[5] -pin ARMcore|ProgramCounter Result[5]
load net ARMcore|ProgramCounter_Result[6] -attr @rip ALUResult[6] -attr @name ProgramCounter_Result[6] -pin ARMcore|ALU ALUResult[6] -pin ARMcore|EMReg_ALUResultE1_i I1[6] -pin ARMcore|ProgramCounter Result[6]
load net ARMcore|ProgramCounter_Result[7] -attr @rip ALUResult[7] -attr @name ProgramCounter_Result[7] -pin ARMcore|ALU ALUResult[7] -pin ARMcore|EMReg_ALUResultE1_i I1[7] -pin ARMcore|ProgramCounter Result[7]
load net ARMcore|ProgramCounter_Result[8] -attr @rip ALUResult[8] -attr @name ProgramCounter_Result[8] -pin ARMcore|ALU ALUResult[8] -pin ARMcore|EMReg_ALUResultE1_i I1[8] -pin ARMcore|ProgramCounter Result[8]
load net ARMcore|ProgramCounter_Result[9] -attr @rip ALUResult[9] -attr @name ProgramCounter_Result[9] -pin ARMcore|ALU ALUResult[9] -pin ARMcore|EMReg_ALUResultE1_i I1[9] -pin ARMcore|ProgramCounter Result[9]
load net ARMcore|RegisterFile_A10_i_n_0 -attr @rip O[3] -attr @name RegisterFile_A10_i_n_0 -pin ARMcore|RegisterFile_A10_i O[3] -pin ARMcore|RegisterFile_A1_i I1[3]
load net ARMcore|RegisterFile_A10_i_n_1 -attr @rip O[2] -attr @name RegisterFile_A10_i_n_1 -pin ARMcore|RegisterFile_A10_i O[2] -pin ARMcore|RegisterFile_A1_i I1[2]
load net ARMcore|RegisterFile_A10_i_n_2 -attr @rip O[1] -attr @name RegisterFile_A10_i_n_2 -pin ARMcore|RegisterFile_A10_i O[1] -pin ARMcore|RegisterFile_A1_i I1[1]
load net ARMcore|RegisterFile_A10_i_n_3 -attr @rip O[0] -attr @name RegisterFile_A10_i_n_3 -pin ARMcore|RegisterFile_A10_i O[0] -pin ARMcore|RegisterFile_A1_i I1[0]
load net ARMcore|RegisterFile_A1[0] -attr @rip O[0] -attr @name RegisterFile_A1[0] -pin ARMcore|DEReg RA1D[0] -pin ARMcore|HazardUnit RA1D[0] -pin ARMcore|RegisterFile A1[0] -pin ARMcore|RegisterFile_A1_i O[0]
load net ARMcore|RegisterFile_A1[1] -attr @rip O[1] -attr @name RegisterFile_A1[1] -pin ARMcore|DEReg RA1D[1] -pin ARMcore|HazardUnit RA1D[1] -pin ARMcore|RegisterFile A1[1] -pin ARMcore|RegisterFile_A1_i O[1]
load net ARMcore|RegisterFile_A1[2] -attr @rip O[2] -attr @name RegisterFile_A1[2] -pin ARMcore|DEReg RA1D[2] -pin ARMcore|HazardUnit RA1D[2] -pin ARMcore|RegisterFile A1[2] -pin ARMcore|RegisterFile_A1_i O[2]
load net ARMcore|RegisterFile_A1[3] -attr @rip O[3] -attr @name RegisterFile_A1[3] -pin ARMcore|DEReg RA1D[3] -pin ARMcore|HazardUnit RA1D[3] -pin ARMcore|RegisterFile A1[3] -pin ARMcore|RegisterFile_A1_i O[3]
load net ARMcore|RegisterFile_A20_i_n_0 -attr @rip O[3] -attr @name RegisterFile_A20_i_n_0 -pin ARMcore|RegisterFile_A20_i O[3] -pin ARMcore|RegisterFile_A2_i I1[3]
load net ARMcore|RegisterFile_A20_i_n_1 -attr @rip O[2] -attr @name RegisterFile_A20_i_n_1 -pin ARMcore|RegisterFile_A20_i O[2] -pin ARMcore|RegisterFile_A2_i I1[2]
load net ARMcore|RegisterFile_A20_i_n_2 -attr @rip O[1] -attr @name RegisterFile_A20_i_n_2 -pin ARMcore|RegisterFile_A20_i O[1] -pin ARMcore|RegisterFile_A2_i I1[1]
load net ARMcore|RegisterFile_A20_i_n_3 -attr @rip O[0] -attr @name RegisterFile_A20_i_n_3 -pin ARMcore|RegisterFile_A20_i O[0] -pin ARMcore|RegisterFile_A2_i I1[0]
load net ARMcore|RegisterFile_A2[0] -attr @rip O[0] -attr @name RegisterFile_A2[0] -pin ARMcore|DEReg RA2D[0] -pin ARMcore|HazardUnit RA2D[0] -pin ARMcore|RegisterFile A2[0] -pin ARMcore|RegisterFile_A2_i O[0]
load net ARMcore|RegisterFile_A2[1] -attr @rip O[1] -attr @name RegisterFile_A2[1] -pin ARMcore|DEReg RA2D[1] -pin ARMcore|HazardUnit RA2D[1] -pin ARMcore|RegisterFile A2[1] -pin ARMcore|RegisterFile_A2_i O[1]
load net ARMcore|RegisterFile_A2[2] -attr @rip O[2] -attr @name RegisterFile_A2[2] -pin ARMcore|DEReg RA2D[2] -pin ARMcore|HazardUnit RA2D[2] -pin ARMcore|RegisterFile A2[2] -pin ARMcore|RegisterFile_A2_i O[2]
load net ARMcore|RegisterFile_A2[3] -attr @rip O[3] -attr @name RegisterFile_A2[3] -pin ARMcore|DEReg RA2D[3] -pin ARMcore|HazardUnit RA2D[3] -pin ARMcore|RegisterFile A2[3] -pin ARMcore|RegisterFile_A2_i O[3]
load net ARMcore|RegisterFile_RD1[0] -attr @rip RD1[0] -attr @name RegisterFile_RD1[0] -pin ARMcore|DEReg RD1D[0] -pin ARMcore|RegisterFile RD1[0]
load net ARMcore|RegisterFile_RD1[10] -attr @rip RD1[10] -attr @name RegisterFile_RD1[10] -pin ARMcore|DEReg RD1D[10] -pin ARMcore|RegisterFile RD1[10]
load net ARMcore|RegisterFile_RD1[11] -attr @rip RD1[11] -attr @name RegisterFile_RD1[11] -pin ARMcore|DEReg RD1D[11] -pin ARMcore|RegisterFile RD1[11]
load net ARMcore|RegisterFile_RD1[12] -attr @rip RD1[12] -attr @name RegisterFile_RD1[12] -pin ARMcore|DEReg RD1D[12] -pin ARMcore|RegisterFile RD1[12]
load net ARMcore|RegisterFile_RD1[13] -attr @rip RD1[13] -attr @name RegisterFile_RD1[13] -pin ARMcore|DEReg RD1D[13] -pin ARMcore|RegisterFile RD1[13]
load net ARMcore|RegisterFile_RD1[14] -attr @rip RD1[14] -attr @name RegisterFile_RD1[14] -pin ARMcore|DEReg RD1D[14] -pin ARMcore|RegisterFile RD1[14]
load net ARMcore|RegisterFile_RD1[15] -attr @rip RD1[15] -attr @name RegisterFile_RD1[15] -pin ARMcore|DEReg RD1D[15] -pin ARMcore|RegisterFile RD1[15]
load net ARMcore|RegisterFile_RD1[16] -attr @rip RD1[16] -attr @name RegisterFile_RD1[16] -pin ARMcore|DEReg RD1D[16] -pin ARMcore|RegisterFile RD1[16]
load net ARMcore|RegisterFile_RD1[17] -attr @rip RD1[17] -attr @name RegisterFile_RD1[17] -pin ARMcore|DEReg RD1D[17] -pin ARMcore|RegisterFile RD1[17]
load net ARMcore|RegisterFile_RD1[18] -attr @rip RD1[18] -attr @name RegisterFile_RD1[18] -pin ARMcore|DEReg RD1D[18] -pin ARMcore|RegisterFile RD1[18]
load net ARMcore|RegisterFile_RD1[19] -attr @rip RD1[19] -attr @name RegisterFile_RD1[19] -pin ARMcore|DEReg RD1D[19] -pin ARMcore|RegisterFile RD1[19]
load net ARMcore|RegisterFile_RD1[1] -attr @rip RD1[1] -attr @name RegisterFile_RD1[1] -pin ARMcore|DEReg RD1D[1] -pin ARMcore|RegisterFile RD1[1]
load net ARMcore|RegisterFile_RD1[20] -attr @rip RD1[20] -attr @name RegisterFile_RD1[20] -pin ARMcore|DEReg RD1D[20] -pin ARMcore|RegisterFile RD1[20]
load net ARMcore|RegisterFile_RD1[21] -attr @rip RD1[21] -attr @name RegisterFile_RD1[21] -pin ARMcore|DEReg RD1D[21] -pin ARMcore|RegisterFile RD1[21]
load net ARMcore|RegisterFile_RD1[22] -attr @rip RD1[22] -attr @name RegisterFile_RD1[22] -pin ARMcore|DEReg RD1D[22] -pin ARMcore|RegisterFile RD1[22]
load net ARMcore|RegisterFile_RD1[23] -attr @rip RD1[23] -attr @name RegisterFile_RD1[23] -pin ARMcore|DEReg RD1D[23] -pin ARMcore|RegisterFile RD1[23]
load net ARMcore|RegisterFile_RD1[24] -attr @rip RD1[24] -attr @name RegisterFile_RD1[24] -pin ARMcore|DEReg RD1D[24] -pin ARMcore|RegisterFile RD1[24]
load net ARMcore|RegisterFile_RD1[25] -attr @rip RD1[25] -attr @name RegisterFile_RD1[25] -pin ARMcore|DEReg RD1D[25] -pin ARMcore|RegisterFile RD1[25]
load net ARMcore|RegisterFile_RD1[26] -attr @rip RD1[26] -attr @name RegisterFile_RD1[26] -pin ARMcore|DEReg RD1D[26] -pin ARMcore|RegisterFile RD1[26]
load net ARMcore|RegisterFile_RD1[27] -attr @rip RD1[27] -attr @name RegisterFile_RD1[27] -pin ARMcore|DEReg RD1D[27] -pin ARMcore|RegisterFile RD1[27]
load net ARMcore|RegisterFile_RD1[28] -attr @rip RD1[28] -attr @name RegisterFile_RD1[28] -pin ARMcore|DEReg RD1D[28] -pin ARMcore|RegisterFile RD1[28]
load net ARMcore|RegisterFile_RD1[29] -attr @rip RD1[29] -attr @name RegisterFile_RD1[29] -pin ARMcore|DEReg RD1D[29] -pin ARMcore|RegisterFile RD1[29]
load net ARMcore|RegisterFile_RD1[2] -attr @rip RD1[2] -attr @name RegisterFile_RD1[2] -pin ARMcore|DEReg RD1D[2] -pin ARMcore|RegisterFile RD1[2]
load net ARMcore|RegisterFile_RD1[30] -attr @rip RD1[30] -attr @name RegisterFile_RD1[30] -pin ARMcore|DEReg RD1D[30] -pin ARMcore|RegisterFile RD1[30]
load net ARMcore|RegisterFile_RD1[31] -attr @rip RD1[31] -attr @name RegisterFile_RD1[31] -pin ARMcore|DEReg RD1D[31] -pin ARMcore|RegisterFile RD1[31]
load net ARMcore|RegisterFile_RD1[3] -attr @rip RD1[3] -attr @name RegisterFile_RD1[3] -pin ARMcore|DEReg RD1D[3] -pin ARMcore|RegisterFile RD1[3]
load net ARMcore|RegisterFile_RD1[4] -attr @rip RD1[4] -attr @name RegisterFile_RD1[4] -pin ARMcore|DEReg RD1D[4] -pin ARMcore|RegisterFile RD1[4]
load net ARMcore|RegisterFile_RD1[5] -attr @rip RD1[5] -attr @name RegisterFile_RD1[5] -pin ARMcore|DEReg RD1D[5] -pin ARMcore|RegisterFile RD1[5]
load net ARMcore|RegisterFile_RD1[6] -attr @rip RD1[6] -attr @name RegisterFile_RD1[6] -pin ARMcore|DEReg RD1D[6] -pin ARMcore|RegisterFile RD1[6]
load net ARMcore|RegisterFile_RD1[7] -attr @rip RD1[7] -attr @name RegisterFile_RD1[7] -pin ARMcore|DEReg RD1D[7] -pin ARMcore|RegisterFile RD1[7]
load net ARMcore|RegisterFile_RD1[8] -attr @rip RD1[8] -attr @name RegisterFile_RD1[8] -pin ARMcore|DEReg RD1D[8] -pin ARMcore|RegisterFile RD1[8]
load net ARMcore|RegisterFile_RD1[9] -attr @rip RD1[9] -attr @name RegisterFile_RD1[9] -pin ARMcore|DEReg RD1D[9] -pin ARMcore|RegisterFile RD1[9]
load net ARMcore|RegisterFile_RD2[0] -attr @rip RD2[0] -attr @name RegisterFile_RD2[0] -pin ARMcore|DEReg RD2D[0] -pin ARMcore|RegisterFile RD2[0]
load net ARMcore|RegisterFile_RD2[10] -attr @rip RD2[10] -attr @name RegisterFile_RD2[10] -pin ARMcore|DEReg RD2D[10] -pin ARMcore|RegisterFile RD2[10]
load net ARMcore|RegisterFile_RD2[11] -attr @rip RD2[11] -attr @name RegisterFile_RD2[11] -pin ARMcore|DEReg RD2D[11] -pin ARMcore|RegisterFile RD2[11]
load net ARMcore|RegisterFile_RD2[12] -attr @rip RD2[12] -attr @name RegisterFile_RD2[12] -pin ARMcore|DEReg RD2D[12] -pin ARMcore|RegisterFile RD2[12]
load net ARMcore|RegisterFile_RD2[13] -attr @rip RD2[13] -attr @name RegisterFile_RD2[13] -pin ARMcore|DEReg RD2D[13] -pin ARMcore|RegisterFile RD2[13]
load net ARMcore|RegisterFile_RD2[14] -attr @rip RD2[14] -attr @name RegisterFile_RD2[14] -pin ARMcore|DEReg RD2D[14] -pin ARMcore|RegisterFile RD2[14]
load net ARMcore|RegisterFile_RD2[15] -attr @rip RD2[15] -attr @name RegisterFile_RD2[15] -pin ARMcore|DEReg RD2D[15] -pin ARMcore|RegisterFile RD2[15]
load net ARMcore|RegisterFile_RD2[16] -attr @rip RD2[16] -attr @name RegisterFile_RD2[16] -pin ARMcore|DEReg RD2D[16] -pin ARMcore|RegisterFile RD2[16]
load net ARMcore|RegisterFile_RD2[17] -attr @rip RD2[17] -attr @name RegisterFile_RD2[17] -pin ARMcore|DEReg RD2D[17] -pin ARMcore|RegisterFile RD2[17]
load net ARMcore|RegisterFile_RD2[18] -attr @rip RD2[18] -attr @name RegisterFile_RD2[18] -pin ARMcore|DEReg RD2D[18] -pin ARMcore|RegisterFile RD2[18]
load net ARMcore|RegisterFile_RD2[19] -attr @rip RD2[19] -attr @name RegisterFile_RD2[19] -pin ARMcore|DEReg RD2D[19] -pin ARMcore|RegisterFile RD2[19]
load net ARMcore|RegisterFile_RD2[1] -attr @rip RD2[1] -attr @name RegisterFile_RD2[1] -pin ARMcore|DEReg RD2D[1] -pin ARMcore|RegisterFile RD2[1]
load net ARMcore|RegisterFile_RD2[20] -attr @rip RD2[20] -attr @name RegisterFile_RD2[20] -pin ARMcore|DEReg RD2D[20] -pin ARMcore|RegisterFile RD2[20]
load net ARMcore|RegisterFile_RD2[21] -attr @rip RD2[21] -attr @name RegisterFile_RD2[21] -pin ARMcore|DEReg RD2D[21] -pin ARMcore|RegisterFile RD2[21]
load net ARMcore|RegisterFile_RD2[22] -attr @rip RD2[22] -attr @name RegisterFile_RD2[22] -pin ARMcore|DEReg RD2D[22] -pin ARMcore|RegisterFile RD2[22]
load net ARMcore|RegisterFile_RD2[23] -attr @rip RD2[23] -attr @name RegisterFile_RD2[23] -pin ARMcore|DEReg RD2D[23] -pin ARMcore|RegisterFile RD2[23]
load net ARMcore|RegisterFile_RD2[24] -attr @rip RD2[24] -attr @name RegisterFile_RD2[24] -pin ARMcore|DEReg RD2D[24] -pin ARMcore|RegisterFile RD2[24]
load net ARMcore|RegisterFile_RD2[25] -attr @rip RD2[25] -attr @name RegisterFile_RD2[25] -pin ARMcore|DEReg RD2D[25] -pin ARMcore|RegisterFile RD2[25]
load net ARMcore|RegisterFile_RD2[26] -attr @rip RD2[26] -attr @name RegisterFile_RD2[26] -pin ARMcore|DEReg RD2D[26] -pin ARMcore|RegisterFile RD2[26]
load net ARMcore|RegisterFile_RD2[27] -attr @rip RD2[27] -attr @name RegisterFile_RD2[27] -pin ARMcore|DEReg RD2D[27] -pin ARMcore|RegisterFile RD2[27]
load net ARMcore|RegisterFile_RD2[28] -attr @rip RD2[28] -attr @name RegisterFile_RD2[28] -pin ARMcore|DEReg RD2D[28] -pin ARMcore|RegisterFile RD2[28]
load net ARMcore|RegisterFile_RD2[29] -attr @rip RD2[29] -attr @name RegisterFile_RD2[29] -pin ARMcore|DEReg RD2D[29] -pin ARMcore|RegisterFile RD2[29]
load net ARMcore|RegisterFile_RD2[2] -attr @rip RD2[2] -attr @name RegisterFile_RD2[2] -pin ARMcore|DEReg RD2D[2] -pin ARMcore|RegisterFile RD2[2]
load net ARMcore|RegisterFile_RD2[30] -attr @rip RD2[30] -attr @name RegisterFile_RD2[30] -pin ARMcore|DEReg RD2D[30] -pin ARMcore|RegisterFile RD2[30]
load net ARMcore|RegisterFile_RD2[31] -attr @rip RD2[31] -attr @name RegisterFile_RD2[31] -pin ARMcore|DEReg RD2D[31] -pin ARMcore|RegisterFile RD2[31]
load net ARMcore|RegisterFile_RD2[3] -attr @rip RD2[3] -attr @name RegisterFile_RD2[3] -pin ARMcore|DEReg RD2D[3] -pin ARMcore|RegisterFile RD2[3]
load net ARMcore|RegisterFile_RD2[4] -attr @rip RD2[4] -attr @name RegisterFile_RD2[4] -pin ARMcore|DEReg RD2D[4] -pin ARMcore|RegisterFile RD2[4]
load net ARMcore|RegisterFile_RD2[5] -attr @rip RD2[5] -attr @name RegisterFile_RD2[5] -pin ARMcore|DEReg RD2D[5] -pin ARMcore|RegisterFile RD2[5]
load net ARMcore|RegisterFile_RD2[6] -attr @rip RD2[6] -attr @name RegisterFile_RD2[6] -pin ARMcore|DEReg RD2D[6] -pin ARMcore|RegisterFile RD2[6]
load net ARMcore|RegisterFile_RD2[7] -attr @rip RD2[7] -attr @name RegisterFile_RD2[7] -pin ARMcore|DEReg RD2D[7] -pin ARMcore|RegisterFile RD2[7]
load net ARMcore|RegisterFile_RD2[8] -attr @rip RD2[8] -attr @name RegisterFile_RD2[8] -pin ARMcore|DEReg RD2D[8] -pin ARMcore|RegisterFile RD2[8]
load net ARMcore|RegisterFile_RD2[9] -attr @rip RD2[9] -attr @name RegisterFile_RD2[9] -pin ARMcore|DEReg RD2D[9] -pin ARMcore|RegisterFile RD2[9]
load net ARMcore|Reset -attr @name Reset -hierPin ARMcore Reset -pin ARMcore|CondUnit Reset -pin ARMcore|DEReg Reset -pin ARMcore|EMReg Reset -pin ARMcore|FDReg Reset -pin ARMcore|FPU Reset -pin ARMcore|MCycle Reset -pin ARMcore|MWReg Reset -pin ARMcore|ProgramCounter Reset -pin ARMcore|RegisterFile Reset
netloc ARMcore|Reset 1 0 20 1290J 1868 1500 2008 NJ 2008 2030 2188 NJ 2188 2990 2188 3580 2068 NJ 2068 NJ 2068 NJ 2068 NJ 2068 6500 1908 7010 1848 NJ 1848 NJ 1848 8800J 1868 NJ 1868 10210 1908 NJ 1908 NJ
load net ARMcore|ResultW[0] -attr @rip O[0] -attr @name ResultW[0] -pin ARMcore|MemOrIO_r_rdata_i I0[0] -pin ARMcore|RegisterFile WD3[0] -pin ARMcore|ResultW_i O[0] -pin ARMcore|SA_i I1[0] -pin ARMcore|SB_i I1[0]
load net ARMcore|ResultW[10] -attr @rip O[10] -attr @name ResultW[10] -pin ARMcore|MemOrIO_r_rdata_i I0[10] -pin ARMcore|RegisterFile WD3[10] -pin ARMcore|ResultW_i O[10] -pin ARMcore|SA_i I1[10] -pin ARMcore|SB_i I1[10]
load net ARMcore|ResultW[11] -attr @rip O[11] -attr @name ResultW[11] -pin ARMcore|MemOrIO_r_rdata_i I0[11] -pin ARMcore|RegisterFile WD3[11] -pin ARMcore|ResultW_i O[11] -pin ARMcore|SA_i I1[11] -pin ARMcore|SB_i I1[11]
load net ARMcore|ResultW[12] -attr @rip O[12] -attr @name ResultW[12] -pin ARMcore|MemOrIO_r_rdata_i I0[12] -pin ARMcore|RegisterFile WD3[12] -pin ARMcore|ResultW_i O[12] -pin ARMcore|SA_i I1[12] -pin ARMcore|SB_i I1[12]
load net ARMcore|ResultW[13] -attr @rip O[13] -attr @name ResultW[13] -pin ARMcore|MemOrIO_r_rdata_i I0[13] -pin ARMcore|RegisterFile WD3[13] -pin ARMcore|ResultW_i O[13] -pin ARMcore|SA_i I1[13] -pin ARMcore|SB_i I1[13]
load net ARMcore|ResultW[14] -attr @rip O[14] -attr @name ResultW[14] -pin ARMcore|MemOrIO_r_rdata_i I0[14] -pin ARMcore|RegisterFile WD3[14] -pin ARMcore|ResultW_i O[14] -pin ARMcore|SA_i I1[14] -pin ARMcore|SB_i I1[14]
load net ARMcore|ResultW[15] -attr @rip O[15] -attr @name ResultW[15] -pin ARMcore|MemOrIO_r_rdata_i I0[15] -pin ARMcore|RegisterFile WD3[15] -pin ARMcore|ResultW_i O[15] -pin ARMcore|SA_i I1[15] -pin ARMcore|SB_i I1[15]
load net ARMcore|ResultW[16] -attr @rip O[16] -attr @name ResultW[16] -pin ARMcore|MemOrIO_r_rdata_i I0[16] -pin ARMcore|RegisterFile WD3[16] -pin ARMcore|ResultW_i O[16] -pin ARMcore|SA_i I1[16] -pin ARMcore|SB_i I1[16]
load net ARMcore|ResultW[17] -attr @rip O[17] -attr @name ResultW[17] -pin ARMcore|MemOrIO_r_rdata_i I0[17] -pin ARMcore|RegisterFile WD3[17] -pin ARMcore|ResultW_i O[17] -pin ARMcore|SA_i I1[17] -pin ARMcore|SB_i I1[17]
load net ARMcore|ResultW[18] -attr @rip O[18] -attr @name ResultW[18] -pin ARMcore|MemOrIO_r_rdata_i I0[18] -pin ARMcore|RegisterFile WD3[18] -pin ARMcore|ResultW_i O[18] -pin ARMcore|SA_i I1[18] -pin ARMcore|SB_i I1[18]
load net ARMcore|ResultW[19] -attr @rip O[19] -attr @name ResultW[19] -pin ARMcore|MemOrIO_r_rdata_i I0[19] -pin ARMcore|RegisterFile WD3[19] -pin ARMcore|ResultW_i O[19] -pin ARMcore|SA_i I1[19] -pin ARMcore|SB_i I1[19]
load net ARMcore|ResultW[1] -attr @rip O[1] -attr @name ResultW[1] -pin ARMcore|MemOrIO_r_rdata_i I0[1] -pin ARMcore|RegisterFile WD3[1] -pin ARMcore|ResultW_i O[1] -pin ARMcore|SA_i I1[1] -pin ARMcore|SB_i I1[1]
load net ARMcore|ResultW[20] -attr @rip O[20] -attr @name ResultW[20] -pin ARMcore|MemOrIO_r_rdata_i I0[20] -pin ARMcore|RegisterFile WD3[20] -pin ARMcore|ResultW_i O[20] -pin ARMcore|SA_i I1[20] -pin ARMcore|SB_i I1[20]
load net ARMcore|ResultW[21] -attr @rip O[21] -attr @name ResultW[21] -pin ARMcore|MemOrIO_r_rdata_i I0[21] -pin ARMcore|RegisterFile WD3[21] -pin ARMcore|ResultW_i O[21] -pin ARMcore|SA_i I1[21] -pin ARMcore|SB_i I1[21]
load net ARMcore|ResultW[22] -attr @rip O[22] -attr @name ResultW[22] -pin ARMcore|MemOrIO_r_rdata_i I0[22] -pin ARMcore|RegisterFile WD3[22] -pin ARMcore|ResultW_i O[22] -pin ARMcore|SA_i I1[22] -pin ARMcore|SB_i I1[22]
load net ARMcore|ResultW[23] -attr @rip O[23] -attr @name ResultW[23] -pin ARMcore|MemOrIO_r_rdata_i I0[23] -pin ARMcore|RegisterFile WD3[23] -pin ARMcore|ResultW_i O[23] -pin ARMcore|SA_i I1[23] -pin ARMcore|SB_i I1[23]
load net ARMcore|ResultW[24] -attr @rip O[24] -attr @name ResultW[24] -pin ARMcore|MemOrIO_r_rdata_i I0[24] -pin ARMcore|RegisterFile WD3[24] -pin ARMcore|ResultW_i O[24] -pin ARMcore|SA_i I1[24] -pin ARMcore|SB_i I1[24]
load net ARMcore|ResultW[25] -attr @rip O[25] -attr @name ResultW[25] -pin ARMcore|MemOrIO_r_rdata_i I0[25] -pin ARMcore|RegisterFile WD3[25] -pin ARMcore|ResultW_i O[25] -pin ARMcore|SA_i I1[25] -pin ARMcore|SB_i I1[25]
load net ARMcore|ResultW[26] -attr @rip O[26] -attr @name ResultW[26] -pin ARMcore|MemOrIO_r_rdata_i I0[26] -pin ARMcore|RegisterFile WD3[26] -pin ARMcore|ResultW_i O[26] -pin ARMcore|SA_i I1[26] -pin ARMcore|SB_i I1[26]
load net ARMcore|ResultW[27] -attr @rip O[27] -attr @name ResultW[27] -pin ARMcore|MemOrIO_r_rdata_i I0[27] -pin ARMcore|RegisterFile WD3[27] -pin ARMcore|ResultW_i O[27] -pin ARMcore|SA_i I1[27] -pin ARMcore|SB_i I1[27]
load net ARMcore|ResultW[28] -attr @rip O[28] -attr @name ResultW[28] -pin ARMcore|MemOrIO_r_rdata_i I0[28] -pin ARMcore|RegisterFile WD3[28] -pin ARMcore|ResultW_i O[28] -pin ARMcore|SA_i I1[28] -pin ARMcore|SB_i I1[28]
load net ARMcore|ResultW[29] -attr @rip O[29] -attr @name ResultW[29] -pin ARMcore|MemOrIO_r_rdata_i I0[29] -pin ARMcore|RegisterFile WD3[29] -pin ARMcore|ResultW_i O[29] -pin ARMcore|SA_i I1[29] -pin ARMcore|SB_i I1[29]
load net ARMcore|ResultW[2] -attr @rip O[2] -attr @name ResultW[2] -pin ARMcore|MemOrIO_r_rdata_i I0[2] -pin ARMcore|RegisterFile WD3[2] -pin ARMcore|ResultW_i O[2] -pin ARMcore|SA_i I1[2] -pin ARMcore|SB_i I1[2]
load net ARMcore|ResultW[30] -attr @rip O[30] -attr @name ResultW[30] -pin ARMcore|MemOrIO_r_rdata_i I0[30] -pin ARMcore|RegisterFile WD3[30] -pin ARMcore|ResultW_i O[30] -pin ARMcore|SA_i I1[30] -pin ARMcore|SB_i I1[30]
load net ARMcore|ResultW[31] -attr @rip O[31] -attr @name ResultW[31] -pin ARMcore|MemOrIO_r_rdata_i I0[31] -pin ARMcore|RegisterFile WD3[31] -pin ARMcore|ResultW_i O[31] -pin ARMcore|SA_i I1[31] -pin ARMcore|SB_i I1[31]
load net ARMcore|ResultW[3] -attr @rip O[3] -attr @name ResultW[3] -pin ARMcore|MemOrIO_r_rdata_i I0[3] -pin ARMcore|RegisterFile WD3[3] -pin ARMcore|ResultW_i O[3] -pin ARMcore|SA_i I1[3] -pin ARMcore|SB_i I1[3]
load net ARMcore|ResultW[4] -attr @rip O[4] -attr @name ResultW[4] -pin ARMcore|MemOrIO_r_rdata_i I0[4] -pin ARMcore|RegisterFile WD3[4] -pin ARMcore|ResultW_i O[4] -pin ARMcore|SA_i I1[4] -pin ARMcore|SB_i I1[4]
load net ARMcore|ResultW[5] -attr @rip O[5] -attr @name ResultW[5] -pin ARMcore|MemOrIO_r_rdata_i I0[5] -pin ARMcore|RegisterFile WD3[5] -pin ARMcore|ResultW_i O[5] -pin ARMcore|SA_i I1[5] -pin ARMcore|SB_i I1[5]
load net ARMcore|ResultW[6] -attr @rip O[6] -attr @name ResultW[6] -pin ARMcore|MemOrIO_r_rdata_i I0[6] -pin ARMcore|RegisterFile WD3[6] -pin ARMcore|ResultW_i O[6] -pin ARMcore|SA_i I1[6] -pin ARMcore|SB_i I1[6]
load net ARMcore|ResultW[7] -attr @rip O[7] -attr @name ResultW[7] -pin ARMcore|MemOrIO_r_rdata_i I0[7] -pin ARMcore|RegisterFile WD3[7] -pin ARMcore|ResultW_i O[7] -pin ARMcore|SA_i I1[7] -pin ARMcore|SB_i I1[7]
load net ARMcore|ResultW[8] -attr @rip O[8] -attr @name ResultW[8] -pin ARMcore|MemOrIO_r_rdata_i I0[8] -pin ARMcore|RegisterFile WD3[8] -pin ARMcore|ResultW_i O[8] -pin ARMcore|SA_i I1[8] -pin ARMcore|SB_i I1[8]
load net ARMcore|ResultW[9] -attr @rip O[9] -attr @name ResultW[9] -pin ARMcore|MemOrIO_r_rdata_i I0[9] -pin ARMcore|RegisterFile WD3[9] -pin ARMcore|ResultW_i O[9] -pin ARMcore|SA_i I1[9] -pin ARMcore|SB_i I1[9]
load net ARMcore|SB[0] -attr @rip O[0] -attr @name SB[0] -pin ARMcore|EMReg WriteDataE[0] -pin ARMcore|FPU Operand2[0] -pin ARMcore|MCycle Operand2[0] -pin ARMcore|SB_i O[0] -pin ARMcore|Shifter ShIn[0]
load net ARMcore|SB[10] -attr @rip O[10] -attr @name SB[10] -pin ARMcore|EMReg WriteDataE[10] -pin ARMcore|FPU Operand2[10] -pin ARMcore|MCycle Operand2[10] -pin ARMcore|SB_i O[10] -pin ARMcore|Shifter ShIn[10]
load net ARMcore|SB[11] -attr @rip O[11] -attr @name SB[11] -pin ARMcore|EMReg WriteDataE[11] -pin ARMcore|FPU Operand2[11] -pin ARMcore|MCycle Operand2[11] -pin ARMcore|SB_i O[11] -pin ARMcore|Shifter ShIn[11]
load net ARMcore|SB[12] -attr @rip O[12] -attr @name SB[12] -pin ARMcore|EMReg WriteDataE[12] -pin ARMcore|FPU Operand2[12] -pin ARMcore|MCycle Operand2[12] -pin ARMcore|SB_i O[12] -pin ARMcore|Shifter ShIn[12]
load net ARMcore|SB[13] -attr @rip O[13] -attr @name SB[13] -pin ARMcore|EMReg WriteDataE[13] -pin ARMcore|FPU Operand2[13] -pin ARMcore|MCycle Operand2[13] -pin ARMcore|SB_i O[13] -pin ARMcore|Shifter ShIn[13]
load net ARMcore|SB[14] -attr @rip O[14] -attr @name SB[14] -pin ARMcore|EMReg WriteDataE[14] -pin ARMcore|FPU Operand2[14] -pin ARMcore|MCycle Operand2[14] -pin ARMcore|SB_i O[14] -pin ARMcore|Shifter ShIn[14]
load net ARMcore|SB[15] -attr @rip O[15] -attr @name SB[15] -pin ARMcore|EMReg WriteDataE[15] -pin ARMcore|FPU Operand2[15] -pin ARMcore|MCycle Operand2[15] -pin ARMcore|SB_i O[15] -pin ARMcore|Shifter ShIn[15]
load net ARMcore|SB[16] -attr @rip O[16] -attr @name SB[16] -pin ARMcore|EMReg WriteDataE[16] -pin ARMcore|FPU Operand2[16] -pin ARMcore|MCycle Operand2[16] -pin ARMcore|SB_i O[16] -pin ARMcore|Shifter ShIn[16]
load net ARMcore|SB[17] -attr @rip O[17] -attr @name SB[17] -pin ARMcore|EMReg WriteDataE[17] -pin ARMcore|FPU Operand2[17] -pin ARMcore|MCycle Operand2[17] -pin ARMcore|SB_i O[17] -pin ARMcore|Shifter ShIn[17]
load net ARMcore|SB[18] -attr @rip O[18] -attr @name SB[18] -pin ARMcore|EMReg WriteDataE[18] -pin ARMcore|FPU Operand2[18] -pin ARMcore|MCycle Operand2[18] -pin ARMcore|SB_i O[18] -pin ARMcore|Shifter ShIn[18]
load net ARMcore|SB[19] -attr @rip O[19] -attr @name SB[19] -pin ARMcore|EMReg WriteDataE[19] -pin ARMcore|FPU Operand2[19] -pin ARMcore|MCycle Operand2[19] -pin ARMcore|SB_i O[19] -pin ARMcore|Shifter ShIn[19]
load net ARMcore|SB[1] -attr @rip O[1] -attr @name SB[1] -pin ARMcore|EMReg WriteDataE[1] -pin ARMcore|FPU Operand2[1] -pin ARMcore|MCycle Operand2[1] -pin ARMcore|SB_i O[1] -pin ARMcore|Shifter ShIn[1]
load net ARMcore|SB[20] -attr @rip O[20] -attr @name SB[20] -pin ARMcore|EMReg WriteDataE[20] -pin ARMcore|FPU Operand2[20] -pin ARMcore|MCycle Operand2[20] -pin ARMcore|SB_i O[20] -pin ARMcore|Shifter ShIn[20]
load net ARMcore|SB[21] -attr @rip O[21] -attr @name SB[21] -pin ARMcore|EMReg WriteDataE[21] -pin ARMcore|FPU Operand2[21] -pin ARMcore|MCycle Operand2[21] -pin ARMcore|SB_i O[21] -pin ARMcore|Shifter ShIn[21]
load net ARMcore|SB[22] -attr @rip O[22] -attr @name SB[22] -pin ARMcore|EMReg WriteDataE[22] -pin ARMcore|FPU Operand2[22] -pin ARMcore|MCycle Operand2[22] -pin ARMcore|SB_i O[22] -pin ARMcore|Shifter ShIn[22]
load net ARMcore|SB[23] -attr @rip O[23] -attr @name SB[23] -pin ARMcore|EMReg WriteDataE[23] -pin ARMcore|FPU Operand2[23] -pin ARMcore|MCycle Operand2[23] -pin ARMcore|SB_i O[23] -pin ARMcore|Shifter ShIn[23]
load net ARMcore|SB[24] -attr @rip O[24] -attr @name SB[24] -pin ARMcore|EMReg WriteDataE[24] -pin ARMcore|FPU Operand2[24] -pin ARMcore|MCycle Operand2[24] -pin ARMcore|SB_i O[24] -pin ARMcore|Shifter ShIn[24]
load net ARMcore|SB[25] -attr @rip O[25] -attr @name SB[25] -pin ARMcore|EMReg WriteDataE[25] -pin ARMcore|FPU Operand2[25] -pin ARMcore|MCycle Operand2[25] -pin ARMcore|SB_i O[25] -pin ARMcore|Shifter ShIn[25]
load net ARMcore|SB[26] -attr @rip O[26] -attr @name SB[26] -pin ARMcore|EMReg WriteDataE[26] -pin ARMcore|FPU Operand2[26] -pin ARMcore|MCycle Operand2[26] -pin ARMcore|SB_i O[26] -pin ARMcore|Shifter ShIn[26]
load net ARMcore|SB[27] -attr @rip O[27] -attr @name SB[27] -pin ARMcore|EMReg WriteDataE[27] -pin ARMcore|FPU Operand2[27] -pin ARMcore|MCycle Operand2[27] -pin ARMcore|SB_i O[27] -pin ARMcore|Shifter ShIn[27]
load net ARMcore|SB[28] -attr @rip O[28] -attr @name SB[28] -pin ARMcore|EMReg WriteDataE[28] -pin ARMcore|FPU Operand2[28] -pin ARMcore|MCycle Operand2[28] -pin ARMcore|SB_i O[28] -pin ARMcore|Shifter ShIn[28]
load net ARMcore|SB[29] -attr @rip O[29] -attr @name SB[29] -pin ARMcore|EMReg WriteDataE[29] -pin ARMcore|FPU Operand2[29] -pin ARMcore|MCycle Operand2[29] -pin ARMcore|SB_i O[29] -pin ARMcore|Shifter ShIn[29]
load net ARMcore|SB[2] -attr @rip O[2] -attr @name SB[2] -pin ARMcore|EMReg WriteDataE[2] -pin ARMcore|FPU Operand2[2] -pin ARMcore|MCycle Operand2[2] -pin ARMcore|SB_i O[2] -pin ARMcore|Shifter ShIn[2]
load net ARMcore|SB[30] -attr @rip O[30] -attr @name SB[30] -pin ARMcore|EMReg WriteDataE[30] -pin ARMcore|FPU Operand2[30] -pin ARMcore|MCycle Operand2[30] -pin ARMcore|SB_i O[30] -pin ARMcore|Shifter ShIn[30]
load net ARMcore|SB[31] -attr @rip O[31] -attr @name SB[31] -pin ARMcore|EMReg WriteDataE[31] -pin ARMcore|FPU Operand2[31] -pin ARMcore|MCycle Operand2[31] -pin ARMcore|SB_i O[31] -pin ARMcore|Shifter ShIn[31]
load net ARMcore|SB[3] -attr @rip O[3] -attr @name SB[3] -pin ARMcore|EMReg WriteDataE[3] -pin ARMcore|FPU Operand2[3] -pin ARMcore|MCycle Operand2[3] -pin ARMcore|SB_i O[3] -pin ARMcore|Shifter ShIn[3]
load net ARMcore|SB[4] -attr @rip O[4] -attr @name SB[4] -pin ARMcore|EMReg WriteDataE[4] -pin ARMcore|FPU Operand2[4] -pin ARMcore|MCycle Operand2[4] -pin ARMcore|SB_i O[4] -pin ARMcore|Shifter ShIn[4]
load net ARMcore|SB[5] -attr @rip O[5] -attr @name SB[5] -pin ARMcore|EMReg WriteDataE[5] -pin ARMcore|FPU Operand2[5] -pin ARMcore|MCycle Operand2[5] -pin ARMcore|SB_i O[5] -pin ARMcore|Shifter ShIn[5]
load net ARMcore|SB[6] -attr @rip O[6] -attr @name SB[6] -pin ARMcore|EMReg WriteDataE[6] -pin ARMcore|FPU Operand2[6] -pin ARMcore|MCycle Operand2[6] -pin ARMcore|SB_i O[6] -pin ARMcore|Shifter ShIn[6]
load net ARMcore|SB[7] -attr @rip O[7] -attr @name SB[7] -pin ARMcore|EMReg WriteDataE[7] -pin ARMcore|FPU Operand2[7] -pin ARMcore|MCycle Operand2[7] -pin ARMcore|SB_i O[7] -pin ARMcore|Shifter ShIn[7]
load net ARMcore|SB[8] -attr @rip O[8] -attr @name SB[8] -pin ARMcore|EMReg WriteDataE[8] -pin ARMcore|FPU Operand2[8] -pin ARMcore|MCycle Operand2[8] -pin ARMcore|SB_i O[8] -pin ARMcore|Shifter ShIn[8]
load net ARMcore|SB[9] -attr @rip O[9] -attr @name SB[9] -pin ARMcore|EMReg WriteDataE[9] -pin ARMcore|FPU Operand2[9] -pin ARMcore|MCycle Operand2[9] -pin ARMcore|SB_i O[9] -pin ARMcore|Shifter ShIn[9]
load net ARMcore|Shifter_CFlag -attr @name Shifter_CFlag -pin ARMcore|ALU CFlag -pin ARMcore|CondUnit CFlag -pin ARMcore|Shifter CFlag
netloc ARMcore|Shifter_CFlag 1 8 5 4780 1788 5120J 1868 5780 1788 6460J 1868 6770
load net ARMcore|Shifter_Carry -attr @name Shifter_Carry -pin ARMcore|CondUnit ShifterCarry -pin ARMcore|Shifter Carry
netloc ARMcore|Shifter_Carry 1 9 3 5100J 1888 NJ 1888 6480
load net ARMcore|Shifter_ShOut[0] -attr @rip ShOut[0] -attr @name Shifter_ShOut[0] -pin ARMcore|ALU_SrcB_i I1[0] -pin ARMcore|Shifter ShOut[0]
load net ARMcore|Shifter_ShOut[10] -attr @rip ShOut[10] -attr @name Shifter_ShOut[10] -pin ARMcore|ALU_SrcB_i I1[10] -pin ARMcore|Shifter ShOut[10]
load net ARMcore|Shifter_ShOut[11] -attr @rip ShOut[11] -attr @name Shifter_ShOut[11] -pin ARMcore|ALU_SrcB_i I1[11] -pin ARMcore|Shifter ShOut[11]
load net ARMcore|Shifter_ShOut[12] -attr @rip ShOut[12] -attr @name Shifter_ShOut[12] -pin ARMcore|ALU_SrcB_i I1[12] -pin ARMcore|Shifter ShOut[12]
load net ARMcore|Shifter_ShOut[13] -attr @rip ShOut[13] -attr @name Shifter_ShOut[13] -pin ARMcore|ALU_SrcB_i I1[13] -pin ARMcore|Shifter ShOut[13]
load net ARMcore|Shifter_ShOut[14] -attr @rip ShOut[14] -attr @name Shifter_ShOut[14] -pin ARMcore|ALU_SrcB_i I1[14] -pin ARMcore|Shifter ShOut[14]
load net ARMcore|Shifter_ShOut[15] -attr @rip ShOut[15] -attr @name Shifter_ShOut[15] -pin ARMcore|ALU_SrcB_i I1[15] -pin ARMcore|Shifter ShOut[15]
load net ARMcore|Shifter_ShOut[16] -attr @rip ShOut[16] -attr @name Shifter_ShOut[16] -pin ARMcore|ALU_SrcB_i I1[16] -pin ARMcore|Shifter ShOut[16]
load net ARMcore|Shifter_ShOut[17] -attr @rip ShOut[17] -attr @name Shifter_ShOut[17] -pin ARMcore|ALU_SrcB_i I1[17] -pin ARMcore|Shifter ShOut[17]
load net ARMcore|Shifter_ShOut[18] -attr @rip ShOut[18] -attr @name Shifter_ShOut[18] -pin ARMcore|ALU_SrcB_i I1[18] -pin ARMcore|Shifter ShOut[18]
load net ARMcore|Shifter_ShOut[19] -attr @rip ShOut[19] -attr @name Shifter_ShOut[19] -pin ARMcore|ALU_SrcB_i I1[19] -pin ARMcore|Shifter ShOut[19]
load net ARMcore|Shifter_ShOut[1] -attr @rip ShOut[1] -attr @name Shifter_ShOut[1] -pin ARMcore|ALU_SrcB_i I1[1] -pin ARMcore|Shifter ShOut[1]
load net ARMcore|Shifter_ShOut[20] -attr @rip ShOut[20] -attr @name Shifter_ShOut[20] -pin ARMcore|ALU_SrcB_i I1[20] -pin ARMcore|Shifter ShOut[20]
load net ARMcore|Shifter_ShOut[21] -attr @rip ShOut[21] -attr @name Shifter_ShOut[21] -pin ARMcore|ALU_SrcB_i I1[21] -pin ARMcore|Shifter ShOut[21]
load net ARMcore|Shifter_ShOut[22] -attr @rip ShOut[22] -attr @name Shifter_ShOut[22] -pin ARMcore|ALU_SrcB_i I1[22] -pin ARMcore|Shifter ShOut[22]
load net ARMcore|Shifter_ShOut[23] -attr @rip ShOut[23] -attr @name Shifter_ShOut[23] -pin ARMcore|ALU_SrcB_i I1[23] -pin ARMcore|Shifter ShOut[23]
load net ARMcore|Shifter_ShOut[24] -attr @rip ShOut[24] -attr @name Shifter_ShOut[24] -pin ARMcore|ALU_SrcB_i I1[24] -pin ARMcore|Shifter ShOut[24]
load net ARMcore|Shifter_ShOut[25] -attr @rip ShOut[25] -attr @name Shifter_ShOut[25] -pin ARMcore|ALU_SrcB_i I1[25] -pin ARMcore|Shifter ShOut[25]
load net ARMcore|Shifter_ShOut[26] -attr @rip ShOut[26] -attr @name Shifter_ShOut[26] -pin ARMcore|ALU_SrcB_i I1[26] -pin ARMcore|Shifter ShOut[26]
load net ARMcore|Shifter_ShOut[27] -attr @rip ShOut[27] -attr @name Shifter_ShOut[27] -pin ARMcore|ALU_SrcB_i I1[27] -pin ARMcore|Shifter ShOut[27]
load net ARMcore|Shifter_ShOut[28] -attr @rip ShOut[28] -attr @name Shifter_ShOut[28] -pin ARMcore|ALU_SrcB_i I1[28] -pin ARMcore|Shifter ShOut[28]
load net ARMcore|Shifter_ShOut[29] -attr @rip ShOut[29] -attr @name Shifter_ShOut[29] -pin ARMcore|ALU_SrcB_i I1[29] -pin ARMcore|Shifter ShOut[29]
load net ARMcore|Shifter_ShOut[2] -attr @rip ShOut[2] -attr @name Shifter_ShOut[2] -pin ARMcore|ALU_SrcB_i I1[2] -pin ARMcore|Shifter ShOut[2]
load net ARMcore|Shifter_ShOut[30] -attr @rip ShOut[30] -attr @name Shifter_ShOut[30] -pin ARMcore|ALU_SrcB_i I1[30] -pin ARMcore|Shifter ShOut[30]
load net ARMcore|Shifter_ShOut[31] -attr @rip ShOut[31] -attr @name Shifter_ShOut[31] -pin ARMcore|ALU_SrcB_i I1[31] -pin ARMcore|Shifter ShOut[31]
load net ARMcore|Shifter_ShOut[3] -attr @rip ShOut[3] -attr @name Shifter_ShOut[3] -pin ARMcore|ALU_SrcB_i I1[3] -pin ARMcore|Shifter ShOut[3]
load net ARMcore|Shifter_ShOut[4] -attr @rip ShOut[4] -attr @name Shifter_ShOut[4] -pin ARMcore|ALU_SrcB_i I1[4] -pin ARMcore|Shifter ShOut[4]
load net ARMcore|Shifter_ShOut[5] -attr @rip ShOut[5] -attr @name Shifter_ShOut[5] -pin ARMcore|ALU_SrcB_i I1[5] -pin ARMcore|Shifter ShOut[5]
load net ARMcore|Shifter_ShOut[6] -attr @rip ShOut[6] -attr @name Shifter_ShOut[6] -pin ARMcore|ALU_SrcB_i I1[6] -pin ARMcore|Shifter ShOut[6]
load net ARMcore|Shifter_ShOut[7] -attr @rip ShOut[7] -attr @name Shifter_ShOut[7] -pin ARMcore|ALU_SrcB_i I1[7] -pin ARMcore|Shifter ShOut[7]
load net ARMcore|Shifter_ShOut[8] -attr @rip ShOut[8] -attr @name Shifter_ShOut[8] -pin ARMcore|ALU_SrcB_i I1[8] -pin ARMcore|Shifter ShOut[8]
load net ARMcore|Shifter_ShOut[9] -attr @rip ShOut[9] -attr @name Shifter_ShOut[9] -pin ARMcore|ALU_SrcB_i I1[9] -pin ARMcore|Shifter ShOut[9]
load netBundle @ARMcore|Cache_ReadData 32 ARMcore|Cache_ReadData[31] ARMcore|Cache_ReadData[30] ARMcore|Cache_ReadData[29] ARMcore|Cache_ReadData[28] ARMcore|Cache_ReadData[27] ARMcore|Cache_ReadData[26] ARMcore|Cache_ReadData[25] ARMcore|Cache_ReadData[24] ARMcore|Cache_ReadData[23] ARMcore|Cache_ReadData[22] ARMcore|Cache_ReadData[21] ARMcore|Cache_ReadData[20] ARMcore|Cache_ReadData[19] ARMcore|Cache_ReadData[18] ARMcore|Cache_ReadData[17] ARMcore|Cache_ReadData[16] ARMcore|Cache_ReadData[15] ARMcore|Cache_ReadData[14] ARMcore|Cache_ReadData[13] ARMcore|Cache_ReadData[12] ARMcore|Cache_ReadData[11] ARMcore|Cache_ReadData[10] ARMcore|Cache_ReadData[9] ARMcore|Cache_ReadData[8] ARMcore|Cache_ReadData[7] ARMcore|Cache_ReadData[6] ARMcore|Cache_ReadData[5] ARMcore|Cache_ReadData[4] ARMcore|Cache_ReadData[3] ARMcore|Cache_ReadData[2] ARMcore|Cache_ReadData[1] ARMcore|Cache_ReadData[0] -autobundled
netbloc @ARMcore|Cache_ReadData 1 0 19 NJ 1888 NJ 1888 NJ 1888 NJ 1888 NJ 1888 NJ 1888 3460J 1908 NJ 1908 4720J 1948 NJ 1948 NJ 1948 6380J 1968 NJ 1968 7540J 1908 8120J 1928 8620J 1978 NJ 1978 NJ 1978 N
load netBundle @ARMcore|IO_ReadData 32 ARMcore|IO_ReadData[31] ARMcore|IO_ReadData[30] ARMcore|IO_ReadData[29] ARMcore|IO_ReadData[28] ARMcore|IO_ReadData[27] ARMcore|IO_ReadData[26] ARMcore|IO_ReadData[25] ARMcore|IO_ReadData[24] ARMcore|IO_ReadData[23] ARMcore|IO_ReadData[22] ARMcore|IO_ReadData[21] ARMcore|IO_ReadData[20] ARMcore|IO_ReadData[19] ARMcore|IO_ReadData[18] ARMcore|IO_ReadData[17] ARMcore|IO_ReadData[16] ARMcore|IO_ReadData[15] ARMcore|IO_ReadData[14] ARMcore|IO_ReadData[13] ARMcore|IO_ReadData[12] ARMcore|IO_ReadData[11] ARMcore|IO_ReadData[10] ARMcore|IO_ReadData[9] ARMcore|IO_ReadData[8] ARMcore|IO_ReadData[7] ARMcore|IO_ReadData[6] ARMcore|IO_ReadData[5] ARMcore|IO_ReadData[4] ARMcore|IO_ReadData[3] ARMcore|IO_ReadData[2] ARMcore|IO_ReadData[1] ARMcore|IO_ReadData[0] -autobundled
netbloc @ARMcore|IO_ReadData 1 0 20 NJ 1928 NJ 1928 NJ 1928 NJ 1928 NJ 1928 NJ 1928 3380J 2148 NJ 2148 NJ 2148 NJ 2148 NJ 2148 NJ 2148 NJ 2148 NJ 2148 NJ 2148 NJ 2148 NJ 2148 NJ 2148 NJ 2148 11130
load netBundle @ARMcore|Instr 32 ARMcore|Instr[31] ARMcore|Instr[30] ARMcore|Instr[29] ARMcore|Instr[28] ARMcore|Instr[27] ARMcore|Instr[26] ARMcore|Instr[25] ARMcore|Instr[24] ARMcore|Instr[23] ARMcore|Instr[22] ARMcore|Instr[21] ARMcore|Instr[20] ARMcore|Instr[19] ARMcore|Instr[18] ARMcore|Instr[17] ARMcore|Instr[16] ARMcore|Instr[15] ARMcore|Instr[14] ARMcore|Instr[13] ARMcore|Instr[12] ARMcore|Instr[11] ARMcore|Instr[10] ARMcore|Instr[9] ARMcore|Instr[8] ARMcore|Instr[7] ARMcore|Instr[6] ARMcore|Instr[5] ARMcore|Instr[4] ARMcore|Instr[3] ARMcore|Instr[2] ARMcore|Instr[1] ARMcore|Instr[0] -autobundled
netbloc @ARMcore|Instr 1 0 2 1270J 1848 1460
load netBundle @ARMcore|Mem_ReadData 32 ARMcore|Mem_ReadData[31] ARMcore|Mem_ReadData[30] ARMcore|Mem_ReadData[29] ARMcore|Mem_ReadData[28] ARMcore|Mem_ReadData[27] ARMcore|Mem_ReadData[26] ARMcore|Mem_ReadData[25] ARMcore|Mem_ReadData[24] ARMcore|Mem_ReadData[23] ARMcore|Mem_ReadData[22] ARMcore|Mem_ReadData[21] ARMcore|Mem_ReadData[20] ARMcore|Mem_ReadData[19] ARMcore|Mem_ReadData[18] ARMcore|Mem_ReadData[17] ARMcore|Mem_ReadData[16] ARMcore|Mem_ReadData[15] ARMcore|Mem_ReadData[14] ARMcore|Mem_ReadData[13] ARMcore|Mem_ReadData[12] ARMcore|Mem_ReadData[11] ARMcore|Mem_ReadData[10] ARMcore|Mem_ReadData[9] ARMcore|Mem_ReadData[8] ARMcore|Mem_ReadData[7] ARMcore|Mem_ReadData[6] ARMcore|Mem_ReadData[5] ARMcore|Mem_ReadData[4] ARMcore|Mem_ReadData[3] ARMcore|Mem_ReadData[2] ARMcore|Mem_ReadData[1] ARMcore|Mem_ReadData[0] -autobundled
netbloc @ARMcore|Mem_ReadData 1 0 19 NJ 1968 NJ 1968 NJ 1968 NJ 1968 2450J 2108 2850J 2168 NJ 2168 NJ 2168 NJ 2168 NJ 2168 NJ 2168 NJ 2168 NJ 2168 NJ 2168 NJ 2168 NJ 2168 NJ 2168 NJ 2168 10730
load netBundle @ARMcore|CondUnit_ALUFlags 4 ARMcore|CondUnit_ALUFlags[3] ARMcore|CondUnit_ALUFlags[2] ARMcore|CondUnit_ALUFlags[1] ARMcore|CondUnit_ALUFlags[0] -autobundled
netbloc @ARMcore|CondUnit_ALUFlags 1 11 1 N 1588
load netBundle @ARMcore|ProgramCounter_Result 32 ARMcore|ProgramCounter_Result[31] ARMcore|ProgramCounter_Result[30] ARMcore|ProgramCounter_Result[29] ARMcore|ProgramCounter_Result[28] ARMcore|ProgramCounter_Result[27] ARMcore|ProgramCounter_Result[26] ARMcore|ProgramCounter_Result[25] ARMcore|ProgramCounter_Result[24] ARMcore|ProgramCounter_Result[23] ARMcore|ProgramCounter_Result[22] ARMcore|ProgramCounter_Result[21] ARMcore|ProgramCounter_Result[20] ARMcore|ProgramCounter_Result[19] ARMcore|ProgramCounter_Result[18] ARMcore|ProgramCounter_Result[17] ARMcore|ProgramCounter_Result[16] ARMcore|ProgramCounter_Result[15] ARMcore|ProgramCounter_Result[14] ARMcore|ProgramCounter_Result[13] ARMcore|ProgramCounter_Result[12] ARMcore|ProgramCounter_Result[11] ARMcore|ProgramCounter_Result[10] ARMcore|ProgramCounter_Result[9] ARMcore|ProgramCounter_Result[8] ARMcore|ProgramCounter_Result[7] ARMcore|ProgramCounter_Result[6] ARMcore|ProgramCounter_Result[5] ARMcore|ProgramCounter_Result[4] ARMcore|ProgramCounter_Result[3] ARMcore|ProgramCounter_Result[2] ARMcore|ProgramCounter_Result[1] ARMcore|ProgramCounter_Result[0] -autobundled
netbloc @ARMcore|ProgramCounter_Result 1 11 9 6180J 2048 NJ 2048 NJ 2048 8260 1908 8700J 1928 NJ 1928 NJ 1928 NJ 1928 NJ
load netBundle @ARMcore|ALU_SrcB 32 ARMcore|ALU_SrcB[31] ARMcore|ALU_SrcB[30] ARMcore|ALU_SrcB[29] ARMcore|ALU_SrcB[28] ARMcore|ALU_SrcB[27] ARMcore|ALU_SrcB[26] ARMcore|ALU_SrcB[25] ARMcore|ALU_SrcB[24] ARMcore|ALU_SrcB[23] ARMcore|ALU_SrcB[22] ARMcore|ALU_SrcB[21] ARMcore|ALU_SrcB[20] ARMcore|ALU_SrcB[19] ARMcore|ALU_SrcB[18] ARMcore|ALU_SrcB[17] ARMcore|ALU_SrcB[16] ARMcore|ALU_SrcB[15] ARMcore|ALU_SrcB[14] ARMcore|ALU_SrcB[13] ARMcore|ALU_SrcB[12] ARMcore|ALU_SrcB[11] ARMcore|ALU_SrcB[10] ARMcore|ALU_SrcB[9] ARMcore|ALU_SrcB[8] ARMcore|ALU_SrcB[7] ARMcore|ALU_SrcB[6] ARMcore|ALU_SrcB[5] ARMcore|ALU_SrcB[4] ARMcore|ALU_SrcB[3] ARMcore|ALU_SrcB[2] ARMcore|ALU_SrcB[1] ARMcore|ALU_SrcB[0] -autobundled
netbloc @ARMcore|ALU_SrcB 1 10 1 5740 1348n
load netBundle @ARMcore|ControlUnit_ALUControl 4 ARMcore|ControlUnit_ALUControl[3] ARMcore|ControlUnit_ALUControl[2] ARMcore|ControlUnit_ALUControl[1] ARMcore|ControlUnit_ALUControl[0] -autobundled
netbloc @ARMcore|ControlUnit_ALUControl 1 3 4 2050J 1238 NJ 1238 NJ 1238 3580
load netBundle @ARMcore|ControlUnit_FlagW 4 ARMcore|ControlUnit_FlagW[3] ARMcore|ControlUnit_FlagW[2] ARMcore|ControlUnit_FlagW[1] ARMcore|ControlUnit_FlagW[0] -autobundled
netbloc @ARMcore|ControlUnit_FlagW 1 3 4 2130J 1318 NJ 1318 NJ 1318 3380
load netBundle @ARMcore|ControlUnit_ImmSrc 2 ARMcore|ControlUnit_ImmSrc[1] ARMcore|ControlUnit_ImmSrc[0] -autobundled
netbloc @ARMcore|ControlUnit_ImmSrc 1 3 3 NJ 1428 NJ 1428 3090
load netBundle @ARMcore|ControlUnit_RegSrc 3 ARMcore|ControlUnit_RegSrc[2] ARMcore|ControlUnit_RegSrc[1] ARMcore|ControlUnit_RegSrc[0] -autobundled
netbloc @ARMcore|ControlUnit_RegSrc 1 3 3 2030 1748N 2550 1728N 2850
load netBundle @ARMcore|DEReg_ALUControlE 4 ARMcore|DEReg_ALUControlE[3] ARMcore|DEReg_ALUControlE[2] ARMcore|DEReg_ALUControlE[1] ARMcore|DEReg_ALUControlE[0] -autobundled
netbloc @ARMcore|DEReg_ALUControlE 1 7 5 3980J 1228 NJ 1228 NJ 1228 5780 1508 6140
load netBundle @ARMcore|DEReg_CondE 4 ARMcore|DEReg_CondE[3] ARMcore|DEReg_CondE[2] ARMcore|DEReg_CondE[1] ARMcore|DEReg_CondE[0] -autobundled
netbloc @ARMcore|DEReg_CondE 1 7 5 4060J 1248 NJ 1248 NJ 1248 NJ 1248 6500
load netBundle @ARMcore|DEReg_ExtImmE 32 ARMcore|DEReg_ExtImmE[31] ARMcore|DEReg_ExtImmE[30] ARMcore|DEReg_ExtImmE[29] ARMcore|DEReg_ExtImmE[28] ARMcore|DEReg_ExtImmE[27] ARMcore|DEReg_ExtImmE[26] ARMcore|DEReg_ExtImmE[25] ARMcore|DEReg_ExtImmE[24] ARMcore|DEReg_ExtImmE[23] ARMcore|DEReg_ExtImmE[22] ARMcore|DEReg_ExtImmE[21] ARMcore|DEReg_ExtImmE[20] ARMcore|DEReg_ExtImmE[19] ARMcore|DEReg_ExtImmE[18] ARMcore|DEReg_ExtImmE[17] ARMcore|DEReg_ExtImmE[16] ARMcore|DEReg_ExtImmE[15] ARMcore|DEReg_ExtImmE[14] ARMcore|DEReg_ExtImmE[13] ARMcore|DEReg_ExtImmE[12] ARMcore|DEReg_ExtImmE[11] ARMcore|DEReg_ExtImmE[10] ARMcore|DEReg_ExtImmE[9] ARMcore|DEReg_ExtImmE[8] ARMcore|DEReg_ExtImmE[7] ARMcore|DEReg_ExtImmE[6] ARMcore|DEReg_ExtImmE[5] ARMcore|DEReg_ExtImmE[4] ARMcore|DEReg_ExtImmE[3] ARMcore|DEReg_ExtImmE[2] ARMcore|DEReg_ExtImmE[1] ARMcore|DEReg_ExtImmE[0] -autobundled
netbloc @ARMcore|DEReg_ExtImmE 1 7 3 NJ 1368 NJ 1368 5060
load netBundle @ARMcore|DEReg_FlagWE 4 ARMcore|DEReg_FlagWE[3] ARMcore|DEReg_FlagWE[2] ARMcore|DEReg_FlagWE[1] ARMcore|DEReg_FlagWE[0] -autobundled
netbloc @ARMcore|DEReg_FlagWE 1 7 5 NJ 1448 NJ 1448 NJ 1448 5640J 1428 6080
load netBundle @ARMcore|HazardUnit_RA1E 4 ARMcore|HazardUnit_RA1E[3] ARMcore|HazardUnit_RA1E[2] ARMcore|HazardUnit_RA1E[1] ARMcore|HazardUnit_RA1E[0] -autobundled
netbloc @ARMcore|HazardUnit_RA1E 1 7 9 4300J 1468 NJ 1468 NJ 1468 5680J 1448 6100J 1428 7050J 1508 NJ 1508 NJ 1508 8740
load netBundle @ARMcore|HazardUnit_RA2E 4 ARMcore|HazardUnit_RA2E[3] ARMcore|HazardUnit_RA2E[2] ARMcore|HazardUnit_RA2E[1] ARMcore|HazardUnit_RA2E[0] -autobundled
netbloc @ARMcore|HazardUnit_RA2E 1 7 11 4100J 1488 NJ 1488 NJ 1488 5700J 1468 6120J 1448 6970J 1528 NJ 1528 NJ 1528 8880 1498 NJ 1498 10070J
load netBundle @ARMcore|DEReg_RD1E 32 ARMcore|DEReg_RD1E[31] ARMcore|DEReg_RD1E[30] ARMcore|DEReg_RD1E[29] ARMcore|DEReg_RD1E[28] ARMcore|DEReg_RD1E[27] ARMcore|DEReg_RD1E[26] ARMcore|DEReg_RD1E[25] ARMcore|DEReg_RD1E[24] ARMcore|DEReg_RD1E[23] ARMcore|DEReg_RD1E[22] ARMcore|DEReg_RD1E[21] ARMcore|DEReg_RD1E[20] ARMcore|DEReg_RD1E[19] ARMcore|DEReg_RD1E[18] ARMcore|DEReg_RD1E[17] ARMcore|DEReg_RD1E[16] ARMcore|DEReg_RD1E[15] ARMcore|DEReg_RD1E[14] ARMcore|DEReg_RD1E[13] ARMcore|DEReg_RD1E[12] ARMcore|DEReg_RD1E[11] ARMcore|DEReg_RD1E[10] ARMcore|DEReg_RD1E[9] ARMcore|DEReg_RD1E[8] ARMcore|DEReg_RD1E[7] ARMcore|DEReg_RD1E[6] ARMcore|DEReg_RD1E[5] ARMcore|DEReg_RD1E[4] ARMcore|DEReg_RD1E[3] ARMcore|DEReg_RD1E[2] ARMcore|DEReg_RD1E[1] ARMcore|DEReg_RD1E[0] -autobundled
netbloc @ARMcore|DEReg_RD1E 1 7 3 4380J 1508 NJ 1508 5320
load netBundle @ARMcore|DEReg_RD2E 32 ARMcore|DEReg_RD2E[31] ARMcore|DEReg_RD2E[30] ARMcore|DEReg_RD2E[29] ARMcore|DEReg_RD2E[28] ARMcore|DEReg_RD2E[27] ARMcore|DEReg_RD2E[26] ARMcore|DEReg_RD2E[25] ARMcore|DEReg_RD2E[24] ARMcore|DEReg_RD2E[23] ARMcore|DEReg_RD2E[22] ARMcore|DEReg_RD2E[21] ARMcore|DEReg_RD2E[20] ARMcore|DEReg_RD2E[19] ARMcore|DEReg_RD2E[18] ARMcore|DEReg_RD2E[17] ARMcore|DEReg_RD2E[16] ARMcore|DEReg_RD2E[15] ARMcore|DEReg_RD2E[14] ARMcore|DEReg_RD2E[13] ARMcore|DEReg_RD2E[12] ARMcore|DEReg_RD2E[11] ARMcore|DEReg_RD2E[10] ARMcore|DEReg_RD2E[9] ARMcore|DEReg_RD2E[8] ARMcore|DEReg_RD2E[7] ARMcore|DEReg_RD2E[6] ARMcore|DEReg_RD2E[5] ARMcore|DEReg_RD2E[4] ARMcore|DEReg_RD2E[3] ARMcore|DEReg_RD2E[2] ARMcore|DEReg_RD2E[1] ARMcore|DEReg_RD2E[0] -autobundled
netbloc @ARMcore|DEReg_RD2E 1 7 1 4260 1668n
load netBundle @ARMcore|DEReg_ShE 2 ARMcore|DEReg_ShE[1] ARMcore|DEReg_ShE[0] -autobundled
netbloc @ARMcore|DEReg_ShE 1 7 2 4220J 1868 N
load netBundle @ARMcore|DEReg_Shamt5E 5 ARMcore|DEReg_Shamt5E[4] ARMcore|DEReg_Shamt5E[3] ARMcore|DEReg_Shamt5E[2] ARMcore|DEReg_Shamt5E[1] ARMcore|DEReg_Shamt5E[0] -autobundled
netbloc @ARMcore|DEReg_Shamt5E 1 7 2 3980J 1888 4740
load netBundle @ARMcore|DEReg_WA3E 4 ARMcore|DEReg_WA3E[3] ARMcore|DEReg_WA3E[2] ARMcore|DEReg_WA3E[1] ARMcore|DEReg_WA3E[0] -autobundled
netbloc @ARMcore|DEReg_WA3E 1 7 7 4200J 1848 4740J 1768 5140J 1848 5620J 1868 6400J 1948 7070 1568 7660J
load netBundle @ARMcore|DEReg_WA3D 4 ARMcore|DEReg_WA3D[3] ARMcore|DEReg_WA3D[2] ARMcore|DEReg_WA3D[1] ARMcore|DEReg_WA3D[0] -autobundled
netbloc @ARMcore|DEReg_WA3D 1 6 10 3420 1108 NJ 1108 NJ 1108 NJ 1108 NJ 1108 NJ 1108 NJ 1108 7560J 1128 8120J 1188 8860J
load netBundle @ARMcore|EMReg_ALUOutM 32 ARMcore|EMReg_ALUOutM[31] ARMcore|EMReg_ALUOutM[30] ARMcore|EMReg_ALUOutM[29] ARMcore|EMReg_ALUOutM[28] ARMcore|EMReg_ALUOutM[27] ARMcore|EMReg_ALUOutM[26] ARMcore|EMReg_ALUOutM[25] ARMcore|EMReg_ALUOutM[24] ARMcore|EMReg_ALUOutM[23] ARMcore|EMReg_ALUOutM[22] ARMcore|EMReg_ALUOutM[21] ARMcore|EMReg_ALUOutM[20] ARMcore|EMReg_ALUOutM[19] ARMcore|EMReg_ALUOutM[18] ARMcore|EMReg_ALUOutM[17] ARMcore|EMReg_ALUOutM[16] ARMcore|EMReg_ALUOutM[15] ARMcore|EMReg_ALUOutM[14] ARMcore|EMReg_ALUOutM[13] ARMcore|EMReg_ALUOutM[12] ARMcore|EMReg_ALUOutM[11] ARMcore|EMReg_ALUOutM[10] ARMcore|EMReg_ALUOutM[9] ARMcore|EMReg_ALUOutM[8] ARMcore|EMReg_ALUOutM[7] ARMcore|EMReg_ALUOutM[6] ARMcore|EMReg_ALUOutM[5] ARMcore|EMReg_ALUOutM[4] ARMcore|EMReg_ALUOutM[3] ARMcore|EMReg_ALUOutM[2] ARMcore|EMReg_ALUOutM[1] ARMcore|EMReg_ALUOutM[0] -autobundled
netbloc @ARMcore|EMReg_ALUOutM 1 3 17 2130 2148 NJ 2148 2830J 2268 NJ 2268 4400 1648 NJ 1648 5300 1788 5740J 1808 6440J 1888 NJ 1888 NJ 1888 NJ 1888 NJ 1888 NJ 1888 10230J 1868 10630 1698 11050J
load netBundle @ARMcore|HazardUnit_RA2M 4 ARMcore|HazardUnit_RA2M[3] ARMcore|HazardUnit_RA2M[2] ARMcore|HazardUnit_RA2M[1] ARMcore|HazardUnit_RA2M[0] -autobundled
netbloc @ARMcore|HazardUnit_RA2M 1 15 4 9200 1138 NJ 1138 NJ 1138 10610
load netBundle @ARMcore|HazardUnit_WA3M 4 ARMcore|HazardUnit_WA3M[3] ARMcore|HazardUnit_WA3M[2] ARMcore|HazardUnit_WA3M[1] ARMcore|HazardUnit_WA3M[0] -autobundled
netbloc @ARMcore|HazardUnit_WA3M 1 3 16 2090 2168 NJ 2168 2810J 2288 NJ 2288 NJ 2288 NJ 2288 NJ 2288 NJ 2288 NJ 2288 NJ 2288 NJ 2288 NJ 2288 9140 1458 NJ 1458 10130J 1378 10570
load netBundle @ARMcore|EMReg_WriteDataM 32 ARMcore|EMReg_WriteDataM[31] ARMcore|EMReg_WriteDataM[30] ARMcore|EMReg_WriteDataM[29] ARMcore|EMReg_WriteDataM[28] ARMcore|EMReg_WriteDataM[27] ARMcore|EMReg_WriteDataM[26] ARMcore|EMReg_WriteDataM[25] ARMcore|EMReg_WriteDataM[24] ARMcore|EMReg_WriteDataM[23] ARMcore|EMReg_WriteDataM[22] ARMcore|EMReg_WriteDataM[21] ARMcore|EMReg_WriteDataM[20] ARMcore|EMReg_WriteDataM[19] ARMcore|EMReg_WriteDataM[18] ARMcore|EMReg_WriteDataM[17] ARMcore|EMReg_WriteDataM[16] ARMcore|EMReg_WriteDataM[15] ARMcore|EMReg_WriteDataM[14] ARMcore|EMReg_WriteDataM[13] ARMcore|EMReg_WriteDataM[12] ARMcore|EMReg_WriteDataM[11] ARMcore|EMReg_WriteDataM[10] ARMcore|EMReg_WriteDataM[9] ARMcore|EMReg_WriteDataM[8] ARMcore|EMReg_WriteDataM[7] ARMcore|EMReg_WriteDataM[6] ARMcore|EMReg_WriteDataM[5] ARMcore|EMReg_WriteDataM[4] ARMcore|EMReg_WriteDataM[3] ARMcore|EMReg_WriteDataM[2] ARMcore|EMReg_WriteDataM[1] ARMcore|EMReg_WriteDataM[0] -autobundled
netbloc @ARMcore|EMReg_WriteDataM 1 18 1 10650 1578n
load netBundle @ARMcore|EMReg_ALUResultE0_i_n_ 32 ARMcore|EMReg_ALUResultE0_i_n_0 ARMcore|EMReg_ALUResultE0_i_n_1 ARMcore|EMReg_ALUResultE0_i_n_2 ARMcore|EMReg_ALUResultE0_i_n_3 ARMcore|EMReg_ALUResultE0_i_n_4 ARMcore|EMReg_ALUResultE0_i_n_5 ARMcore|EMReg_ALUResultE0_i_n_6 ARMcore|EMReg_ALUResultE0_i_n_7 ARMcore|EMReg_ALUResultE0_i_n_8 ARMcore|EMReg_ALUResultE0_i_n_9 ARMcore|EMReg_ALUResultE0_i_n_10 ARMcore|EMReg_ALUResultE0_i_n_11 ARMcore|EMReg_ALUResultE0_i_n_12 ARMcore|EMReg_ALUResultE0_i_n_13 ARMcore|EMReg_ALUResultE0_i_n_14 ARMcore|EMReg_ALUResultE0_i_n_15 ARMcore|EMReg_ALUResultE0_i_n_16 ARMcore|EMReg_ALUResultE0_i_n_17 ARMcore|EMReg_ALUResultE0_i_n_18 ARMcore|EMReg_ALUResultE0_i_n_19 ARMcore|EMReg_ALUResultE0_i_n_20 ARMcore|EMReg_ALUResultE0_i_n_21 ARMcore|EMReg_ALUResultE0_i_n_22 ARMcore|EMReg_ALUResultE0_i_n_23 ARMcore|EMReg_ALUResultE0_i_n_24 ARMcore|EMReg_ALUResultE0_i_n_25 ARMcore|EMReg_ALUResultE0_i_n_26 ARMcore|EMReg_ALUResultE0_i_n_27 ARMcore|EMReg_ALUResultE0_i_n_28 ARMcore|EMReg_ALUResultE0_i_n_29 ARMcore|EMReg_ALUResultE0_i_n_30 ARMcore|EMReg_ALUResultE0_i_n_31 -autobundled
netbloc @ARMcore|EMReg_ALUResultE0_i_n_ 1 16 1 9600 1638n
load netBundle @ARMcore|EMReg_ALUResultE1_i_n_ 32 ARMcore|EMReg_ALUResultE1_i_n_0 ARMcore|EMReg_ALUResultE1_i_n_1 ARMcore|EMReg_ALUResultE1_i_n_2 ARMcore|EMReg_ALUResultE1_i_n_3 ARMcore|EMReg_ALUResultE1_i_n_4 ARMcore|EMReg_ALUResultE1_i_n_5 ARMcore|EMReg_ALUResultE1_i_n_6 ARMcore|EMReg_ALUResultE1_i_n_7 ARMcore|EMReg_ALUResultE1_i_n_8 ARMcore|EMReg_ALUResultE1_i_n_9 ARMcore|EMReg_ALUResultE1_i_n_10 ARMcore|EMReg_ALUResultE1_i_n_11 ARMcore|EMReg_ALUResultE1_i_n_12 ARMcore|EMReg_ALUResultE1_i_n_13 ARMcore|EMReg_ALUResultE1_i_n_14 ARMcore|EMReg_ALUResultE1_i_n_15 ARMcore|EMReg_ALUResultE1_i_n_16 ARMcore|EMReg_ALUResultE1_i_n_17 ARMcore|EMReg_ALUResultE1_i_n_18 ARMcore|EMReg_ALUResultE1_i_n_19 ARMcore|EMReg_ALUResultE1_i_n_20 ARMcore|EMReg_ALUResultE1_i_n_21 ARMcore|EMReg_ALUResultE1_i_n_22 ARMcore|EMReg_ALUResultE1_i_n_23 ARMcore|EMReg_ALUResultE1_i_n_24 ARMcore|EMReg_ALUResultE1_i_n_25 ARMcore|EMReg_ALUResultE1_i_n_26 ARMcore|EMReg_ALUResultE1_i_n_27 ARMcore|EMReg_ALUResultE1_i_n_28 ARMcore|EMReg_ALUResultE1_i_n_29 ARMcore|EMReg_ALUResultE1_i_n_30 ARMcore|EMReg_ALUResultE1_i_n_31 -autobundled
netbloc @ARMcore|EMReg_ALUResultE1_i_n_ 1 15 1 8620 1608n
load netBundle @ARMcore|EMReg_ALUResultE 32 ARMcore|EMReg_ALUResultE[31] ARMcore|EMReg_ALUResultE[30] ARMcore|EMReg_ALUResultE[29] ARMcore|EMReg_ALUResultE[28] ARMcore|EMReg_ALUResultE[27] ARMcore|EMReg_ALUResultE[26] ARMcore|EMReg_ALUResultE[25] ARMcore|EMReg_ALUResultE[24] ARMcore|EMReg_ALUResultE[23] ARMcore|EMReg_ALUResultE[22] ARMcore|EMReg_ALUResultE[21] ARMcore|EMReg_ALUResultE[20] ARMcore|EMReg_ALUResultE[19] ARMcore|EMReg_ALUResultE[18] ARMcore|EMReg_ALUResultE[17] ARMcore|EMReg_ALUResultE[16] ARMcore|EMReg_ALUResultE[15] ARMcore|EMReg_ALUResultE[14] ARMcore|EMReg_ALUResultE[13] ARMcore|EMReg_ALUResultE[12] ARMcore|EMReg_ALUResultE[11] ARMcore|EMReg_ALUResultE[10] ARMcore|EMReg_ALUResultE[9] ARMcore|EMReg_ALUResultE[8] ARMcore|EMReg_ALUResultE[7] ARMcore|EMReg_ALUResultE[6] ARMcore|EMReg_ALUResultE[5] ARMcore|EMReg_ALUResultE[4] ARMcore|EMReg_ALUResultE[3] ARMcore|EMReg_ALUResultE[2] ARMcore|EMReg_ALUResultE[1] ARMcore|EMReg_ALUResultE[0] -autobundled
netbloc @ARMcore|EMReg_ALUResultE 1 17 1 10150 1438n
load netBundle @ARMcore|EMReg_WA3E0_i_n_ 4 ARMcore|EMReg_WA3E0_i_n_0 ARMcore|EMReg_WA3E0_i_n_1 ARMcore|EMReg_WA3E0_i_n_2 ARMcore|EMReg_WA3E0_i_n_3 -autobundled
netbloc @ARMcore|EMReg_WA3E0_i_n_ 1 14 1 8120 1398n
load netBundle @ARMcore|EMReg_WA3E 4 ARMcore|EMReg_WA3E[3] ARMcore|EMReg_WA3E[2] ARMcore|EMReg_WA3E[1] ARMcore|EMReg_WA3E[0] -autobundled
netbloc @ARMcore|EMReg_WA3E 1 15 3 8920 1518 NJ 1518 10050J
load netBundle @ARMcore|Extend_ExtImm 32 ARMcore|Extend_ExtImm[31] ARMcore|Extend_ExtImm[30] ARMcore|Extend_ExtImm[29] ARMcore|Extend_ExtImm[28] ARMcore|Extend_ExtImm[27] ARMcore|Extend_ExtImm[26] ARMcore|Extend_ExtImm[25] ARMcore|Extend_ExtImm[24] ARMcore|Extend_ExtImm[23] ARMcore|Extend_ExtImm[22] ARMcore|Extend_ExtImm[21] ARMcore|Extend_ExtImm[20] ARMcore|Extend_ExtImm[19] ARMcore|Extend_ExtImm[18] ARMcore|Extend_ExtImm[17] ARMcore|Extend_ExtImm[16] ARMcore|Extend_ExtImm[15] ARMcore|Extend_ExtImm[14] ARMcore|Extend_ExtImm[13] ARMcore|Extend_ExtImm[12] ARMcore|Extend_ExtImm[11] ARMcore|Extend_ExtImm[10] ARMcore|Extend_ExtImm[9] ARMcore|Extend_ExtImm[8] ARMcore|Extend_ExtImm[7] ARMcore|Extend_ExtImm[6] ARMcore|Extend_ExtImm[5] ARMcore|Extend_ExtImm[4] ARMcore|Extend_ExtImm[3] ARMcore|Extend_ExtImm[2] ARMcore|Extend_ExtImm[1] ARMcore|Extend_ExtImm[0] -autobundled
netbloc @ARMcore|Extend_ExtImm 1 6 1 3400 1388n
load netBundle @ARMcore|FDReg_InstrD 32 ARMcore|FDReg_InstrD[31] ARMcore|FDReg_InstrD[30] ARMcore|FDReg_InstrD[29] ARMcore|FDReg_InstrD[28] ARMcore|FDReg_InstrD[27] ARMcore|FDReg_InstrD[26] ARMcore|FDReg_InstrD[25] ARMcore|FDReg_InstrD[24] ARMcore|FDReg_InstrD[23] ARMcore|FDReg_InstrD[22] ARMcore|FDReg_InstrD[21] ARMcore|FDReg_InstrD[20] ARMcore|FDReg_InstrD[19] ARMcore|FDReg_InstrD[18] ARMcore|FDReg_InstrD[17] ARMcore|FDReg_InstrD[16] ARMcore|FDReg_InstrD[15] ARMcore|FDReg_InstrD[14] ARMcore|FDReg_InstrD[13] ARMcore|FDReg_InstrD[12] ARMcore|FDReg_InstrD[11] ARMcore|FDReg_InstrD[10] ARMcore|FDReg_InstrD[9] ARMcore|FDReg_InstrD[8] ARMcore|FDReg_InstrD[7] ARMcore|FDReg_InstrD[6] ARMcore|FDReg_InstrD[5] ARMcore|FDReg_InstrD[4] ARMcore|FDReg_InstrD[3] ARMcore|FDReg_InstrD[2] ARMcore|FDReg_InstrD[1] ARMcore|FDReg_InstrD[0] -autobundled
netbloc @ARMcore|FDReg_InstrD 1 2 5 1760 1788 2070 1608 2510 1608 3010 1648 3600
load netBundle @ARMcore|HazardUnit_FPUWA3 4 ARMcore|HazardUnit_FPUWA3[3] ARMcore|HazardUnit_FPUWA3[2] ARMcore|HazardUnit_FPUWA3[1] ARMcore|HazardUnit_FPUWA3[0] -autobundled
netbloc @ARMcore|HazardUnit_FPUWA3 1 13 3 7700 558 NJ 558 NJ
load netBundle @ARMcore|FPU_Result 32 ARMcore|FPU_Result[31] ARMcore|FPU_Result[30] ARMcore|FPU_Result[29] ARMcore|FPU_Result[28] ARMcore|FPU_Result[27] ARMcore|FPU_Result[26] ARMcore|FPU_Result[25] ARMcore|FPU_Result[24] ARMcore|FPU_Result[23] ARMcore|FPU_Result[22] ARMcore|FPU_Result[21] ARMcore|FPU_Result[20] ARMcore|FPU_Result[19] ARMcore|FPU_Result[18] ARMcore|FPU_Result[17] ARMcore|FPU_Result[16] ARMcore|FPU_Result[15] ARMcore|FPU_Result[14] ARMcore|FPU_Result[13] ARMcore|FPU_Result[12] ARMcore|FPU_Result[11] ARMcore|FPU_Result[10] ARMcore|FPU_Result[9] ARMcore|FPU_Result[8] ARMcore|FPU_Result[7] ARMcore|FPU_Result[6] ARMcore|FPU_Result[5] ARMcore|FPU_Result[4] ARMcore|FPU_Result[3] ARMcore|FPU_Result[2] ARMcore|FPU_Result[1] ARMcore|FPU_Result[0] -autobundled
netbloc @ARMcore|FPU_Result 1 13 4 NJ 1748 8280J 1728 9080 1578 9660
load netBundle @ARMcore|HazardUnit_ForwardAE 3 ARMcore|HazardUnit_ForwardAE[2] ARMcore|HazardUnit_ForwardAE[1] ARMcore|HazardUnit_ForwardAE[0] -autobundled
netbloc @ARMcore|HazardUnit_ForwardAE 1 10 7 5660J 1068 NJ 1068 NJ 1068 NJ 1068 NJ 1068 9100J 1198 9640
load netBundle @ARMcore|HazardUnit_ForwardBE 3 ARMcore|HazardUnit_ForwardBE[2] ARMcore|HazardUnit_ForwardBE[1] ARMcore|HazardUnit_ForwardBE[0] -autobundled
netbloc @ARMcore|HazardUnit_ForwardBE 1 8 9 4700J 1048 NJ 1048 NJ 1048 NJ 1048 NJ 1048 NJ 1048 NJ 1048 8820J 1178 9620
load netBundle @ARMcore|HazardUnit_MCycleWA3 4 ARMcore|HazardUnit_MCycleWA3[3] ARMcore|HazardUnit_MCycleWA3[2] ARMcore|HazardUnit_MCycleWA3[1] ARMcore|HazardUnit_MCycleWA3[0] -autobundled
netbloc @ARMcore|HazardUnit_MCycleWA3 1 13 3 N 1368 8220 618 NJ
load netBundle @ARMcore|MCycle_Result 32 ARMcore|MCycle_Result[31] ARMcore|MCycle_Result[30] ARMcore|MCycle_Result[29] ARMcore|MCycle_Result[28] ARMcore|MCycle_Result[27] ARMcore|MCycle_Result[26] ARMcore|MCycle_Result[25] ARMcore|MCycle_Result[24] ARMcore|MCycle_Result[23] ARMcore|MCycle_Result[22] ARMcore|MCycle_Result[21] ARMcore|MCycle_Result[20] ARMcore|MCycle_Result[19] ARMcore|MCycle_Result[18] ARMcore|MCycle_Result[17] ARMcore|MCycle_Result[16] ARMcore|MCycle_Result[15] ARMcore|MCycle_Result[14] ARMcore|MCycle_Result[13] ARMcore|MCycle_Result[12] ARMcore|MCycle_Result[11] ARMcore|MCycle_Result[10] ARMcore|MCycle_Result[9] ARMcore|MCycle_Result[8] ARMcore|MCycle_Result[7] ARMcore|MCycle_Result[6] ARMcore|MCycle_Result[5] ARMcore|MCycle_Result[4] ARMcore|MCycle_Result[3] ARMcore|MCycle_Result[2] ARMcore|MCycle_Result[1] ARMcore|MCycle_Result[0] -autobundled
netbloc @ARMcore|MCycle_Result 1 13 2 7680 1688 8140J
load netBundle @ARMcore|MWReg_ALUOutW 32 ARMcore|MWReg_ALUOutW[31] ARMcore|MWReg_ALUOutW[30] ARMcore|MWReg_ALUOutW[29] ARMcore|MWReg_ALUOutW[28] ARMcore|MWReg_ALUOutW[27] ARMcore|MWReg_ALUOutW[26] ARMcore|MWReg_ALUOutW[25] ARMcore|MWReg_ALUOutW[24] ARMcore|MWReg_ALUOutW[23] ARMcore|MWReg_ALUOutW[22] ARMcore|MWReg_ALUOutW[21] ARMcore|MWReg_ALUOutW[20] ARMcore|MWReg_ALUOutW[19] ARMcore|MWReg_ALUOutW[18] ARMcore|MWReg_ALUOutW[17] ARMcore|MWReg_ALUOutW[16] ARMcore|MWReg_ALUOutW[15] ARMcore|MWReg_ALUOutW[14] ARMcore|MWReg_ALUOutW[13] ARMcore|MWReg_ALUOutW[12] ARMcore|MWReg_ALUOutW[11] ARMcore|MWReg_ALUOutW[10] ARMcore|MWReg_ALUOutW[9] ARMcore|MWReg_ALUOutW[8] ARMcore|MWReg_ALUOutW[7] ARMcore|MWReg_ALUOutW[6] ARMcore|MWReg_ALUOutW[5] ARMcore|MWReg_ALUOutW[4] ARMcore|MWReg_ALUOutW[3] ARMcore|MWReg_ALUOutW[2] ARMcore|MWReg_ALUOutW[1] ARMcore|MWReg_ALUOutW[0] -autobundled
netbloc @ARMcore|MWReg_ALUOutW 1 4 1 2550 2258n
load netBundle @ARMcore|MWReg_ReadDataW 32 ARMcore|MWReg_ReadDataW[31] ARMcore|MWReg_ReadDataW[30] ARMcore|MWReg_ReadDataW[29] ARMcore|MWReg_ReadDataW[28] ARMcore|MWReg_ReadDataW[27] ARMcore|MWReg_ReadDataW[26] ARMcore|MWReg_ReadDataW[25] ARMcore|MWReg_ReadDataW[24] ARMcore|MWReg_ReadDataW[23] ARMcore|MWReg_ReadDataW[22] ARMcore|MWReg_ReadDataW[21] ARMcore|MWReg_ReadDataW[20] ARMcore|MWReg_ReadDataW[19] ARMcore|MWReg_ReadDataW[18] ARMcore|MWReg_ReadDataW[17] ARMcore|MWReg_ReadDataW[16] ARMcore|MWReg_ReadDataW[15] ARMcore|MWReg_ReadDataW[14] ARMcore|MWReg_ReadDataW[13] ARMcore|MWReg_ReadDataW[12] ARMcore|MWReg_ReadDataW[11] ARMcore|MWReg_ReadDataW[10] ARMcore|MWReg_ReadDataW[9] ARMcore|MWReg_ReadDataW[8] ARMcore|MWReg_ReadDataW[7] ARMcore|MWReg_ReadDataW[6] ARMcore|MWReg_ReadDataW[5] ARMcore|MWReg_ReadDataW[4] ARMcore|MWReg_ReadDataW[3] ARMcore|MWReg_ReadDataW[2] ARMcore|MWReg_ReadDataW[1] ARMcore|MWReg_ReadDataW[0] -autobundled
netbloc @ARMcore|MWReg_ReadDataW 1 4 1 2530 2238n
load netBundle @ARMcore|HazardUnit_WA3W 4 ARMcore|HazardUnit_WA3W[3] ARMcore|HazardUnit_WA3W[2] ARMcore|HazardUnit_WA3W[1] ARMcore|HazardUnit_WA3W[0] -autobundled
netbloc @ARMcore|HazardUnit_WA3W 1 4 12 2490 2008 2810 988 NJ 988 NJ 988 NJ 988 NJ 988 NJ 988 NJ 988 NJ 988 NJ 988 NJ 988 8840J
load netBundle @ARMcore|IO_Addr 32 ARMcore|IO_Addr[31] ARMcore|IO_Addr[30] ARMcore|IO_Addr[29] ARMcore|IO_Addr[28] ARMcore|IO_Addr[27] ARMcore|IO_Addr[26] ARMcore|IO_Addr[25] ARMcore|IO_Addr[24] ARMcore|IO_Addr[23] ARMcore|IO_Addr[22] ARMcore|IO_Addr[21] ARMcore|IO_Addr[20] ARMcore|IO_Addr[19] ARMcore|IO_Addr[18] ARMcore|IO_Addr[17] ARMcore|IO_Addr[16] ARMcore|IO_Addr[15] ARMcore|IO_Addr[14] ARMcore|IO_Addr[13] ARMcore|IO_Addr[12] ARMcore|IO_Addr[11] ARMcore|IO_Addr[10] ARMcore|IO_Addr[9] ARMcore|IO_Addr[8] ARMcore|IO_Addr[7] ARMcore|IO_Addr[6] ARMcore|IO_Addr[5] ARMcore|IO_Addr[4] ARMcore|IO_Addr[3] ARMcore|IO_Addr[2] ARMcore|IO_Addr[1] ARMcore|IO_Addr[0] -autobundled
netbloc @ARMcore|IO_Addr 1 20 1 N 1638
load netBundle @ARMcore|IO_WriteData 32 ARMcore|IO_WriteData[31] ARMcore|IO_WriteData[30] ARMcore|IO_WriteData[29] ARMcore|IO_WriteData[28] ARMcore|IO_WriteData[27] ARMcore|IO_WriteData[26] ARMcore|IO_WriteData[25] ARMcore|IO_WriteData[24] ARMcore|IO_WriteData[23] ARMcore|IO_WriteData[22] ARMcore|IO_WriteData[21] ARMcore|IO_WriteData[20] ARMcore|IO_WriteData[19] ARMcore|IO_WriteData[18] ARMcore|IO_WriteData[17] ARMcore|IO_WriteData[16] ARMcore|IO_WriteData[15] ARMcore|IO_WriteData[14] ARMcore|IO_WriteData[13] ARMcore|IO_WriteData[12] ARMcore|IO_WriteData[11] ARMcore|IO_WriteData[10] ARMcore|IO_WriteData[9] ARMcore|IO_WriteData[8] ARMcore|IO_WriteData[7] ARMcore|IO_WriteData[6] ARMcore|IO_WriteData[5] ARMcore|IO_WriteData[4] ARMcore|IO_WriteData[3] ARMcore|IO_WriteData[2] ARMcore|IO_WriteData[1] ARMcore|IO_WriteData[0] -autobundled
netbloc @ARMcore|IO_WriteData 1 20 1 11500 1658n
load netBundle @ARMcore|Cache_Addr 32 ARMcore|Cache_Addr[31] ARMcore|Cache_Addr[30] ARMcore|Cache_Addr[29] ARMcore|Cache_Addr[28] ARMcore|Cache_Addr[27] ARMcore|Cache_Addr[26] ARMcore|Cache_Addr[25] ARMcore|Cache_Addr[24] ARMcore|Cache_Addr[23] ARMcore|Cache_Addr[22] ARMcore|Cache_Addr[21] ARMcore|Cache_Addr[20] ARMcore|Cache_Addr[19] ARMcore|Cache_Addr[18] ARMcore|Cache_Addr[17] ARMcore|Cache_Addr[16] ARMcore|Cache_Addr[15] ARMcore|Cache_Addr[14] ARMcore|Cache_Addr[13] ARMcore|Cache_Addr[12] ARMcore|Cache_Addr[11] ARMcore|Cache_Addr[10] ARMcore|Cache_Addr[9] ARMcore|Cache_Addr[8] ARMcore|Cache_Addr[7] ARMcore|Cache_Addr[6] ARMcore|Cache_Addr[5] ARMcore|Cache_Addr[4] ARMcore|Cache_Addr[3] ARMcore|Cache_Addr[2] ARMcore|Cache_Addr[1] ARMcore|Cache_Addr[0] -autobundled
netbloc @ARMcore|Cache_Addr 1 20 1 11480 1468n
load netBundle @ARMcore|Cache_WriteData 32 ARMcore|Cache_WriteData[31] ARMcore|Cache_WriteData[30] ARMcore|Cache_WriteData[29] ARMcore|Cache_WriteData[28] ARMcore|Cache_WriteData[27] ARMcore|Cache_WriteData[26] ARMcore|Cache_WriteData[25] ARMcore|Cache_WriteData[24] ARMcore|Cache_WriteData[23] ARMcore|Cache_WriteData[22] ARMcore|Cache_WriteData[21] ARMcore|Cache_WriteData[20] ARMcore|Cache_WriteData[19] ARMcore|Cache_WriteData[18] ARMcore|Cache_WriteData[17] ARMcore|Cache_WriteData[16] ARMcore|Cache_WriteData[15] ARMcore|Cache_WriteData[14] ARMcore|Cache_WriteData[13] ARMcore|Cache_WriteData[12] ARMcore|Cache_WriteData[11] ARMcore|Cache_WriteData[10] ARMcore|Cache_WriteData[9] ARMcore|Cache_WriteData[8] ARMcore|Cache_WriteData[7] ARMcore|Cache_WriteData[6] ARMcore|Cache_WriteData[5] ARMcore|Cache_WriteData[4] ARMcore|Cache_WriteData[3] ARMcore|Cache_WriteData[2] ARMcore|Cache_WriteData[1] ARMcore|Cache_WriteData[0] -autobundled
netbloc @ARMcore|Cache_WriteData 1 20 1 11560 1618n
load netBundle @ARMcore|MemOrIO_r_wdata 32 ARMcore|MemOrIO_r_wdata[31] ARMcore|MemOrIO_r_wdata[30] ARMcore|MemOrIO_r_wdata[29] ARMcore|MemOrIO_r_wdata[28] ARMcore|MemOrIO_r_wdata[27] ARMcore|MemOrIO_r_wdata[26] ARMcore|MemOrIO_r_wdata[25] ARMcore|MemOrIO_r_wdata[24] ARMcore|MemOrIO_r_wdata[23] ARMcore|MemOrIO_r_wdata[22] ARMcore|MemOrIO_r_wdata[21] ARMcore|MemOrIO_r_wdata[20] ARMcore|MemOrIO_r_wdata[19] ARMcore|MemOrIO_r_wdata[18] ARMcore|MemOrIO_r_wdata[17] ARMcore|MemOrIO_r_wdata[16] ARMcore|MemOrIO_r_wdata[15] ARMcore|MemOrIO_r_wdata[14] ARMcore|MemOrIO_r_wdata[13] ARMcore|MemOrIO_r_wdata[12] ARMcore|MemOrIO_r_wdata[11] ARMcore|MemOrIO_r_wdata[10] ARMcore|MemOrIO_r_wdata[9] ARMcore|MemOrIO_r_wdata[8] ARMcore|MemOrIO_r_wdata[7] ARMcore|MemOrIO_r_wdata[6] ARMcore|MemOrIO_r_wdata[5] ARMcore|MemOrIO_r_wdata[4] ARMcore|MemOrIO_r_wdata[3] ARMcore|MemOrIO_r_wdata[2] ARMcore|MemOrIO_r_wdata[1] ARMcore|MemOrIO_r_wdata[0] -autobundled
netbloc @ARMcore|MemOrIO_r_wdata 1 3 18 2110 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 NJ 2428 11540
load netBundle @ARMcore|MemOrIO_m_rdata 32 ARMcore|MemOrIO_m_rdata[31] ARMcore|MemOrIO_m_rdata[30] ARMcore|MemOrIO_m_rdata[29] ARMcore|MemOrIO_m_rdata[28] ARMcore|MemOrIO_m_rdata[27] ARMcore|MemOrIO_m_rdata[26] ARMcore|MemOrIO_m_rdata[25] ARMcore|MemOrIO_m_rdata[24] ARMcore|MemOrIO_m_rdata[23] ARMcore|MemOrIO_m_rdata[22] ARMcore|MemOrIO_m_rdata[21] ARMcore|MemOrIO_m_rdata[20] ARMcore|MemOrIO_m_rdata[19] ARMcore|MemOrIO_m_rdata[18] ARMcore|MemOrIO_m_rdata[17] ARMcore|MemOrIO_m_rdata[16] ARMcore|MemOrIO_m_rdata[15] ARMcore|MemOrIO_m_rdata[14] ARMcore|MemOrIO_m_rdata[13] ARMcore|MemOrIO_m_rdata[12] ARMcore|MemOrIO_m_rdata[11] ARMcore|MemOrIO_m_rdata[10] ARMcore|MemOrIO_m_rdata[9] ARMcore|MemOrIO_m_rdata[8] ARMcore|MemOrIO_m_rdata[7] ARMcore|MemOrIO_m_rdata[6] ARMcore|MemOrIO_m_rdata[5] ARMcore|MemOrIO_m_rdata[4] ARMcore|MemOrIO_m_rdata[3] ARMcore|MemOrIO_m_rdata[2] ARMcore|MemOrIO_m_rdata[1] ARMcore|MemOrIO_m_rdata[0] -autobundled
netbloc @ARMcore|MemOrIO_m_rdata 1 19 1 11150 1678n
load netBundle @ARMcore|MemOrIO_r_rdata 32 ARMcore|MemOrIO_r_rdata[31] ARMcore|MemOrIO_r_rdata[30] ARMcore|MemOrIO_r_rdata[29] ARMcore|MemOrIO_r_rdata[28] ARMcore|MemOrIO_r_rdata[27] ARMcore|MemOrIO_r_rdata[26] ARMcore|MemOrIO_r_rdata[25] ARMcore|MemOrIO_r_rdata[24] ARMcore|MemOrIO_r_rdata[23] ARMcore|MemOrIO_r_rdata[22] ARMcore|MemOrIO_r_rdata[21] ARMcore|MemOrIO_r_rdata[20] ARMcore|MemOrIO_r_rdata[19] ARMcore|MemOrIO_r_rdata[18] ARMcore|MemOrIO_r_rdata[17] ARMcore|MemOrIO_r_rdata[16] ARMcore|MemOrIO_r_rdata[15] ARMcore|MemOrIO_r_rdata[14] ARMcore|MemOrIO_r_rdata[13] ARMcore|MemOrIO_r_rdata[12] ARMcore|MemOrIO_r_rdata[11] ARMcore|MemOrIO_r_rdata[10] ARMcore|MemOrIO_r_rdata[9] ARMcore|MemOrIO_r_rdata[8] ARMcore|MemOrIO_r_rdata[7] ARMcore|MemOrIO_r_rdata[6] ARMcore|MemOrIO_r_rdata[5] ARMcore|MemOrIO_r_rdata[4] ARMcore|MemOrIO_r_rdata[3] ARMcore|MemOrIO_r_rdata[2] ARMcore|MemOrIO_r_rdata[1] ARMcore|MemOrIO_r_rdata[0] -autobundled
netbloc @ARMcore|MemOrIO_r_rdata 1 19 1 11170 1698n
load netBundle @ARMcore|PC 32 ARMcore|PC[31] ARMcore|PC[30] ARMcore|PC[29] ARMcore|PC[28] ARMcore|PC[27] ARMcore|PC[26] ARMcore|PC[25] ARMcore|PC[24] ARMcore|PC[23] ARMcore|PC[22] ARMcore|PC[21] ARMcore|PC[20] ARMcore|PC[19] ARMcore|PC[18] ARMcore|PC[17] ARMcore|PC[16] ARMcore|PC[15] ARMcore|PC[14] ARMcore|PC[13] ARMcore|PC[12] ARMcore|PC[11] ARMcore|PC[10] ARMcore|PC[9] ARMcore|PC[8] ARMcore|PC[7] ARMcore|PC[6] ARMcore|PC[5] ARMcore|PC[4] ARMcore|PC[3] ARMcore|PC[2] ARMcore|PC[1] ARMcore|PC[0] -autobundled
netbloc @ARMcore|PC 1 20 1 N 1868
load netBundle @ARMcore|ProgramCounter_PCPlus 32 ARMcore|ProgramCounter_PCPlus4[31] ARMcore|ProgramCounter_PCPlus4[30] ARMcore|ProgramCounter_PCPlus4[29] ARMcore|ProgramCounter_PCPlus4[28] ARMcore|ProgramCounter_PCPlus4[27] ARMcore|ProgramCounter_PCPlus4[26] ARMcore|ProgramCounter_PCPlus4[25] ARMcore|ProgramCounter_PCPlus4[24] ARMcore|ProgramCounter_PCPlus4[23] ARMcore|ProgramCounter_PCPlus4[22] ARMcore|ProgramCounter_PCPlus4[21] ARMcore|ProgramCounter_PCPlus4[20] ARMcore|ProgramCounter_PCPlus4[19] ARMcore|ProgramCounter_PCPlus4[18] ARMcore|ProgramCounter_PCPlus4[17] ARMcore|ProgramCounter_PCPlus4[16] ARMcore|ProgramCounter_PCPlus4[15] ARMcore|ProgramCounter_PCPlus4[14] ARMcore|ProgramCounter_PCPlus4[13] ARMcore|ProgramCounter_PCPlus4[12] ARMcore|ProgramCounter_PCPlus4[11] ARMcore|ProgramCounter_PCPlus4[10] ARMcore|ProgramCounter_PCPlus4[9] ARMcore|ProgramCounter_PCPlus4[8] ARMcore|ProgramCounter_PCPlus4[7] ARMcore|ProgramCounter_PCPlus4[6] ARMcore|ProgramCounter_PCPlus4[5] ARMcore|ProgramCounter_PCPlus4[4] ARMcore|ProgramCounter_PCPlus4[3] ARMcore|ProgramCounter_PCPlus4[2] ARMcore|ProgramCounter_PCPlus4[1] ARMcore|ProgramCounter_PCPlus4[0] -autobundled
netbloc @ARMcore|ProgramCounter_PCPlus 1 5 16 3090 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 NJ 2208 11460
load netBundle @ARMcore|RegisterFile_RD1 32 ARMcore|RegisterFile_RD1[31] ARMcore|RegisterFile_RD1[30] ARMcore|RegisterFile_RD1[29] ARMcore|RegisterFile_RD1[28] ARMcore|RegisterFile_RD1[27] ARMcore|RegisterFile_RD1[26] ARMcore|RegisterFile_RD1[25] ARMcore|RegisterFile_RD1[24] ARMcore|RegisterFile_RD1[23] ARMcore|RegisterFile_RD1[22] ARMcore|RegisterFile_RD1[21] ARMcore|RegisterFile_RD1[20] ARMcore|RegisterFile_RD1[19] ARMcore|RegisterFile_RD1[18] ARMcore|RegisterFile_RD1[17] ARMcore|RegisterFile_RD1[16] ARMcore|RegisterFile_RD1[15] ARMcore|RegisterFile_RD1[14] ARMcore|RegisterFile_RD1[13] ARMcore|RegisterFile_RD1[12] ARMcore|RegisterFile_RD1[11] ARMcore|RegisterFile_RD1[10] ARMcore|RegisterFile_RD1[9] ARMcore|RegisterFile_RD1[8] ARMcore|RegisterFile_RD1[7] ARMcore|RegisterFile_RD1[6] ARMcore|RegisterFile_RD1[5] ARMcore|RegisterFile_RD1[4] ARMcore|RegisterFile_RD1[3] ARMcore|RegisterFile_RD1[2] ARMcore|RegisterFile_RD1[1] ARMcore|RegisterFile_RD1[0] -autobundled
netbloc @ARMcore|RegisterFile_RD1 1 6 1 3540 1668n
load netBundle @ARMcore|RegisterFile_RD2 32 ARMcore|RegisterFile_RD2[31] ARMcore|RegisterFile_RD2[30] ARMcore|RegisterFile_RD2[29] ARMcore|RegisterFile_RD2[28] ARMcore|RegisterFile_RD2[27] ARMcore|RegisterFile_RD2[26] ARMcore|RegisterFile_RD2[25] ARMcore|RegisterFile_RD2[24] ARMcore|RegisterFile_RD2[23] ARMcore|RegisterFile_RD2[22] ARMcore|RegisterFile_RD2[21] ARMcore|RegisterFile_RD2[20] ARMcore|RegisterFile_RD2[19] ARMcore|RegisterFile_RD2[18] ARMcore|RegisterFile_RD2[17] ARMcore|RegisterFile_RD2[16] ARMcore|RegisterFile_RD2[15] ARMcore|RegisterFile_RD2[14] ARMcore|RegisterFile_RD2[13] ARMcore|RegisterFile_RD2[12] ARMcore|RegisterFile_RD2[11] ARMcore|RegisterFile_RD2[10] ARMcore|RegisterFile_RD2[9] ARMcore|RegisterFile_RD2[8] ARMcore|RegisterFile_RD2[7] ARMcore|RegisterFile_RD2[6] ARMcore|RegisterFile_RD2[5] ARMcore|RegisterFile_RD2[4] ARMcore|RegisterFile_RD2[3] ARMcore|RegisterFile_RD2[2] ARMcore|RegisterFile_RD2[1] ARMcore|RegisterFile_RD2[0] -autobundled
netbloc @ARMcore|RegisterFile_RD2 1 6 1 3560 1688n
load netBundle @ARMcore|RegisterFile_A10_i_n_ 4 ARMcore|RegisterFile_A10_i_n_0 ARMcore|RegisterFile_A10_i_n_1 ARMcore|RegisterFile_A10_i_n_2 ARMcore|RegisterFile_A10_i_n_3 -autobundled
netbloc @ARMcore|RegisterFile_A10_i_n_ 1 4 1 2470 1678n
load netBundle @ARMcore|RegisterFile_A1 4 ARMcore|RegisterFile_A1[3] ARMcore|RegisterFile_A1[2] ARMcore|RegisterFile_A1[1] ARMcore|RegisterFile_A1[0] -autobundled
netbloc @ARMcore|RegisterFile_A1 1 5 11 2870 1788 3620 1828 4160J 1528 NJ 1528 5340J 1508 5720J 1488 6140J 1468 6950J 1548 NJ 1548 NJ 1548 8640
load netBundle @ARMcore|RegisterFile_A20_i_n_ 4 ARMcore|RegisterFile_A20_i_n_0 ARMcore|RegisterFile_A20_i_n_1 ARMcore|RegisterFile_A20_i_n_2 ARMcore|RegisterFile_A20_i_n_3 -autobundled
netbloc @ARMcore|RegisterFile_A20_i_n_ 1 4 1 2470 1798n
load netBundle @ARMcore|RegisterFile_A2 4 ARMcore|RegisterFile_A2[3] ARMcore|RegisterFile_A2[2] ARMcore|RegisterFile_A2[1] ARMcore|RegisterFile_A2[0] -autobundled
netbloc @ARMcore|RegisterFile_A2 1 5 11 2850 1808 3640 1848 4180J 1548 NJ 1548 5360J 1528 5720J 1668 6160J 1488 6770J 1588 7640J 1708 8220J 1688 8940
load netBundle @ARMcore|ResultW 32 ARMcore|ResultW[31] ARMcore|ResultW[30] ARMcore|ResultW[29] ARMcore|ResultW[28] ARMcore|ResultW[27] ARMcore|ResultW[26] ARMcore|ResultW[25] ARMcore|ResultW[24] ARMcore|ResultW[23] ARMcore|ResultW[22] ARMcore|ResultW[21] ARMcore|ResultW[20] ARMcore|ResultW[19] ARMcore|ResultW[18] ARMcore|ResultW[17] ARMcore|ResultW[16] ARMcore|ResultW[15] ARMcore|ResultW[14] ARMcore|ResultW[13] ARMcore|ResultW[12] ARMcore|ResultW[11] ARMcore|ResultW[10] ARMcore|ResultW[9] ARMcore|ResultW[8] ARMcore|ResultW[7] ARMcore|ResultW[6] ARMcore|ResultW[5] ARMcore|ResultW[4] ARMcore|ResultW[3] ARMcore|ResultW[2] ARMcore|ResultW[1] ARMcore|ResultW[0] -autobundled
netbloc @ARMcore|ResultW 1 5 14 2870 2228 NJ 2228 4420 2048 NJ 2048 5260 2108 NJ 2108 NJ 2108 NJ 2108 NJ 2108 NJ 2108 NJ 2108 NJ 2108 NJ 2108 10670
load netBundle @ARMcore|ALU_SrcA 32 ARMcore|ALU_SrcA[31] ARMcore|ALU_SrcA[30] ARMcore|ALU_SrcA[29] ARMcore|ALU_SrcA[28] ARMcore|ALU_SrcA[27] ARMcore|ALU_SrcA[26] ARMcore|ALU_SrcA[25] ARMcore|ALU_SrcA[24] ARMcore|ALU_SrcA[23] ARMcore|ALU_SrcA[22] ARMcore|ALU_SrcA[21] ARMcore|ALU_SrcA[20] ARMcore|ALU_SrcA[19] ARMcore|ALU_SrcA[18] ARMcore|ALU_SrcA[17] ARMcore|ALU_SrcA[16] ARMcore|ALU_SrcA[15] ARMcore|ALU_SrcA[14] ARMcore|ALU_SrcA[13] ARMcore|ALU_SrcA[12] ARMcore|ALU_SrcA[11] ARMcore|ALU_SrcA[10] ARMcore|ALU_SrcA[9] ARMcore|ALU_SrcA[8] ARMcore|ALU_SrcA[7] ARMcore|ALU_SrcA[6] ARMcore|ALU_SrcA[5] ARMcore|ALU_SrcA[4] ARMcore|ALU_SrcA[3] ARMcore|ALU_SrcA[2] ARMcore|ALU_SrcA[1] ARMcore|ALU_SrcA[0] -autobundled
netbloc @ARMcore|ALU_SrcA 1 10 3 5760 1688 6200J 1508 7030
load netBundle @ARMcore|SB 32 ARMcore|SB[31] ARMcore|SB[30] ARMcore|SB[29] ARMcore|SB[28] ARMcore|SB[27] ARMcore|SB[26] ARMcore|SB[25] ARMcore|SB[24] ARMcore|SB[23] ARMcore|SB[22] ARMcore|SB[21] ARMcore|SB[20] ARMcore|SB[19] ARMcore|SB[18] ARMcore|SB[17] ARMcore|SB[16] ARMcore|SB[15] ARMcore|SB[14] ARMcore|SB[13] ARMcore|SB[12] ARMcore|SB[11] ARMcore|SB[10] ARMcore|SB[9] ARMcore|SB[8] ARMcore|SB[7] ARMcore|SB[6] ARMcore|SB[5] ARMcore|SB[4] ARMcore|SB[3] ARMcore|SB[2] ARMcore|SB[1] ARMcore|SB[0] -autobundled
netbloc @ARMcore|SB 1 8 10 4760 1728 5180J 1808 5680J 1828 6420J 1928 6990 1468 NJ 1468 NJ 1468 8900J 1538 9720J 1618 NJ
load netBundle @ARMcore|Shifter_ShOut 32 ARMcore|Shifter_ShOut[31] ARMcore|Shifter_ShOut[30] ARMcore|Shifter_ShOut[29] ARMcore|Shifter_ShOut[28] ARMcore|Shifter_ShOut[27] ARMcore|Shifter_ShOut[26] ARMcore|Shifter_ShOut[25] ARMcore|Shifter_ShOut[24] ARMcore|Shifter_ShOut[23] ARMcore|Shifter_ShOut[22] ARMcore|Shifter_ShOut[21] ARMcore|Shifter_ShOut[20] ARMcore|Shifter_ShOut[19] ARMcore|Shifter_ShOut[18] ARMcore|Shifter_ShOut[17] ARMcore|Shifter_ShOut[16] ARMcore|Shifter_ShOut[15] ARMcore|Shifter_ShOut[14] ARMcore|Shifter_ShOut[13] ARMcore|Shifter_ShOut[12] ARMcore|Shifter_ShOut[11] ARMcore|Shifter_ShOut[10] ARMcore|Shifter_ShOut[9] ARMcore|Shifter_ShOut[8] ARMcore|Shifter_ShOut[7] ARMcore|Shifter_ShOut[6] ARMcore|Shifter_ShOut[5] ARMcore|Shifter_ShOut[4] ARMcore|Shifter_ShOut[3] ARMcore|Shifter_ShOut[2] ARMcore|Shifter_ShOut[1] ARMcore|Shifter_ShOut[0] -autobundled
netbloc @ARMcore|Shifter_ShOut 1 9 1 5080 1358n
load netBundle @SW 16 SW[15] SW[14] SW[13] SW[12] SW[11] SW[10] SW[9] SW[8] SW[7] SW[6] SW[5] SW[4] SW[3] SW[2] SW[1] SW[0] -autobundled
netbloc @SW 1 0 3 NJ 690 NJ 690 860J
load netBundle @LED 16 LED[15] LED[14] LED[13] LED[12] LED[11] LED[10] LED[9] LED[8] LED[7] LED[6] LED[5] LED[4] LED[3] LED[2] LED[1] LED[0] -autobundled
netbloc @LED 1 6 1 NJ 650
load netBundle @SevenSegAn 8 SevenSegAn[7] SevenSegAn[6] SevenSegAn[5] SevenSegAn[4] SevenSegAn[3] SevenSegAn[2] SevenSegAn[1] SevenSegAn[0] -autobundled
netbloc @SevenSegAn 1 6 1 NJ 780
load netBundle @SevenSegCat 7 SevenSegCat[6] SevenSegCat[5] SevenSegCat[4] SevenSegCat[3] SevenSegCat[2] SevenSegCat[1] SevenSegCat[0] -autobundled
netbloc @SevenSegCat 1 6 1 NJ 800
load netBundle @ARMcore_Cache_Addr 32 ARMcore_Cache_Addr[31] ARMcore_Cache_Addr[30] ARMcore_Cache_Addr[29] ARMcore_Cache_Addr[28] ARMcore_Cache_Addr[27] ARMcore_Cache_Addr[26] ARMcore_Cache_Addr[25] ARMcore_Cache_Addr[24] ARMcore_Cache_Addr[23] ARMcore_Cache_Addr[22] ARMcore_Cache_Addr[21] ARMcore_Cache_Addr[20] ARMcore_Cache_Addr[19] ARMcore_Cache_Addr[18] ARMcore_Cache_Addr[17] ARMcore_Cache_Addr[16] ARMcore_Cache_Addr[15] ARMcore_Cache_Addr[14] ARMcore_Cache_Addr[13] ARMcore_Cache_Addr[12] ARMcore_Cache_Addr[11] ARMcore_Cache_Addr[10] ARMcore_Cache_Addr[9] ARMcore_Cache_Addr[8] ARMcore_Cache_Addr[7] ARMcore_Cache_Addr[6] ARMcore_Cache_Addr[5] ARMcore_Cache_Addr[4] ARMcore_Cache_Addr[3] ARMcore_Cache_Addr[2] ARMcore_Cache_Addr[1] ARMcore_Cache_Addr[0] -autobundled
netbloc @ARMcore_Cache_Addr 1 1 3 500 130 NJ 130 11810
load netBundle @ARMcore_Cache_WriteData 32 ARMcore_Cache_WriteData[31] ARMcore_Cache_WriteData[30] ARMcore_Cache_WriteData[29] ARMcore_Cache_WriteData[28] ARMcore_Cache_WriteData[27] ARMcore_Cache_WriteData[26] ARMcore_Cache_WriteData[25] ARMcore_Cache_WriteData[24] ARMcore_Cache_WriteData[23] ARMcore_Cache_WriteData[22] ARMcore_Cache_WriteData[21] ARMcore_Cache_WriteData[20] ARMcore_Cache_WriteData[19] ARMcore_Cache_WriteData[18] ARMcore_Cache_WriteData[17] ARMcore_Cache_WriteData[16] ARMcore_Cache_WriteData[15] ARMcore_Cache_WriteData[14] ARMcore_Cache_WriteData[13] ARMcore_Cache_WriteData[12] ARMcore_Cache_WriteData[11] ARMcore_Cache_WriteData[10] ARMcore_Cache_WriteData[9] ARMcore_Cache_WriteData[8] ARMcore_Cache_WriteData[7] ARMcore_Cache_WriteData[6] ARMcore_Cache_WriteData[5] ARMcore_Cache_WriteData[4] ARMcore_Cache_WriteData[3] ARMcore_Cache_WriteData[2] ARMcore_Cache_WriteData[1] ARMcore_Cache_WriteData[0] -autobundled
netbloc @ARMcore_Cache_WriteData 1 1 3 520 410 1040J 368 11750
load netBundle @ARMcore_IO_Addr 32 ARMcore_IO_Addr[31] ARMcore_IO_Addr[30] ARMcore_IO_Addr[29] ARMcore_IO_Addr[28] ARMcore_IO_Addr[27] ARMcore_IO_Addr[26] ARMcore_IO_Addr[25] ARMcore_IO_Addr[24] ARMcore_IO_Addr[23] ARMcore_IO_Addr[22] ARMcore_IO_Addr[21] ARMcore_IO_Addr[20] ARMcore_IO_Addr[19] ARMcore_IO_Addr[18] ARMcore_IO_Addr[17] ARMcore_IO_Addr[16] ARMcore_IO_Addr[15] ARMcore_IO_Addr[14] ARMcore_IO_Addr[13] ARMcore_IO_Addr[12] ARMcore_IO_Addr[11] ARMcore_IO_Addr[10] ARMcore_IO_Addr[9] ARMcore_IO_Addr[8] ARMcore_IO_Addr[7] ARMcore_IO_Addr[6] ARMcore_IO_Addr[5] ARMcore_IO_Addr[4] ARMcore_IO_Addr[3] ARMcore_IO_Addr[2] ARMcore_IO_Addr[1] ARMcore_IO_Addr[0] -autobundled
netbloc @ARMcore_IO_Addr 1 3 1 11830 670n
load netBundle @ARMcore_IO_WriteData 32 ARMcore_IO_WriteData[31] ARMcore_IO_WriteData[30] ARMcore_IO_WriteData[29] ARMcore_IO_WriteData[28] ARMcore_IO_WriteData[27] ARMcore_IO_WriteData[26] ARMcore_IO_WriteData[25] ARMcore_IO_WriteData[24] ARMcore_IO_WriteData[23] ARMcore_IO_WriteData[22] ARMcore_IO_WriteData[21] ARMcore_IO_WriteData[20] ARMcore_IO_WriteData[19] ARMcore_IO_WriteData[18] ARMcore_IO_WriteData[17] ARMcore_IO_WriteData[16] ARMcore_IO_WriteData[15] ARMcore_IO_WriteData[14] ARMcore_IO_WriteData[13] ARMcore_IO_WriteData[12] ARMcore_IO_WriteData[11] ARMcore_IO_WriteData[10] ARMcore_IO_WriteData[9] ARMcore_IO_WriteData[8] ARMcore_IO_WriteData[7] ARMcore_IO_WriteData[6] ARMcore_IO_WriteData[5] ARMcore_IO_WriteData[4] ARMcore_IO_WriteData[3] ARMcore_IO_WriteData[2] ARMcore_IO_WriteData[1] ARMcore_IO_WriteData[0] -autobundled
netbloc @ARMcore_IO_WriteData 1 3 1 11870 710n
load netBundle @PC 32 PC[31] PC[30] PC[29] PC[28] PC[27] PC[26] PC[25] PC[24] PC[23] PC[22] PC[21] PC[20] PC[19] PC[18] PC[17] PC[16] PC[15] PC[14] PC[13] PC[12] PC[11] PC[10] PC[9] PC[8] PC[7] PC[6] PC[5] PC[4] PC[3] PC[2] PC[1] PC[0] -autobundled
netbloc @PC 1 1 3 520 610 900J 2488 11750
load netBundle @Cache_cm_ReadAddr 32 Cache_cm_ReadAddr[31] Cache_cm_ReadAddr[30] Cache_cm_ReadAddr[29] Cache_cm_ReadAddr[28] Cache_cm_ReadAddr[27] Cache_cm_ReadAddr[26] Cache_cm_ReadAddr[25] Cache_cm_ReadAddr[24] Cache_cm_ReadAddr[23] Cache_cm_ReadAddr[22] Cache_cm_ReadAddr[21] Cache_cm_ReadAddr[20] Cache_cm_ReadAddr[19] Cache_cm_ReadAddr[18] Cache_cm_ReadAddr[17] Cache_cm_ReadAddr[16] Cache_cm_ReadAddr[15] Cache_cm_ReadAddr[14] Cache_cm_ReadAddr[13] Cache_cm_ReadAddr[12] Cache_cm_ReadAddr[11] Cache_cm_ReadAddr[10] Cache_cm_ReadAddr[9] Cache_cm_ReadAddr[8] Cache_cm_ReadAddr[7] Cache_cm_ReadAddr[6] Cache_cm_ReadAddr[5] Cache_cm_ReadAddr[4] Cache_cm_ReadAddr[3] Cache_cm_ReadAddr[2] Cache_cm_ReadAddr[1] Cache_cm_ReadAddr[0] -autobundled
netbloc @Cache_cm_ReadAddr 1 0 3 40 30 NJ 30 1060
load netBundle @Cache_cm_WriteAddr 32 Cache_cm_WriteAddr[31] Cache_cm_WriteAddr[30] Cache_cm_WriteAddr[29] Cache_cm_WriteAddr[28] Cache_cm_WriteAddr[27] Cache_cm_WriteAddr[26] Cache_cm_WriteAddr[25] Cache_cm_WriteAddr[24] Cache_cm_WriteAddr[23] Cache_cm_WriteAddr[22] Cache_cm_WriteAddr[21] Cache_cm_WriteAddr[20] Cache_cm_WriteAddr[19] Cache_cm_WriteAddr[18] Cache_cm_WriteAddr[17] Cache_cm_WriteAddr[16] Cache_cm_WriteAddr[15] Cache_cm_WriteAddr[14] Cache_cm_WriteAddr[13] Cache_cm_WriteAddr[12] Cache_cm_WriteAddr[11] Cache_cm_WriteAddr[10] Cache_cm_WriteAddr[9] Cache_cm_WriteAddr[8] Cache_cm_WriteAddr[7] Cache_cm_WriteAddr[6] Cache_cm_WriteAddr[5] Cache_cm_WriteAddr[4] Cache_cm_WriteAddr[3] Cache_cm_WriteAddr[2] Cache_cm_WriteAddr[1] Cache_cm_WriteAddr[0] -autobundled
netbloc @Cache_cm_WriteAddr 1 0 3 80 70 NJ 70 1020
load netBundle @Cache_cm_WriteData 32 Cache_cm_WriteData[31] Cache_cm_WriteData[30] Cache_cm_WriteData[29] Cache_cm_WriteData[28] Cache_cm_WriteData[27] Cache_cm_WriteData[26] Cache_cm_WriteData[25] Cache_cm_WriteData[24] Cache_cm_WriteData[23] Cache_cm_WriteData[22] Cache_cm_WriteData[21] Cache_cm_WriteData[20] Cache_cm_WriteData[19] Cache_cm_WriteData[18] Cache_cm_WriteData[17] Cache_cm_WriteData[16] Cache_cm_WriteData[15] Cache_cm_WriteData[14] Cache_cm_WriteData[13] Cache_cm_WriteData[12] Cache_cm_WriteData[11] Cache_cm_WriteData[10] Cache_cm_WriteData[9] Cache_cm_WriteData[8] Cache_cm_WriteData[7] Cache_cm_WriteData[6] Cache_cm_WriteData[5] Cache_cm_WriteData[4] Cache_cm_WriteData[3] Cache_cm_WriteData[2] Cache_cm_WriteData[1] Cache_cm_WriteData[0] -autobundled
netbloc @Cache_cm_WriteData 1 0 3 100 90 NJ 90 1000
load netBundle @ARMcore_Cache_ReadData 32 ARMcore_Cache_ReadData[31] ARMcore_Cache_ReadData[30] ARMcore_Cache_ReadData[29] ARMcore_Cache_ReadData[28] ARMcore_Cache_ReadData[27] ARMcore_Cache_ReadData[26] ARMcore_Cache_ReadData[25] ARMcore_Cache_ReadData[24] ARMcore_Cache_ReadData[23] ARMcore_Cache_ReadData[22] ARMcore_Cache_ReadData[21] ARMcore_Cache_ReadData[20] ARMcore_Cache_ReadData[19] ARMcore_Cache_ReadData[18] ARMcore_Cache_ReadData[17] ARMcore_Cache_ReadData[16] ARMcore_Cache_ReadData[15] ARMcore_Cache_ReadData[14] ARMcore_Cache_ReadData[13] ARMcore_Cache_ReadData[12] ARMcore_Cache_ReadData[11] ARMcore_Cache_ReadData[10] ARMcore_Cache_ReadData[9] ARMcore_Cache_ReadData[8] ARMcore_Cache_ReadData[7] ARMcore_Cache_ReadData[6] ARMcore_Cache_ReadData[5] ARMcore_Cache_ReadData[4] ARMcore_Cache_ReadData[3] ARMcore_Cache_ReadData[2] ARMcore_Cache_ReadData[1] ARMcore_Cache_ReadData[0] -autobundled
netbloc @ARMcore_Cache_ReadData 1 2 1 1060 310n
load netBundle @ARMcore_Mem_ReadData 32 ARMcore_Mem_ReadData[31] ARMcore_Mem_ReadData[30] ARMcore_Mem_ReadData[29] ARMcore_Mem_ReadData[28] ARMcore_Mem_ReadData[27] ARMcore_Mem_ReadData[26] ARMcore_Mem_ReadData[25] ARMcore_Mem_ReadData[24] ARMcore_Mem_ReadData[23] ARMcore_Mem_ReadData[22] ARMcore_Mem_ReadData[21] ARMcore_Mem_ReadData[20] ARMcore_Mem_ReadData[19] ARMcore_Mem_ReadData[18] ARMcore_Mem_ReadData[17] ARMcore_Mem_ReadData[16] ARMcore_Mem_ReadData[15] ARMcore_Mem_ReadData[14] ARMcore_Mem_ReadData[13] ARMcore_Mem_ReadData[12] ARMcore_Mem_ReadData[11] ARMcore_Mem_ReadData[10] ARMcore_Mem_ReadData[9] ARMcore_Mem_ReadData[8] ARMcore_Mem_ReadData[7] ARMcore_Mem_ReadData[6] ARMcore_Mem_ReadData[5] ARMcore_Mem_ReadData[4] ARMcore_Mem_ReadData[3] ARMcore_Mem_ReadData[2] ARMcore_Mem_ReadData[1] ARMcore_Mem_ReadData[0] -autobundled
netbloc @ARMcore_Mem_ReadData 1 1 2 440 530 960J
load netBundle @Instr 32 Instr[31] Instr[30] Instr[29] Instr[28] Instr[27] Instr[26] Instr[25] Instr[24] Instr[23] Instr[22] Instr[21] Instr[20] Instr[19] Instr[18] Instr[17] Instr[16] Instr[15] Instr[14] Instr[13] Instr[12] Instr[11] Instr[10] Instr[9] Instr[8] Instr[7] Instr[6] Instr[5] Instr[4] Instr[3] Instr[2] Instr[1] Instr[0] -autobundled
netbloc @Instr 1 2 1 980J 490n
load netBundle @PeripheralConnector_LED_WD 32 PeripheralConnector_LED_WD[31] PeripheralConnector_LED_WD[30] PeripheralConnector_LED_WD[29] PeripheralConnector_LED_WD[28] PeripheralConnector_LED_WD[27] PeripheralConnector_LED_WD[26] PeripheralConnector_LED_WD[25] PeripheralConnector_LED_WD[24] PeripheralConnector_LED_WD[23] PeripheralConnector_LED_WD[22] PeripheralConnector_LED_WD[21] PeripheralConnector_LED_WD[20] PeripheralConnector_LED_WD[19] PeripheralConnector_LED_WD[18] PeripheralConnector_LED_WD[17] PeripheralConnector_LED_WD[16] PeripheralConnector_LED_WD[15] PeripheralConnector_LED_WD[14] PeripheralConnector_LED_WD[13] PeripheralConnector_LED_WD[12] PeripheralConnector_LED_WD[11] PeripheralConnector_LED_WD[10] PeripheralConnector_LED_WD[9] PeripheralConnector_LED_WD[8] PeripheralConnector_LED_WD[7] PeripheralConnector_LED_WD[6] PeripheralConnector_LED_WD[5] PeripheralConnector_LED_WD[4] PeripheralConnector_LED_WD[3] PeripheralConnector_LED_WD[2] PeripheralConnector_LED_WD[1] PeripheralConnector_LED_WD[0] -autobundled
netbloc @PeripheralConnector_LED_WD 1 4 2 N 670 NJ
load netBundle @ARMcore_IO_ReadData 32 ARMcore_IO_ReadData[31] ARMcore_IO_ReadData[30] ARMcore_IO_ReadData[29] ARMcore_IO_ReadData[28] ARMcore_IO_ReadData[27] ARMcore_IO_ReadData[26] ARMcore_IO_ReadData[25] ARMcore_IO_ReadData[24] ARMcore_IO_ReadData[23] ARMcore_IO_ReadData[22] ARMcore_IO_ReadData[21] ARMcore_IO_ReadData[20] ARMcore_IO_ReadData[19] ARMcore_IO_ReadData[18] ARMcore_IO_ReadData[17] ARMcore_IO_ReadData[16] ARMcore_IO_ReadData[15] ARMcore_IO_ReadData[14] ARMcore_IO_ReadData[13] ARMcore_IO_ReadData[12] ARMcore_IO_ReadData[11] ARMcore_IO_ReadData[10] ARMcore_IO_ReadData[9] ARMcore_IO_ReadData[8] ARMcore_IO_ReadData[7] ARMcore_IO_ReadData[6] ARMcore_IO_ReadData[5] ARMcore_IO_ReadData[4] ARMcore_IO_ReadData[3] ARMcore_IO_ReadData[2] ARMcore_IO_ReadData[1] ARMcore_IO_ReadData[0] -autobundled
netbloc @ARMcore_IO_ReadData 1 2 3 1040 2508 11850J 610 12260
load netBundle @PeripheralConnector_SEG_WD 32 PeripheralConnector_SEG_WD[31] PeripheralConnector_SEG_WD[30] PeripheralConnector_SEG_WD[29] PeripheralConnector_SEG_WD[28] PeripheralConnector_SEG_WD[27] PeripheralConnector_SEG_WD[26] PeripheralConnector_SEG_WD[25] PeripheralConnector_SEG_WD[24] PeripheralConnector_SEG_WD[23] PeripheralConnector_SEG_WD[22] PeripheralConnector_SEG_WD[21] PeripheralConnector_SEG_WD[20] PeripheralConnector_SEG_WD[19] PeripheralConnector_SEG_WD[18] PeripheralConnector_SEG_WD[17] PeripheralConnector_SEG_WD[16] PeripheralConnector_SEG_WD[15] PeripheralConnector_SEG_WD[14] PeripheralConnector_SEG_WD[13] PeripheralConnector_SEG_WD[12] PeripheralConnector_SEG_WD[11] PeripheralConnector_SEG_WD[10] PeripheralConnector_SEG_WD[9] PeripheralConnector_SEG_WD[8] PeripheralConnector_SEG_WD[7] PeripheralConnector_SEG_WD[6] PeripheralConnector_SEG_WD[5] PeripheralConnector_SEG_WD[4] PeripheralConnector_SEG_WD[3] PeripheralConnector_SEG_WD[2] PeripheralConnector_SEG_WD[1] PeripheralConnector_SEG_WD[0] -autobundled
netbloc @PeripheralConnector_SEG_WD 1 4 1 12300 730n
load netBundle @PeripheralConnector_SW_RD 32 PeripheralConnector_SW_RD[31] PeripheralConnector_SW_RD[30] PeripheralConnector_SW_RD[29] PeripheralConnector_SW_RD[28] PeripheralConnector_SW_RD[27] PeripheralConnector_SW_RD[26] PeripheralConnector_SW_RD[25] PeripheralConnector_SW_RD[24] PeripheralConnector_SW_RD[23] PeripheralConnector_SW_RD[22] PeripheralConnector_SW_RD[21] PeripheralConnector_SW_RD[20] PeripheralConnector_SW_RD[19] PeripheralConnector_SW_RD[18] PeripheralConnector_SW_RD[17] PeripheralConnector_SW_RD[16] PeripheralConnector_SW_RD[15] PeripheralConnector_SW_RD[14] PeripheralConnector_SW_RD[13] PeripheralConnector_SW_RD[12] PeripheralConnector_SW_RD[11] PeripheralConnector_SW_RD[10] PeripheralConnector_SW_RD[9] PeripheralConnector_SW_RD[8] PeripheralConnector_SW_RD[7] PeripheralConnector_SW_RD[6] PeripheralConnector_SW_RD[5] PeripheralConnector_SW_RD[4] PeripheralConnector_SW_RD[3] PeripheralConnector_SW_RD[2] PeripheralConnector_SW_RD[1] PeripheralConnector_SW_RD[0] -autobundled
netbloc @PeripheralConnector_SW_RD 1 3 1 11910J 690n
load netBundle @SEG 32 SEG[31] SEG[30] SEG[29] SEG[28] SEG[27] SEG[26] SEG[25] SEG[24] SEG[23] SEG[22] SEG[21] SEG[20] SEG[19] SEG[18] SEG[17] SEG[16] SEG[15] SEG[14] SEG[13] SEG[12] SEG[11] SEG[10] SEG[9] SEG[8] SEG[7] SEG[6] SEG[5] SEG[4] SEG[3] SEG[2] SEG[1] SEG[0] -autobundled
netbloc @SEG 1 5 1 12540 770n
levelinfo -pg 1 0 240 660 1220 12060 12390 12650 12810
levelinfo -hier ARMcore * 1340 1600 1850 2260 2680 3210 3770 4550 4880 5490 5900 6620 7190 7880 8410 9360 9870 10380 10860 11280 *
pagesize -pg 1 -db -bbox -sgen -110 0 12980 2700
pagesize -hier ARMcore -db -bbox -sgen 1220 398 11590 2458
show
zoom 0.599289
scrollpos 847 347
#
# initialize ictrl to current module TOP work:TOP:NOFILE
ictrl init topinfo |
