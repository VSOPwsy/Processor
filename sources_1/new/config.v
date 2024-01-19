`ifndef CONFIG_V
`define CONFIG_V


`define     INSTR_ADDR_LOW          32'h00000000
`define     INSTR_ADDR_HIGH         32'h000001FC


`define     DATA_ADDR_LOW       (`DATA_CONST_ADDR_LOW < `DATA_VAR_ADDR_LOW ? `DATA_CONST_ADDR_LOW : `DATA_VAR_ADDR_LOW)
`define     DATA_ADDR_HIGH      (`DATA_VAR_ADDR_HIGH > `DATA_CONST_ADDR_HIGH ? `DATA_VAR_ADDR_HIGH : `DATA_CONST_ADDR_HIGH)

`define     DATA_CONST_ADDR_LOW     32'h00000200
`define     DATA_CONST_ADDR_HIGH    32'h000003FC
`define     DATA_CONST_ADDR_WIDTH   ($clog2((`DATA_CONST_ADDR_HIGH - `DATA_CONST_ADDR_LOW + 4)/4))
`define     DATA_CONST_ADDR_SIZE    (2 ** `DATA_CONST_ADDR_WIDTH)

`define     DATA_VAR_ADDR_LOW       32'h00000800
`define     DATA_VAR_ADDR_HIGH      32'h000009FC
`define     DATA_VAR_ADDR_WIDTH     ($clog2((`DATA_VAR_ADDR_HIGH - `DATA_VAR_ADDR_LOW + 4)/4))
`define     DATA_VAR_ADDR_SIZE      (2 ** `DATA_VAR_ADDR_WIDTH)


`define     PERIPHERAL_ADDR_LOW     32'h00000C00
`define     PERIPHERAL_ADDR_HIGH    32'h00000C18

`define     LED      32'h00000C00
`define     SW       32'h00000C04
`define     SEG      32'h00000C18



`define     AND     4'b0000
`define     EOR     4'b0001
`define     SUB     4'b0010
`define     RSB     4'b0011
`define     ADD     4'b0100
`define     ADC     4'b0101
`define     SBC     4'b0110
`define     RSC     4'b0111
`define     TST     4'b1000
`define     TEQ     4'b1001
`define     CMP     4'b1010
`define     CMN     4'b1011
`define     ORR     4'b1100
`define     MOV     4'b1101
`define     BIC     4'b1110
`define     MVN     4'b1111


`define     FIFO    1'b0
`define     RANDOM  1'b1



`define     TASK_1_1    11
`define     TASK_1_2    12
`define     TASK_1_3    13
`define     TASK_1_4    14


`define     TASK_2_1    21
`define     TASK_2_2    22
`define     TASK_2_3    23
`define     TASK_2_4    24

`endif
