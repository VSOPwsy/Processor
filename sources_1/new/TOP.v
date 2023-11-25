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

    input [6:0] DIP,

    output [7:0] SevenSegAn,
    output [6:0] SevenSegCat
);

    // ARMcore
    // Input
    wire    [31:0]      ARMcore_IO_ReadData;
    // Output
    wire    [31:0]      ARMcore_IO_Addr;
    wire    [31:0]      ARMcore_IO_WriteData;
    wire                ARMcore_IO_WE;
    // Assignment
    assign  ARMcore_IO_ReadData     =   PeripheralConnector_RD;


    // PeripheralConnector
    // Input
    wire                PeripheralConnector_WE;
    wire    [31:0]      PeripheralConnector_WD;
    wire    [31:0]      PeripheralConnector_ADDR;
    wire    [31:0]      PeripheralConnector_DIP_RD;
    // Output
    wire    [31:0]      PeripheralConnector_RD;
    wire                PeripheralConnector_LED_WE;
    wire    [31:0]      PeripheralConnector_LED_WD;
    wire                PeripheralConnector_SEG_WE;
    wire    [31:0]      PeripheralConnector_SEG_WD;
    // Assignment
    assign  PeripheralConnector_WE  =   ARMcore_IO_WE;
    assign  PeripheralConnector_WD  =   ARMcore_IO_WriteData;
    assign  PeripheralConnector_ADDR    =   ARMcore_IO_Addr;
    assign  PeripheralConnector_DIP_RD  =   DipDriver_RD;


    ARMcore ARMcore(
    .CLK            (CLK                    ),
    .Reset          (Reset                  ),
    .IO_ReadData    (ARMcore_IO_ReadData    ),
    .IO_Addr        (ARMcore_IO_Addr        ),
    .IO_WriteData   (ARMcore_IO_WriteData   ),
    .IO_WE          (ARMcore_IO_WE          ));
    

    PeripheralConnector PeripheralConnector(
        .WD     (PeripheralConnector_WD     ),
        .ADDR   (PeripheralConnector_ADDR   ),
        .WE     (PeripheralConnector_WE     ),
        .DIP_RD (PeripheralConnector_DIP_RD ),
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

    wire    [31:0]      DipDriver_RD;
    DipDriver DipDriver(
        .DIP    (DIP         ),
        .RD     (DipDriver_RD));

    wire [31:0] SEG;
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