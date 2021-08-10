`timescale 1ns / 1ps
//Tx Data Unit of serial port transmission unit
//Author: Jianjian Song
//Date: August 2021
//Purpose: Problem #8 Homework #1, Summer 2021 HUST

//Even parity: Parity=0;
//Odd parity: Parity=1;
//1-bit start, 9-bit data, 1-bit parity, 1-bit stop
//data is sent with the least significant bit first
//Load = 1 to load Data into shift register
//shiftOut = 1 to send data to Rx one bit at a time

module TxDataUnit_summer2021HUST #(parameter DataLength=9)(
input [DataLength-1:0] Data,
input Load, ShiftOut, Parity, Reset, Clock,
output Tx);

reg [11:0] ShiftRegister;
wire ParityBit;

assign Tx=ShiftRegister[0];

assign ParityBit=Parity^Data[0]^Data[1]^Data[2]^Data[3]^Data[4]^Data[5]^Data[6]^Data[7]^Data[8];
always@(posedge Clock)
	if(Reset==1 || Load==1) ShiftRegister<={ParityBit, Data, 2'b01};
	else 
	if(ShiftOut==1) ShiftRegister<={ShiftRegister[0], ShiftRegister[11:1]};
	else ShiftRegister<=ShiftRegister;
endmodule
