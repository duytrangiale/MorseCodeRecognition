`timescale 10ns / 1ns

module TB_comp_mem;

// Inputs
   reg start;
   reg reset;
   reg nextCharacter;
   reg [7:0] morseCode;

// Output
   wire done;
   wire found;
   
//others 
    wire [7:0] memdata;
    wire [4:0] memaddr;
    wire [19:0] word;
    reg waitTime10;
    reg enable3;
    reg restart3; 
    reg clk_50;

// Instantiate the design to be tested
code_comparator UUT1( 
	.start(start), 
	.morseCode(morseCode), 
	.nextCharacter(nextCharacter),
	.data(memdata), 
	.addr(memaddr),
	.word(word),
	.done(done),
	.found(found),
	.clk(clk_50),
	.reset(reset)
);
   
 Morse_decoder_rom UUT2( 
	.addr(memaddr), 
	.data(memdata) 
);

   

initial begin
	clk_50=1'b0;
forever
	#1 clk_50 = ~clk_50; // every ten nanoseconds invert
end

initial begin //initial signal values
	morseCode=8'b01010101;
	start=1'b0;
	reset=1'b1;
	nextCharacter = 1'b0;
	waitTime10 = 0;
	enable3 = 0;
end

// Signal changes
initial begin
		#4 reset=1'b0;
		#4 start= 1'b1;
		
		#50 nextCharacter = 1'b1;
	
		#40; $finish;  // terminates simulation
end

endmodule