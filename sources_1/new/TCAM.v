module TCAM(
    input CLK,
    input [27:0] tag_in,
    input tag_update,
    input valid,
    input ready,
    input [7:0] RepPtr,
    output found,
    output [7:0] hit_index,
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
        if (tag_update) begin
            Tag[RepPtr] <= tag_in;
        end
    end



    PriorityEncoder #(256) PriorityEncoder(
        .in(response),
        .out(hit_index),
        .none(none));

        
    assign found = ~none;
endmodule