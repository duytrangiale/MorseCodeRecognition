`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2020 01:25:59 AM
// Design Name: 
// Module Name: FSM_letter
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


module FSM_letter(
    input wire clk,
    input wire ready,
    input wire done,
    input wire found,
    input wire reset_btn,
    input wire nextCharacter,
    output reg letter_disp,
    output reg start,
    output reg reset
    );
    
    // Assign bit values to each state of FSM
    parameter IDLE = 2'b00, CODE_CHECK = 2'b01, DISP = 2'b10, CLOSE = 2'b11;

    // Declare 2 reg to store current and next state
    reg [1:0] state, nextstate;
    
    // State memory - sequential
    always @(posedge clk) begin
        if (reset_btn || nextCharacter) state <= IDLE;
        else state <= nextstate;
    end
    
    // Next state logic - combinational
    always @(*) begin
        case (state)
            IDLE : begin
                if (ready) nextstate = CODE_CHECK;
                else nextstate = IDLE;
            end
            
            CODE_CHECK : begin
                if (done) nextstate = DISP;
                else nextstate = CODE_CHECK;
            end
            
            DISP : begin
                if (found) nextstate = CLOSE;
                else nextstate = DISP;
            end
            
            CLOSE : begin
                if (reset_btn || nextCharacter) nextstate = IDLE;
                else nextstate = CLOSE;
            end 
        endcase
    end
    
    // Output logic
    always @(*) begin
        case (state)
            IDLE : begin
                start = (ready) ? 1'b1 : 1'b0;
                letter_disp = (found) ? 1'b1 : 1'b0;
                reset = (reset_btn || nextCharacter) ? 1'b1 : 1'b0;
            end
            
            CODE_CHECK : begin
                start = (ready) ? 1'b1 : 1'b0;
                letter_disp = (found) ? 1'b1 : 1'b0;
                reset = (reset_btn || nextCharacter) ? 1'b1 : 1'b0;
            end
            
            DISP : begin
                start = (ready) ? 1'b1 : 1'b0;
                letter_disp = (found) ? 1'b1 : 1'b0;
                reset = (reset_btn || nextCharacter) ? 1'b1 : 1'b0;
            end
            
            CLOSE : begin
                start = (ready) ? 1'b1 : 1'b0;
                letter_disp = (found) ? 1'b1 : 1'b0;
                reset = (reset_btn || nextCharacter) ? 1'b1 : 1'b0;
            end 
        endcase
    end
endmodule
