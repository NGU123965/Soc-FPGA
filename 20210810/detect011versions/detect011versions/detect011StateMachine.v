`timescale 1ns / 100ps

// File name	: detect011StateMachineV2.v
// Jianjian Song
// ECE433 Fall 2019
// If the input X is 011 with 0 being the first bit, the output Z will produce a "1"
// The detection is recursive.

module detect011StateMachineV2(X, Z, RESET, CLOCK, CurrentState);
input	X, RESET, CLOCK;
output reg Z;
// State variables
output reg [1:0] CurrentState;

// State codes
parameter	State1 = 2'b00, State0 = 2'b01, State011 = 2'b10, State01 = 2'b11;


// Output logic
always @ (CurrentState)
	if (CurrentState == State011) Z <= 1;
	else Z <= 0;

// State registers
always @ (posedge CLOCK)
	if (RESET==1) 
		CurrentState <= State1;
	else
	case (CurrentState)
	State1:	begin
			if (X==0) CurrentState <= State0;
			else CurrentState <= State1;
		end
	State0:	begin
			if (X==0) CurrentState <= State0;
			else CurrentState <= State01;
		end
	State011:	begin
			if (X==0) CurrentState <= State0;
			else CurrentState <= State1;
		end
	State01:	begin
			if (X==0) CurrentState <= State0;
			else CurrentState <= State011;
		end
	endcase

endmodule
