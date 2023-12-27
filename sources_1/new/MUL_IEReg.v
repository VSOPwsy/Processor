module MUL_IEReg(
    input CLK,
    input Reset,
    input EN,
    input CLR,
    input ExecI,
    input [3:0] CondI,
    input [3:0] FlagWI,
    input [2:0] WIndexI,
    input [31:0] SrcAI,
    input [31:0] SrcBI,
    input [4:0] OpI,
    input MULSI,
    output reg ExecE,
    output reg [3:0] CondE,
    output reg [3:0] FlagWE,
    output reg [2:0] WIndexE,
    output reg [31:0] SrcAE,
    output reg [31:0] SrcBE,
    output reg [4:0] OpE,
    output reg MULSE
);

    initial begin
        ExecE = 0;
        CondE = 0;
        FlagWE = 0;
        WIndexE = 0;
        SrcAE = 0;
        SrcBE = 0;
        OpE = 0;
        MULSE = 0;
    end

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            ExecE <= 0;
            CondE <= 0;
            FlagWE <= 0;
            WIndexE <= 0;
            SrcAE <= 0;
            SrcBE <= 0;
            OpE <= 0;
            MULSE <= 0;
        end
        else if (CLR) begin
            ExecE <= 0;
            CondE <= 0;
            FlagWE <= 0;
            WIndexE <= 0;
            SrcAE <= 0;
            SrcBE <= 0;
            OpE <= 0;
            MULSE <= 0;
        end
        else if (EN) begin
            ExecE <= ExecI;
            CondE <= CondI;
            FlagWE <= FlagWI;
            WIndexE <= WIndexI;
            SrcAE <= SrcAI;
            SrcBE <= SrcBI;
            OpE <= OpI;
            MULSE <= MULSI;
        end
        else begin
            ExecE <= ExecE;
            CondE <= CondE;
            FlagWE <= FlagWE;
            WIndexE <= WIndexE;
            SrcAE <= SrcAE;
            SrcBE <= SrcBE;
            OpE <= OpE;
            MULSE <= MULSE;
        end
    end
endmodule
