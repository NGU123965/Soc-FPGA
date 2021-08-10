// File name	: Refreshing7SegNexysA7.v
// Written by	: Jianjian Song
// ECE433 Fall 2020
`timescale 1ns / 1ps

module Refreshing7SegNexysA7 #(parameter	Bits = 8) (
input		Reset, CLOCK,
output reg [Bits-1:0]	Transistors);

reg	[2:0]	Q;

parameter	Divider = 10000;	//refreshing rate in number of clock cycles. Time=#cycles*20ns
parameter 	NumberOfBits = 20;
reg [NumberOfBits:0] count;

always @ (posedge CLOCK)
	if(Reset==1)	Q <= 0;
	else	if (count==(Divider-1'b1)) Q<=Q+1;
	else Q<=Q;

always@(Q)
	case (Q)
	0:	Transistors<=8'b11111110;
	1:	Transistors<=8'b11111101;
	2: Transistors<=8'b11111011;
	3: Transistors<=8'b11110111;
	4:	Transistors<=8'b11101111;
	5:	Transistors<=8'b11011111;
	6: Transistors<=8'b10111111;
	7: Transistors<=8'b01111111;
	endcase
	
always @ (posedge CLOCK)
	if(Reset==1)		begin count <= 0; end
	else if (count==(Divider-1))	count<=0;
		else count <= count+1;
	
endmodule
