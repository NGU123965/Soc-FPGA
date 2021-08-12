`timescale 1ns / 1ps
//one read port and one write port
//both read and write are synchronized by clock
//WriteOrRead=1 to write and 0 to read
//HUST Summer 2021
//RAM Initial Content: Temperature
module TemperatureRAM2021summer #(parameter DataWidth=8, MemorySize=100, AddressBits=7)
(input reset, clock, writeOrread,
input [AddressBits:0] address,
input [DataWidth-1:0] din,
output reg [DataWidth-1:0] dout);

reg[DataWidth-1:0] memory [MemorySize-1:0]; 
parameter LineFeed=8'h0A, CarriageReturn=8'h0D, NUL=8'h00, DEGREE=8'HF8, SPACE=8'H20;
always@(posedge clock)
	if(reset==1) begin
	memory[0]<=LineFeed;	memory[1]<=CarriageReturn;	memory[2]<=" ";	memory[3]<=" ";
	memory[4]<="A";	memory[5]<="d";	memory[6]<="d";	memory[7]<="r";
	memory[8]<="e";	memory[9]<="s";	memory[10]<="s";	memory[11]<=":";
	memory[12]<=SPACE;	memory[13]<=SPACE;	memory[14]<=SPACE;	memory[15]<="T";
	memory[16]<="e";	memory[17]<="m";	memory[18]<="p";	memory[19]<="e";
	memory[20]<="r";	memory[21]<="a";	memory[22]<="t";	memory[23]<="u";
	memory[24]<="r";	memory[25]<="e";	memory[26]<=":";	memory[27]<=SPACE;
	memory[28]<="3";	memory[29]<="2";	memory[30]<=SPACE;	memory[31]<=DEGREE;
	memory[32]<="F";	memory[33]<=SPACE;	memory[34]<="0";	memory[35]<="0";
	memory[36]<=SPACE;    memory[37]<=DEGREE;    memory[38]<="C";    memory[39]<=LineFeed;
	memory[40]<=CarriageReturn;    memory[41]<=NUL;    memory[42]<="i";    memory[43]<="g";
	memory[44]<="n";    memory[45]<=" ";    memory[46]<="w";    memory[47]<="i";
	memory[48]<="t";    memory[49]<="h";    memory[50]<=" ";    memory[51]<="V";
	memory[52]<="e";    memory[53]<="r";    memory[54]<="i";    memory[55]<="l";
	memory[56]<="o";    memory[57]<="g";    memory[58]<=" ";    memory[59]<=" ";
	memory[60]<=CarriageReturn;
	memory[61]<=LineFeed;	//line feed
	memory[62]<=NUL;
	end 
	else
		if (writeOrread==1) memory[address] <= din; 
		else  dout = memory[address];
endmodule
