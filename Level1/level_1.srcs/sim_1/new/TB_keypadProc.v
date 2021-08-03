`timescale 10ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2020 10:17:59 PM
// Design Name: 
// Module Name: TB_keypadProc
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


module TB_keypadProc;

// Inputs
    reg enableIn;
    reg enter;
    reg receive;
    reg reset;
     
// Output
    wire [7:0] led;
    wire nextCharacter;
    wire [7:0] morseCode;
    
// Other regs
    reg clk_50;

// Instantiate the design to be tested
    keyProcessor UUT(
        .clk(clk_50),
        .enableIn(enableIn),
        .enter(enter),
        .receive(receive),
        .reset(reset),
        .led(led),
        .nextCharacter(nextCharacter),
        .morseCode(morseCode)
    );
            
// create clock at 50MHz
initial begin
    clk_50 = 0;
    forever
    #0.5 clk_50 = ~clk_50; // every 5 nanoseconds invert
end

initial begin // initialisation of signals
    enter = 0;
    receive = 0;
    reset = 0;
    enableIn = 0;
end


// Signal changes
initial begin
    #1 reset = 1'b1;
    #3 reset = 1'b0;
    
    #2 enableIn = 1'b1;
    
    #10 receive = 1'b1;
    #3 receive = 1'b0;
    
    #5 enter = 1'b1;
    #15 enter = 1'b0;

//    #5 enter = 1'b1;
//    #15 enter = 1'b0;
    
//    #23 receive = 1'b1;
//    #5 receive = 1'b0;
    
//    #20 enter = 1'b1;
//    #10 enter = 1'b0;
    
//    #10 receive = 1'b1;
//    #5 receive = 1'b0;
    
//    #12 enter = 1'b1;
//    #15 enter = 1'b0;
    
//    #10 receive = 1'b1;
//    #10 receive = 1'b0;
    
//    #4 enter = 1'b1;
//    #25 enter = 1'b0;
    
    #10; $finish; // terminates simulation
    
end
endmodule
