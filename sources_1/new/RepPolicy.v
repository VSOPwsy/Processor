`include "config.v"

module RepPolicy #(
    parameter POLICY = `FIFO,
    parameter SET_NUM = 256
)(
    input CLK,
    input Valid,
    input Hit,
    input [31:0] Addr,
    output [$clog2(SET_NUM)-1:0] RepPtr
    );
    
    generate
        if (POLICY == `FIFO)
            Rep_FIFO #(.SET_NUM(SET_NUM)) Rep_FIFO(
                .CLK    (CLK    ),
                .Valid  (Valid  ),
                .Hit    (Hit    ),
                .RepPtr (RepPtr ));

        else if (POLICY == `RANDOM)
            Rep_RANDOM #(.SET_NUM(SET_NUM)) Rep_RANDOM(
                .CLK    (CLK    ),
                .Valid  (Valid  ),
                .RepPtr (RepPtr ));
    endgenerate



endmodule
