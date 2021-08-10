// File name	: UniversalCounter.v
// Written by	: Jianjian Song
// 4-bit universal bidirectional counter
`timescale 1ns / 1ps

module UniversalCounter(P,Q,S1,S0,MR,TerminalCount, CLOCK) ;
parameter	LENGTH = 4;
parameter EndCount = 9;
parameter BeginCount = 0;
input		S1, S0, MR, CLOCK;
input	[LENGTH-1:0]	P;
output 	reg [LENGTH-1:0]	Q;
output reg TerminalCount;	//TerminalCount=1 when the counter wraps around
reg	[LENGTH-1:0]	NextQ;

always @ (posedge CLOCK)
	if(MR==1)	Q <= 0;
	else	Q<=NextQ;

always@(Q or S1 or S0 or P)
	case ({S1,S0})
	0:	NextQ <= Q;	// hold
	1:	if (Q>=EndCount) NextQ<=0;
		else NextQ <= Q+1'b1;
	2:	if (Q<=BeginCount) NextQ<=EndCount;
		else NextQ <= Q-1'b1;
	3:	NextQ <= P;				// parallel load
	endcase
	
	always@(Q or S1 or S0)
	case ({S1,S0})
	0:	TerminalCount<=0;
	1:	if (Q==EndCount) TerminalCount<=1;
		else TerminalCount<=0;
	2:	if (Q==BeginCount) TerminalCount<=1;
		else TerminalCount<=0;
	3:	TerminalCount<=0;
	endcase
endmodule
