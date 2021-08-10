//in Verilog 2001
module Control_Unit  (
  output reg		enable_DP,
  input		enable,
  input		clk, rst 
);
	always@(posedge clk)
		if(rst==1) enable_DP=0;
		else
		enable_DP = enable;	// pass through
endmodule
