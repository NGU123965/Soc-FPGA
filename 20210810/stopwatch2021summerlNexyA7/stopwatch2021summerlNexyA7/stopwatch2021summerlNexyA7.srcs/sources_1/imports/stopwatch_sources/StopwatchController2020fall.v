`timescale 1ns / 1ps
//StopwatchController2020fall.v
//Stopwatch Controller
//better documented when states are named with meaningful phrases
//Author: Jianjian Song
//Date: Sept 23, 2020
//ECE433 Fall 2020
//Purpose: generate two active high control signals: run and clear. 
// if run =0 and clear=0, the stopwatch should hold.

module StopwatchController2020fall(ControlButton, Run, Clear, Reset, Clock);
input ControlButton, Reset, Clock;
output Run, Clear;
reg [1:0] State;
parameter ClearState=0, RunState=1, StopState=2, UnusedState=3;
wire ButtonOneShot, ButtonOutput;

	Debouncer2020fall ControlInput(ControlButton, Reset, Clock, ButtonOutput);
	PositiveClockedOneShot ButtonDevice(ButtonOutput, ButtonOneShot, Reset, Clock);

always@(posedge Clock or posedge Reset)
	if(Reset==1) State<=ClearState; else
	case (State)
	ClearState: if (ButtonOneShot==0) State<=ClearState; else State<=RunState;	//Clear counter
	RunState: if (ButtonOneShot==0) State<=RunState; else State<=StopState;	//count up
	StopState: if (ButtonOneShot==0) State<=StopState; else State<=ClearState;	//hold counter
	UnusedState: if (ButtonOneShot==0) State<=ClearState;
	endcase
assign Run = (State==RunState);
assign Clear = (State==ClearState);

endmodule
