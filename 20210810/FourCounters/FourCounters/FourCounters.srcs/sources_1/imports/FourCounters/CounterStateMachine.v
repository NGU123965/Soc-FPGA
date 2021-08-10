// Example 7.1 in Verilog 2001
module CounterStateMachine #(parameter size = 4)(
  output 	reg [size -1: 0]	count,
  input			enable,
  input			clk, rst
); //in Verilog 2001
 
reg [size-1: 0]	NextState;

parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7, S8=8;
parameter S9=9, S10=10, S11=11, S12=12, S13=13, S14=14, S15=15;

always@(posedge clk)
	if(rst==1'b1) count <= {(size){1'b0}};
	else count<=NextState;
	
always@(count or enable)
	case (count)
		S0:	if(enable==1) NextState<=S1; else NextState<=S0;
		S1:	if(enable==1) NextState<=S2; else NextState<=S1;
		S2:	if(enable==1) NextState<=S3; else NextState<=S2;
		S3:	if(enable==1) NextState<=S4; else NextState<=S3;
		S4:	if(enable==1) NextState<=S5; else NextState<=S4;
		S5:	if(enable==1) NextState<=S6; else NextState<=S5;
		S6:	if(enable==1) NextState<=S7; else NextState<=S6;
		S7:	if(enable==1) NextState<=S8; else NextState<=S7;
		S8:	if(enable==1) NextState<=S9; else NextState<=S8;
		S9:	if(enable==1) NextState<=S10; else NextState<=S9;
		S10:	if(enable==1) NextState<=S11; else NextState<=S10;
		S11:	if(enable==1) NextState<=S12; else NextState<=S11;
		S12:	if(enable==1) NextState<=S13; else NextState<=S12;
		S13:	if(enable==1) NextState<=S14; else NextState<=S13;
		S14:	if(enable==1) NextState<=S15; else NextState<=S14;
		S15:	if(enable==1) NextState<=S0; else NextState<=S15;
	endcase
 
endmodule


