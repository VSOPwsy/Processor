module DEReg(
    input CLK,
    input Reset,
    input CLR,
    input [3:0] RA1D,
    input [3:0] RA2D,
    input [3:0] CondD,
    input [1:0] FlagWD,
    input PCSD,
    input RegWD,
    input MemWD,
    input MemtoRegD,
    input [3:0] WA3D,
    input [3:0] WA5D,
    input ALUSrcD,
    input [3:0] ALUControlD,
    input [31:0] RD1D,
    input [31:0] RD2D,
    input [31:0] RD4D,
    input [31:0] ExtImmD,
    input [1:0] ShD,
    input [4:0] Shamt5D,
    input NoWriteD,
    input MSD,
    input MCycleOpD,
    input MCycleHazardD,
    input MCAddD,
    input MCLongD,
    output reg [3:0] CondE,
    output reg [1:0] FlagWE,
    output reg PCSE,
    output reg RegWE,
    output reg MemWE,
    output reg MemtoRegE,
    output reg [3:0] WA3E,
    output reg [3:0] WA5E,
    output reg ALUSrcE,
    output reg [3:0] ALUControlE,
    output reg [3:0] RA1E,
    output reg [3:0] RA2E,
    output reg [3:0] RA4E,
    output reg [31:0] RD1E,
    output reg [31:0] RD2E,
    output reg [31:0] RD4E,
    output reg [31:0] ExtImmE,
    output reg [1:0] ShE,
    output reg [4:0] Shamt5E,
    output reg NoWriteE,
    output reg MSE,
    output reg MCycleOpE,
    output reg MCycleHazardE,
    output reg MCAddE,
    output reg MCLongE
);

    initial begin
        CondE = 0;
        FlagWE = 0;
        PCSE = 0;
        RegWE = 0;
        MemWE = 0;
        MemtoRegE = 0;
        WA3E = 0;
        ALUSrcE = 0;
        ALUControlE = 0;
        RD1E = 0;
        RD2E = 0;
        RD4E = 0;
        ExtImmE = 0;
        RA1E = 0;
        RA2E = 0;
        ShE = 0;
        Shamt5E = 0;
        NoWriteE = 0;
        MSE = 0;
        MCycleOpE = 0;
        MCycleHazardE = 0;
        WA5E = 0;
        MCAddE = 0;
        MCLongE = 0;
    end

    always @(posedge CLK, posedge Reset) begin
        if (Reset | CLR) begin
            CondE <= 0;
            FlagWE <= 0;
            PCSE <= 0;
            RegWE <= 0;
            MemWE <= 0;
            MemtoRegE <= 0;
            WA3E <= 0;
            ALUSrcE <= 0;
            ALUControlE <= 0;
            RD1E <= 0;
            RD2E <= 0;
            RD4E <= 0;
            ExtImmE <= 0;
            RA1E <= 0;
            RA2E <= 0;
            ShE <= 0;
            Shamt5E <= 0;
            NoWriteE <= 0;
            MSE <= 0;
            MCycleOpE <= 0;
            MCycleHazardE <= 0;
            WA5E <= 0;
            MCAddE <= 0;
            MCLongE <= 0;
        end
        else begin
            CondE <= CondD;
            FlagWE <= FlagWD;
            PCSE <= PCSD;
            RegWE <= RegWD;
            MemWE <= MemWD;
            MemtoRegE <= MemtoRegD;
            WA3E <= WA3D;
            ALUSrcE <= ALUSrcD;
            ALUControlE <= ALUControlD;
            RD1E <= RD1D;
            RD2E <= RD2D;
            RD4E <= RD4D;
            ExtImmE <= ExtImmD;
            RA1E <= RA1D;
            RA2E <= RA2D;
            ShE <= ShD;
            Shamt5E <= Shamt5D;
            NoWriteE <= NoWriteD;
            MSE <= MSD;
            MCycleOpE <= MCycleOpD;
            MCycleHazardE <= MCycleHazardD;
            WA5E <= WA5D;
            MCAddE <= MCAddD;
            MCLongE <= MCLongD;
        end
    end

endmodule
