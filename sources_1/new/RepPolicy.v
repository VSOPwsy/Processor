`include "config.v"

module RepPolicy #(
    parameter POLICY = `FIFO
)(
    input CLK,
    input update,
    output [7:0] RepPtr
    );
    
    generate
        if (POLICY == `FIFO)
            Rep_FIFO Rep_FIFO(
                .CLK    (CLK    ),
                .update (update ),
                .RepPtr (RepPtr ));
    endgenerate



endmodule
