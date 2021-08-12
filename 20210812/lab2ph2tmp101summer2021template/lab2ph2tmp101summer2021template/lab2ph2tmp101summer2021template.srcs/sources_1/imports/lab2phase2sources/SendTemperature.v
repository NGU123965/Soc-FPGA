`timescale 1ns / 1ps
//overall controller for Transmit temperature to a serial port
//HUST Summer 2021
//Jianjian Song
//August 2021
//starting Address == 0
//Start is high to start transmitting memory content from address 0
//until data==NULL is reached
//Repeat if Start==1

module SendTemperature #(parameter AddressBits=7)(
input Start, tx_full, reset, clock, input [7:0] data,
output reg write_to_uart, Transmitting,
output reg [AddressBits-1:0] Address);

parameter StartingAddress={(AddressBits){1'b0}};
parameter NULL=0, No=1, Yes=0;

reg [1:0] State;
parameter InitialState=2'd0, TransmitState=2'd1, WaitState=2'd2, TransitState=2'd3;

//module ClockedPositiveOneShot(InputPulse, OneShot, Reset, CLOCK) ;

ClockedPositiveOneShot OneShotUnit(Start, StartOneShot, reset, clock);

//Transmitting is status bit to see when to start and when to stop
always@(posedge clock)
	if(reset==1) Transmitting<=0;
	else if (StartOneShot==1) Transmitting<=1;
	else if((Transmitting==1) && (data==NULL)) Transmitting<=0;
	   else Transmitting<=Transmitting;

reg StartDelay;
wire Timeover;
always@(posedge clock)
	if (reset==1) begin write_to_uart<=0; Address<=StartingAddress; State<=InitialState; StartDelay<=No; end
	else 
	case (State)
	InitialState: begin write_to_uart<=0; Address<=StartingAddress; StartDelay<=No;
	   if (Transmitting==0)  State<=InitialState; else State<=WaitState; end
    WaitState: begin write_to_uart<=0; Address<=Address; StartDelay<=Yes;
        if(Timeover==0) State<=WaitState; else State<=TransitState;
        end
    TransmitState: begin write_to_uart<=1; Address<=Address+1'b1; StartDelay<=1; State<=WaitState; StartDelay<=No; end
    TransitState: begin write_to_uart<=1'b0;  Address<=Address; StartDelay<=No;
        if(Transmitting==0) State<=InitialState; else if (tx_full==1) State<=WaitState; 
        else State<=TransmitState; end
	endcase

//module DelayTimeReset(input Reset, Clock, Start, output reg Timeout);
DelayTimeReset delaytime(reset,clock,StartDelay,Timeover);
		
endmodule
