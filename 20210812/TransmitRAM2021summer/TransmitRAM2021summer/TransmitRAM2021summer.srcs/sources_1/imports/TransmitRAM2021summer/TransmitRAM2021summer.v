`timescale 1ns / 1ps
//Send a number of characters from a RAM to a serial terminal
//Jianjian Song
//HUST Summer 2021
//August 2021

module TransmitRAM2021summer(input clock, reset, rx, output tx, lock);

wire clk50MHz;
//clock module
ClockGenerator50MHz ClockUnit50MHz(.clk_in125MHz(clock),.clk_out50MHz(clk50MHz),.locked(lock));

//Baud Rate Generator
parameter BAUDRATE=20'd19200, FREQUENCY=30'd50000000;
wire en_16_x_baud;

BaudRateGenerator BaudRateUnit(en_16_x_baud, reset, clk50MHz, BAUDRATE, FREQUENCY);

// Signals for UART connections
wire  	write_to_uart, tx_full, tx_half_full;
reg  	read_from_uart;
wire [7:0] 	rx_data;
wire  	rx_data_present, rx_full, rx_half_full;
wire [7:0] out_port;

uart_tx TransmitUnit(	.data_in({1'b0, RAM_dataout}), .write_buffer(write_to_uart), .reset_buffer(1'b0), .en_16_x_baud(en_16_x_baud), .serial_out(tx),.buffer_full(tx_full), .buffer_half_full(),.clk(clk50MHz));
//RAM
parameter DataLength=8;
wire [DataLength-1:0] OutputValue;
parameter AddressBits=5;
wire [AddressBits-1:0] Address;
wire [6:0] RAM_dataout;
//RAM
RAM21x7bits RAMUnit(1'b1, clk50MHz, reset, , Address, RAM_dataout);

assign start=1'b1;
OverallController ControlUnit(tx_full, en_16_x_baud,  clk50MHz, 
reset, start, write_to_uart, Address);
endmodule
