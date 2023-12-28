module FlagStatus(
    input CLK,
    input Reset,
    input [163:0] CDB,
    input append,
    input Set,
    input Use,
    input [2:0] ROBTail,
    output reg SetFlagReady,
    output [2:0] SetIndex,
    output reg UseFlagReady,
    output [2:0] UseIndex,
    output reg SetUseOder
);
    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            SetUseOder <= 0;
        end
        else if (append) begin
            if (Set) begin
                SetUseOder <= 0;
            end
            else begin
                SetUseOder <= 1;
            end
        end
    end
    reg [2:0] SET_INDEX;

    initial begin
        SET_INDEX = 0;
        SetFlagReady = 1;
    end

    assign SetIndex = SET_INDEX;

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            SET_INDEX <= 0;
        end
        else begin
            if (append & Set) begin
                SET_INDEX <= ROBTail;
                SetFlagReady <= 0;
            end
            else if (CDB[147] & CDB[146:144] == SET_INDEX) begin
                SetFlagReady <= 1;
            end
        end
    end


    reg [2:0] USE_INDEX;

    initial begin
        USE_INDEX = 0;
        UseFlagReady = 1;
    end

    assign UseIndex = USE_INDEX;

    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            USE_INDEX <= 0;
        end
        else begin
            if (append & Use) begin
                USE_INDEX <= ROBTail;
                UseFlagReady <= 0;
            end
            else if ((CDB[151] & CDB[150:148] == USE_INDEX)|
                     (CDB[155] & CDB[154:152] == USE_INDEX)|
                     (CDB[159] & CDB[158:156] == USE_INDEX)|
                     (CDB[163] & CDB[162:160] == USE_INDEX)) begin
                UseFlagReady <= 1;
            end
        end
    end
endmodule