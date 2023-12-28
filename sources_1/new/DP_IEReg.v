module DP_IEReg(
    input CLK,
    input Reset,
    input EN,
    input CLR,
    input ExecI,
    input [3:0] CondI,
    input [3:0] FlagWI,
    input RegWI,
    input [2:0] WIndexI,
    input [31:0] SrcAI,
    input [31:0] SrcBI,
    input [1:0] ShI,
    input [4:0] Shamt5I,
    input ALUSrcI,
    input [4:0] OpI,
    input NoWriteI,
    input PCSI,
    output reg ExecE,
    output reg [3:0] CondE,
    output reg [3:0] FlagWE,
    output reg RegWE,
    output reg [2:0] WIndexE,
    output reg [31:0] SrcAE,
    output reg [31:0] SrcBE,
    output reg [1:0] ShE,
    output reg [4:0] Shamt5E,
    output reg ALUSrcE,
    output reg [4:0] OpE,
    output reg NoWriteE,
    output reg PCSE
);

    initial begin
        ExecE = 0;
        CondE = 0;
        FlagWE = 0;
        RegWE = 0;
        WIndexE = 0;
        SrcAE = 0;
        SrcBE = 0;
        ShE = 0;
        Shamt5E = 0;
        NoWriteE = 0;
        ALUSrcE = 0;
        OpE = 0;
        PCSE = 0;
    end

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            ExecE <= 0;
            CondE <= 0;
            FlagWE <= 0;
            RegWE <= 0;
            WIndexE <= 0;
            SrcAE <= 0;
            SrcBE <= 0;
            ShE <= 0;
            Shamt5E <= 0;
            NoWriteE <= 0;
            ALUSrcE <= 0;
            OpE <= 0;
            PCSE <= 0;
        end
        else if (CLR) begin
            ExecE <= 0;
            CondE <= 0;
            FlagWE <= 0;
            RegWE <= 0;
            WIndexE <= 0;
            SrcAE <= 0;
            SrcBE <= 0;
            ShE <= 0;
            Shamt5E <= 0;
            NoWriteE <= 0;
            ALUSrcE <= 0;
            OpE <= 0;
            PCSE <= 0;
        end
        else if (EN) begin
            ExecE <= ExecI;
            CondE <= CondI;
            FlagWE <= FlagWI;
            RegWE <= RegWI;
            WIndexE <= WIndexI;
            SrcAE <= SrcAI;
            SrcBE <= SrcBI;
            ShE <= ShI;
            Shamt5E <= Shamt5I;
            NoWriteE <= NoWriteI;
            ALUSrcE <= ALUSrcI;
            OpE <= OpI;
            PCSE <= PCSI;
        end
        else begin
            ExecE <= ExecE;
            CondE <= CondE;
            FlagWE <= FlagWE;
            RegWE <= RegWE;
            WIndexE <= WIndexE;
            SrcAE <= SrcAE;
            SrcBE <= SrcBE;
            ShE <= ShE;
            Shamt5E <= Shamt5E;
            NoWriteE <= NoWriteE;
            ALUSrcE <= ALUSrcE;
            OpE <= OpE;
            PCSE <= PCSE;
        end
    end
endmodule
