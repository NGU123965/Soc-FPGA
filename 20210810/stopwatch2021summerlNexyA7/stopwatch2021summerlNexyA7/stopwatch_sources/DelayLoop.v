`timescale 1ns / 1ps
// File name	: DelayLoop.v
// Written by	: Jianjian Song
// ECE433 Fall 2020
// Divide a high frequency square wave to 
// generate a lower frequency square wave.

module DelayLoop(MR,Timeout,Clock) ;
//set DelayTime to be 3 for simulation and a large number for physical delay time
//parameter	DelayTime = 20000;	//delay time in number of clock cycles, 20ns
parameter	DelayTime = 3;	//for simulation
parameter 	NumberOfBits = 27;
input			MR, Clock;
output reg	Timeout;
reg 	[NumberOfBits-1:0]	count;
	
always @ (count)
	if(count==DelayTime) Timeout<=1;
	else Timeout<=0;
	
always @ (posedge Clock)
	if(MR==1)		count <= 0;
	else if (count==DelayTime)	count<=0;
		else count <= count+1'b1;
endmodule
