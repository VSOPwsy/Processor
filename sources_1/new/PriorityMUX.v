module PriorityMUX #(
    parameter SEL_WIDTH = 4,
    parameter DATA_WIDTH = 32
)(
    input [SEL_WIDTH-1:0] sel,
    input [SEL_WIDTH*DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,
    output reg none
);

    wire [$clog2(SEL_WIDTH)-1:0] index;

    PriorityEncode #(SEL_WIDTH) PriorityEncode(
        .in     (sel    ),
        .out    (index  ),
        .none   (none   ));

    genvar i;
    generate
        for (i = 0; i < SEL_WIDTH; i = i + 1) begin
            assign data_out = none ? 0 : data_in[(i+1)*DATA_WIDTH-1-:DATA_WIDTH];
        end
    endgenerate
    
endmodule