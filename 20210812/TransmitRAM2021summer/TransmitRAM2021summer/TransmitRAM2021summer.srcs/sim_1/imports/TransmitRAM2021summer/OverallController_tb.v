`timescale 1ns / 1ps

//HUST Summer 2021
//August 2021

module OverallController_tb;
	reg tx_full, en_16_x_baud, clk, reset, start;
	wire write_to_uart; wire [4:0] Address;
	OverallController uut (tx_full, en_16_x_baud, clk, reset, start, write_to_uart, Address);

initial begin clk = 0; end
initial fork
	#0 start=0; #33 start=1;  #43 start=0; #76 start=1; #128 start=0;  #153 start=1;
	#0 reset = 1; #8 reset=0; 
	#0 tx_full = 0;  #100 tx_full=1;   #150 tx_full=0;
	#0 en_16_x_baud=0;   #24 en_16_x_baud=1; #28 en_16_x_baud=0;
	#44 en_16_x_baud=1; #48 en_16_x_baud=0;  #64 en_16_x_baud=1; #68 en_16_x_baud=0;
	#84 en_16_x_baud=1; #88 en_16_x_baud=0;  #104 en_16_x_baud=1; #108 en_16_x_baud=0;
	#134 en_16_x_baud=1; #138 en_16_x_baud=0;  #154 en_16_x_baud=1; #158 en_16_x_baud=0;
	#184 en_16_x_baud=1; #188 en_16_x_baud=0;
	#240 $stop;
   join
	always #2 clk = ~clk;
endmodule

