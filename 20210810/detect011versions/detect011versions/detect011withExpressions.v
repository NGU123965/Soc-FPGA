`timescale 1ns / 100ps

// File name	: detect011withExpressions.v
// Jianjian Song
// ECE433 Fall 2019
// If the input X is 011 with 0 being the first bit, the output Z will produce a "1"
//the detection is recursive.

module detect011Expressions(X, Z, reset, CLOCK);
input	X, reset, CLOCK;
output Z;

reg QA, QB;
wire DA,DB;

// D flip-flops
always @ (posedge CLOCK)
	if (reset==1) begin QA<=0; QB<=0; end
	else begin QA<=DA; QB<=DB; end

assign Z=QA&~QB;

assign DA= X&QB;
assign DB=~X | ~QA&QB;

endmodule
