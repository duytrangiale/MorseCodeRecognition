`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2020 12:33:26 AM
// Design Name: 
// Module Name: Morse_decoder_rom
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


module Morse_decoder_rom(
    input wire [4:0] addr,
    output reg [7:0] data
    );
    
    always @(*) begin
        case (addr)
            5'd3 : data = 8'b00000110; // A
            5'd4 : data = 8'b10010101; // B
            5'd5 : data = 8'b10011001; // C
            5'd6 : data = 8'b00100101; // D
            5'd7 : data = 8'b00000001; // E
            5'd8 : data = 8'b01011001; // F
            5'd9 : data = 8'b00101001; // G
            5'd10 : data = 8'b01010101; // H
            5'd11 : data = 8'b00000101; // I
            5'd12 : data = 8'b01101010; // J
            5'd13 : data = 8'b00100110; // K
            5'd14 : data = 8'b01100101; // L
            5'd15 : data = 8'b00001010; // M
            5'd16 : data = 8'b00001001; // N
            5'd17 : data = 8'b00101010; // O
            5'd18 : data = 8'b01101001; // P
            5'd19 : data = 8'b10100110; // Q
            5'd20 : data = 8'b00011001; // R
            5'd21 : data = 8'b00010101; // S
            5'd22 : data = 8'b00000010; // T
            5'd23 : data = 8'b00010110; // U
            5'd24 : data = 8'b01010110; // V
            5'd25 : data = 8'b00011010; // W
            5'd26 : data = 8'b10010110; // X
            5'd27 : data = 8'b10011010; // Y
            5'd28 : data = 8'b10100101; // Z
            default : data = 8'b00000000;
        endcase
    end
endmodule
