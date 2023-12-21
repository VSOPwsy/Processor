module RegisterResultStatus(
    input CLK,
    input Reset,
    input [143:0] CDB,
    input [7:0] query,
    input [3:0] WA,
    input append,
    input [2:0] ROBTail,
    output reg [1:0] result_busy,
    output reg [5:0] index
);
    reg [2:0] INDEX [0:15];
    reg [15:0] BUSY;

    always @(*) begin
        result_busy[0] = BUSY[query[3:0]];
        index[2:0] = INDEX[query[3:0]];
        result_busy[1] = BUSY[query[7:4]];
        index[5:3] = INDEX[query[7:4]];
    end

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            BUSY = 0;
        end
        else begin
            if (append) begin
                BUSY[WA] <= 1;
                INDEX[WA] <= ROBTail;
            end

            if (CDB[3]) begin
                if (INDEX[0] == CDB[2:0]) begin
                    BUSY[0] <= 0;
                end
                if (INDEX[1] == CDB[2:0]) begin
                    BUSY[1] <= 0;
                end
                if (INDEX[2] == CDB[2:0]) begin
                    BUSY[2] <= 0;
                end
                if (INDEX[3] == CDB[2:0]) begin
                    BUSY[3] <= 0;
                end
                if (INDEX[4] == CDB[2:0]) begin
                    BUSY[4] <= 0;
                end
                if (INDEX[5] == CDB[2:0]) begin
                    BUSY[5] <= 0;
                end
                if (INDEX[6] == CDB[2:0]) begin
                    BUSY[6] <= 0;
                end
                if (INDEX[7] == CDB[2:0]) begin
                    BUSY[7] <= 0;
                end
                if (INDEX[8] == CDB[2:0]) begin
                    BUSY[8] <= 0;
                end
                if (INDEX[9] == CDB[2:0]) begin
                    BUSY[9] <= 0;
                end
                if (INDEX[10] == CDB[2:0]) begin
                    BUSY[10] <= 0;
                end
                if (INDEX[11] == CDB[2:0]) begin
                    BUSY[11] <= 0;
                end
                if (INDEX[12] == CDB[2:0]) begin
                    BUSY[12] <= 0;
                end
                if (INDEX[13] == CDB[2:0]) begin
                    BUSY[13] <= 0;
                end
                if (INDEX[14] == CDB[2:0]) begin
                    BUSY[14] <= 0;
                end
                if (INDEX[15] == CDB[2:0]) begin
                    BUSY[15] <= 0;
                end
            end
        end
    end
endmodule