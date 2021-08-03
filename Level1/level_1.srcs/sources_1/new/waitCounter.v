`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2020 09:46:13 AM
// Design Name: 
// Module Name: waitCounter
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


module waitCounter(
    input wire clk,
    input wire enable1,
    input wire enable2,
    input wire reset,
    input wire restart1,
    input wire restart2,
    output wire timer1,
    output wire timer2
    );
    
    // Create a 1 second beat
    wire beat;
    heartbeat #(.TOPCOUNT(100_000_000)) hb(.clk(clk), .reset(reset), .beat(beat));
    
    
    reg [2:0] count1; // for 4 seconds of pressing time
    reg [1:0] count2; // for 2 seconds of translating time
    initial begin
        count1 = 0;
        count2 = 0;
    end
    always @(posedge clk) begin
        if (restart1) count1 <= 0;
        else if (enable1) begin
            if (beat) count1 <= count1 + 1;
        end
        
        if (restart2) count2 <= 0;
        else if (enable2) begin
            if (beat) count2 <= count2 + 1;
        end
    end
    
    assign timer1 = (count1 == 3'b101); // timer1 == 1 after 5 seconds
    assign timer2 = (count2 == 3'b10); // timer2 == 1 after 2 seconds
endmodule
