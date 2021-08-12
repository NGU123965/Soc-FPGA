`timescale 1ns / 1ps
//Author: Jianjian Song
//Date: August 2021
//HUST Summer 2021
module RAM21x7bits #(parameter DataLength=7, AddressBits=5, MemorySize=20)(
input ReadOrWrite, Clock, Reset,
input [DataLength-1:0] InputValue,
input [AddressBits-1:0] Address,
output reg [DataLength-1:0] OutputValue);

//RAM of 20 ddresses of 7 bits at each address
reg [DataLength-1:0] ASCIICode [0:MemorySize-1];

always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
	ASCIICode[0]<="H";	ASCIICode[1]<="U";	ASCIICode[2]<="S";	ASCIICode[3]<="T"; 
	ASCIICode[4]<=" ";	ASCIICode[5]<="S";	ASCIICode[6]<="u";	ASCIICode[7]<="m";
	ASCIICode[8]<="m";	ASCIICode[9]<="e";	ASCIICode[10]<="r";	ASCIICode[11]<=" ";
	ASCIICode[12]<="2"; ASCIICode[13]<="0"; ASCIICode[14]<="2"; ASCIICode[15]<="1";
	ASCIICode[16]<=8'h0A;	//line feed
	ASCIICode[17]<=8'h0D;	//carriage return
	ASCIICode[18]<=8'h0A;	//line feed
	ASCIICode[19]<="NULL ";
	end 
	else if (ReadOrWrite==1) begin	//read memory
		OutputValue<=ASCIICode[Address];
	end
	else begin
		ASCIICode[Address]<=InputValue; 
	end
endmodule
