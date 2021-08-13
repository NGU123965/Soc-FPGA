//File Name: I2C_BaudRateGenerator.v
//Author: Jianjian Song
//Date: November 2020
//HUST Fall 2020
//Inputs: Baud Rate in BaudRate, System Clock Frequency in ClockFrequency
//Output: ClockI2C is a square wave
//-------------------------------------------------------------------

module I2C_BaudRateGenerator (input Reset, clock, StartStop,
input [19:0] WaveFrequency,  //up to 1,000,000
input [29:0] ClockFrequency,
output reg  SignalOut);

reg [15:0] 	baud_count;

 always @(posedge clock)
      if(Reset==1) begin baud_count <= 16'b0;
      	     	SignalOut <= 1'b1;	//idle is "1"
					end
		else 
		case (StartStop)
		1'b0: begin SignalOut <= 1'b1; baud_count <= 16'b0; end
		1'b1: if (baud_count < (ClockFrequency/(WaveFrequency*2)-1)) 
		begin
           		baud_count <= baud_count + 1'b1;
           		SignalOut <= SignalOut;
		end
       else
		begin
					baud_count <= 16'b0;
      	     	SignalOut <= ~SignalOut;
      	end
		endcase
endmodule
