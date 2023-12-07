module Rep_FIFO(
    input CLK,
    input Valid,
    input Hit,
    output reg [7:0] RepPtr
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