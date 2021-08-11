`timescale 1ns / 1ps
//HUST Fall 2020
module I2C_ShiftRegister_tb;

	reg WriteLoad;
	reg [7:0] SentData;
	reg ShiftIn, ShiftorHold, Reset, CLOCK;

	wire [7:0] ReceivedData;
	wire ShiftOut;

//module I2C_ShiftRegister #(parameter LENGTH = 8)(
//input	Reset, CLOCK, WriteLoad, ShiftorHold, ShiftIn,
//input	[LENGTH-1:0]	SentData,
//output ShiftOut,
//output [LENGTH-1:0]	ReceivedData);


I2C_ShiftRegister uut (Reset, CLOCK, WriteLoad, ShiftorHold,  ShiftIn, SentData, ShiftOut,ReceivedData);

	initial begin  WriteLoad = 0;  SentData = 0;  ShiftIn = 0;   ShiftorHold = 0; Reset = 0;  CLOCK = 0; end
	always #3 CLOCK=~CLOCK;
	
	initial fork
	#0 Reset = 0;  #2 Reset = 1;  #6 Reset = 0;  
	#0 WriteLoad = 0;  #7 WriteLoad = 1; #11 WriteLoad = 0; #53 WriteLoad = 1;  #61 WriteLoad = 0; 
	#0 SentData = 8'b10101011;    	#44 SentData = 8'b11011010;  
	#0 ShiftIn = 1;   #13 ShiftIn = 1;   #19 ShiftIn = 0;   #24 ShiftIn = 1;   #38 ShiftIn = 0;    #46 ShiftIn = 1;
	#67 ShiftIn = 0; #98 ShiftIn = 1;
	#0 ShiftorHold = 0;   #12 ShiftorHold = 1;    #36 ShiftorHold = 0;  
	#41 ShiftorHold = 1; #77 ShiftorHold = 0;  
	#80 $stop;
	join
endmodule
