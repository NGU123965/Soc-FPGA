`timescale 1ns / 1ps
//File Name: OneTemperatureConverter.v
//Jianjian Song
//Hust Summer 2021
//August, 2021
//Convert Two 8-bit temperatures in Celsius 
// to Two 2-digits in Fahrenheit
//Define a LongTemp wire to do 16-bit multiplication

module OneTemperatureConverter( input [7:0] Temp,
output [3:0] Fahtenth, Fahones, Celtenth, Celones);
wire [15:0] LongTemp=Temp;

assign Fahtenth = (LongTemp*8'd18/'d10+8'd32)/8'd10;
assign Fahones = (LongTemp*8'd18/8'd10+8'd32)%8'd10;

assign Celtenth = LongTemp/8'd10;
assign Celones = LongTemp%8'd10;

endmodule
