module DIReg(
    input CLK,
    input Reset,
    input EN,
    input IssueD,
    input [4:0] OpD,
    input [3:0] RA1D,
    input [3:0] RA2D,
    input [3:0] WA3D,
    input ALUSrcD,
    input [31:0] ExtImmD,
    input [3:0] CondD,
    input [3:0] FlagWD,
    input RegWD,
    input NoWriteD,
    input [4:0] Shamt5D,
    input [1:0] ShD,
    input MemWD,
    input MemtoRegD,
    input MULSD,
    input FPSD,
    input PCSD,
    output reg IssueI,
    output reg [4:0] OpI,
    output reg [3:0] RA1I,
    output reg [3:0] RA2I,
    output reg [3:0] WA3I,
    output reg ALUSrcI,
    output reg [31:0] ExtImmI,
    output reg [3:0] CondI,
    output reg [3:0] FlagWI,
    output reg RegWI,
    output reg NoWriteI,
    output reg [4:0] Shamt5I,
    output reg [1:0] ShI,
    output reg MemWI,
    output reg MemtoRegI,
    output reg MULSI,
    output reg FPSI,
    output reg PCSI
);

    initial begin
        IssueI = 0;
        OpI = 0;
        RA1I = 0;
        RA2I = 0;
        WA3I = 0;
        ALUSrcI = 0;
        ExtImmI = 0;
        CondI = 0;
        FlagWI = 0;
        RegWI = 0;
        NoWriteI = 0;
        MemWI = 0;
        MemtoRegI = 0;
        MULSI = 0;
        FPSI = 0;
        Shamt5I = 0;
        ShI = 0;
        PCSI = 0;
    end

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            IssueI <= 0;
            OpI <= 0;
            RA1I <= 0;
            RA2I <= 0;
            WA3I <= 0;
            ALUSrcI <= 0;
            ExtImmI <= 0;
            CondI <= 0;
            FlagWI <= 0;
            RegWI <= 0;
            NoWriteI <= 0;
            MemWI <= 0;
            MemtoRegI <= 0;
            MULSI <= 0;
            FPSI <= 0;
            Shamt5I <= 0;
            ShI <= 0;
            PCSI <= 0;
        end
        else begin
            if (EN) begin
                IssueI <= IssueD;
                OpI <= OpD;
                RA1I <= RA1D;
                RA2I <= RA2D;
                WA3I <= WA3D;
                ALUSrcI <= ALUSrcD;
                ExtImmI <= ExtImmD;
                CondI <= CondD;
                FlagWI <= FlagWD;
                RegWI <= RegWD;
                NoWriteI <= NoWriteD;
                MemWI <= MemWD;
                MemtoRegI <= MemtoRegD;
                MULSI <= MULSD;
                FPSI <= FPSD;
                Shamt5I <= Shamt5D;
                ShI <= ShD;
                PCSI <= PCSD;
            end
            else begin
                IssueI <= IssueI;
                OpI <= OpI;
                RA1I <= RA1I;
                RA2I <= RA2I;
                WA3I <= WA3I;
                ALUSrcI <= ALUSrcI;
                ExtImmI <= ExtImmI;
                CondI <= CondI;
                FlagWI <= FlagWI;
                RegWI <= RegWI;
                NoWriteI <= NoWriteI;
                MemWI <= MemWI;
                MemtoRegI <= MemtoRegI;
                MULSI <= MULSI;
                FPSI <= FPSI;
                Shamt5I <= Shamt5I;
                ShI <= ShI;
                PCSI <= PCSI;
            end
        end
    end

endmodule