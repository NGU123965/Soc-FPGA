`timescale 1ns / 1ps		//simulation time unit is 1ns and resolution is 1ps
//Author: Jianjian Song
//Date: October 24, 2011
//Purpose: ECE130 example circuit

module Gate3Table (All, Blink, Right, Left);
input All, Blink;
output reg Right, Left;

	always @(All, Blink)
		case({All,Blink})
		0: {Right,Left}=2'b10;
		1: {Right,Left}=2'b01;
		2: {Right,Left}=2'b11;
		3: {Right,Left}=2'b11;
		endcase
endmodule
