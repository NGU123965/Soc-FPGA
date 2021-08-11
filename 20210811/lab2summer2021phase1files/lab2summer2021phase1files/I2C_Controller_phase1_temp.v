`timescale 1ns / 1ps

//This is a template from the instructor
//File Name: I2C_Controller_phase1_temp.v
//Author: Jianjian Song
//Date: August 2021
//HUST summer 2021
//ControllerI2C for I2C Master Circuit
//Inputs: 
//Output: 
//ReadorWrite==1 to read
//ReadorWrite==0 to write
//Go is "1" to start communication

module I2C_Controller_phase1_temp(
input Reset, clock, Go, ClockI2C,
output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck);

parameter InitialState=3'd0, StartState=3'd1, LoadState=3'd2, WriteState=3'd3, AcknowledgeState=3'd4; 
parameter TransitState=3'd5, StopState=3'd6;

reg [3:0] DataCounter; 
reg [2:0] State, NextState;

wire TimeOut;
reg ClearDelayLoop;

//module DelayTimeReset(input Reset, Clock, Start, output reg Timeout);
DelayTimeReset  DelayUnit(Reset, clock, ClearDelayLoop, TimeOut);

wire OneShotI2Cnegative, OneShotI2Cpositive;
ClockedNegativeOneShot OneShotUnitNeg(ClockI2C, OneShotI2Cnegative, Reset, clock) ;
ClockedPositiveOneShot OneShotUnitPos(ClockI2C, OneShotI2Cpositive, Reset, clock) ;


//flip-flop storage block

	
//next state block


//counting the number of shifts


//output block


endmodule
