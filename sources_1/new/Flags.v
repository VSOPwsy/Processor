`include "config.v"

module Flags (
    input CLK,
    input Reset,
    input [3:0] FlagWrite,
    input [3:0] ALUFlags,
    input ShifterCarry,
    input [4:0] Op,
    output [3:0] Flags
);


    reg N, Z, C, V;
    initial begin
        N = 0;
        Z = 0;
        C = 0;
        V = 0;
    end
    assign Flags = {N, Z, C, V};
    always @(posedge CLK, posedge Reset) begin
        if (Reset)
            {N, Z, C, V} <= 4'b0;
        else begin
            N <= FlagWrite[3] ? ALUFlags[3] : N;
            Z <= FlagWrite[2] ? ALUFlags[2] : Z;
            if (FlagWrite[1]) begin
                if (Op == `AND || Op == `EOR || Op == `TST || Op == `TEQ || 
                    Op == `ORR || Op == `MOV || Op == `BIC || Op == `MVN)
                    C <= ShifterCarry;
                else
                    C <= ALUFlags[1];
            end
            else begin
                C <= C;
            end
            V <= FlagWrite[0] ? ALUFlags[0] : V;
        end
    end

endmodule