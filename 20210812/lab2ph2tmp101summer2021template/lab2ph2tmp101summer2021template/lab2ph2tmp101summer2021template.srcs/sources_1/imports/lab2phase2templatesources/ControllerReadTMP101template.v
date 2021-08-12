//File Name: ControllerReadTMP101template.v
//THIS IS TEMPLATE FOR LAB #2 PHASE 2 CONTROLLER
//Author: Jianjian Song
//Date: August 2021
//HUST Summer 2021
//Lab 2 Phase 2
//I2C Master Controller:
//1. Send Address and read until acknowledgment is received
//2. Receive one byte temperature from a TMP101
//Inputs: 
//Output: 
//ReadorWrite==1 to read
//ReadorWrite==0 to write
//Select==0 to StartStopAck
//Select==1	to choose shift register
//Go is "1" to start communication

module ControllerReadTMP101template (input Reset, clock, Start, ClockI2C, SDA,
output reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable,
output reg StartStopAck, DONE);

parameter InitialState=4'd0, StartState=4'd1, LoadState=4'd2, WriteState=4'd3, AcknowledgeState1=4'd4; 
parameter ConnectedState=4'd5, ReadState=4'd6, WaitState=4'd7, AcknowledgeState2=4'd8;
parameter TransitState=4'd9, StopState=4'd10;

reg [3:0] DataCounter; 
reg [3:0] State, NextState;

wire TimeOut;
reg StartDelayLoop;
//module DelayTimeReset(input Reset, Clock, Start, output reg Timeout);
DelayTimeReset DelayUnit(Reset, clock, StartDelayLoop,TimeOut);

wire OneShotNegative, OneShotPositive;
ClockedNegativeOneShot OneShotNegativeUnit(ClockI2C, OneShotNegative, Reset, clock);
ClockedPositiveOneShot OneShotPositiveUnit(ClockI2C, OneShotPositive, Reset, clock);

reg ACKbit;
always@(posedge clock) begin
	if(Reset==1) begin State<=InitialState; ACKbit<=1; end
	else begin State<=NextState; 
	if(OneShotPositive==1) ACKbit<=SDA; else ACKbit<=ACKbit; end
end

//next state block

//count update, negative SCL edge to write and positive SCL edge to read



//output block
always@(*)
	case(State)
	InitialState: begin end 
	StartState: begin end 
	LoadState:  begin end 
		
	WriteState: begin end 
	AcknowledgeState1: begin end 

	ConnectedState:  begin end 

	ReadState: begin end 

	WaitState: begin end 

	AcknowledgeState2: begin end 

	TransitState: begin end 

	StopState: begin end 

	default: begin end 

	endcase

endmodule
