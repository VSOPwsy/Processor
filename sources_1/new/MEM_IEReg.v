module DP_IEReg(
    input CLK,
    input Reset,
    input EN,
    input CLR,
    input ExecI,
    input [3:0] CondI,
    input [2:0] WIndexI,
    input [4:0] OpI,
    input [31:0] SrcAI,
    input [31:0] SrcBI,
    input [1:0] ShI,
    input [4:0] Shamt5I,
    output reg ExecE,
    output reg [3:0] CondE,
    output reg [2:0] WIndexE,
    output reg [4:0] OpE,
    output reg [31:0] SrcAE,
    output reg [31:0] SrcBE,
    output reg [1:0] ShE,
    output reg [4:0] Shamt5E
);

    initial begin
        ExecE = 0;
        CondE = 0;
        WIndexE = 0;
        OpE = 0;
        SrcAE = 0;
        SrcBE = 0;
        ShE = 0;
        Shamt5E = 0;
    end

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            ExecE <= 0;
            CondE <= 0;
            WIndexE <= 0;
            OpE <= 0;
            SrcAE <= 0;
            SrcBE <= 0;
            ShE <= 0;
            Shamt5E <= 0;
        end
        else if (CLR) begin
            ExecE <= 0;
            CondE <= 0;
            WIndexE <= 0;
            OpE <= 0;
            SrcAE <= 0;
            SrcBE <= 0;
            ShE <= 0;
            Shamt5E <= 0;
        end
        else if (EN) begin
            ExecE <= ExecI;
            CondE <= CondI;
            WIndexE <= WIndexI;
            OpE <= OpI;
            SrcAE <= SrcAI;
            SrcBE <= SrcBI;
            ShE <= ShI;
            Shamt5E <= Shamt5I;
        end
        else begin
            ExecE <= ExecE;
            CondE <= CondE;
            WIndexE <= WIndexE;
            OpE <= OpE;
            SrcAE <= SrcAE;
            SrcBE <= SrcBE;
            ShE <= ShE;
            Shamt5E <= Shamt5E;
        end
    end
endmodule