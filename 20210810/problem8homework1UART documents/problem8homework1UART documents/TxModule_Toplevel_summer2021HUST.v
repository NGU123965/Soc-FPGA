`timescale 1ns / 1ps
//Author: Jianjian Song
//Date: August 2021
//Purpose: Problem #8 Homework #1, summer 2021 HUST

// TxModule_Toplevel_summer2021HUST.v
//uart transmission unit with data unit and controller
module TxModule_Toplevel_summer2021HUST(input Start, Parity, Reset, Clock,
input [8:0] Data,
input [3:0] Speed,	//baud in the number of clock cycles
output Tx);

wire Load, ShiftOut;

//module TxController_summer2021HUST(input Start, Reset, Clock,
//input [3:0] Speed,
//output reg Load, ShiftOut,
//reg [4:0] BitCount);


TxController_summer2021HUST ControlUnit(Start, Reset, Clock, Speed, Load, ShiftOut);

//module TxDataUnit_summer2021HUST #(parameter DataLength=9)(
//input [DataLength-1:0] Data,
//input Load, ShiftOut, Parity, Reset, Clock,
//output Tx);

TxDataUnit_summer2021HUST DataUnit(Data, Load, ShiftOut, Parity, Reset, Clock, Tx);

endmodule
