`timescale 1ns / 1ps
// File Name: Stopwatch2021summerNexysA7.v
// Jianjian Song
// Summer 2021 HUST
//Date: Sept 23, 2020
// Four-digit stopwatch with 10ms precision on the Nexys A7 board
// Press BTNU to start, stop and clear the stopwatch.
// Press BTND to reset it.
module Stopwatch2021summerNexysA7 (
input Clock, ControlButton, Reset,
output [7:0] Transistors,
output [7:0] Display);
wire [3:0] Digit3, Digit2, Digit1, Digit0;	//
wire [7:0] SevenSegment3, SevenSegment2, SevenSegment1, SevenSegment0 ;
parameter ParallelLoad = 4'b0000;
wire Run, Clear, Pulse10ns; //Run==1 to count, Run==0 to hold, Clear==1 to clear counter
wire Digit0Carry, Digit1Carry, Digit2Carry;

	Pulse10millisecond Generate10msPulse(Reset,Pulse10ns,Clock);
//module StopwatchController2020fall(ControlButton, Run, Clear, Reset, Clock);
	StopwatchController2020fall Controller(ControlButton, Run, Clear, Reset, Clock);
//module UniversalCounter(P,Q,S1,S0,MR,TerminalCount, CLOCK) ;
//digit 0
	UniversalCounter Digit0Counter(ParallelLoad,Digit0,Clear,
	Run&Pulse10ns || Clear, Reset,Digit0Carry,Clock);
	
	BCDto7Segment SevenSegDisplay0 (Digit0,SevenSegment0);
//digit 1
	UniversalCounter Digit1Counter(ParallelLoad,Digit1,Clear,
	Digit0Carry&Pulse10ns || Clear, Reset,Digit1Carry,Clock);
	
	BCDto7Segment SevenSegDisplay1 (Digit1,SevenSegment1);
//digit 2
	UniversalCounter Digit2Counter(ParallelLoad,Digit2,Clear,
	Digit1Carry&Pulse10ns || Clear, Reset,Digit2Carry,Clock);
	
	BCDto7Segment SevenSegDisplay2 (Digit2,SevenSegment2);
//digit 3
	UniversalCounter Digit3Counter(ParallelLoad,Digit3,Clear,
	Digit2Carry&Pulse10ns || Clear, Reset, ,Clock);

	BCDto7Segment SevenSegDisplay3 (Digit3,SevenSegment3);
//module SevenSegDriverNexysA7 #(parameter N=8)(
//input [N-1:0] D7, D6,D5, D4, D3, D2, D1, D0,
//input Reset, Clock,
//output [N-1:0]	Display,
//output [N-1:0] Select);
wire [3:0] Select;  //place holder so that the upper four digits will not be active
	SevenSegDriverNexysA7 DriverUnit( , , , , SevenSegment3, SevenSegment2, SevenSegment1, 
	SevenSegment0, Reset, Clock, Display, {Select,Transistors[3:0]});
endmodule
