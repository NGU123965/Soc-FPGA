// File name	: DisplayMuxNexysA7.v
// Written by	: Jianjian Song
// ECE433 Fall 2020

`timescale 1ns / 1ps

module DisplayMuxNexysA7 #(parameter N=8)(
input [N-1:0] D7, D6, D5, D4, D3, D2, D1, D0,
input [N-1:0] Select,
input Reset, Clock,
output reg [N-1:0]	Display);

reg [N-1:0] Digit7,Digit6,Digit5, Digit4, Digit3, Digit2, Digit1, Digit0;	//stored values

always@(posedge Clock) 
	if(Reset==1) begin 
	Digit7<=0; Digit6<=0; Digit5<=0; Digit4<=0;
	Digit3<=0; Digit2<=0; Digit1<=0; Digit0<=0; end
	else 	begin 
	Digit7<=D7; Digit6<=D6; Digit5<=D5; Digit4<=D4;
	Digit3<=D3; Digit2<=D2; Digit1<=D1; Digit0<=D0; end
	
always@(Select)
	case (Select)
	8'b11111110: Display <=Digit0;
	8'b11111101: Display <=Digit1;
	8'b11111011: Display <=Digit2;
	8'b11110111: Display <=Digit3;
	8'b11101111: Display <=Digit4;
	8'b11011111: Display <=Digit5;
	8'b10111111: Display <=Digit6;
	8'b01111111: Display <=Digit7;
	default: Display <=Digit0;
	endcase
endmodule
