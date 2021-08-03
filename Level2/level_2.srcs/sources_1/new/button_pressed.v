`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2020 06:30:54 PM
// Design Name: 
// Module Name: button_pressed
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


module button_pressed(
    input wire clk,
    input wire btn,
    output reg btn_pressed
    );
    
    reg btn_prev;
    always @(posedge clk) begin
        btn_prev <= btn;
    end
    
    always @(*) begin
        if (btn && (!btn_prev)) btn_pressed = 1;
        else btn_pressed = 0;
    end
    
endmodule
