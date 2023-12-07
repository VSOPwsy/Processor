`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: TOP
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


`include "config.v"

module TOP(
    input CLK,
    input Reset,

    output [15:0] LED,

    input [15:0] SW,

    output [7:0] SevenSegAn,
    output [6:0] SevenSegCat
);

    wire    [31:0]      ARMcore_IO_ReadData;
    wire                ARMcore_Cache_Hit;
    wire    [31:0]      ARMcore_Cache_ReadData;
    wire                ARMcore_Mem_ReadReady;
    wire    [31:0]      ARMcore_Mem_ReadData;
    wire    [31:0]      ARMcore_IO_Addr;
    wire    [31:0]      ARMcore_IO_WriteData;
    wire                ARMcore_IO_WE;
    wire                ARMcore_Cache_RW;
    wire    [31:0]      ARMcore_Cache_Addr;
    wire    [31:0]      ARMcore_Cache_WriteData;
    wire                ARMcore_Cache_Valid;

    wire Cache_rc_RW;
    wire Cache_rc_Valid;
    wire [31:0] Cache_rc_Addr;
    wire [31:0] Cache_rc_WriteData;
    wire Cache_cm_ReadReady;
    wire [31:0] Cache_cm_ReadData;
    wire [31:0] Cache_rc_ReadData;
    wire Cache_rc_Hit;
    wire Cache_cm_ReadValid;
    wire Cache_cm_WriteValid;
    wire [31:0] Cache_cm_WriteAddr;
    wire [31:0] Cache_cm_WriteData;
    wire [31:0] Cache_cm_ReadAddr;

    wire                DataMemory_ReadValid;
    wire                DataMemory_WriteValid;
    wire    [31:0]      DataMemory_WriteAddr;
    wire    [31:0]      DataMemory_ReadAddr;
    wire    [31:0]      DataMemory_WriteData;
    wire    [31:0]      DataMemory_ReadData;
    wire                DataMemory_ReadReady;

    wire                PeripheralConnector_WE;
    wire    [31:0]      PeripheralConnector_WD;
    wire    [31:0]      PeripheralConnector_ADDR;
    wire    [31:0]      PeripheralConnector_SW_RD;
    wire    [31:0]      PeripheralConnector_RD;
    wire                PeripheralConnector_LED_WE;
    wire    [31:0]      PeripheralConnector_LED_WD;
    wire                PeripheralConnector_SEG_WE;
    wire    [31:0]      PeripheralConnector_SEG_WD;

    wire    [31:0]      SWDriver_RD;
    wire    [31:0]      SEG;


    assign  ARMcore_IO_ReadData     =   PeripheralConnector_RD;
    assign  ARMcore_Cache_Hit       =   Cache_rc_Hit;
    assign  ARMcore_Cache_ReadData  =   Cache_rc_ReadData;
    assign  ARMcore_Mem_ReadReady   =   DataMemory_ReadReady;
    assign  ARMcore_Mem_ReadData    =   DataMemory_ReadData;

    assign  Cache_rc_Addr       =   ARMcore_Cache_Addr;
    assign  Cache_rc_RW         =   ARMcore_Cache_RW;
    assign  Cache_rc_Valid      =   ARMcore_Cache_Valid;
    assign  Cache_rc_WriteData  =   ARMcore_Cache_WriteData;
    assign  Cache_cm_ReadReady  =   DataMemory_ReadReady;
    assign  Cache_cm_ReadData   =   DataMemory_ReadData;

    assign  DataMemory_ReadValid    =   Cache_cm_ReadValid;
    assign  DataMemory_WriteValid   =   Cache_cm_WriteValid;
    assign  DataMemory_WriteAddr    =   Cache_cm_WriteAddr;
    assign  DataMemory_ReadAddr     =   Cache_cm_ReadAddr;
    assign  DataMemory_WriteData    =   Cache_cm_WriteData;

    assign  PeripheralConnector_WE      =   ARMcore_IO_WE;
    assign  PeripheralConnector_WD      =   ARMcore_IO_WriteData;
    assign  PeripheralConnector_ADDR    =   ARMcore_IO_Addr;
    assign  PeripheralConnector_SW_RD   =   SWDriver_RD;



    ARMcore ARMcore(
        .CLK            (CLK                    ),
        .Reset          (Reset                  ),
        .IO_ReadData    (ARMcore_IO_ReadData    ),
        .IO_Addr        (ARMcore_IO_Addr        ),
        .IO_WriteData   (ARMcore_IO_WriteData   ),
        .IO_WE          (ARMcore_IO_WE          ),
        .Cache_RW       (ARMcore_Cache_RW       ),
        .Cache_Addr     (ARMcore_Cache_Addr     ),
        .Cache_WriteData(ARMcore_Cache_WriteData),
        .Cache_Valid    (ARMcore_Cache_Valid    ),
        .Cache_Hit      (ARMcore_Cache_Hit      ),
        .Cache_ReadData (ARMcore_Cache_ReadData ),
        .Mem_ReadReady  (ARMcore_Mem_ReadReady  ),
        .Mem_ReadData   (ARMcore_Mem_ReadData   ));
    
    

    Cache Cache(
        .CLK            (CLK                ),
        .Reset          (Reset              ),
        .rc_RW          (Cache_rc_RW        ),
        .rc_Valid       (Cache_rc_Valid     ),
        .rc_Addr        (Cache_rc_Addr      ),
        .rc_WriteData   (Cache_rc_WriteData ),

        .cm_ReadValid   (Cache_cm_ReadValid ),
        .cm_WriteValid  (Cache_cm_WriteValid),
        .cm_ReadAddr    (Cache_cm_ReadAddr  ),
        .cm_WriteAddr   (Cache_cm_WriteAddr ),
        .cm_WriteData   (Cache_cm_WriteData ),

        .cm_ReadReady   (Cache_cm_ReadReady ),
        .cm_ReadData    (Cache_cm_ReadData  ),
    
        .rc_ReadData    (Cache_rc_ReadData  ),
        .rc_Hit         (Cache_rc_Hit       ));



    DataMemory DataMemory(
        .CLK        (CLK                    ),
        .ReadAddr   (DataMemory_ReadAddr    ),
        .WriteAddr  (DataMemory_WriteAddr   ),
        .ReadValid  (DataMemory_ReadValid   ),
        .WriteValid (DataMemory_WriteValid  ),
        .WriteData  (DataMemory_WriteData   ),
        .ReadData   (DataMemory_ReadData    ),
        .ReadReady  (DataMemory_ReadReady   ));


    PeripheralConnector PeripheralConnector(
        .WD     (PeripheralConnector_WD     ),
        .ADDR   (PeripheralConnector_ADDR   ),
        .WE     (PeripheralConnector_WE     ),
        .SW_RD  (PeripheralConnector_SW_RD  ),
        .RD     (PeripheralConnector_RD     ),
        .LED_WE (PeripheralConnector_LED_WE ),
        .LED_WD (PeripheralConnector_LED_WD ),
        .SEG_WE (PeripheralConnector_SEG_WE ),
        .SEG_WD (PeripheralConnector_SEG_WD ));


    ////////////////////////////////////////
    //Peripherals
    ////////////////////////////////////////
    LedDriver LedDriver(
        .CLK    (CLK                       ),
        .Reset  (Reset                     ),
        .LED    (LED                       ),
        .WE     (PeripheralConnector_LED_WE),
        .WD     (PeripheralConnector_LED_WD));

    SWDriver SWDriver(
        .SW     (SW          ),
        .RD     (SWDriver_RD));

    SegmentDriver SegmentDriver(
        .CLK    (CLK                       ),
        .Reset  (Reset                     ),
        .SEG    (SEG                       ),
        .WE     (PeripheralConnector_SEG_WE),
        .WD     (PeripheralConnector_SEG_WD));
    ////////////////////////////////////////
    ////////////////////////////////////////
    
    Segment Segment(
    .CLK    (CLK        ),
    .data   (SEG        ),
    .anode  (SevenSegAn ),
    .cathode(SevenSegCat),
    .dp     (           ));

endmodule