module TCAM(
    input CLK,
    input [31:0] Addr,
    input Valid,
    input [7:0] RepPtr,
    output h,
    output [7:0] Hit_Index,
    output [27:0] replaced_Tag
    );

    reg [27:0] Tag [0:255];
    integer i;
    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            Tag[i] = 0;
        end
    end

    assign replaced_Tag = Tag[RepPtr];

    always @(posedge CLK) begin
        if (Valid) begin
            Tag[RepPtr] <= Addr[31-:28];
        end
    end

    wire [255:0] response;
    genvar j;
    generate
        for (j = 0; j < 256; j = j + 1) begin
            assign response[j] = Tag[j] == Addr[31-:28];
        end
    endgenerate

    wire none;
    PriorityEncoder #(256) PriorityEncoder(
        .in(response),
        .out(Hit_Index),
        .none(none));
    assign h = ~none;
endmodule