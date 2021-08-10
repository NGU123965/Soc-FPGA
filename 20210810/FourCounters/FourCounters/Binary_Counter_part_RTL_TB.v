`timescale 1ns / 1ps

//Test bench for Design Example: Binary Counter
//From Chapter 7 of the Textbook by Michael D. Ciletti
//Advanced Digital Design with the Verilog HDL

module Binary_Counter_part_RTL_TB;

	reg enable, clk, rst;

	wire [3:0] counterController, counterImplicit, counterStateMachine, counterBy3;

	Binary_Counter_Part_RTL CounterDataControl (.count(counterController), .enable(enable), .clk(clk), .rst(rst));
	counterImplicit RingCounterUnit (counterImplicit, enable, clk, rst);
	CounterStateMachine CounterStateMachineUnit (counterStateMachine, enable, clk, rst);
	Binary_Counter_Part_RTL_by_3 CounterBy3 (counterBy3, enable, clk, rst);

initial begin enable=0; clk=0; rst=0; end

always #5 clk=~clk;

initial fork
	#0 rst = 1;   #34 rst=0;
	#0 enable=0; #54 enable=1; #234 enable=0; #289 enable=1;
	#337 $stop;

join
endmodule

