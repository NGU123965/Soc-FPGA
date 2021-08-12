//File Name: lab2I2Cphase2TMP101fall2020template.v
//Author: Jianjian Song
//Date: August 2021
//HUST Summer 2021
//This is a template as a starting point for students
//Address is from  two slide switches: SW2 and SW1 typing 
//Read selected TMP101 temperature sensor
//send first address and Read byte to I2C bus with address {4'b1001,ChipSelect}
//Receive first byte temperature from the selected TMP101 on I2C bus
//Display the current address and its temperature to a uart display
//Display 2-digit temperature in Fahrenheit and 2-digit in Celsius
//Mode = 0 to stop reading temperature
//Mode = 1 for continuous sampling mode

module Lab2I2Cphase2TMP101summer2021template (input Reset, Clock, rx, Mode, Start,
input [1:0] Address,
output tx, SCL, ClockLocked, inout SDA);

parameter I2CBaudRate=20'd15000, ClockFrequency=30'd60000000;
parameter RAMAddressSize=7;
 wire clock60MHz; 
SystemClk60MHz SystemClockUnit(.clk_in125MHz(Clock),.clk_out60MHz(clock60MHz), .locked(ClockLocked));

ClockedPositiveOneShot StartOneShot(Start, StartReading, Reset, clock60MHz) ;

wire [7:0] Chip;
wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck;

//module ReadTMP101summer2021(input Reset, clock, Start,
//input [7:0] FirstByte,
//input [19:0] BaudRate,
//input [29:0] ClockFrequency,
//output DONE, SCL,
//inout SDA,
wire [7:0] ReceivedData;
//select an address to read
assign Chip = {5'b10010,Address,1'b1};
ReadTMP101summer2021 ReadUnit(Reset, clock60MHz, StartReading||Mode, Chip, I2CBaudRate, ClockFrequency, 
DONE, SCL, SDA, ReceivedData);
	
wire [3:0] Fahtenth, Fahones, Celtenth, Celones;
reg [7:0] Temperature;
always@(posedge clock60MHz)
	if(DONE==1) Temperature<=ReceivedData;
	else Temperature<=Temperature;
	
//odule OneTemperatureConverter( input [7:0] Temp,
//output [3:0] Fahtenth, Fahones, Celtenth, Celones);	

OneTemperatureConverter ConvertUnit(Temperature, Fahtenth, Fahones, Celtenth, Celones);

reg [RAMAddressSize-1:0] WriteAddress;
wire [RAMAddressSize-1:0] ReadAdress, RAMaddress;

wire WriteorRead;

reg [7:0] DataIn;
wire [7:0] RAMDataout;

assign RAMaddress = (Start==1)?ReadAdress:WriteAddress;
assign   WriteOrRead=(Start==1)?0:1;

wire Timeout;
DelayTimeReset WriteDelay(Reset, clock60MHz, 0, Timeout);

reg [2:0] count;
always@(posedge clock60MHz)
    if(Reset==1) begin count<=0; end
    else if (count==4) count<=0;
    else if(Timeout==1) count<=count+1'b1;
    else count<=count;
   
always@(*)
case (count)
    0: begin WriteAddress=7'd13;  DataIn=Address+8'h30; end
    1: begin WriteAddress=7'd28;  DataIn=Fahtenth+8'h30; end
    2: begin WriteAddress=7'd29;  DataIn=Fahones+8'h30; end
    3: begin WriteAddress=7'd34; DataIn=Celtenth+8'h30; end
    4: begin WriteAddress=7'd35; DataIn=Celones+8'h30; end
    default: begin WriteAddress=7'd13;  DataIn=Address+8'h30; end
endcase

wire read_from_uart, write_to_uart;
wire  	tx_full;
wire  	tx_half_full;
wire  	rx_data_present;
wire  	rx_full;
wire  	rx_half_full;
wire [7:0] rx_data, tx_data;

//module TemperatureRAM2021summer #(parameter DataWidth=7, MemorySize=100, AddressBits=7)
//(input reset, clock, writeOrread,
//input [AddressBits:0] address,
//input [DataWidth-1:0] din,
//output [DataWidth-1:0] dout);

TemperatureRAM2021summer RAMUnit(Reset, clock60MHz, WriteOrRead, RAMaddress, DataIn, RAMDataout);

//module SendTemperature #(parameter AddressBits=7)(
//input Start, tx_full, reset, clock, input [6:0] data,
//output reg write_to_uart, Transmitting,
//output reg [AddressBits-1:0] Address);

assign tx_data=RAMDataout;

SendTemperature SendCharsUnit(Start, tx_full, Reset, clock60MHz, RAMDataout, write_to_uart, Transmitting, ReadAdress);

//module UARTmodule2020Fall #(parameter TRANSMITTED_BITS=8, BAUDRATE=20'd19200, FREQUENCY=30'd60000000) 
//(input  reset, clock, read_from_uart, write_to_uart, rx, 
//input [TRANSMITTED_BITS-1:0] tx_data,
//output  tx_full, rx_data_present, tx,
//output [TRANSMITTED_BITS-1:0] rx_data,
//output reg [TRANSMITTED_BITS-1:0] transmitted_bits);

UARTmodule2021summer UARTunit(Reset, clock60MHz, read_from_uart, write_to_uart, rx, tx_data, tx_full, rx_data_present,
tx, rx_data, );

endmodule