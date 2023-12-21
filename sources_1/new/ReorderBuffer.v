`include "config.v"

module ReorderBuffer (
    input CLK,
    input Reset,
    input append,
    output full,
    output [2:0] ROBTail,
    input [143:0] CDB,
    input [3:0] DestReg,

    output reg [3:0] WA,
    output reg WE,
    output reg [31:0] WD
);


    wire [35:0] CDB_DP, CDB_MEM, CDB_MUL, CDB_FP; 
    assign CDB_DP = CDB[35:0];
    assign CDB_MEM = CDB[71:36];
    assign CDB_MUL = CDB[107:72];
    assign CDB_FP = CDB[143:108];

    reg [3:0] head, tail;
    assign ROBTail = tail;

    reg [7:0] BUSY;
    reg [7:0] STATE; // 0 for issue or execute, 1 for write back
    reg [3:0] DESTINATION [0:7];
    reg [31:0] VALUE [0:7];

    initial begin
        BUSY = 0;
        STATE = 0;
    end

    assign full = head == {~tail[3], tail[2:0]};
    assign empty = head == tail;


    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            tail <= 0;
            BUSY <= 0;
        end
        else begin
            if (append) begin
                tail <= tail + 1;
                BUSY[tail] <= 1;
                DESTINATION[tail] <= DestReg;
            end
            if (BUSY[head] & STATE[head] & ~empty) begin
                BUSY[head] <= 0;
            end
        end
    end

    always @(posedge CLK) begin
        if (append) begin
            STATE[tail] <= 0;
        end
        if (CDB_DP[3] & BUSY[CDB_DP[2:0]]) begin
            STATE[CDB_DP[2:0]] <= 1;
            VALUE[CDB_DP[2:0]] <= CDB_DP[35:4];
        end
        if (CDB_MEM[3] & BUSY[CDB_MEM[2:0]]) begin
            STATE[CDB_MEM[2:0]] <= 1;
            VALUE[CDB_MEM[2:0]] <= CDB_MEM[35:4];
        end
        if (CDB_MUL[3] & BUSY[CDB_MUL[2:0]]) begin
            STATE[CDB_MUL[2:0]] <= 1;
            VALUE[CDB_MUL[2:0]] <= CDB_MUL[35:4];
        end
        if (CDB_FP[3] & BUSY[CDB_FP[2:0]]) begin
            STATE[CDB_FP[2:0]] <= 1;
            VALUE[CDB_FP[2:0]] <= CDB_FP[35:4];
        end
    end

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            head <= 0;
            WA <= 0;
            WE <= 0;
            WD <= 0;
        end
        else begin
            if (BUSY[head] & STATE[head] & ~empty) begin
                head <= head + 1;
                WA <= DESTINATION[head];
                WE <= 1;
                WD <= VALUE[head];
            end
            else begin
                head <= head;
                WA <= 0;
                WE <= 0;
                WD <= 0;
            end
        end
    end

endmodule