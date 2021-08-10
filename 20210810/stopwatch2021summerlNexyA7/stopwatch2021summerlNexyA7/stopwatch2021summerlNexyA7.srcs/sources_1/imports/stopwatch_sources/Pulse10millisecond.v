`timescale 1ns / 1ps
// File name	: Pulse10millisecond.v
// Written by	: Jianjian Song
// ECE433-01 Fall 2020
// Date: September 23, 2020
// Purpose:	To generate one single positive pulse 
//	every 10ms from a 100MHz clock

module Pulse10millisecond(Reset,Pulse20ns,Clock);
parameter	PulsePeriod = 1000000; //10nsx1000,000=10ms
parameter 	NumberOfBits = 20;
input			Reset, Clock;
output reg	Pulse20ns;
reg 	[NumberOfBits-1:0]	count;
	
always @ (posedge Clock or posedge Reset)
	if(Reset==1)		begin count <= 0; Pulse20ns<=0; end
	else if (count==PulsePeriod)
		begin count<=0; Pulse20ns<=1; end
		else begin count <= count+1'b1; Pulse20ns <= 0; end
endmodule
