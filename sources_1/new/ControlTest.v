`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/20 14:40:42
// Design Name: 
// Module Name: ControlTest
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define     IDLE        1'b0
`define     COMPUTING   1'b1

module ControlTest #(
    parameter width = 32
)(
    input CLK,
    input Reset,
    input MCycleOp,
    input Start,
    input Control,
    output Init,
    output reg Shift,
    output Write,
    output reg Busy,
    output reg Done
    );
    
    initial begin
        Shift = 0;
        Busy = 0;
        current_state = `IDLE;
        next_state = `IDLE;
        Done = 0;
    end
    
    reg current_state, next_state;
    reg [5:0] count = 0;
    reg done = 0;
    assign Init = current_state == `IDLE & next_state == `COMPUTING;
    
    always @(posedge CLK, posedge Reset) begin
        if (Reset)
            current_state <= `IDLE;
        else
            current_state <= next_state;
    end
    
    
    
    always @(*) begin
        case (current_state)
            `IDLE: begin
                next_state = Start ? `COMPUTING : `IDLE;
                Busy = Start;
            end
            
            `COMPUTING: begin
                next_state = done ? `IDLE : `COMPUTING;
                Busy = done ? 1'b0 : 1'b1;
            end
        endcase
    end
    
    
    
    always @(posedge CLK, posedge Reset) begin
        if (Reset) begin
            count <= 0;
            Shift <= 0;
            done <= 0;
        end
        else begin
            case (current_state)
                `IDLE: begin
                    count <= 0;
                    Shift <= next_state == `COMPUTING ? 1'b1 : 1'b0;
                    done <= next_state == `COMPUTING ? 1'b0 : 1'b1;
                end
                
                `COMPUTING: begin
                    if (count == (MCycleOp ? width : width - 1)) begin
                        done <= 1'b1;
                        count <= 0;
                        Shift <= 1'b0;
                    end
                    else if (next_state == `COMPUTING) begin
                        done <= done;
                        count <= count + 1;
                        Shift <= 1'b1;
                    end
                    
                    if (count == (MCycleOp ? width - 1 : width - 2)) begin
                        Done <= 1'b1;
                    end
                    else begin
                        Done <= 1'b0;
                    end
                end
            endcase
        end
    end
    
    
    assign Write = Control;
endmodule
