// File name	: SevenSegDriverNexysA7.v
// Written by	: Jianjian Song
// ECE433 Fall 2020
// Driver for eight 7-segment display on Nexys A7
`timescale 1ns / 1ps

module SevenSegDriverNexysA7 #(parameter N=8)(
input [N-1:0] D7, D6,D5, D4, D3, D2, D1, D0,
input Reset, Clock,
output [N-1:0]	Display,
output [N-1:0] Select);

//DisplayMuxNexysA7 #(parameter N=8)(
//input [N-1:0] D7, D6, D5, D4, D3, D2, D1, D0,
//input [N-1:0] Select,
//input Reset, Clock,
//output reg [N-1:0]	Display);
  DisplayMuxNexysA7 DisplayInput(D7, D6, D5, D4, D3, D2, D1, D0, Select, Reset, Clock, Display) ;

//module Refreshing7Seg #(parameter	Bits = 8) (
//input		Reset, CLOCK,
//output reg [Bits-1:0]	Transistors);
  Refreshing7SegNexysA7 Update(Reset, Clock, Select) ;
 
endmodule
