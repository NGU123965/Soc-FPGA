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

module I2C_Controller_phase1_ZMJ(
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

wire start;
assign start = Go && ClockI2C;

//flip-flop storage block
always @ (posedge clock) State <= (Reset ? InitialState : NextState);

//next state block
always @ (*) begin
    NextState = State;
    case(State)
        InitialState:       NextState = start               ?   StartState          :   InitialState;
        StartState:         NextState = TimeOut             ?   LoadState           :   StartState;
        LoadState:          NextState = (DataCounter == 9)  ?   WriteState          :   LoadState;
        WriteState:         NextState = (DataCounter == 1)  ?   AcknowledgeState    :   WriteState;
        AcknowledgeState:   NextState = OneShotI2Cpositive  ?   TransitState        :   AcknowledgeState;
        TransitState:       NextState = TimeOut             ?   StopState           :   TransitState;
        StopState:          NextState = TimeOut             ?   InitialState        :   StopState;
        default:            NextState = NextState;
    endcase
end

//counting the number of shifts
always @ (posedge clock) begin
    case(State)
        InitialState:begin
            DataCounter     <= 10;
        end
        StartState:begin
            DataCounter     <= 10;
        end
        LoadState:begin
            DataCounter     <= OneShotI2Cnegative ? DataCounter - 1 : DataCounter;
        end
        WriteState:begin
            DataCounter     <= OneShotI2Cnegative ? DataCounter - 1 : DataCounter;
        end
        AcknowledgeState:begin
            DataCounter     <= 10;
        end
        TransitState:begin
            DataCounter     <= 10;
        end
        StopState:begin
            DataCounter     <= 10;
        end
        default:begin
            DataCounter     <= DataCounter;
        end
    endcase
end

//output block
always @ (*) begin
    case(State)
        InitialState:begin
            BaudEnable      <= 0;
            ReadorWrite     <= 0;
            WriteLoad       <= 0;
            Select          <= 0;
            ShiftorHold     <= 0;
            StartStopAck    <= 1;
            ClearDelayLoop  <= 1;
        end
        StartState:begin
            BaudEnable      <= 0;
            ReadorWrite     <= 0;
            WriteLoad       <= 0;
            Select          <= 0;
            ShiftorHold     <= 0;
            StartStopAck    <= 0;
            ClearDelayLoop  <= 0;
        end
        LoadState:begin
            BaudEnable      <= 1;
            ReadorWrite     <= 0;
            WriteLoad       <= 1;
            Select          <= 0;
            ShiftorHold     <= 0;
            StartStopAck    <= 0;
            ClearDelayLoop  <= 1;
        end
        WriteState:begin
            BaudEnable      <= 1;
            ReadorWrite     <= 0;
            WriteLoad       <= 0;
            Select          <= 1;
            ShiftorHold     <= OneShotI2Cnegative;
            StartStopAck    <= 0;
            ClearDelayLoop  <= 1;
        end
        AcknowledgeState:begin
            BaudEnable      <= 1;
            ReadorWrite     <= 1;
            WriteLoad       <= 0;
            Select          <= 0;
            ShiftorHold     <= 0;
            StartStopAck    <= 0;
            ClearDelayLoop  <= 1;
        end
        TransitState:begin
            BaudEnable      <= 0;
            ReadorWrite     <= 0;
            WriteLoad       <= 0;
            Select          <= 0;
            ShiftorHold     <= 0;
            StartStopAck    <= 0;
            ClearDelayLoop  <= 0;
        end
        StopState:begin
            BaudEnable      <= 0;
            ReadorWrite     <= 0;
            WriteLoad       <= 0;
            Select          <= 0;
            ShiftorHold     <= 0;
            StartStopAck    <= 1;
            ClearDelayLoop  <= 0;
        end
        default:begin
            BaudEnable      <= BaudEnable;
            ReadorWrite     <= ReadorWrite;
            WriteLoad       <= WriteLoad;
            Select          <= Select;
            ShiftorHold     <= ShiftorHold;
            StartStopAck    <= StartStopAck;
            ClearDelayLoop  <= ClearDelayLoop;
        end
    endcase
end

endmodule