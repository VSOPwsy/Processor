module FPU(
    input CLK,
    input Reset,
    input Start,
    input FPUOp,
    input [31:0] Operand1,
    input [31:0] Operand2,
    input [3:0] WA3,
    output [31:0] Result,
    output Busy,
    output Done,
    output [3:0] FPUWA3,
    output reg FPUPushIn
    );


    wire ADD_Start, MUL_Start;
    wire [31:0] ADD_Result, MUL_Result;
    wire ADD_Busy, MUL_Busy;
    wire ADD_Done, MUL_Done;
    wire [3:0] FADDWA3, FMULWA3;
    assign ADD_Start = Start & ~FPUOp;
    assign MUL_Start = Start & FPUOp;
    assign Result = Op_reg ? MUL_Result : ADD_Result;
    assign Busy = ADD_Busy | MUL_Busy;
    assign Done = ADD_Done | MUL_Done;

    reg Op_reg = 0;
    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            Op_reg <= 0;
        end
        else if (ADD_Start) begin
            Op_reg <= 0;
        end
        else if (MUL_Start) begin
            Op_reg <= 1;
        end
        else begin
            Op_reg <= Op_reg;
        end
    end


    FADD FADD(
        .CLK(CLK),
        .Reset(Reset),
        .Start(ADD_Start),
        .Operand1(Operand1),
        .Operand2(Operand2),
        .WA3(WA3),
        .Result(ADD_Result),
        .Busy(ADD_Busy),
        .Done(ADD_Done),
        .FADDWA3(FADDWA3)
    );

    FMUL FMUL(
        .CLK(CLK),
        .Reset(Reset),
        .Start(MUL_Start),
        .Operand1(Operand1),
        .Operand2(Operand2),
        .WA3(WA3),
        .Result(MUL_Result),
        .Busy(MUL_Busy),
        .Done(MUL_Done),
        .FMULWA3(FMULWA3)
    );

    // assign FPUWA3 = FMULWA3;
    assign FPUWA3 = 0;
    always @(posedge CLK, posedge Reset) FPUPushIn <= Reset ? 0 : MUL_Done;
endmodule