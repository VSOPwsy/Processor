module Rep_FIFO #(
    parameter SET_NUM = 256
)(
    input CLK,
    input Valid,
    input Hit,
    output reg [$clog2(SET_NUM)-1:0] RepPtr
    );

    initial begin
        RepPtr = 0;
    end

    always @(posedge CLK) begin
        if (Valid & ~Hit) begin
            RepPtr <= RepPtr + 1;
        end
    end

endmodule