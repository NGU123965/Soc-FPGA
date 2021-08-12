`timescale 1ns / 1ps
//HUST Fall 2020
//Lab 7 Phase 1 Controller Simulation
//Change the following parameter to 3 for simulation 
//in module DelayLoop(MR,Timeout,Clock) of I2C_Controller.v 
//parameter	Divider = 3;
module I2C_Controller_phase1_tb;

	reg Go,Reset,ClockI2C,clock;

	wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck;
	wire [2:0] State=uut.State;
	wire [3:0] DataCounter=uut.DataCounter;
	wire TimeOut=uut.TimeOut;
	wire OneShotI2Cnegative=uut.OneShotI2Cnegative;
	wire OneShotI2Cpostive=uut.OneShotI2Cpositive;
//module I2C_Controller_phase1(
//input Reset, clock, Go, ClockI2C,
//output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);
	I2C_Controller_phase1 uut (Reset, clock, Go, ClockI2C, WriteLoad, 
	ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);
	
	initial begin  Go = 0;  Reset = 0;  ClockI2C = 0;  clock = 0; end
	always #4 clock=~clock;
	always #12 ClockI2C=~ClockI2C;
	initial fork
	#0 Go = 0;  #12 Go = 1;  
	#0 Reset = 1;  #6 Reset = 0; 
	#350 $stop;
	join
      
endmodule

