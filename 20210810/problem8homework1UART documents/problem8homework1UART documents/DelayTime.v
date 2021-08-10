`timescale 1ns / 1ps
// File name	: DelayTime.v
// Written by	: Jianjian Song
// Delay the number of clock cycles as speficied in Speed
// Start=1 to start
// Start=0 to clear and hold

module DelayTime(Start, Speed, Timeout,Reset, Clock);
//delay time in number of clock cycles as speficied by Speed
parameter 	NumberOfBits = 4;
input			Start, Reset, Clock;
input 	[NumberOfBits-1:0] Speed;
output reg	Timeout;
reg 	[NumberOfBits-1:0] count;
	
always @ (count or Speed)
	if(count==(Speed-1'b1)) Timeout<=1'b1;
	else Timeout<=0;
	
always @ (posedge Clock)
	if(Reset==1) count<=4'd0;
	else if(Start==0)		begin count <= 4'd0; end
	else if (count>=(Speed-1'b1))	count<=4'd0;
		else count <= count+1'b1;
endmodule
