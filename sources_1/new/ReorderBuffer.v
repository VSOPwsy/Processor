`include "config.v"

module ReorderBuffer(
    input CLK,
    input Reset,
    input append,
    output full,
    output [2:0] ROBTail,
    output reg [2:0] ROBHead,
    input [147:0] CDB,
    input [3:0] DestReg,
    input DP_WriteBack,
    input MEM_WriteBack,

    output reg [3:0] WA,
    output reg WE,
    output reg [31:0] WD,
    output reg Commit,

    input [2:0] IndexA,
    input [2:0] IndexB,
    output [31:0] ForwardDataA,
    output [31:0] ForwardDataB,
    output ForwardA,
    output ForwardB
);


    wire [35:0] CDB_DP, CDB_MEM, CDB_MUL, CDB_FP; 
    assign CDB_DP = CDB[35:0];
    assign CDB_MEM = CDB[71:36];
    assign CDB_MUL = CDB[107:72];
    assign CDB_FP = CDB[143:108];

    initial ROBHead = 0;
    reg [3:0] head, tail;
    wire [2:0] ROBHead_next;
    assign ROBTail = tail[2:0];
    assign ROBHead_next = head[2:0];
    always @(posedge CLK, posedge Reset) ROBHead <= Reset ? 0 : ROBHead_next;

    reg [7:0] BUSY;
    reg [7:0] STATE; // 0 for issue or execute, 1 for write back
    reg [3:0] DESTINATION [0:7];
    reg [31:0] VALUE [0:7];
    reg [7:0] WRITEBACK;

    initial begin
        BUSY = 0;
        STATE = 0;
        WRITEBACK = 0;
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
                BUSY[ROBTail] <= 1;
                DESTINATION[ROBTail] <= DestReg;
            end
            if (BUSY[ROBHead_next] & STATE[ROBHead_next] & ~empty) begin
                BUSY[ROBHead_next] <= 0;
            end
        end
    end

    always @(posedge CLK) begin
        if (append) begin
            STATE[ROBTail] <= 0;
        end
        if (CDB_DP[3] & BUSY[CDB_DP[2:0]]) begin
            STATE[CDB_DP[2:0]] <= 1;
            VALUE[CDB_DP[2:0]] <= CDB_DP[35:4];
            WRITEBACK[CDB_DP[2:0]] <= DP_WriteBack;
        end
        if (CDB_MEM[3] & BUSY[CDB_MEM[2:0]]) begin
            STATE[CDB_MEM[2:0]] <= 1;
            VALUE[CDB_MEM[2:0]] <= CDB_MEM[35:4];
            WRITEBACK[CDB_MEM[2:0]] <= MEM_WriteBack;
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
        end
        else begin
            if (BUSY[ROBHead_next] & STATE[ROBHead_next] & ~empty) begin
                head <= head + 1;
            end
            else begin
                head <= head;
            end
        end
    end

    always @(*) begin
        if (BUSY[ROBHead_next] & STATE[ROBHead_next] & ~empty) begin
            WA = DESTINATION[ROBHead_next];
            WE = WRITEBACK[ROBHead_next];
            WD = VALUE[ROBHead_next];
            Commit = 1;
        end
        else begin
            WA = 0;
            WE = 0;
            WD = 0;
            Commit = 0;
        end
    end

    assign ForwardA = BUSY[IndexA] & STATE[IndexA];
    assign ForwardB = BUSY[IndexB] & STATE[IndexB];
    assign ForwardDataA = VALUE[IndexA];
    assign ForwardDataB = VALUE[IndexB];


endmodule