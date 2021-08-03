`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2020 03:31:05 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input wire clk,
    input wire reset,
    input wire next,
    output reg [4:0] count
    );
    
    always @(posedge clk) begin
       if (reset) count <= 5'd3; // address of alphabets starts at 5'd3
       else if (next) count <= count + 5'd1;
    end
    
endmodule
