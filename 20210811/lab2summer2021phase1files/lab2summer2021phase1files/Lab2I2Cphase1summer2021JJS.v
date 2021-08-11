//File Name: Lab2I2Cphase1summer2021JJS.v
//Author: Jianjian Song
//Date: August 10, 2021
//HUST Summer 2021
//Phase 1 of Lab #2 I2C driver and TMP101 temperature sensor
//send first byte to I2C bus with slave address
//Output: 
//Go is "1" to start communication

module Lab2I2Cphase1summer2021JJS (input Reset, clock, Go,
output SCL, ClockLocked, inout SDA);
//send this byte as address
parameter FirstByte=8'b10010110;
//I2C speed frequency and system clock frequency
//parameter BaudRate=20'd15000, ClockFrequency=30'd60000000;
wire clk60MHz;

//These are simulation parameters. 
//Comment the following two lines before making bit stream file
parameter BaudRate=2, ClockFrequency=20;
assign clk60MHz=clock;

//disable SystemClock60MHz to simulate this circuit
//SystemClock60MHz SystemClock(.clk_in125MHz(clock),.clk_out60MHz(clk60MHz),.locked(ClockLocked));

wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck;

//module I2C_BaudRateGenerator (input Reset, clock, StartStop,
//input [19:0] WaveFrequency,  //up to 1,000,000
//input [29:0] ClockFrequency,
//output reg  SignalOut);

I2C_BaudRateGenerator  BaudUnit(Reset, clk60MHz, BaudEnable, BaudRate, ClockFrequency,  SCL);

//module I2C_Controller_phase1(
//input Reset, clock, Go, ClockI2C,
//output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);


I2C_Controller_phase1  ControlUnit(Reset, clk60MHz, Go, SCL,
WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);

//module I2C_DataUnit #(parameter	LENGTH = 8) (
//input Reset, clock, WriteLoad, ReadorWrite, ShiftorHold, Select, StartStopAck,
//input	[LENGTH-1:0]	SentData,
//output [LENGTH-1:0]	ReceivedData, inout SDA);

wire [7:0] ReceivedData;
I2C_DataUnit DataUnit(Reset, clk60MHz, WriteLoad, ReadorWrite, ShiftorHold, Select, StartStopAck, FirstByte, 
ReceivedData, SDA);

endmodule
