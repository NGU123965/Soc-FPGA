`timescale 1ns / 1ps
//Author: Jianjian Song
//Date:	August 2021
//HUST Summer 2021
//A complete UART module based on files from Xilinx
module UARTmodule2021summer #(parameter TRANSMITTED_BITS=8, BAUDRATE=20'd19200, FREQUENCY=30'd125000000) 
(input  reset, clock, read_from_uart, write_to_uart, rx, 
input [TRANSMITTED_BITS-1:0] tx_data,
output  tx_full, rx_data_present, tx,
output [TRANSMITTED_BITS-1:0] rx_data,
output reg [TRANSMITTED_BITS-1:0] transmitted_bits);

wire  en_16_x_baud;

always@(posedge clock)
 transmitted_bits<=tx_data;

BaudRateGenerator BaudRateUnit(en_16_x_baud, reset, clock, BAUDRATE, FREQUENCY);

// Signals for UART connections
//reg read_from_uart, write_to_uart;

wire  	tx_half_full;
wire  	rx_full;
wire  	rx_half_full;

uart_tx TransmitUnit(	.data_in(tx_data), .write_buffer(write_to_uart),
    	.reset_buffer(1'b0), .en_16_x_baud(en_16_x_baud),
    	.serial_out(tx),.buffer_full(tx_full),
    	.buffer_half_full(),.clk(clock));
		
uart_rx ReceiveUnit
(	.serial_in(rx),
    	.data_out(rx_data),
    	.read_buffer(read_from_uart),
    	.reset_buffer(1'b0),
    	.en_16_x_baud(en_16_x_baud),
    	.buffer_data_present(rx_data_present),
    	.buffer_full(rx_full),
    	.buffer_half_full(rx_half_full),
    	.clk(clock));
endmodule
