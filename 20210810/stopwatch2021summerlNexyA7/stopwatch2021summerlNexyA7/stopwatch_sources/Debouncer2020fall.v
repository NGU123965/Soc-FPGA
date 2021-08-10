// File name	: Debouncer2020fall.v
// Written by	: Jianjian Song
// ECE433 Fall 2020
// debouncing an input switch
// if (Switch==1) delay a while and test again. 
// if (switch==1) output is 1 else output is 0.
`timescale 1ns / 1ps
//ClearTimer is input to a flip-flop and therefore needs to be latched.
module Debouncer2020fall(
input   InputPulse, Reset, CLOCK,
output reg DebouncedOuput);
//State assignment
parameter InitialState=0, DelayState=1, TransitState=2, OutputState=3;
reg [1:0] State, NextState;

wire Timeout, ClearTimer;

assign ClearTimer = (State==DelayState)?1'b0:1'b1;	//run timer at State 1. Clear timer at other states

always @ (posedge CLOCK)
	if(Reset==1)	State <= InitialState;
	else	State<=NextState;
	
//state is controlled by CLOCK and therefore ClearTimer should also be controlled by CLOCK.
always@(State)
	case (State)
	0: DebouncedOuput<=0; 	//timer cleared
	1: DebouncedOuput<=0;	//timer starts running
	2: DebouncedOuput<=0; 	//timer cleared
	3: DebouncedOuput<=1; 	//timer cleared
	endcase


always@(State or InputPulse or Timeout)
	case (State)
	0:	if (InputPulse==0) NextState<=InitialState; else NextState<=DelayState;
	1:	if (Timeout==0) NextState<=DelayState; else NextState<=TransitState;
	2: if (InputPulse==0) NextState<=InitialState; else NextState<=OutputState;
	3:	if (InputPulse==0) NextState<=InitialState; else NextState<=OutputState;
	endcase

//module DelayLoop(MR,Timeout,Clock) ;

DelayLoop Timer(ClearTimer,Timeout,CLOCK);

endmodule
