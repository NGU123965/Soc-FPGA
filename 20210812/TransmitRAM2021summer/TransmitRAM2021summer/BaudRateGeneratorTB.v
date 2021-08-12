`timescale 1ns / 1ps
//ECE433 Fall 2019

module BaudRateGeneratorTB;

	reg Reset, Clock;

	wire uartClk;

	BaudRateGenerator uut (uartClk, Reset, Clock, 20'd20, 30'd1600);

	initial begin 		Reset = 1; Clock = 0; end
	
	always #5 Clock=~Clock;
	
	initial fork
	#0 Reset = 1;  #23 Reset=0;
	#400 $stop;
	join
	
endmodule

