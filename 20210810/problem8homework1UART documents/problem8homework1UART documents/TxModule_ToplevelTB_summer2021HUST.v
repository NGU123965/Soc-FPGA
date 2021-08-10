`timescale 1ns / 1ps
//Author: Jianjian Song
//Date: August 2021
//Purpose: Problem #8 Homework #1, Summer 2021 HUST

module TxModule_ToplevelTB_summer2021HUST;

	// Inputs
	reg Start;
	reg [8:0] Data;
	reg [3:0] Speed;
	reg Parity, Reset, Clock;
	
	wire Tx;
//module TxModule_Toplevel_summer2021HUST(input Start, Parity, Reset, Clock,
//    input [8:0] Data,
//    input [3:0] Speed,    //baud in the number of clock cycles
//    output Tx);

	TxModule_Toplevel_summer2021HUST TopLevel (Start, Parity, Reset, Clock, Data, Speed, Tx);

	initial begin Start = 0; Data = 0; Speed = 0; Parity = 0; Reset = 0; Clock = 0; end
	always #4 Clock=~Clock;
	initial fork
	#0 Reset = 1;  #14 Reset = 0;  
	#0 Start = 0; #23 Start = 1;  #45 Start = 0; #388 Start = 1; #403 Start = 0; 
	#0 Data = 9'b100101110;    #298 Data = 9'b101010110; 
	#0 Speed = 2;  #349 Speed = 3;  
	#0 Parity = 1;  #200 Parity = 0; 
   #650 $stop;
	join
	
endmodule

