`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2020 11:24:24 PM
// Design Name: 
// Module Name: Morse_decoder_TOP
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


module Morse_decoder_TOP(
    input wire clk,
    input wire btn_enter,
    input wire btn_reset,
    input wire enableDisp,
    input wire switchDisp,
    input wire enableIn,
    output wire [7:0] led,
    output wire [7:0] ssdCathode,
    output wire [3:0] ssdAnode
    );
    
    wire ready, done, found, start, fsm_reset, letter_disp;
    wire nextCharacter;
    wire enter_deb;
    wire [7:0] morseCode;
    wire [4:0] rom_addr;
    wire [7:0] rom_data;
    
    debouncer db (
        .btn_in(btn_enter), 
        .clk(clk), 
        .reset(btn_reset), 
        .debounceout(enter_deb)
    );
    
    sevenSegmentDisp sevensegDisp(
        .clk(clk), 
        .reset(btn_reset), 
        .enableDisp(enableDisp), 
        .switchDisp(switchDisp), 
        .letter_disp(letter_disp),
        .morseCode(morseCode), 
        .addr(rom_addr),
        .ssdCathode(ssdCathode), 
        .ssdAnode(ssdAnode));
    
    keyProcessor keyproc(
        .clk(clk), 
        .enableIn(enableIn), 
        .enter(enter_deb), 
        .reset(fsm_reset), 
        .ready(ready),
        .led(led), 
        .nextCharacter(nextCharacter), 
        .morseCode(morseCode)
    );
    
    code_comparator codecompare(
        .clk(clk),
        .start(start),
        .reset(fsm_reset),
        .morseCode(morseCode),
        .data(rom_data),
        .addr(rom_addr),
        .found(found),
        .done(done)
    );
    
    Morse_decoder_rom memory(
        .addr(rom_addr),
        .data(rom_data)
    );
    
    FSM_letter fsmLetter(
        .clk(clk),
        .ready(ready),
        .done(done),
        .found(found),
        .reset_btn(btn_reset),
        .nextCharacter(nextCharacter),
        .letter_disp(letter_disp),
        .start(start),
        .reset(fsm_reset)
    );
    
endmodule
