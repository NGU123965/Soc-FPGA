`timescale 1ns / 1ps
//HUST Fall 2020
module I2C_BaudRateGenerator_tb;

	// Inputs
	reg Enable;
	reg Reset;
	reg clock;
	reg [19:0] BaudRate;
	reg [29:0] ClockFrequency;

	// Outputs
	wire ClockI2C;

//module I2C_BaudRateGenerator (input Reset, clock, StartStop,
//input [19:0] WaveFrequency,  //up to 1,000,000
//input [29:0] ClockFrequency,
//output reg  SignalOut);
	I2C_BaudRateGenerator uut (Reset,clock, Enable,BaudRate,ClockFrequency,ClockI2C);
	
	initial begin  Enable = 0;  Reset = 0;  clock = 0;  BaudRate = 2;  ClockFrequency = 10; end
	always #4 clock = ~ clock;
	
	initial fork
	#0 Reset = 0; #12 Reset = 1; #19 Reset = 0; 
	#0 Enable = 0;  #23 Enable = 1;  #89 Enable = 0;  #120 Enable = 1;
	#300 $stop;
	join
      
endmodule
