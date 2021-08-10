`timescale 1ns / 100ps

// File name	: detect011TB.v
// Jianjian Song
//ECE433 Fall 2019
// If the input X is 011 with 0 being the first bit, 
//the output Z will produce a "1". The detection is recursive.

module detect011_test_circuit;
reg X, R, clk;
wire Zstate, Zexp, Zversion2;
wire [1:0] CurrentState,StateV2;
wire [1:0] Nextstate= UnitV1.NextState;
wire [1:0] StateExp= {UnitExpressions.QA,UnitExpressions.QB};

initial begin #0 clk=0; end	//initial value for input clock
always #10 clk=~clk;	//generate a periodic signal as clock

	initial fork	//absolute time instances
		#0  R=0; #15 R = 1;  #43 R=0; #340 R=1;
		#0 X=1;   #22 X=0; #42 X=1;   #67 X=0;  
		#103 X=1;  #121 X=0;  #143 X=1; 
		#215 X=0; #242 X=1; #284 X=0;
		#380 $stop;
	join
	
detect011StateMachineV1 UnitV1(X, Zstate, R, clk, CurrentState);
detect011Expressions UnitExpressions(X, Zexp, R, clk);
detect011StateMachineV2 UnitV2(X, Zversion2, R, clk, StateV2);

endmodule
