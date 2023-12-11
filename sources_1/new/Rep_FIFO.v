module Rep_FIFO(
    input CLK,
    input update,
    output reg [7:0] RepPtr
    );

    initial begin
        RepPtr = 0;
    end

    always @(posedge CLK) begin
        if (update) begin
            RepPtr <= RepPtr + 1;
        end
    end

endmodule