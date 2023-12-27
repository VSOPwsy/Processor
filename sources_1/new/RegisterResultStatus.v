module RegisterResultStatus(
    input CLK,
    input Reset,
    input [147:0] CDB,
    input [35:0] WBB,
    input [7:0] query,
    input [3:0] WA,
    input NoWrite,
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
            if (append & ~NoWrite) begin
                BUSY[WA] <= 1;
                INDEX[WA] <= ROBTail;
            end

            if (WBB[3]) begin
                if (INDEX[0] == WBB[2:0]) begin
                    BUSY[0] <= 0;
                end
                if (INDEX[1] == WBB[2:0]) begin
                    BUSY[1] <= 0;
                end
                if (INDEX[2] == WBB[2:0]) begin
                    BUSY[2] <= 0;
                end
                if (INDEX[3] == WBB[2:0]) begin
                    BUSY[3] <= 0;
                end
                if (INDEX[4] == WBB[2:0]) begin
                    BUSY[4] <= 0;
                end
                if (INDEX[5] == WBB[2:0]) begin
                    BUSY[5] <= 0;
                end
                if (INDEX[6] == WBB[2:0]) begin
                    BUSY[6] <= 0;
                end
                if (INDEX[7] == WBB[2:0]) begin
                    BUSY[7] <= 0;
                end
                if (INDEX[8] == WBB[2:0]) begin
                    BUSY[8] <= 0;
                end
                if (INDEX[9] == WBB[2:0]) begin
                    BUSY[9] <= 0;
                end
                if (INDEX[10] == WBB[2:0]) begin
                    BUSY[10] <= 0;
                end
                if (INDEX[11] == WBB[2:0]) begin
                    BUSY[11] <= 0;
                end
                if (INDEX[12] == WBB[2:0]) begin
                    BUSY[12] <= 0;
                end
                if (INDEX[13] == WBB[2:0]) begin
                    BUSY[13] <= 0;
                end
                if (INDEX[14] == WBB[2:0]) begin
                    BUSY[14] <= 0;
                end
                if (INDEX[15] == WBB[2:0]) begin
                    BUSY[15] <= 0;
                end
            end
        end
    end
endmodule