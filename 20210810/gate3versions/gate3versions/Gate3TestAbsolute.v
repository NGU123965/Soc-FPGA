`timescale 1ns / 1ps

//Jianjian Song
//12 March 2011
//ECE130 Spring 2011

module Gate3TestAbsolute;
reg all1, blink1;	// Inputs
wire RightGates, LeftGates;	// Outputs
wire RightBehavior, LeftBehavior;
wire RightTable, LeftTable;
wire RightAssign, LeftAssign;
wire NOT_output = Gate3GateChip.w1;	//internal wire of a device under test (DUT)

	initial fork
// Initialize Inputs
		#0 	all1 = 0;	#3		all1 = 1; 	#7		all1 = 0;
		#0		blink1 = 0;	#12	blink1 = 1;	#17	blink1 = 0;	
		#20	blink1 = 1;	#25	blink1 = 0;
		#28	$stop;
	join
	
// Associate the test bench with a device under test (DUT)
	Gate3Gates Gate3GateChip ( .Blink(blink1), .Left(LeftGates), .Right(RightGates), .All(all1));
   Gate3Expression Gate3ExpressionChip (all1, blink1, RightBehavior, LeftBehavior);
	Gate3Table Gate3TableChip (all1, blink1, RightTable, LeftTable);
	Gate3Assign Gate3AssignChip (all1, blink1, RightAssign, LeftAssign);
		
endmodule
