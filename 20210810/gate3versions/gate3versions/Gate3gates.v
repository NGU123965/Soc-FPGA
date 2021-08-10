`timescale 1ns / 1ps		
//simulation time unit is 1ns and resolution is 1ps
//Author: Jianjian Song
//Date: March 16, 2011
//Purpose: ECE130 example circuit

module Gate3Gates (All, Blink, Right, Left);
input All, Blink;
output Right, Left;
wire w1;
	not U1 (w1, All);
	nand U2(Right, w1, Blink);
	or U3 (Left, All, Blink);
endmodule
