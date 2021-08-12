`timescale 1ns / 1ps
//overall controller for Transmit Test. en_16_x_baud is one shot
//HUST Summer 2021
//August 2021
//Jianjian Song
module OverallController #(parameter AddressBits=5, NumberOfLines=21) (
input tx_full, en_16_x_baud, clk, reset, start,
output reg write_to_uart, output reg[AddressBits-1:0] Address); 

parameter initialState=2'd0, waitState=2'd1, transmitState=2'd2; 
reg [1:0] state;

//state transitions
always@(posedge clk) begin
    if(reset==1) state<=initialState;else
    case (state)
    initialState: if(start==0) state<=initialState; else state<=waitState;
    waitState:  if (tx_full==0 && en_16_x_baud==1) state<=transmitState; else state<=waitState;
    transmitState: if (Address==NumberOfLines) state<=initialState; else state<=waitState;	
    default: state<=initialState;
    endcase
 end
 //output
 always@(posedge clk)
    case (state)
    initialState: begin write_to_uart<=0; Address<=0; end
    waitState: begin write_to_uart<=0; Address<=Address; end
    transmitState: begin write_to_uart<=1;
        if(Address==NumberOfLines) Address<=0; else Address<=Address+1'b1; 	end //generate a one shot
    default: begin write_to_uart<=0; Address<=0; end
    endcase
	
endmodule
