`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/25 12:50:31
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;

reg [31:0] SrcA, SrcB;
reg [1:0] ALUControl;
wire [31:0] ALUResult;
wire [3:0] ALUFlags;


ALU ALU(
    .SrcA       (SrcA       ),
    .SrcB       (SrcB       ),
    .ALUControl (ALUControl ),
    .ALUResult  (ALUResult  ),
    .ALUFlags   (ALUFlags   ));


initial begin
    SrcA = 32'h00000204;
    SrcB = 32'h0000000C;
    ALUControl = 2'b00;
    #10;
    $finish;
end

endmodule
