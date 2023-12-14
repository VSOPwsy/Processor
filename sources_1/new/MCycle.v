`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SUSTech
// Engineer: Suyu Wang
// Module Name: MCycle
// Project Name: Processor
// Tool Versions: Vivado 2021.2
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module MCycle #(
    parameter width = 32
)(
    input                   CLK,
    input                   Reset,
    input                   Start,
    input                   MCycleOp,
    input   [width-1:0]     Operand1, // Multiplicand / Dividend
    input   [width-1:0]     Operand2, // Multiplier / Divisor
    input   [3:0]           WA3,

    output  [width-1:0]     Result,
    output                  Busy,
    output                  Done,
    output  reg [3:0]       MCycleWA3,
    output  reg             MPushIn
);
    reg MCycleOp_reg;
    wire [width-1:0] a, b, s;
    wire cout;
    wire Init;
    reg [2*width-1:0] temp_sum = 0;
    reg [width-1:0] shifted_op1 = 0 ;

    initial begin
        MPushIn = 0;
        MCycleWA3 = 0;
        MCycleOp_reg = 0;
    end
    
    always @(posedge CLK, posedge Reset) begin
        if (Reset)
            MCycleOp_reg <= 0;
        else
            MCycleOp_reg <= Start ? MCycleOp : MCycleOp_reg;
    end
    
    ControlTest #(
        .width(width)
    )ControlTest(
        .CLK(CLK),
        .Reset(Reset),
        .MCycleOp(MCycleOp_reg),
        .Start(Start),
        .Control(MCycleOp_reg ? cout : temp_sum[0]),
        .Init(Init),
        .Shift(Shift),
        .Write(Write),
        .Busy(Busy),
        .Done(Done)
    );
    
    adder adder(
        .cin(MCycleOp_reg),
        .a(a),
        .b(MCycleOp_reg ? ~b : b),
        .s(s),
        .cout(cout)
    );

    assign a = temp_sum[2*width-1 -: width];
    assign b = shifted_op1;

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            temp_sum <= 0;
            shifted_op1 <= 0;
            MCycleWA3 <= 0;
        end
        else if (Init) begin
            temp_sum <= {{width{1'b0}}, (Start ? MCycleOp : MCycleOp_reg) ? Operand1 : Operand2};
            shifted_op1 <= (Start ? MCycleOp : MCycleOp_reg) ? Operand2 : Operand1;
            MCycleWA3 <= WA3;
        end
        else if (Shift) begin
            if(~MCycleOp_reg) begin
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

    assign Result = temp_sum[width-1:0];
    always @(posedge CLK, posedge Reset) MPushIn <= Reset ? 0 : Done;
endmodule
