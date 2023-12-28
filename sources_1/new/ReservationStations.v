`include "config.v"

module ReservationStations #(
    parameter DP_STATION_DEPTH = 4,
    parameter MEM_STATION_DEPTH = 2,
    parameter MUL_STATION_DEPTH = 2
)(
    input CLK,
    input Reset,
    input Issue,
    input MemW,
    input MemtoReg,
    input MULS,
    input FPS,
    output reg full,

    input [147:0] CDB,

    output [7:0] rrs_query,
    input [1:0] rrs_result_busy,
    input [5:0] rrs_index,

    input [31:0] ROB_ForwardDataA,
    input [31:0] ROB_ForwardDataB,
    input ROB_ForwardA,
    input ROB_ForwardB,

    input fs_flagready,
    input [2:0] fs_index,

    input ALUSrc,
    input [31:0] ExtImm,
    input [3:0] Cond,
    input [3:0] FlagW,
    input RegW,
    input NoWrite,
    input [4:0] Shamt5,
    input [1:0] Sh,
    input [3:0] RA1,
    input [3:0] RA2,
    input [31:0] RD1,
    input [31:0] RD2,
    input [4:0] Op,
    input [2:0] ROBTail,

    output          DP_Exec,
    output [3:0]    DP_Cond,
    output [3:0]    DP_FlagW,
    output          DP_RegW,
    output          DP_NoWrite,
    output [4:0]    DP_Op,
    output [2:0]    DP_WIndex,
    output [4:0]    DP_Shamt5,
    output [1:0]    DP_Sh,
    output [31:0]   DP_SrcA,
    output [31:0]   DP_SrcB,
    output          DP_ALUSrc,

    input           Cache_Busy,
    output          MEM_Exec,
    output [3:0]    MEM_Cond,
    output          MEM_RegW,
    output [2:0]    MEM_WIndex,
    output          MEM_ALUSrc,
    output [4:0]    MEM_Shamt5,
    output [1:0]    MEM_Sh,
    output [31:0]   MEM_SrcA,
    output [31:0]   MEM_SrcB,
    output [31:0]   MEM_WriteData,

    input           MCycle_Busy,
    output          MUL_Exec,
    output [3:0]    MUL_Cond,
    output [3:0]    MUL_FlagW,
    output [4:0]    MUL_Op,
    output [2:0]    MUL_WIndex,
    output [31:0]   MUL_SrcA,
    output [31:0]   MUL_SrcB
);
    wire dp, mem, mul, fp;
    assign dp = ~(MemW | MemtoReg) & ~MULS & ~FPS;
    assign mem = MemW | MemtoReg;
    assign mul = MULS;
    assign fp = FPS;
    wire dp_full, mem_full, mul_full, fp_full;
    always @(*) begin
        if (dp) begin
            full = dp_full;
        end
        else if (mem) begin
            full = mem_full;
        end
        else if (mul) begin
            full = mul_full;
        end
        else if (fp) begin
            full = fp_full;
        end
        else begin
            full = 0;
        end
    end

    assign rrs_query = {RA2, RA1};
    
    DP_Station #(DP_STATION_DEPTH) DP_Station(
        .CLK(CLK),
        .Reset(Reset),
        .append(dp & Issue),
        .full(dp_full),
        .CDB(CDB),
        .rrs_result_busy(rrs_result_busy),
        .rrs_index(rrs_index),
        .fs_flagready(fs_flagready),
        .fs_index(fs_index),
        .ALUSrc(ALUSrc),
        .ExtImm(ExtImm),
        .Cond(Cond),
        .FlagW(FlagW),
        .RegW(RegW),
        .NoWrite(NoWrite),
        .Shamt5(Shamt5),
        .Sh(Sh),
        .RD1(RD1),
        .RD2(RD2),
        .Op(Op),
        .ROBTail(ROBTail),
        .ROB_ForwardDataA(ROB_ForwardDataA),
        .ROB_ForwardDataB(ROB_ForwardDataB),
        .ROB_ForwardA(ROB_ForwardA),
        .ROB_ForwardB(ROB_ForwardB),
        .Exec(DP_Exec),
        .Exec_Op(DP_Op),
        .Exec_Cond(DP_Cond),
        .Exec_FlagW(DP_FlagW),
        .Exec_RegW(DP_RegW),
        .Exec_NoWrite(DP_NoWrite),
        .WIndex(DP_WIndex),
        .Exec_Shamt5(DP_Shamt5),
        .Exec_Sh(DP_Sh),
        .Exec_SrcA(DP_SrcA),
        .Exec_SrcB(DP_SrcB),
        .Exec_ALUSrc(DP_ALUSrc)
    );

    MEM_Station #(MEM_STATION_DEPTH) MEM_Station(
        .CLK(CLK),
        .Reset(Reset),
        .append(mem & Issue),
        .full(mem_full),
        .CDB(CDB),
        .rrs_result_busy(rrs_result_busy),
        .rrs_index(rrs_index),
        .fs_flagready(fs_flagready),
        .fs_index(fs_index),
        .ALUSrc(ALUSrc),
        .ExtImm(ExtImm),
        .Cond(Cond),
        .RegW(RegW),
        .Shamt5(Shamt5),
        .Sh(Sh),
        .RD1(RD1),
        .RD2(RD2),
        .Op(Op),
        .ROBTail(ROBTail),
        .ROB_ForwardDataA(ROB_ForwardDataA),
        .ROB_ForwardDataB(ROB_ForwardDataB),
        .ROB_ForwardA(ROB_ForwardA),
        .ROB_ForwardB(ROB_ForwardB),
        .Cache_Busy(Cache_Busy),
        .Exec(MEM_Exec),
        .Exec_RegW(MEM_RegW),
        .Exec_Cond(MEM_Cond),
        .WIndex(MEM_WIndex),
        .Exec_ALUSrc(MEM_ALUSrc),
        .Exec_Shamt5(MEM_Shamt5),
        .Exec_Sh(MEM_Sh),
        .Exec_SrcA(MEM_SrcA),
        .Exec_SrcB(MEM_SrcB),
        .Exec_WriteData(MEM_WriteData)
    );



    MUL_Station #(MUL_STATION_DEPTH) MUL_Station(
        .CLK(CLK),
        .Reset(Reset),
        .append(mul & Issue),
        .full(mul_full),
        .CDB(CDB),
        .rrs_result_busy(rrs_result_busy),
        .rrs_index(rrs_index),
        .fs_flagready(fs_flagready),
        .fs_index(fs_index),
        .Cond(Cond),
        .FlagW(FlagW),
        .RD1(RD1),
        .RD2(RD2),
        .Op(Op),
        .ROBTail(ROBTail),
        .ROB_ForwardDataA(ROB_ForwardDataA),
        .ROB_ForwardDataB(ROB_ForwardDataB),
        .ROB_ForwardA(ROB_ForwardA),
        .ROB_ForwardB(ROB_ForwardB),
        .MCycle_Busy(MCycle_Busy),
        .Exec(MUL_Exec),
        .Exec_Cond(MUL_Cond),
        .Exec_FlagW(MUL_FlagW),
        .Exec_Op(MUL_Op),
        .WIndex(MUL_WIndex),
        .Exec_SrcA(MUL_SrcA),
        .Exec_SrcB(MUL_SrcB)
    );
endmodule




module DP_Station #(
    parameter DP_STATION_DEPTH = 2
)(
    input CLK,
    input Reset,
    input append,
    output full,
    
    input [147:0] CDB,

    // rrs: Register result status
    input [1:0] rrs_result_busy,
    input [5:0] rrs_index,
    
    input [31:0] ROB_ForwardDataA,
    input [31:0] ROB_ForwardDataB,
    input ROB_ForwardA,
    input ROB_ForwardB,

    input fs_flagready,
    input [2:0] fs_index,

    input ALUSrc,
    input [31:0] ExtImm,
    input [3:0] Cond,
    input [3:0] FlagW,
    input RegW,
    input NoWrite,
    input [4:0] Shamt5,
    input [1:0] Sh,
    input [31:0] RD1,
    input [31:0] RD2,
    input [4:0] Op,
    input [2:0] ROBTail,

    output Exec,
    output reg [3:0] Exec_Cond,
    output reg [4:0] Exec_Op,
    output reg [2:0] WIndex,
    output reg [3:0] Exec_FlagW,
    output reg Exec_RegW,
    output reg Exec_NoWrite,
    output reg [4:0] Exec_Shamt5,
    output reg [1:0] Exec_Sh,
    output reg [31:0] Exec_SrcA,
    output reg [31:0] Exec_SrcB,
    output reg Exec_ALUSrc
);

    reg [DP_STATION_DEPTH*1-1:0] BUSY;
    reg [DP_STATION_DEPTH*5-1:0] OP;
    reg [DP_STATION_DEPTH*4-1:0] COND;
    reg [DP_STATION_DEPTH*4-1:0] FLAGW;
    reg [DP_STATION_DEPTH*1-1:0] REGW;
    reg [DP_STATION_DEPTH*1-1:0] NOWRITE;
    reg [DP_STATION_DEPTH*5-1:0] SHAMT;
    reg [DP_STATION_DEPTH*2-1:0] SH;
    reg [DP_STATION_DEPTH*1-1:0] I;
    reg [DP_STATION_DEPTH*1-1:0] WAIT;
    reg [DP_STATION_DEPTH*32-1:0] VJ, VK;
    reg [DP_STATION_DEPTH*4-1:0] QJ, QK;
    reg [DP_STATION_DEPTH*3-1:0] DEST;
    reg [DP_STATION_DEPTH*4-1:0] F;

    wire [DP_STATION_DEPTH-1:0] READY;
    reg [DP_STATION_DEPTH-1:0] EXEC;

    initial begin
        BUSY = 0;
        OP = 0;
        COND = 0;
        FLAGW = 0;
        REGW = 0;
        NOWRITE = 0;
        SHAMT = 0;
        SH = 0;
        I = 0;
        WAIT = 0;
        VJ = 0;
        VK = 0;
        QJ = 0;
        QK = 0;
        DEST = 0;
        F = 0;
        Exec_Cond = 0;
        Exec_FlagW = 0;
        Exec_RegW = 0;
        Exec_NoWrite = 0;
        Exec_Op = 0;
        WIndex = 0;
        Exec_Shamt5 = 0;
        Exec_Sh = 0;
        Exec_SrcA = 0;
        Exec_SrcB = 0;
        Exec_ALUSrc = 0;
    end

    assign full = &BUSY;
    assign Exec = |EXEC;

    genvar i;
    generate
        for (i = 0; i < DP_STATION_DEPTH; i = i + 1) begin
            assign READY[i] = BUSY[i] & ~QJ[i*4+3] & ~QK[i*4+3] & ~F[i*4+3] & WAIT[i];
            if (i > 0) begin
                always @(posedge CLK, posedge Reset) begin
                    if (Reset) begin
                        BUSY[i] <= 0;
                    end
                    else begin
                        if (append & (&BUSY[i-1:0]) & ~BUSY[i]) begin
                            BUSY[i] <= 1;
                            WAIT[i] <= 1;
                            OP[i*5+:5] <= Op;
                            COND[i*4+:4] <= Cond;
                            FLAGW[i*4+:4] <= FlagW;
                            DEST[i*3+:3] <= ROBTail;
                            REGW[i] <= RegW;
                            NOWRITE[i] <= NoWrite;
                            SHAMT[i*5+:5] <= Shamt5;
                            SH[i*2+:2] <= Sh;
                            I[i] <= ALUSrc;
                            if (rrs_result_busy[0]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[35:4];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[71:40];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[107:76];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardA) begin
                                    VJ[i*32+:32] <= ROB_ForwardDataA;
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VJ[i*32+:32] <= VJ[i*32+:32];
                                    QJ[i*4+:4] <= {1'b1, rrs_index[2:0]};
                                end
                            end
                            else begin
                                VJ[i*32+:32] <= RD1;
                                QJ[i*4+:4] <= 4'b0;
                            end

                            if (ALUSrc) begin
                                VK[i*32+:32] <= ExtImm;
                                QK[i*4+:4] <= 4'b0;
                            end
                            else if (rrs_result_busy[1]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[35:4];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[71:40];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[107:76];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardB) begin
                                    VK[i*32+:32] <= ROB_ForwardDataB;
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VK[i*32+:32] <= VK[i*32+:32];
                                    QK[i*4+:4] <= {1'b1, rrs_index[5:3]};
                                end
                            end
                            else begin
                                VK[i*32+:32] <= RD2;
                                QK[i*4+:4] <= 4'b0;
                            end

                            if (Cond == 4'hE | fs_flagready) begin
                                F[i*4+:4] <= 4'b0;
                            end
                            else begin
                                F[i*4+:4] <= {1'b1, fs_index};
                            end
                        end

                        if (READY[i] & (READY[i-1:0] == 0)) begin
                            EXEC[i] <= 1;
                            WAIT[i] <= 0;
                        end
                        else begin
                            EXEC[i] <= 0;
                        end


                        if (BUSY[i]) begin
                            if (QJ[i*4+3] & CDB[3:0] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[35:4];
                            end
                            else if (QJ[i*4+3] & CDB[39:36] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[71:40];
                            end
                            else if (QJ[i*4+3] & CDB[75:72] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[107:76];
                            end
                            
                            if (QK[i*4+3] & CDB[3:0] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[35:4];
                            end
                            else if (QK[i*4+3] & CDB[39:36] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[71:40];
                            end
                            else if (QK[i*4+3] & CDB[75:72] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[107:76];
                            end

                            if (F[i*4+3] & CDB[147:144] == F[i*4+:4]) begin
                                F[i*4+3] <= 1'b0;
                            end

                            if (DEST[i*3+:3] == CDB[2:0] & CDB[3]) begin
                                BUSY[i] <= 0;
                            end

                        end
                    end
                end
            end
            else begin  // i = 0
                always @(posedge CLK, posedge Reset) begin
                    if (Reset) begin
                        BUSY[i] <= 0;
                    end
                    else begin
                        if (append & ~BUSY[i]) begin
                            BUSY[i] <= 1;
                            WAIT[i] <= 1;
                            OP[i*5+:5] <= Op;
                            COND[i*4+:4] <= Cond;
                            FLAGW[i*4+:4] <= FlagW;
                            REGW[i] <= RegW;
                            NOWRITE[i] <= NoWrite;
                            DEST[i*3+:3] <= ROBTail;
                            SHAMT[i*5+:5] <= Shamt5;
                            SH[i*2+:2] <= Sh;
                            I[i] <= ALUSrc;
                            if (rrs_result_busy[0]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[35:4];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[71:40];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[107:76];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardA) begin
                                    VJ[i*32+:32] <= ROB_ForwardDataA;
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VJ[i*32+:32] <= VJ[i*32+:32];
                                    QJ[i*4+:4] <= {1'b1, rrs_index[2:0]};
                                end
                            end
                            else begin
                                VJ[i*32+:32] <= RD1;
                                QJ[i*4+:4] <= 4'b0;
                            end

                            if (ALUSrc) begin
                                VK[i*32+:32] <= ExtImm;
                                QK[i*4+:4] <= 4'b0;
                            end
                            else if (rrs_result_busy[1]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[35:4];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[71:40];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[107:76];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardB) begin
                                    VK[i*32+:32] <= ROB_ForwardDataB;
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VK[i*32+:32] <= VK[i*32+:32];
                                    QK[i*4+:4] <= {1'b1, rrs_index[5:3]};
                                end
                            end
                            else begin
                                VK[i*32+:32] <= RD2;
                                QK[i*4+:4] <= 4'b0;
                            end

                            if (Cond == 4'hE | fs_flagready) begin
                                F[i*4+:4] <= 4'b0;
                            end
                            else begin
                                F[i*4+:4] <= {1'b1, fs_index};
                            end
                        end

                        if (READY[i]) begin
                            EXEC[i] <= 1;
                            WAIT[i] <= 0;
                        end
                        else begin
                            EXEC[i] <= 0;
                        end


                        if (BUSY[i]) begin
                            if (QJ[i*4+3] & CDB[3:0] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[35:4];
                            end
                            else if (QJ[i*4+3] & CDB[39:36] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[71:40];
                            end
                            else if (QJ[i*4+3] & CDB[75:72] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[107:76];
                            end
                            
                            if (QK[i*4+3] & CDB[3:0] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[35:4];
                            end
                            else if (QK[i*4+3] & CDB[39:36] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[71:40];
                            end
                            else if (QK[i*4+3] & CDB[75:72] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[107:76];
                            end

                            if (F[i*4+3] & CDB[147:144] == F[i*4+:4]) begin
                                F[i*4+3] <= 1'b0;
                            end

                            if (DEST[i*3+:3] == CDB[2:0] & CDB[3]) begin
                                BUSY[i] <= 0;
                            end
                        end
                    end
                end
            end
        end
    endgenerate


    generate
        if (DP_STATION_DEPTH == 2) begin
            always @(posedge CLK, posedge Reset) begin
                if (Reset) begin
                    Exec_Op <= 0;
                    WIndex <= 0;
                    Exec_Cond <= 0;
                    Exec_FlagW <= 0;
                    Exec_RegW <= 0;
                    Exec_NoWrite <= 0;
                    Exec_Shamt5 <= 0;
                    Exec_Sh <= 0;
                    Exec_SrcA <= 0;
                    Exec_SrcB <= 0;
                    Exec_ALUSrc <= 0;
                end
                else if (READY[0]) begin
                    Exec_Op <= OP[0*5+:5];
                    WIndex <= DEST[0*3+:3];
                    Exec_Cond <= COND[0*4+:4];
                    Exec_FlagW <= FLAGW[0*4+:4];
                    Exec_RegW <= REGW[0];
                    Exec_NoWrite <= NOWRITE[0];
                    Exec_Shamt5 <= SHAMT[0*5+:5];
                    Exec_Sh <= SH[0*2+:2];
                    Exec_SrcA <= VJ[0*32+:32];
                    Exec_SrcB <= VK[0*32+:32];
                    Exec_ALUSrc <= I[0];
                end
                else if (READY[1]) begin
                    Exec_Op <= OP[1*5+:5];
                    WIndex <= DEST[1*3+:3];
                    Exec_Cond <= COND[1*4+:4];
                    Exec_FlagW <= FLAGW[1*4+:4];
                    Exec_RegW <= REGW[1];
                    Exec_NoWrite <= NOWRITE[1];
                    Exec_Shamt5 <= SHAMT[1*5+:5];
                    Exec_Sh <= SH[1*2+:2];
                    Exec_SrcA <= VJ[1*32+:32];
                    Exec_SrcB <= VK[1*32+:32];
                    Exec_ALUSrc <= I[1];
                end
            end
        end
        else if (DP_STATION_DEPTH == 4) begin
            always @(posedge CLK, posedge Reset) begin
                if (Reset) begin
                    Exec_Op <= 0;
                    WIndex <= 0;
                    Exec_Cond <= 0;
                    Exec_FlagW <= 0;
                    Exec_RegW <= 0;
                    Exec_NoWrite <= 0;
                    Exec_Shamt5 <= 0;
                    Exec_Sh <= 0;
                    Exec_SrcA <= 0;
                    Exec_SrcB <= 0;
                    Exec_ALUSrc <= 0;
                end
                else if (READY[0]) begin
                    Exec_Op <= OP[0*5+:5];
                    WIndex <= DEST[0*3+:3];
                    Exec_Cond <= COND[0*4+:4];
                    Exec_FlagW <= FLAGW[0*4+:4];
                    Exec_RegW <= REGW[0];
                    Exec_NoWrite <= NOWRITE[0];
                    Exec_Shamt5 <= SHAMT[0*5+:5];
                    Exec_Sh <= SH[0*2+:2];
                    Exec_SrcA <= VJ[0*32+:32];
                    Exec_SrcB <= VK[0*32+:32];
                    Exec_ALUSrc <= I[0];
                end
                else if (READY[1]) begin
                    Exec_Op <= OP[1*5+:5];
                    WIndex <= DEST[1*3+:3];
                    Exec_Cond <= COND[1*4+:4];
                    Exec_FlagW <= FLAGW[1*4+:4];
                    Exec_RegW <= REGW[1];
                    Exec_NoWrite <= NOWRITE[1];
                    Exec_Shamt5 <= SHAMT[1*5+:5];
                    Exec_Sh <= SH[1*2+:2];
                    Exec_SrcA <= VJ[1*32+:32];
                    Exec_SrcB <= VK[1*32+:32];
                    Exec_ALUSrc <= I[1];
                end
                else if (READY[2]) begin
                    Exec_Op <= OP[2*5+:5];
                    WIndex <= DEST[2*3+:3];
                    Exec_Cond <= COND[2*4+:4];
                    Exec_FlagW <= FLAGW[2*4+:4];
                    Exec_RegW <= REGW[2];
                    Exec_NoWrite <= NOWRITE[2];
                    Exec_Shamt5 <= SHAMT[2*5+:5];
                    Exec_Sh <= SH[2*2+:2];
                    Exec_SrcA <= VJ[2*32+:32];
                    Exec_SrcB <= VK[2*32+:32];
                    Exec_ALUSrc <= I[2];
                end
                else if (READY[3]) begin
                    Exec_Op <= OP[3*5+:5];
                    WIndex <= DEST[3*3+:3];
                    Exec_Cond <= COND[3*4+:4];
                    Exec_FlagW <= FLAGW[3*4+:4];
                    Exec_RegW <= REGW[3];
                    Exec_NoWrite <= NOWRITE[3];
                    Exec_Shamt5 <= SHAMT[3*5+:5];
                    Exec_Sh <= SH[3*2+:2];
                    Exec_SrcA <= VJ[3*32+:32];
                    Exec_SrcB <= VK[3*32+:32];
                    Exec_ALUSrc <= I[3];
                end
            end
        end
    endgenerate
endmodule






module MEM_Station #(
    parameter MEM_STATION_DEPTH = 2
)(
    input CLK,
    input Reset,
    input append,
    output full,
    
    input [147:0] CDB,


    input [1:0] rrs_result_busy,
    input [5:0] rrs_index,

    input [31:0] ROB_ForwardDataA,
    input [31:0] ROB_ForwardDataB,
    input ROB_ForwardA,
    input ROB_ForwardB,
    
    input fs_flagready,
    input [2:0] fs_index,


    input ALUSrc,
    input [31:0] ExtImm,
    input RegW,
    input [4:0] Shamt5,
    input [1:0] Sh,
    input [31:0] RD1,
    input [31:0] RD2,
    input [4:0] Op,
    input [3:0] Cond,
    input [2:0] ROBTail,
    input Cache_Busy,

    output Exec,
    output reg [3:0] Exec_Cond,
    output reg [2:0] WIndex,
    output reg Exec_RegW,
    output reg [4:0] Exec_Shamt5,
    output reg [1:0] Exec_Sh,
    output reg [31:0] Exec_SrcA,
    output reg [31:0] Exec_SrcB,
    output reg [31:0] Exec_WriteData,
    output reg Exec_ALUSrc
);

    reg [MEM_STATION_DEPTH*1-1:0] BUSY;
    reg [MEM_STATION_DEPTH*4-1:0] COND;
    reg [MEM_STATION_DEPTH*4-1:0] REGW;
    reg [MEM_STATION_DEPTH*32-1:0] EXTIMM;
    reg [MEM_STATION_DEPTH*5-1:0] SHAMT;
    reg [MEM_STATION_DEPTH*2-1:0] SH;
    reg [MEM_STATION_DEPTH*1-1:0] I;
    reg [MEM_STATION_DEPTH*1-1:0] WAIT;
    reg [MEM_STATION_DEPTH*32-1:0] VJ, VK;
    reg [MEM_STATION_DEPTH*4-1:0] QJ, QK;
    reg [MEM_STATION_DEPTH*3-1:0] DEST;
    reg [MEM_STATION_DEPTH*4-1:0] F;

    wire [MEM_STATION_DEPTH-1:0] READY;
    reg [MEM_STATION_DEPTH-1:0] EXEC;

    initial begin
        BUSY = 0;
        COND = 0;
        REGW = 0;
        EXTIMM = 0;
        SHAMT = 0;
        SH = 0;
        I = 0;
        WAIT = 0;
        VJ = 0;
        VK = 0;
        QJ = 0;
        QK = 0;
        DEST = 0;
        F = 0;
        Exec_Cond = 0;
        Exec_RegW = 0;
        WIndex = 0;
        Exec_Shamt5 = 0;
        Exec_Sh = 0;
        Exec_SrcA = 0;
        Exec_SrcB = 0;
        Exec_WriteData = 0;
        Exec_ALUSrc = 0;
    end

    assign full = &BUSY;
    assign Exec = |EXEC;

    genvar i;
    generate
        for (i = 0; i < MEM_STATION_DEPTH; i = i + 1) begin
            assign READY[i] = BUSY[i] & ~QJ[i*4+3] & ~QK[i*4+3] & ~F[i*4+3] & WAIT[i];
            if (i > 0) begin
                always @(posedge CLK, posedge Reset) begin
                    if (Reset) begin
                        BUSY[i] <= 0;
                    end
                    else begin
                        if (append & (&BUSY[i-1:0]) & ~BUSY[i]) begin
                            BUSY[i] <= 1;
                            WAIT[i] <= 1;
                            COND[i*4+:4] <= Cond;
                            DEST[i*3+:3] <= ROBTail;
                            REGW[i] <= RegW;
                            SHAMT[i*5+:5] <= Shamt5;
                            SH[i*2+:2] <= Sh;
                            I[i] <= ALUSrc;
                            EXTIMM[i*32+:32] <= ExtImm;
                            if (rrs_result_busy[0]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[35:4];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[71:40];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[107:76];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardA) begin
                                    VJ[i*32+:32] <= ROB_ForwardDataA;
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VJ[i*32+:32] <= VJ[i*32+:32];
                                    QJ[i*4+:4] <= {1'b1, rrs_index[2:0]};
                                end
                            end
                            else begin
                                VJ[i*32+:32] <= RD1;
                                QJ[i*4+:4] <= 4'b0;
                            end

                            if (rrs_result_busy[1]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[35:4];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[71:40];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[107:76];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardB) begin
                                    VK[i*32+:32] <= ROB_ForwardDataB;
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VK[i*32+:32] <= VK[i*32+:32];
                                    QK[i*4+:4] <= {1'b1, rrs_index[5:3]};
                                end
                            end
                            else begin
                                VK[i*32+:32] <= RD2;
                                QK[i*4+:4] <= 4'b0;
                            end

                            if (Cond == 4'hE | fs_flagready) begin
                                F[i*4+:4] <= 4'b0;
                            end
                            else begin
                                F[i*4+:4] <= {1'b1, fs_index};
                            end
                        end

                        if (READY[i] & (READY[i-1:0] == 0) & ~Cache_Busy) begin
                            EXEC[i] <= 1;
                            WAIT[i] <= 0;
                        end
                        else if (Cache_Busy) begin
                            EXEC[i] <= EXEC[i];
                        end
                        else begin
                            EXEC[i] <= 0;
                        end


                        if (BUSY[i]) begin
                            if (QJ[i*4+3] & CDB[3:0] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[35:4];
                            end
                            else if (QJ[i*4+3] & CDB[39:36] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[71:40];
                            end
                            else if (QJ[i*4+3] & CDB[75:72] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[107:76];
                            end
                            
                            if (QK[i*4+3] & CDB[3:0] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[35:4];
                            end
                            else if (QK[i*4+3] & CDB[39:36] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[71:40];
                            end
                            else if (QK[i*4+3] & CDB[75:72] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[107:76];
                            end

                            if (F[i*4+3] & CDB[147:144] == F[i*4+:4]) begin
                                F[i*4+3] <= 1'b0;
                            end

                            if (DEST[i*3+:3] == CDB[38:36] & CDB[39]) begin
                                BUSY[i] <= 0;
                            end
                        end
                    end
                end
            end
            else begin  // i = 0
                always @(posedge CLK, posedge Reset) begin
                    if (Reset) begin
                        BUSY[i] <= 0;
                    end
                    else begin
                        if (append & ~BUSY[i]) begin
                            BUSY[i] <= 1;
                            WAIT[i] <= 1;
                            COND[i*4+:4] <= Cond;
                            DEST[i*3+:3] <= ROBTail;
                            REGW[i] <= RegW;
                            SHAMT[i*5+:5] <= Shamt5;
                            SH[i*2+:2] <= Sh;
                            I[i] <= ALUSrc;
                            EXTIMM[i*32+:32] <= ExtImm;
                            if (rrs_result_busy[0]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[35:4];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[71:40];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[107:76];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardA) begin
                                    VJ[i*32+:32] <= ROB_ForwardDataA;
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VJ[i*32+:32] <= VJ[i*32+:32];
                                    QJ[i*4+:4] <= {1'b1, rrs_index[2:0]};
                                end
                            end
                            else begin
                                VJ[i*32+:32] <= RD1;
                                QJ[i*4+:4] <= 4'b0;
                            end

                            if (rrs_result_busy[1]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[35:4];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[71:40];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[107:76];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardB) begin
                                    VK[i*32+:32] <= ROB_ForwardDataB;
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VK[i*32+:32] <= VK[i*32+:32];
                                    QK[i*4+:4] <= {1'b1, rrs_index[5:3]};
                                end
                            end
                            else begin
                                VK[i*32+:32] <= RD2;
                                QK[i*4+:4] <= 4'b0;
                            end

                            if (Cond == 4'hE | fs_flagready) begin
                                F[i*4+:4] <= 4'b0;
                            end
                            else begin
                                F[i*4+:4] <= {1'b1, fs_index};
                            end
                        end

                        if (READY[i] & ~Cache_Busy) begin
                            EXEC[i] <= 1;
                            WAIT[i] <= 0;
                        end
                        else if (Cache_Busy) begin
                            EXEC[i] <= EXEC[i];
                        end
                        else begin
                            EXEC[i] <= 0;
                        end


                        if (BUSY[i]) begin
                            if (QJ[i*4+3] & CDB[3:0] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[35:4];
                            end
                            else if (QJ[i*4+3] & CDB[39:36] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[71:40];
                            end
                            else if (QJ[i*4+3] & CDB[75:72] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[107:76];
                            end
                            
                            if (QK[i*4+3] & CDB[3:0] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[35:4];
                            end
                            else if (QK[i*4+3] & CDB[39:36] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[71:40];
                            end
                            else if (QK[i*4+3] & CDB[75:72] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[107:76];
                            end

                            if (F[i*4+3] & CDB[147:144] == F[i*4+:4]) begin
                                F[i*4+3] <= 1'b0;
                            end

                            if (DEST[i*3+:3] == CDB[38:36] & CDB[39]) begin
                                BUSY[i] <= 0;
                            end
                        end
                    end
                end
            end
        end
    endgenerate


    generate
        if (MEM_STATION_DEPTH == 2) begin
            always @(posedge CLK, posedge Reset) begin
                if (Reset) begin
                    WIndex <= 0;
                    Exec_Cond <= 0;
                    Exec_RegW <= 0;
                    Exec_Shamt5 <= 0;
                    Exec_Sh <= 0;
                    Exec_SrcA <= 0;
                    Exec_SrcB <= 0;
                    Exec_WriteData <= 0;
                    Exec_ALUSrc <= 0;
                end
                else if (READY[0] & ~Cache_Busy) begin
                    WIndex <= DEST[0*3+:3];
                    Exec_Cond <= COND[0*4+:4];
                    Exec_RegW <= REGW[0];
                    Exec_Shamt5 <= SHAMT[0*5+:5];
                    Exec_Sh <= SH[0*2+:2];
                    Exec_SrcA <= VJ[0*32+:32];
                    Exec_SrcB <= EXTIMM[0*32+:32];
                    Exec_WriteData <= VK[0*32+:32];
                    Exec_ALUSrc <= I[0];
                end
                else if (READY[1] & ~Cache_Busy) begin
                    WIndex <= DEST[1*3+:3];
                    Exec_Cond <= COND[1*4+:4];
                    Exec_RegW <= REGW[1];
                    Exec_Shamt5 <= SHAMT[1*5+:5];
                    Exec_Sh <= SH[1*2+:2];
                    Exec_SrcA <= VJ[1*32+:32];
                    Exec_SrcB <= EXTIMM[1*32+:32];
                    Exec_WriteData <= VK[1*32+:32];
                    Exec_ALUSrc <= I[1];
                end
            end
        end
    endgenerate
endmodule







module MUL_Station #(
    parameter MUL_STATION_DEPTH = 2
)(
    input CLK,
    input Reset,
    input append,
    output full,
    
    input [147:0] CDB,

    // rrs: Register result status
    input [1:0] rrs_result_busy,
    input [5:0] rrs_index,
    
    input [31:0] ROB_ForwardDataA,
    input [31:0] ROB_ForwardDataB,
    input ROB_ForwardA,
    input ROB_ForwardB,

    input fs_flagready,
    input [2:0] fs_index,

    input ALUSrc,
    input [31:0] ExtImm,
    input [3:0] Cond,
    input [3:0] FlagW,
    input [31:0] RD1,
    input [31:0] RD2,
    input [4:0] Op,
    input [2:0] ROBTail,
    input MCycle_Busy,

    output Exec,
    output reg [3:0] Exec_Cond,
    output reg [4:0] Exec_Op,
    output reg [2:0] WIndex,
    output reg [3:0] Exec_FlagW,
    output reg [31:0] Exec_SrcA,
    output reg [31:0] Exec_SrcB
);

    reg [MUL_STATION_DEPTH*1-1:0] BUSY;
    reg [MUL_STATION_DEPTH*5-1:0] OP;
    reg [MUL_STATION_DEPTH*4-1:0] COND;
    reg [MUL_STATION_DEPTH*4-1:0] FLAGW;
    reg [MUL_STATION_DEPTH*1-1:0] WAIT;
    reg [MUL_STATION_DEPTH*32-1:0] VJ, VK;
    reg [MUL_STATION_DEPTH*4-1:0] QJ, QK;
    reg [MUL_STATION_DEPTH*3-1:0] DEST;
    reg [MUL_STATION_DEPTH*4-1:0] F;

    wire [MUL_STATION_DEPTH-1:0] READY;
    reg [MUL_STATION_DEPTH-1:0] EXEC;

    initial begin
        BUSY = 0;
        OP = 0;
        COND = 0;
        FLAGW = 0;
        WAIT = 0;
        VJ = 0;
        VK = 0;
        QJ = 0;
        QK = 0;
        DEST = 0;
        F = 0;
        Exec_Cond = 0;
        Exec_FlagW = 0;
        Exec_Op = 0;
        WIndex = 0;
        Exec_SrcA = 0;
        Exec_SrcB = 0;
    end

    assign full = &BUSY;
    assign Exec = |EXEC;

    genvar i;
    generate
        for (i = 0; i < MUL_STATION_DEPTH; i = i + 1) begin
            assign READY[i] = BUSY[i] & ~QJ[i*4+3] & ~QK[i*4+3] & ~F[i*4+3] & WAIT[i];
            if (i > 0) begin
                always @(posedge CLK, posedge Reset) begin
                    if (Reset) begin
                        BUSY[i] <= 0;
                    end
                    else begin
                        if (append & (&BUSY[i-1:0]) & ~BUSY[i]) begin
                            BUSY[i] <= 1;
                            WAIT[i] <= 1;
                            OP[i*5+:5] <= Op;
                            COND[i*4+:4] <= Cond;
                            FLAGW[i*4+:4] <= FlagW;
                            DEST[i*3+:3] <= ROBTail;
                            if (rrs_result_busy[0]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[35:4];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[71:40];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[107:76];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardA) begin
                                    VJ[i*32+:32] <= ROB_ForwardDataA;
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VJ[i*32+:32] <= VJ[i*32+:32];
                                    QJ[i*4+:4] <= {1'b1, rrs_index[2:0]};
                                end
                            end
                            else begin
                                VJ[i*32+:32] <= RD1;
                                QJ[i*4+:4] <= 4'b0;
                            end

                            if (ALUSrc) begin
                                VK[i*32+:32] <= ExtImm;
                                QK[i*4+:4] <= 4'b0;
                            end
                            else if (rrs_result_busy[1]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[35:4];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[71:40];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[107:76];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardB) begin
                                    VK[i*32+:32] <= ROB_ForwardDataB;
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VK[i*32+:32] <= VK[i*32+:32];
                                    QK[i*4+:4] <= {1'b1, rrs_index[5:3]};
                                end
                            end
                            else begin
                                VK[i*32+:32] <= RD2;
                                QK[i*4+:4] <= 4'b0;
                            end

                            if (Cond == 4'hE | fs_flagready) begin
                                F[i*4+:4] <= 4'b0;
                            end
                            else begin
                                F[i*4+:4] <= {1'b1, fs_index};
                            end
                        end

                        if (READY[i] & (READY[i-1:0] == 0) & ~MCycle_Busy) begin
                            EXEC[i] <= 1;
                            WAIT[i] <= 0;
                        end
                        else if (MCycle_Busy) begin
                            EXEC[i] <= EXEC[i];
                        end
                        else begin
                            EXEC[i] <= 0;
                        end


                        if (BUSY[i]) begin
                            if (QJ[i*4+3] & CDB[3:0] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[35:4];
                            end
                            else if (QJ[i*4+3] & CDB[39:36] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[71:40];
                            end
                            else if (QJ[i*4+3] & CDB[75:72] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[107:76];
                            end
                            
                            if (QK[i*4+3] & CDB[3:0] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[35:4];
                            end
                            else if (QK[i*4+3] & CDB[39:36] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[71:40];
                            end
                            else if (QK[i*4+3] & CDB[75:72] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[107:76];
                            end

                            if (F[i*4+3] & CDB[147:144] == F[i*4+:4]) begin
                                F[i*4+3] <= 1'b0;
                            end

                            if (DEST[i*3+:3] == CDB[74:72] & CDB[75]) begin
                                BUSY[i] <= 0;
                            end
                        end
                    end
                end
            end
            else begin  // i = 0
                always @(posedge CLK, posedge Reset) begin
                    if (Reset) begin
                        BUSY[i] <= 0;
                    end
                    else begin
                        if (append & ~BUSY[i]) begin
                            BUSY[i] <= 1;
                            WAIT[i] <= 1;
                            OP[i*5+:5] <= Op;
                            COND[i*4+:4] <= Cond;
                            FLAGW[i*4+:4] <= FlagW;
                            DEST[i*3+:3] <= ROBTail;
                            if (rrs_result_busy[0]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[35:4];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[71:40];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[2:0]) begin
                                    VJ[i*32+:32] <= CDB[107:76];
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardA) begin
                                    VJ[i*32+:32] <= ROB_ForwardDataA;
                                    QJ[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VJ[i*32+:32] <= VJ[i*32+:32];
                                    QJ[i*4+:4] <= {1'b1, rrs_index[2:0]};
                                end
                            end
                            else begin
                                VJ[i*32+:32] <= RD1;
                                QJ[i*4+:4] <= 4'b0;
                            end

                            if (ALUSrc) begin
                                VK[i*32+:32] <= ExtImm;
                                QK[i*4+:4] <= 4'b0;
                            end
                            else if (rrs_result_busy[1]) begin
                                if (CDB[3] & CDB[2:0] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[35:4];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[39] & CDB[38:36] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[71:40];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (CDB[75] & CDB[74:72] == rrs_index[5:3]) begin
                                    VK[i*32+:32] <= CDB[107:76];
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else if (ROB_ForwardB) begin
                                    VK[i*32+:32] <= ROB_ForwardDataB;
                                    QK[i*4+:4] <= 4'b0;
                                end
                                else begin
                                    VK[i*32+:32] <= VK[i*32+:32];
                                    QK[i*4+:4] <= {1'b1, rrs_index[5:3]};
                                end
                            end
                            else begin
                                VK[i*32+:32] <= RD2;
                                QK[i*4+:4] <= 4'b0;
                            end

                            if (Cond == 4'hE | fs_flagready) begin
                                F[i*4+:4] <= 4'b0;
                            end
                            else begin
                                F[i*4+:4] <= {1'b1, fs_index};
                            end
                        end

                        if (READY[i] & ~MCycle_Busy) begin
                            EXEC[i] <= 1;
                            WAIT[i] <= 0;
                        end
                        else if (MCycle_Busy) begin
                            EXEC[i] <= EXEC[i];
                        end
                        else begin
                            EXEC[i] <= 0;
                        end


                        if (BUSY[i]) begin
                            if (QJ[i*4+3] & CDB[3:0] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[35:4];
                            end
                            else if (QJ[i*4+3] & CDB[39:36] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[71:40];
                            end
                            else if (QJ[i*4+3] & CDB[75:72] == QJ[i*4+:4]) begin
                                QJ[i*4+3] <= 1'b0;
                                VJ[i*32+:32] <= CDB[107:76];
                            end
                            
                            if (QK[i*4+3] & CDB[3:0] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[35:4];
                            end
                            else if (QK[i*4+3] & CDB[39:36] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[71:40];
                            end
                            else if (QK[i*4+3] & CDB[75:72] == QK[i*4+:4]) begin
                                QK[i*4+3] <= 1'b0;
                                VK[i*32+:32] <= CDB[107:76];
                            end

                            if (F[i*4+3] & CDB[147:144] == F[i*4+:4]) begin
                                F[i*4+3] <= 1'b0;
                            end

                            if (DEST[i*3+:3] == CDB[74:72] & CDB[75]) begin
                                BUSY[i] <= 0;
                            end
                        end
                    end
                end
            end
        end
    endgenerate

    generate
        if (MUL_STATION_DEPTH == 2) begin
            always @(posedge CLK, posedge Reset) begin
                if (Reset) begin
                    Exec_Op <= 0;
                    WIndex <= 0;
                    Exec_Cond <= 0;
                    Exec_FlagW <= 0;
                    Exec_SrcA <= 0;
                    Exec_SrcB <= 0;
                end
                else if (READY[0] & ~MCycle_Busy) begin
                    Exec_Op <= OP[0*5+:5];
                    WIndex <= DEST[0*3+:3];
                    Exec_Cond <= COND[0*4+:4];
                    Exec_FlagW <= FLAGW[0*4+:4];
                    Exec_SrcA <= VJ[0*32+:32];
                    Exec_SrcB <= VK[0*32+:32];
                end
                else if (READY[1] & ~MCycle_Busy) begin
                    Exec_Op <= OP[1*5+:5];
                    WIndex <= DEST[1*3+:3];
                    Exec_Cond <= COND[1*4+:4];
                    Exec_FlagW <= FLAGW[1*4+:4];
                    Exec_SrcA <= VJ[1*32+:32];
                    Exec_SrcB <= VK[1*32+:32];
                end
            end
        end
    endgenerate
endmodule

