`include "config.v"

module RepPolicy #(
    parameter POLICY = `FIFO
)(
    input CLK,
    input Valid,
    input Hit,
    input [31:0] Addr,
    output [7:0] RepPtr
    );
    
    generate
        if (POLICY == `FIFO)
            Rep_FIFO Rep_FIFO(
                .CLK    (CLK    ),
                .Valid  (Valid  ),
                .Hit    (Hit    ),
                .RepPtr (RepPtr ));

        else if (POLICY == `RANDOM)
            Rep_RANDOM Rep_RANDOM(
                .CLK    (CLK    ),
                .Valid  (Valid  ),
                .RepPtr (RepPtr ));
    endgenerate



endmodule
