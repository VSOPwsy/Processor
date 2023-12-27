module FlagStatus(
    input CLK,
    input Reset,
    input [151:0] CDB,
    input append,
    input S,
    input ROBTail,
    output reg FlagReady,
    output [2:0] index
);

    reg [2:0] INDEX;

    initial begin
        INDEX = 0;
        FlagReady = 1;
    end

    assign index = INDEX;

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            INDEX <= 0;
        end
        else begin
            if (append & S) begin
                INDEX <= ROBTail;
                FlagReady <= 0;
            end
            else if (CDB[151] & CDB[150:148] == INDEX) begin
                FlagReady <= 1;
            end
        end
    end


endmodule