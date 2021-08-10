`timescale 1ns / 1ps
//ECE433 Fall 2020
module Debouncer2020fallTB;

	// Inputs
	reg iSignal, Reset, CLOCK;

	wire DebouncedOuput;

wire [1:0] state = TestDebouncer.State;

	// Instantiate the Unit Under Test (UUT)
	Debouncer2020fall TestDebouncer (iSignal, DebouncedOuput, Reset, CLOCK);

initial begin CLOCK = 0; forever #5 CLOCK = ~CLOCK; end

initial fork
	#0	Reset = 1; #36	Reset = 0; 
	#0 iSignal = 0;
	#54	iSignal = 1;
	#123	iSignal = 0;
	#167  iSignal = 1;
	#198  iSignal = 0;
	#250	iSignal = 1;
	#376  iSignal = 0;
	#450 $stop;
join
      
endmodule

