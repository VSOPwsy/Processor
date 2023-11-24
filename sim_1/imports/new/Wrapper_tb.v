module Wrapper_tb;

reg [6:0] DIP;
reg RESET,CLK;
wire [15:0] LED;
wire [31:0] SEVENSEGHEX;

Wrapper uut(
    DIP,
    LED,
    SEVENSEGHEX,
    RESET,
    CLK); 
    
always #5 CLK = ~CLK;
    
initial begin
    DIP = 6'b001100;
    CLK = 0;
    RESET = 0;
    #10;
    RESET = 1;
    #30;
    RESET = 0;
    #8000;
    $finish;
end
endmodule