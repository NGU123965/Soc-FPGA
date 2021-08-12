`timescale 1ns / 1ps
//HUST Summer 2021
//Baud rate and clock frequency are defined in UARTmodule433fall2020v
//Test UART module: 
//Baud Rate is 19200 defined in UARTmodule2021summer.v
//System clock is 125MHz
//Type a numer of characters in keyboard up to 16 characters stored in receive buff
//Press NET "Start" LOC = A8;	//BTNU to transmit the stored charaters to serial port

module UartTyperwriter2021summer(input clock, reset, rx, output tx,
output [3:0] transmitted_bits);

// Signals for UART connections
reg read_from_uart, write_to_uart;
wire  	tx_full, tx_half_full, rx_data_present, rx_full, rx_half_full;
wire [7:0] rx_data, tx_data;
reg [7:0] databuffer;

reg newdata;    //new data flag
always@(posedge clock) begin
	if(reset==1) begin read_from_uart<=0; newdata<=0; databuffer<=0; end
	else if (rx_data_present==1) begin read_from_uart<=1;  newdata<=1; databuffer<=rx_data; end 
	else begin read_from_uart<=0; newdata<=0; databuffer<=0; end
    if(reset==1) begin write_to_uart<=0; end
	else if (newdata==1) begin write_to_uart<=1; end
	else begin write_to_uart<=0; end
end

//module UARTmodule2021summer #(parameter TRANSMITTED_BITS=8, BAUDRATE=20'd19200, FREQUENCY=30'd125000000) 
//(input  reset, clock, read_from_uart, write_to_uart, rx, 
//input [TRANSMITTED_BITS-1:0] tx_data,
//output  tx_full, rx_data_present, tx,
//output [TRANSMITTED_BITS-1:0] rx_data,
//output reg [TRANSMITTED_BITS-1:0] transmitted_bits);
//send receive data to transitted data directly

UARTmodule2021summer UARTunit(reset, clock, read_from_uart, write_to_uart, rx, databuffer, tx_full, rx_data_present,
tx, rx_data, transmitted_bits);

endmodule
