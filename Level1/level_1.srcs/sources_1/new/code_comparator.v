`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 11:45:10 PM
// Design Name: 
// Module Name: code_comparator
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


module code_comparator(
    input wire clk,
    input wire start,
    input wire reset,
    input wire [7:0] morseCode,
    input wire [7:0] data,
    output reg [4:0] addr,
    output reg found,
    output reg done
    );
    
    // Assign bit values to each state 
    parameter WAIT = 2'b00, CHECK = 2'b10, DONE = 2'b01;
    
    // Declare 2 registers to store current and next state
    reg [1:0] state, nextstate;
    
    // Instantiate a counter to advance through memory address
    reg next;
    wire [4:0] count;
    counter inst_count(
        .clk(clk), 
        .reset(reset), 
        .next(next), 
        .count(count)
    );
    
    // State memory - sequential
    always @(posedge clk) begin
        if (reset) state <= WAIT;
        else state <= nextstate;
    end
    
    // Next state logic - combinational
    always @(*) begin
        case (state)
            WAIT : begin
                if (start) nextstate = CHECK; // receive "start" signal from FSM
                else nextstate = WAIT;
            end
            
            CHECK : begin // if the input code is found in memory or if it reaches the last address, move to DONE 
                if ((morseCode == data)||(addr == 5'd28)) nextstate = DONE; 
                else nextstate = CHECK;
            end
            
            DONE : begin // wait for "reset" signal from FSM
                if (reset) nextstate = WAIT;
                else nextstate = DONE;
            end
        endcase
    end
    
    // Output logic - combinational
    always @(*) begin
        case (state)
            WAIT : begin
                next = 1'b0;
                addr = count;
                done = state[0];
                found = state[0] & (morseCode == data); 
            end
            
            CHECK : begin
                next = (morseCode == data) ? 1'b0 : 1'b1;
                addr = count;
                done = state[0];
                found = state[0] & (morseCode == data); 
            end
            
            DONE : begin
                next = 1'b0;
                addr = count;
                done = state[0];
                found = state[0] & (morseCode == data);
            end
        endcase
    end
endmodule
