`timescale 1ns / 1ps
//HUST summer 2021
//These are simulation parameters. 
//in lab2I2Cphase1summer2021JJS.v
//parameter BaudRate=2, ClockFrequency=20;
//assign clk60MHz=clock;
//SystemClock60MHz SystemClock(clock,clk60MHz,ClockLocked);
//Change the delay loop to 3 counts in DelayUnit of Control Unit 

module Lab2I2Cphase1summe2021ZMJ_tb;
	reg Go, Reset, clock;
	wire SCL, ClockLocked;
	// Bidirs
	wire SDA;
	wire [2:0] State=DUT.ControlUnit.State;
	wire OneShotI2Cnegative=DUT.ControlUnit.OneShotI2Cnegative;
	wire OneShotI2Cpositive=DUT.ControlUnit.OneShotI2Cpositive;	
	wire [3:0] count=DUT.ControlUnit.DataCounter;

//module Lab7I2Cphase1summer2021JJS (
//input Reset, clock, Go,
//output SCL, ClockLocked, inout SDA);

	Lab2I2Cphase1summer2021ZMJ DUT(Reset, clock, Go, SCL, ClockLocked, SDA);

	initial begin Go = 0;  Reset = 0;  clock = 0; end
	always #2 clock=~clock;
	initial fork
	#0 Reset=1;  #12 Reset=0;
	#0 Go=0;  #21 Go=1;     #61 Go=0;   #470 Go=1;  #479 Go=0;
	#600 $stop;
	join
      
endmodule

