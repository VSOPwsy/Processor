module DP_EWReg(
    input CLK,
    input Reset,
    input ExecE,
    input [31:0] ALUResultE,
    input [2:0] WIndexE,
    output reg ExecW,
    output reg [31:0] ALUResultW,
    output reg [2:0] WIndexW
);

    initial begin
        ALUResultW = 0;
        WIndexW = 0;
        ExecW = 0;
    end


    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            ALUResultW <= 0;
            WIndexW <= 0;
            ExecW <= 0;
        end
        else begin
            ALUResultW <= ALUResultE;
            WIndexW <= WIndexE;
            ExecW <= ExecE;
        end
    end


endmodule