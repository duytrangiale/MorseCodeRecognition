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
    input wire letter_disp,
    input wire [7:0] morseCode,
    input wire [4:0] addr,
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
        if (!enableDisp) ssdAnode <= 4'b1111; // if SW0 is turned off (down), then no light on 7SD 
        else begin
            case (activeDisplay)
                2'd0 : begin
                    if (!switchDisp) begin // if SW14 is turned down, display morseCode
                        ssdValue <= morseCode[7:6];
                    end
                    else begin // else displa the corresponding letter
                        if (letter_disp) ssdValue <= addr; // display the corresponding letter
                        else ssdValue <= 5'd7; // E
                    end
                    ssdAnode <= 4'b0111;
                end
                2'd1 : begin
                    if (!switchDisp) begin
                        ssdValue <= morseCode[5:4];
                    end
                    else begin
                        if (letter_disp) ssdValue <= 5'd0; // blank
                        else ssdValue <= 5'd20; // r
                    end
                    ssdAnode <= 4'b1011;
                end
                2'd2 : begin
                    if (!switchDisp) begin
                        ssdValue <= morseCode[3:2];
                    end
                    else begin
                        if (letter_disp) ssdValue <= 5'd0;
                        else ssdValue <= 5'd20; // r
                    end
                    ssdAnode <= 4'b1101;
                end
                2'd3 : begin
                    if (!switchDisp) begin
                        ssdValue <= morseCode[1:0];
                    end
                    else begin
                        if (letter_disp) ssdValue <= 5'd0;
                        else ssdValue <= 5'd17; // o
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
