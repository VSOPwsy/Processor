`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/26 14:14:41
// Design Name: 
// Module Name: CondLogic_tb
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


module CondLogic_tb;

    // Signals
    reg CLK;
    reg PCS;
    reg RegW;
    reg MemW;
    reg [1:0] FlagW;
    reg [3:0] Cond;
    reg [3:0] ALUFlags;
    wire PCSrc;
    wire RegWrite;
    wire MemWrite;

    // Instantiate the unit under test (UUT)
    CondLogic uut (
        .CLK(CLK),
        .PCS(PCS),
        .RegW(RegW),
        .MemW(MemW),
        .FlagW(FlagW),
        .Cond(Cond),
        .ALUFlags(ALUFlags),
        .PCSrc(PCSrc),
        .RegWrite(RegWrite),
        .MemWrite(MemWrite)
    );

    // Test procedure
    initial begin
        // Initialization
        CLK = 0;
        #5 CLK = ~CLK;
        PCS = 0;
        RegW = 0;
        MemW = 0;
        FlagW = 2'b00;
        Cond = 4'b0000;
        ALUFlags = 4'b0000;

        // Wait for a few clock cycles
        #10;

        // Test case 1
        Cond = 4'b0000;
        ALUFlags = 4'b0010;
        PCS = 1;
        RegW = 1;
        MemW = 1;
        FlagW = 2'b11;
        #10;

        // Test case 2
        Cond = 4'b0001;
        ALUFlags = 4'b0010;
        #10;

        // Test case 3
        Cond = 4'b0010;
        ALUFlags = 4'b0001;
        #10;

        // ... Add more test cases as required ...

        // End of test
        $display("Testbench completed!");
        $finish;
    end

endmodule