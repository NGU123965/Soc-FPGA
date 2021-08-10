`timescale 1ns / 1ps		//simulation time unit is 1ns and resolution is 1ps
//Author: Jianjian Song
//Date: October 24, 2011
//Purpose: ECE130 example circuit

module Gate3Assign (All, Blink, Right, Left);
input All, Blink;
output Right, Left;

	assign Right = !(!All&Blink);
	assign Left = All | Blink;
endmodule
