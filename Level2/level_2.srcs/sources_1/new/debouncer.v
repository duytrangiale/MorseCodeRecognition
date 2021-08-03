`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2020 02:29:59 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input wire btn_in,
    input wire clk,
    input wire reset,
    output wire debounceout
    );
    
    // Instantiate an arbitrary clock divider with heartbeat
    wire beat;
    heartbeat #(.TOPCOUNT(30_000)) debouncebeat(.clk(clk), .reset(reset), .beat(beat));
    
    // Hearbeat-enabled shift register
    reg [2:0] pipeline;
    always @(posedge clk) begin
        if (beat) begin
            pipeline[0] <= btn_in;
            pipeline[1] <= pipeline[0];
            pipeline[2] <= pipeline[1];
        end
    end
    
    // Output logic
    assign debounceout = &pipeline;
    
endmodule
