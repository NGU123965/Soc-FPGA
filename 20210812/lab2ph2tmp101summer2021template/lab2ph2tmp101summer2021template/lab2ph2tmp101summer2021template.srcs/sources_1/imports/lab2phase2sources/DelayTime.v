`timescale 1ns / 1ps
// File name	: DelayTime.v
// Written by	: Jianjian Song
// Time Delay Loop
//ECE433 Fall 2020

module DelayTime(input Reset, Clock, Start, output reg Timeout);
//for simulation
//parameter	MaxCount = 3;	//delay time in number of clock cycles
//for board implementation
parameter	MaxCount = 10000;	//delay time in number of clock cycles
parameter 	NumberOfBits = 20;

reg 	[NumberOfBits-1:0]	count;
	
always @ (count)
	if(count==MaxCount) Timeout<=1;
	else Timeout<=0;
	
always @ (posedge Clock)
    if(Reset==1) count<=0; else
	if(Start==1) begin count <= 0; end
	else if (count>=MaxCount)	count<=0;
		else count <= count+1'b1;
endmodule
