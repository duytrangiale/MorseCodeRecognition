`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2020 03:17:07 PM
// Design Name: 
// Module Name: sevenSegDisp
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


module sevenSegDisp(
    input wire clk,
    input wire reset,
    input wire enableDisp,
    input wire switchDisp,
    input wire letterView,
    input wire inputDisp,
    input wire btn_east,
    input wire btn_west,
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
    
    // Assign bit values to each state of FSM
    parameter WORD = 4'd0, 
              LETTER1 = 4'd1, 
              LETTER2 = 4'd2, 
              LETTER3 = 4'd3,
              LETTER4 = 4'd4,
              MORSE1 = 4'd5,
              MORSE2 = 4'd6,
              MORSE3 = 4'd7,
              MORSE4 = 4'd8;
    
    // Declare 2 reg to store current and next state
    reg [3:0] state, nextstate;
    
    // State memory - sequential
    always @(posedge clk) begin
        if (reset || (!letterView)) state <= WORD;
        else state <= nextstate;
    end
    
    // Next state logic 
    always @(*) begin
        case (state)
            WORD : begin
                if (letterView && switchDisp) nextstate = LETTER1;
                else if (letterView && (!switchDisp)) nextstate = MORSE1;
                else nextstate = WORD;
            end
            
            LETTER1 : begin
                if (letterView && (!switchDisp)) nextstate = MORSE1;
                else if (!letterView) nextstate = WORD;
                else if (btn_east) nextstate = LETTER2;
                else if (btn_west) nextstate = LETTER4;
                else nextstate = LETTER1;
            end
            
            LETTER2 : begin
                if (letterView && (!switchDisp)) nextstate = MORSE2;
                else if (!letterView) nextstate = WORD;
                else if (btn_east) nextstate = LETTER3;
                else if (btn_west) nextstate = LETTER1;
                else nextstate = LETTER2;
            end
            
            LETTER3 : begin
                if (letterView && (!switchDisp)) nextstate = MORSE3;
                else if (!letterView) nextstate = WORD;
                else if (btn_east) nextstate = LETTER4;
                else if (btn_west) nextstate = LETTER2;
                else nextstate = LETTER3;
            end
            
            LETTER4 : begin
                if (letterView && (!switchDisp)) nextstate = MORSE4;
                else if (!letterView) nextstate = WORD;
                else if (btn_east) nextstate = LETTER1;
                else if (btn_west) nextstate = LETTER3;
                else nextstate = LETTER4;
            end
            
            MORSE1 : begin
                if (letterView && switchDisp) nextstate = LETTER1;
                else if (!letterView) nextstate = WORD;
                else if (btn_east) nextstate = MORSE2;
                else if (btn_west) nextstate = MORSE4;
                else nextstate = MORSE1;
            end
            
            MORSE2 : begin
                if (letterView && switchDisp) nextstate = LETTER2;
                else if (!letterView) nextstate = WORD;
                else if (btn_east) nextstate = MORSE3;
                else if (btn_west) nextstate = MORSE1;
                else nextstate = MORSE2;
            end
            
            MORSE3 : begin
                if (letterView && switchDisp) nextstate = LETTER3;
                else if (!letterView) nextstate = WORD;
                else if (btn_east) nextstate = MORSE4;
                else if (btn_west) nextstate = MORSE2;
                else nextstate = MORSE3;
            end
            
            MORSE4 : begin
                if (letterView && switchDisp) nextstate = LETTER4;
                else if (!letterView) nextstate = WORD;
                else if (btn_east) nextstate = MORSE1;
                else if (btn_west) nextstate = MORSE3;
                else nextstate = MORSE4;
            end
            
        endcase
    end
    
    // Output logic
    always @(posedge clk) begin
        case (state)
            WORD : begin
                if (!enableDisp) ssdAnode <= 4'b1111;
                else if (inputDisp) begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCode[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCode[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCode[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCode[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
                else begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= word[19:15];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= word[14:10];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= word[9:5];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= word[4:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
            end
            
            LETTER1 : begin
                if (!enableDisp) ssdAnode <= 4'b1111;
                else if (inputDisp) begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCode[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCode[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCode[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCode[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
                else begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= word[19:15];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end 
            end
            
            LETTER2 : begin
                if (!enableDisp) ssdAnode <= 4'b1111;
                else if (inputDisp) begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCode[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCode[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCode[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCode[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
                else begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= word[14:10];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end 
            end
            
            LETTER3 : begin
                if (!enableDisp) ssdAnode <= 4'b1111;
                else if (inputDisp) begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCode[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCode[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCode[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCode[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
                else begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= word[9:5];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end 
            end
            
            LETTER4 : begin
                if (!enableDisp) ssdAnode <= 4'b1111;
                else if (inputDisp) begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCode[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCode[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCode[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCode[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
                else begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= word[4:0];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end 
            end
            
            MORSE1 : begin
                if (!enableDisp) ssdAnode <= 4'b1111;
                else if (inputDisp) begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCode[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCode[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCode[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCode[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
                else begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCodeWord[31:30];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCodeWord[29:28];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCodeWord[27:26];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCodeWord[25:24];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end 
            end
            
            MORSE2 : begin
                if (!enableDisp) ssdAnode <= 4'b1111;
                else if (inputDisp) begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCode[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCode[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCode[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCode[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
                else begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCodeWord[23:22];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCodeWord[21:20];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCodeWord[19:18];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCodeWord[17:16];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end 
            end
            
            MORSE3 : begin
                if (!enableDisp) ssdAnode <= 4'b1111;
                else if (inputDisp) begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCode[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCode[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCode[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCode[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
                else begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCodeWord[15:14];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCodeWord[13:12];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCodeWord[11:10];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCodeWord[9:8];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end 
            end
            
            MORSE4 : begin
                if (!enableDisp) ssdAnode <= 4'b1111;
                else if (inputDisp) begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCode[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCode[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCode[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCode[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end
                else begin
                    case (activeDisplay)
                        2'd0 : begin
                            ssdValue <= morseCodeWord[7:6];
                            ssdAnode <= 4'b0111;
                        end
                        
                        2'd1 : begin
                            ssdValue <= morseCodeWord[5:4];
                            ssdAnode <= 4'b1011;
                        end
                        
                        2'd2 : begin
                            ssdValue <= morseCodeWord[3:2];
                            ssdAnode <= 4'b1101;
                        end
                        
                        2'd3 : begin
                            ssdValue <= morseCodeWord[1:0];
                            ssdAnode <= 4'b1110;
                        end
                        
                        default : begin
                            ssdValue <= 5'd0;
                            ssdAnode <= 4'b1111; // none active
                        end
                    endcase
                end 
            end
            
        endcase
    end
    
    // Instantiate the sevenSegmentDecoder
    sevenSegmentDecoder inst_sevenSegmentDec(.bcd(ssdValue), .ssd(ssdCathode));
    
endmodule
