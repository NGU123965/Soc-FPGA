`timescale 1ns / 1ps

//set delay time in delay loop to be 3 for simulation and a large number for actual delay

module StopwatchController2020fallTB;
reg ControlButton, Reset, Clock;
wire Run, Clear;
wire State=uut.State, OneShot=uut.ButtonOneShot;
	StopwatchController2020fall uut (ControlButton, Run, Clear, Reset, Clock);
	initial begin ControlButton = 0; Reset = 0; Clock = 0; end
   initial fork
	#0 Reset = 1; #23 Reset=0;
	#10 ControlButton = 1; #35 ControlButton = 1; #47 ControlButton = 1; 
	#64 ControlButton = 0; #112 ControlButton = 1; #145 ControlButton = 1; 
	#146 ControlButton = 1; #210 ControlButton = 0; #243 ControlButton = 1; 
	#289 ControlButton = 1; #312 ControlButton = 1; #378 ControlButton = 0; 
	#393 ControlButton = 1; #475 ControlButton = 0; #489 ControlButton = 1; 
	#579 $stop;
	join
	always #10 Clock = ~Clock;
	
endmodule

