`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 14:22:41
// Design Name: 
// Module Name: MCycle
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


module MCycle #(
    parameter width = 32
)(
    input CLK,
    input Reset,
    input Start,
    input MCycleOp,
    input [width-1:0] Operand1, // Multiplicand / Dividend
    input [width-1:0] Operand2, // Multiplier / Divisor
    input [width-1:0] Operand3,
    input [3:0] WA3,
    input [3:0] WA5,
    input MCAdd,
    input MCLong,
    input MCycleHazard,
    output [width-1:0] ResultHigh,
    output [width-1:0] ResultLow,
    output reg [width-1:0] AddSrc,
    output reg MCycleLong,
    output Busy,
    output reg [3:0] MCycleWA3,
    output reg [3:0] MCycleWA5,
    output Done,
    output reg MPushIn
);

    initial begin
        MPushIn = 0;
        MCycleWA3 = 0;
        MCycleWA5 = 0;
        AddSrc = 0;
        MCycleLong = 0;
    end
    
    wire Done;
    ControlTest #(
        .width(width)
    )ControlTest(
        .CLK(CLK),
        .Reset(Reset),
        .MCycleOp(MCycleOp),
        .Start(Start),
        .Control(MCycleOp ? cout : temp_sum[0]),
        .Init(Init),
        .Shift(Shift),
        .Write(Write),
        .Busy(Busy),
        .Done(Done)
    );
    
    wire [width-1:0] a, b, s;
    wire cout;
    adder adder(
        .cin(MCycleOp),
        .a(a),
        .b(MCycleOp? ~b : b),
        .s(s),
        .cout(cout)
    );
    
    
    wire Init;
    reg [2*width-1:0] temp_sum = 0;
    reg [width-1:0] shifted_op1 = 0 ;

    assign a = temp_sum[2*width-1 -: width];
    assign b = shifted_op1;

    always @(posedge CLK, posedge Reset) begin: COMPUTING_PROCESS // process which does the actual computation
        if (Reset | Init) begin
            temp_sum <= {{width{1'b0}}, MCycleOp ? Operand1 : Operand2};
            shifted_op1 <= MCycleOp ? Operand2 : Operand1;
            MCycleWA3 <= WA3;
            MCycleWA5 <= WA5;
            AddSrc <= MCAdd ? Operand3 : 0;
            MCycleLong <= MCLong; 
        end
        else if (Shift) begin
            if(~MCycleOp) begin
                if (Write)
                    temp_sum <= {cout, s, temp_sum[width-1:1]};
                else
                    temp_sum <= {1'b0, temp_sum[2*width-1:1]};
            end
            else begin
                if (Write)
                    temp_sum <= {s[width-2:0], temp_sum[width-1:0], 1'b1};
                else
                    temp_sum <= {temp_sum[2*width-2 : 0], 1'b0};
            end
        end
    end

    assign {ResultHigh, ResultLow} = temp_sum;
    always @(posedge CLK, posedge Reset) MPushIn <= Reset ? 0 : Done;
endmodule
