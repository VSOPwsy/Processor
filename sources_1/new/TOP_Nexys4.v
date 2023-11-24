`timescale 1ns / 1ps
// >>>>>>>>>>>>>>>>>>>>>>>>>>> ******* FOR SYNTHESIS ONLY. DO NOT SIMULATE THIS ******* <<<<<<<<<<<<<<<<<<<<<<<<<<<
module TOP#(
    parameter N_LEDs_OUT = 16,        // Number of LEDs displaying Result. LED(15 downto 15-N_LEDs_OUT+1). 16 by default
    parameter N_DIPs = 7,             // Number of DIPs. 16 by default
    parameter N_SEVEN_SEG_DIGITs = 8, // Number of digits on the 7-seg display.
    parameter CLK_DIV_BITS = 25        // Set this to 26 for a ~1Hz clock. 0 for a 100MHz clock. Should not exceed 26. 
  // There is no need to change it for simulation, as this entity/module should not be simulated
  // If this is set to less than 17, you might need a software delay loop between successive reads / writes to/from UART.
)(
    input  [N_DIPs-1:0] DIP, 		 		// DIP switch inputs, used as a user definied memory address for checking memory content.
    output [N_LEDs_OUT-1:0] LED,   	// LED light display. Display the value of program counter.
    output [N_SEVEN_SEG_DIGITs-1:0] SevenSegAn, // 7 Seg anodes
    output [6:0] SevenSegCat,       // 7 Seg cathodes
    input PAUSE,                    // Pause -> BTNU (Up push button)
    input RESET,                    // Reset -> BTND (Down push button)
    input CLK_undiv                 // 100MHz clock. Converted to a lower frequency using DIV_PROCESS before being fed to the Wrapper.
);
 
//----------------------------------------------------------------
// Wrapper signals
//----------------------------------------------------------------	
wire [31:0] SEVENSEGHEX; 		
wire CLK;	

//----------------------------------------------------------------
// Wrapper port map
//----------------------------------------------------------------
Wrapper Wrapper(
  .DIP(DIP),
  .LED(LED),
  .SEVENSEGHEX(SEVENSEGHEX),
  .RESET(RESET),
  .CLK(CLK)
);

//----------------------------------------------------------------
//-- Clock divider
//----------------------------------------------------------------
generate
    if (CLK_DIV_BITS == 0) begin
        assign CLK = CLK_undiv;
    end
    else begin   // Clock division
        reg [CLK_DIV_BITS:0] clk_counter;
        always @(posedge CLK_undiv or posedge RESET) begin
            if(RESET)
            clk_counter <= 'b0;
            else if(~PAUSE)
            clk_counter <= clk_counter + 1;
        end
        assign CLK = clk_counter[CLK_DIV_BITS];
        end
endgenerate


seg_display seg_display(
    .clk    (CLK_undiv  ),
    .data   (SEVENSEGHEX),
    .anode  (SevenSegAn ),
    .cathode(SevenSegCat),
    .dp()               );

endmodule