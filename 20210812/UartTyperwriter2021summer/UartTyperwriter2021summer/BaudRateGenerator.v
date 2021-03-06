//File Name: BaudRateGenerator.v
//Author: Jianjian Song
//Date: August 2021
//HUST Summer 2021
//Inputs: Baud Rate in BaudRate, System Clock Frequency in ClockFrequency
//Output: uartClock, a clock that is 16 times faster than the uart bit speed
//-------------------------------------------------------------------

module BaudRateGenerator (uartClock, Reset, clock, BaudRate, ClockFrequency);
input Reset, clock;
input [19:0] BaudRate;  //up to 1,000,000
input [29:0] ClockFrequency; //up to 1GHz

output reg  uartClock; 
reg [15:0] 	baud_count;

 always @(posedge clock)
      if(Reset==1) begin baud_count <= 1'b0;
      	     	uartClock <= 1'b1;
					end
	//	else if (baud_count == 8) 
		else if (baud_count == ClockFrequency/(BaudRate*16)) 
		begin
           		baud_count <= 1'b0;
      	     	uartClock <= 1'b1;
		end
       else
		begin
           		baud_count <= baud_count + 1'b1;
           		uartClock <= 1'b0;
      	end
endmodule
