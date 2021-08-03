`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2020 09:47:07 AM
// Design Name: 
// Module Name: sevenSegmentDecoder
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


module sevenSegmentDecoder(
    input [4:0] bcd, // 2 dit-dahs and 26 alphabets
    output reg [7:0] ssd // 7 segments and 1 dp - 8'b(dp)ABCDEFG
    );
    
    always @(*) begin
        case (bcd)
            5'd0 : ssd = 8'b11111111; // blank 
            5'd1 : ssd = 8'b01111111; // dot
            5'd2 : ssd = 8'b11111110; // dash
            5'd3 : ssd = 8'b10001000; // A
            5'd4 : ssd = 8'b11100000; // b
            5'd5 : ssd = 8'b10110001; // C
            5'd6 : ssd = 8'b11000010; // d
            5'd7 : ssd = 8'b10110000; // E
            5'd8 : ssd = 8'b10111000; // F
            5'd9 : ssd = 8'b10100001; // G
            5'd10 : ssd = 8'b11101000; // h
            5'd11 : ssd = 8'b10111001; // I
            5'd12 : ssd = 8'b11000011; // J
            5'd13 : ssd = 8'b10101000; // k
            5'd14 : ssd = 8'b11110001; // L
            5'd15 : ssd = 8'b10101010; // M
            5'd16 : ssd = 8'b11101010; // n
            5'd17 : ssd = 8'b11100010; // o
            5'd18 : ssd = 8'b10011000; // P
            5'd19 : ssd = 8'b10001100; // q
            5'd20 : ssd = 8'b11111010; // r
            5'd21 : ssd = 8'b10100101; // S
            5'd22 : ssd = 8'b11110000; // t
            5'd23 : ssd = 8'b11100011; // u
            5'd24 : ssd = 8'b11010101; // V
            5'd25 : ssd = 8'b11010100; // W
            5'd26 : ssd = 8'b11101011; // X
            5'd27 : ssd = 8'b11000100; // y
            5'd28 : ssd = 8'b10010011; // Z
            default : ssd = 8'b11111111; // no light
        endcase
    end
endmodule
