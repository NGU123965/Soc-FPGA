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
`define NO 1
`define YES 0
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
always@(posedge clock) begin
	case (State)
		InitialState: begin
			BaudEnable <=0;
			ReadorWrite<=0;
			WriteLoad<=0;
		    Select<=0;
			ShiftorHold<=0;
			StartStopAck<=1;
			StartDelayLoop<=`NO;
			DONE<=0;
		end 
		StartState: begin
			BaudEnable<=0;
			ReadorWrite<=0;
			WriteLoad<=0;
			Select<=0;
			ShiftorHold<=0;
			StartStopAck<=0;
			StartDelayLoop<=`YES;			
		end 
		LoadState:  begin 
			BaudEnable<=1;
			ReadorWrite<=0;
			WriteLoad<=1;
			Select<=0;
			ShiftorHold<=0;
			StartStopAck<=0;	
			StartDelayLoop<=`NO;
		end 
		WriteState: begin
			BaudEnable<=1;
			ReadorWrite<=0;
			ShiftorHold<=OneShotNegative;
			WriteLoad<=0;
			Select<=1;
			StartStopAck<=0;
			StartDelayLoop=`NO;	
		end 
		AcknowledgeState1: begin 
			BaudEnable<=1;
			ReadorWrite<=1;
			WriteLoad<=0;
			Select<=0;
			ShiftorHold<=0;
			StartStopAck<=0;
			StartDelayLoop<=`NO;	
		end 
		ConnectedState:  begin	
		end 
		ReadState: begin 
			BaudEnable<=1;
			ReadorWrite=1;
			WriteLoad<=0;
			ShiftorHold<=OneShotPositive;
			Select<=1;
			DONE<=0;
			StartStopAck<=0;
			StartDelayLoop<=`NO;	
		end 

		WaitState: begin 
			BaudEnable<=1;
			ReadorWrite<=1;
			WriteLoad<=0;
			Select<=0;
			ShiftorHold<=0;
			StartStopAck<=1;
			StartDelayLoop<=`NO;
			DONE<=0;
		end 

		AcknowledgeState2: begin 
			BaudEnable<=1;
			ReadorWrite<=0;
			WriteLoad<=0;
			Select<=0;
			ShiftorHold<=0;
			StartStopAck<=0;
			DONE<=0;
			StartDelayLoop<=`NO;
		end 

		TransitState: begin
			BaudEnable<=0;
			ReadorWrite<=0;
			WriteLoad<=0;
			Select<=0;
			ShiftorHold<=0;
			StartStopAck<=0;
			DONE<=0;
			StartDelayLoop<=`YES;
		end 

		StopState: begin
			BaudEnable<=0;
			ReadorWrite<=0;
			WriteLoad<=0;
			Select<=0;
			ShiftorHold<=0;
			StartStopAck<=1;
			DONE<=1;
			StartDelayLoop<=`YES;
		end
		endcase
	
end
always @(posedge clock) begin
	case (NextState)
		InitialState: begin
			if(Start ==1 && ClockI2C ==1)
				NextState<=StartState;
			else NextState<=InitialState;
		end
		StartState:begin
			if(TimeOut==1)
				NextState<=LoadState;
			else NextState<=StartState;
		end
		LoadState:begin
			if(DataCounter == 9)
				NextState <=WriteState;
			else NextState<=LoadState;
		end
		WriteState:begin
			if(DataCounter ==1)
				NextState<=AcknowledgeState1;
			else NextState<=WriteState;
		end
		AcknowledgeState1:begin
			if(OneShotPositive ==1 )
				NextState<=ConnectedState;
			else NextState<=AcknowledgeState1;	
		end
		ConnectedState:begin
			if(ACKbit == 1 ) 
				NextState<=InitialState;
			else if(SDA == 0) 
				NextState<=ReadState;
			else NextState <= StartState;
		end
		ReadState:begin
			if(DataCounter==2)
				NextState<=WaitState;
			else NextState<=ReadState;
		end
		WaitState:begin
			if(OneShotNegative)
				NextState<=AcknowledgeState2;
			else NextState<=WaitState;
		end
		AcknowledgeState2:begin
			if(OneShotPositive==1)
				NextState<=TransitState;
			else NextState<=AcknowledgeState2;
		end
		TransitState:begin
			if(TimeOut==1)
				NextState <=StopState;
			else NextState <=TransitState;
		end
		StopState:begin
			if(TimeOut==1)
				NextState<=InitialState;
			else NextState<=StopState;
		end
		default: NextState<=InitialState;
		endcase
end
//next state block

//count update, neSgative SCL edge to write and positive SCL edge to read
always @(posedge clock) begin
	case (State)
		LoadState: if(OneShotNegative) 
					DataCounter<=DataCounter-1;
		WriteState: if(OneShotNegative) 
					DataCounter<=DataCounter-1;
		ReadState:if(OneShotNegative) 
					DataCounter<=DataCounter-1;
		default: DataCounter <=10;
	endcase
end

//output block
endmodule