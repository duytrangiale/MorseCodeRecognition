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
    output reg [19:0] word, // contains 4 address of 4 letters
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
    
    // Instantiate a wait timer
    wire waitTime10;
    reg enable3;
    reg restart3;
    waitCounter waitTime(
        .clk(clk),
        .enable1(1'b0),
        .enable2(1'b0),
        .enable3(enable3),
        .reset(reset),
        .restart1(1'b0),
        .restart2(1'b0),
        .restart3(restart3),
        .timer3(waitTime10)
    );
    
    // Add the address of the found letter to the array "word"
    reg enableWord;
    reg [2:0] numberData;
    
    initial begin
        word = 0;
        numberData = 0;
        //enable3 = 0;
    end
    
    always @(posedge clk) begin
        if (reset) numberData <= 3'd0;
        else if (found && enableWord && (numberData != 1) && (word[19:15] == 5'd0)) begin
            word <= {word[14:0], addr};
            numberData <= numberData + 1;
        end 
        else word <= word;
        
        if (morseCode == 8'd0) begin
            if (waitTime10) begin
                word <= 20'd0;
            end
            else word <= word;
        end
        
    end
    
    // State memory - sequential
    always @(posedge clk) begin
        if (reset) state <= WAIT;
        else state <= nextstate;
    end
    
    // Next state logic - combinational
    always @(*) begin
        case (state)
            WAIT : begin
                if (start) nextstate = CHECK;
                else nextstate = WAIT;
            end
            
            CHECK : begin
                if ((morseCode == data)||(addr == 5'd28)) nextstate = DONE;
                else nextstate = CHECK;
            end
            
            DONE : begin
                if (reset) nextstate = WAIT;
                else nextstate = DONE;
            end
        endcase
    end
    
    // Output logic - combinational
    always @(*) begin
        case (state)
            WAIT : begin
                enableWord = 1'b0;
                enable3 = 1'b1;
                restart3 = 1'b0;
                next = 1'b0;
                addr = count;
                done = state[0];
                found = state[0] & (morseCode == data); 
            end
            
            CHECK : begin
                enableWord = 1'b0;
                enable3 = 1'b0;
                restart3 = 1'b1;
                next = (morseCode == data) ? 1'b0 : 1'b1;
                addr = count;
                done = state[0];
                found = state[0] & (morseCode == data); 
            end
            
            DONE : begin
                enableWord = 1'b1;
                enable3 = 1'b0;
                restart3 = 1'b0;
                next = 1'b0;
                addr = count;
                done = state[0];
                found = state[0] & (morseCode == data);
            end
        endcase
    end
endmodule
