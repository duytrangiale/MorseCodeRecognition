`timescale 1ns / 1ps

//Module heartbeat generates a single high value of one clock cycle duration every TOPCOUNT clock cycles

module heartbeat( 
    input wire clk,
    input wire reset,
    output wire beat);

    parameter TOPCOUNT=100_000; // generate a 1kHz heartbeat from 100MHz clock => need 100_000 cycles
    
    reg [$clog2(TOPCOUNT)-1:0] count; 
/*The above reg declaration features a preprocessor inbuilt function $clog2(), which computes 
the ceiling of the log2 result for TOPCOUNT and places that result into my module code before synthesis.

If your understanding of the course is coming along well, you should be able to tell why this 
is a great solution for flexible coding in this circumstance.*/


always@(posedge clk) begin
    if(reset || (count==TOPCOUNT-1)) count<=0;
    else count<=count+1;
end

assign beat=(count==TOPCOUNT-1);

endmodule
