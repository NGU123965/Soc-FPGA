`timescale 1ns / 1ps
//Author: Jianjian Song
//Date: August 2021
//HUST Summer 2021
module RAM21x7bits #(parameter DataLength=7, AddressBits=5, MemorySize=21)(
input ReadOrWrite, Clock, Reset,
input [DataLength-1:0] InputValue,
input [AddressBits-1:0] Address,
output reg [DataLength-1:0] OutputValue);

//RAM of 21 addresses of 7 bits at each address
reg [DataLength-1:0] ASCIICode [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	ASCIICode[0]<="E";	ASCIICode[1]<="C";	ASCIICode[2]<="E";	ASCIICode[3]<="4";
	ASCIICode[4]<="3";	ASCIICode[5]<="3";	ASCIICode[6]<=" ";	ASCIICode[7]<="F";
	ASCIICode[8]<="a";	ASCIICode[9]<="l";	ASCIICode[10]<="l";	ASCIICode[11]<=" ";
	ASCIICode[12]<=" ";	ASCIICode[13]<="2";	ASCIICode[14]<="0";	ASCIICode[15]<="2";
	ASCIICode[16]<="0";
	ASCIICode[17]<=8'h0A;	//line feed
	ASCIICode[18]<=8'h0D;	//carriage return
	ASCIICode[19]<=8'h0A;	//line feed
	ASCIICode[20]<=“NULL ";
	end 
	else if (ReadOrWrite==1) begin	//read memory
		OutputValue<=ASCIICode[Address];
	end
	else begin
		ASCIICode[Address]<=InputValue; 
	end
endmodule
