module TCAM #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter SET_NUM = 256,
    parameter WAY_NUM = 4
)(
    input CLK,
    input [ADDR_WIDTH-1:0] Addr,
    input Valid,
    input [$clog2(SET_NUM)-1:0] RepPtr,
    output h,
    output [$clog2(SET_NUM)-1:0] Hit_Index,
    output [TAG_WIDTH-1:0] replaced_Tag
);
    
    localparam TAG_WIDTH = ADDR_WIDTH - ($clog2(WAY_NUM) + $clog2(DATA_WIDTH/8));

    reg [TAG_WIDTH-1:0] Tag [0:SET_NUM-1];
    integer i;
    initial begin
        for (i = 0; i < SET_NUM; i = i + 1) begin
            Tag[i] = 0;
        end
    end

    assign replaced_Tag = Tag[RepPtr];

    always @(posedge CLK) begin
        if (Valid) begin
            Tag[RepPtr] <= Addr[ADDR_WIDTH-1-:TAG_WIDTH];
        end
    end

    wire [SET_NUM:0] response;
    genvar j;
    generate
        for (j = 0; j < SET_NUM; j = j + 1) begin
            assign response[j] = Tag[j] == Addr[ADDR_WIDTH-1-:TAG_WIDTH];
        end
    endgenerate

    wire none;
    PriorityEncoder #(SET_NUM) PriorityEncoder(
        .in(response),
        .out(Hit_Index),
        .none(none));
    assign h = ~none;
endmodule