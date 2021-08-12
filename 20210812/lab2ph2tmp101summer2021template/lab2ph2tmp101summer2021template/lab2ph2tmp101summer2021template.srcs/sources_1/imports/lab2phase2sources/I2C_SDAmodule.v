`timescale 1ns / 1ps
//HUST Summer 2021
//Read==1
//Write==0
module I2C_SDAmodule(input	ReadorWrite, Select, StartStopAck, ShiftOut,
output ShiftIn, inout SDA);

reg MuxOut;

assign SDA = (ReadorWrite)? (1'bz):(MuxOut);
assign ShiftIn = SDA;	//read


always@(ReadorWrite, Select, StartStopAck, ShiftOut)
	case({ReadorWrite, Select})
	2'b00: MuxOut<= StartStopAck;
	2'b01: MuxOut<= ShiftOut;
	2'b10: MuxOut<=0;
	2'b11: MuxOut<=0;
	default: MuxOut<=0;
	endcase	
	
endmodule
