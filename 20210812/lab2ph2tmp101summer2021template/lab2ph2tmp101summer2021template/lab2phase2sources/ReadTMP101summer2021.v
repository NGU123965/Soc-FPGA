//File Name: ReadTMP101summer2021.v
//Author: Jianjian Song
//Date: August 2021
//HUST Summer 2021
//Read one TMP101 temperature sensors
//send first byte to I2C bus with slave address
//Receive first byte from I2C bus as temperature
//display two 2-digit temperatures in Fahrenheit 
//on 4-digit 7-segment display 


module ReadTMP101summer2021(input Reset, clock, Start,
input [7:0] FirstByte,
input [19:0] BaudRate,
input [29:0] ClockFrequency,
output DONE, SCL, 
inout SDA,
output [7:0] ReceivedData);

wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck;

//module I2C_BaudRateGenerator (input Reset, clock, StartStop,
//input [19:0] WaveFrequency,  //up to 1,000,000
//input [29:0] ClockFrequency,
//output reg  SignalOut);

I2C_BaudRateGenerator BaudRateUnit(Reset, clock, BaudEnable, BaudRate, ClockFrequency, SCL);

//module ControllerReadTMP101 (input Reset, clock, Start, ClockI2C, SDA,
//output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable,
//output reg StartStopAck, DONE);


ControllerReadTMP101  ControlUnit(Reset, clock, Start, SCL, SDA, WriteLoad, ReadorWrite, 
	ShiftorHold, Select, BaudEnable, StartStopAck, DONE);

//module I2C_DataUnit #(parameter	LENGTH = 8) (
//input Reset, clock, WriteLoad, ReadorWrite, ShiftorHold, Select, StartStopAck,
//input	[LENGTH-1:0]	SentData,
//output [LENGTH-1:0]	ReceivedData, inout SDA);

I2C_DataUnit DataUnit(Reset, clock, WriteLoad, ReadorWrite, ShiftorHold, Select, StartStopAck,
FirstByte, ReceivedData, SDA);

endmodule

