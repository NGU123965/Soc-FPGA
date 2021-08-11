`timescale 1ns / 1ps
//HUST Summer 2021
module I2C_SDAmodule_tb;

	reg ReadorWrite, Select, StartStopAck, ShiftOut;
	wire ShiftIn;
// Bidirs
	wire SDA;

//module I2C_SDAmodule(input ReadorWrite, Select, StartStopAck, ShiftOut,
//output ShiftIn, inout SDA);

I2C_SDAmodule uut (ReadorWrite, Select, StartStopAck, ShiftOut, ShiftIn, SDA);

	initial begin  ReadorWrite = 0;  Select = 0;  StartStopAck=1;  ShiftOut = 0;  end
	
	initial fork
	
	#0 ReadorWrite = 0; #12 ReadorWrite = 1; #34 ReadorWrite = 0; #56 ReadorWrite = 1; #78 ReadorWrite = 0; 
	#0 Select = 0;  #21 Select = 1; #35 Select = 0; #77 Select = 1; #96 Select = 0; 
	#0 StartStopAck = 1;  #38 StartStopAck =0; #43 StartStopAck = 1; #50 StartStopAck =0; #53 StartStopAck = 1;
	 #94 StartStopAck =0; #98 StartStopAck = 1;
	
	#0 ShiftOut = 0;  	#21 ShiftOut = 1; 	#34 ShiftOut = 0; 	#45 ShiftOut = 1;  	#57 ShiftOut = 0;  #87 ShiftOut = 1;
	#100 $stop;
	join
      
endmodule

