`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2020 11:36:16 AM
// Design Name: 
// Module Name: sevenSegmentDisp
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


module sevenSegmentDisp(
    input wire clk,
    input wire reset,
    input wire enableDisp,
    input wire switchDisp,
    input wire letterView,
    input wire letter_disp,
//    input wire word_disp,
//    input wire btn_east,
//    input wire btn_west,
    input wire [7:0] morseCode,
    input wire [4:0] addr,
    input wire [31:0] morseCodeWord,
    input wire [19:0] word,
    output [7:0] ssdCathode,
    output reg [3:0] ssdAnode
    );
    
    // Instantiate heartbeat at 1kHz
    wire beat;
    heartbeat #(.TOPCOUNT(100_000))inst_beat(.clk(clk), .reset(reset), .beat(beat));
    
    // Create an overflow counter to continuously cycle through active displays
    reg [1:0] activeDisplay; // overflow counter
    always @(posedge clk) begin
        if (beat) begin
            activeDisplay <= activeDisplay + 1;
        end else begin
            activeDisplay <= activeDisplay;
        end
    end
    
    // Declare a required value for each count of activeDisplay
    reg [4:0] ssdValue; // store 4 numbers want to display
    always @(posedge clk) begin
        if (!enableDisp) ssdAnode <= 4'b1111;
        else begin
            case (activeDisplay)
                2'd0 : begin
                    if (!letterView) begin
                        ssdValue <= word[19:15];
                    end
                    else begin
                        if (!switchDisp) ssdValue <= morseCodeWord[31:30];
                        else ssdValue <= word[19:15];
                    end
                    ssdAnode <= 4'b0111;
                end
                2'd1 : begin
                    if (!letterView) begin
                        ssdValue <= word[14:10];
                    end
                    else begin
                        if (!switchDisp) ssdValue <= morseCodeWord[29:28];
                        else ssdValue <= word[14:10];
                    end
                    ssdAnode <= 4'b1011;
                end
                2'd2 : begin
                    if (!letterView) begin
                        ssdValue <= word[9:5];
                    end
                    else begin
                        if (!switchDisp) ssdValue <= morseCodeWord[27:26];
                        else ssdValue <= word[9:5];
                    end
                    ssdAnode <= 4'b1101;
                end
                2'd3 : begin
                    if (!letterView) begin
                        ssdValue <= word[4:0];
                    end
                    else begin
                        if (!switchDisp) ssdValue <= morseCodeWord[25:24];
                        else ssdValue <= word[4:0];
                    end
                    ssdAnode <= 4'b1110;
                end
                default : begin
                    ssdValue <= 5'd0;
                    ssdAnode <= 4'b1111; // none active
                end
            endcase
        end
    end
    
    // Instantiate the sevenSegmentDecoder
    sevenSegmentDecoder inst_sevenSegmentDec(.bcd(ssdValue), .ssd(ssdCathode));
    
endmodule
