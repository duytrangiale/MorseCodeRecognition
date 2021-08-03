`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 12:02:20 PM
// Design Name: 
// Module Name: keyProcessor
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


module keyProcessor(
    input wire clk,
    input wire enableIn,
    input wire enter,
    input wire reset,
    output reg ready,
    output reg [7:0] led,
    output reg inputDisp,
    output reg nextCharacter,
    output reg [7:0] morseCode, // a 8-bit array contains 4 Morse code signal, each signal is 2 bits
    output reg [31:0] morseCodeWord // a 32-bit array contains Morse code of 4 letters in a word
    );
    
    // Assign bit value to each signal
    parameter DIT = 2'b01, DAH = 2'b10;
    
    // Assign bit values to each state of FSM
    parameter IDLE = 2'd0, MEASURE = 2'd1, LETTER = 2'd2, READY = 2'd3;
    
    // Declare 2 registers to store current and next state
    reg [1:0] state, nextstate;
    
    // Instantiate a beat value - count every one second
    wire beat;
    heartbeat #(.TOPCOUNT(100_000_000)) hb1(.clk(clk), .reset(reset), .beat(beat));
    
    // Instantiate a wait timer - waitTime5 to count the time in MEASURE and READY state, waitTime2 to count the time in TRANSLATE state
    // waitTime5 is 5 seconds, waitTime2 is 2 seconds
    wire waitTime5;
    wire waitTime2; 
    wire waitTime10;
    reg enable1;
    reg enable2;
    reg enable3;
    reg restart1;
    reg restart2;
    reg restart3;
    waitCounter spaceTime(
        .clk(clk), 
        .enable1(enable1), 
        .enable2(enable2), 
        .enable3(enable3),
        .reset(reset), 
        .restart1(restart1), 
        .restart2(restart2), 
        .restart3(restart3),
        .timer1(waitTime5), 
        .timer2(waitTime2),
        .timer3(waitTime10)
    );
    
    // Set some variables to keep track the state of inputs
    reg [2:0] pressTime;    // measure the time of pressing button
    reg fsm_counter_en;     // to activate the timer process
    reg fsm_counter_rst;    // to reset the timer
    reg [15:0] morseArray;  // an array to store input signal
    
    initial begin
        pressTime = 0;
        morseArray = 0;
        morseCode = 0;
        morseCodeWord = 0;
    end
    
    // Timer logic 
    always @(posedge clk) begin
        if (fsm_counter_rst) begin
            pressTime <= 3'd0;
        end  
        else if (enableIn && fsm_counter_en && enter) begin // check the enable switch, enter button and enable from fsm
            if (beat) begin // for every 1 second
                pressTime <= pressTime + 3'd1; // count up every 1 second
            end
        end
    end
    
    // Add the input morseCode of each letter to morseCodeWord
    reg enableCodeWord; // enable to input the morseCode sequence into morseCodeWord array
    reg [2:0] numberCode; // number of Morse code sequence been added
        
    initial begin
        numberCode = 0;
        enable3 = 0;
    end
    
    always @(posedge clk) begin
        if (reset) numberCode <= 3'd0;
        else if (enableCodeWord && (numberCode != 1) && (morseCodeWord[31:24] == 8'd0)) begin
            morseCodeWord <= {morseCodeWord[23:0], morseCode};
            numberCode <= numberCode + 1;
        end 
        else morseCodeWord <= morseCodeWord;
        
        if (morseCode == 8'd0) begin
            if (waitTime10) begin   // wait for 10 seconds to receive the new word
                morseCodeWord <= 32'd0;
            end
            else morseCodeWord <= morseCodeWord;
        end
        
    end
    
    // State memory - sequential
    always @(posedge clk) begin
        if (reset) state <= IDLE;
        else state <= nextstate;
    end
    
    // Next state logic - combinational
    always @(*) begin
        case (state)
            IDLE : begin
                if (enter) nextstate = MEASURE; // press enter button for a period of time to input signal (1 sec for DOT, 3 secs for DASH)
                else nextstate = IDLE;
            end
            
            MEASURE : begin
                if (waitTime5) nextstate = LETTER; // transfer to LETTER state after 5 sec
                else nextstate = MEASURE;
            end
            
            LETTER : begin
                if (enter) nextstate = MEASURE; // if press enter button again, come back to MEASURE to receive next input
                else if (waitTime2) nextstate = READY; // if users do not enter any input, wait for 2 sec and forward to READY state
                else nextstate = LETTER;
            end
            
            READY : begin
                if (waitTime5) nextstate = IDLE; // wait for 5 sec to come back to IDLE state and receive new sequence
                else nextstate = READY;
            end
        endcase   
    end
    
    // Output logic
    always @(posedge clk) begin
        case (state)
            IDLE : begin
                morseCode = 8'b00000000;
                enableCodeWord = 1'b0;
                morseArray = 16'd0;
                enable1 = 1'b0;
                enable2 = 1'b0;
                enable3 = 1'b1;
                restart1 = 1'b1;
                restart2 = 1'b1;
                restart3 = 1'b0;
                fsm_counter_en = 1'b0;
                fsm_counter_rst = 1'b1;
                nextCharacter = 1'b0;
                led = 8'b00000001; // LD0 light on
                ready = 1'b0;
                inputDisp = 1'b0;
            end
            
            MEASURE : begin 
                morseCode = morseCode;
                enableCodeWord = 1'b0;
                morseArray = morseArray;
                enable1 = 1'b1; // activate waitTime5
                enable2 = 1'b0;
                enable3 = 1'b0;
                restart1 = 1'b0;
                restart2 = 1'b1; // restart waitTime2
                restart3 = 1'b1;
                fsm_counter_en = 1'b1; // activate counter for pressing time
                fsm_counter_rst = 1'b0;
                nextCharacter = 1'b0;
                led = 8'b00000010; // LD1 light on
                ready = 1'b0;
                inputDisp = 1'b1;
           end  
                            
           LETTER : begin
                enableCodeWord = 1'b0;
                enable1 = 1'b0;
                enable2 = 1'b1; // activate waitTime2
                enable3 = 1'b0;
                restart1 = 1'b1; // restart waitTime5
                restart2 = 1'b0;
                restart3 = 1'b0;
                fsm_counter_en = 1'b0;
                fsm_counter_rst = 1'b1; // reset counter of pressing time
                nextCharacter = 1'b0;
                led = 8'b00000100; // LD2 light on
                ready = 1'b0;
                inputDisp = 1'b1;
                if (pressTime > 0 && pressTime < 3) begin
                    morseArray <= {morseArray[13:0], DIT};
                end
                else if (pressTime >= 3) begin
                    morseArray <= {morseArray[13:0], DAH};
                end
                morseCode[7:6] <= morseArray[15:14];
                morseCode[5:4] <= morseArray[11:10];
                morseCode[3:2] <= morseArray[7:6];
                morseCode[1:0] <= morseArray[3:2];
           end
           
           READY : begin
                enableCodeWord = 1'b1; // activate the addition of morseCode into array morseCodeWord
                enable1 = 1'b1; // activate waitTime5
                enable2 = 1'b0;
                enable3 = 1'b0;
                restart1 = 1'b0;
                restart2 = 1'b1; // restart waitTime2
                restart3 = 1'b0;
                fsm_counter_en = 1'b0;
                fsm_counter_rst = 1'b1;
                if (waitTime5) nextCharacter = 1'b1; // turn on nextCharacter to reset system and receive new sequence         
                led = morseCode;
                morseCode = morseCode;    
                morseArray = 16'd0;
                ready = 1'b1; // send out ready signal to FSM
                inputDisp = 1'b0;
           end     
        endcase
    end
endmodule
