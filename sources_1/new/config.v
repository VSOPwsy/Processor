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



`define     AND     5'b00000
`define     EOR     5'b00001
`define     SUB     5'b00010
`define     RSB     5'b00011
`define     ADD     5'b00100
`define     ADC     5'b00101
`define     SBC     5'b00110
`define     RSC     5'b00111
`define     TST     5'b01000
`define     TEQ     5'b01001
`define     CMP     5'b01010
`define     CMN     5'b01011
`define     ORR     5'b01100
`define     MOV     5'b01101
`define     BIC     5'b01110
`define     MVN     5'b01111

`define     LDR     5'b10000
`define     STR     5'b10001

`define     MUL     5'b10010
`define     DIV     5'b10011

`define     FADD    5'b10100
`define     FMUL    5'b10101

`define     FIFO    1'b0
`define     RANDOM  1'b1


`endif
