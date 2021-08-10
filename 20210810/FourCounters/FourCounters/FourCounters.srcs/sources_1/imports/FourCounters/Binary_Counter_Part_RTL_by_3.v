// Example 7.1 in Verilog 2001
module Binary_Counter_Part_RTL_by_3 #(parameter size = 4)(
  output 	[size -1: 0]	count,
  input			enable,
  input			clk, rst
);
  wire			enable_DP;

	Control_Unit_by_3  M0 (enable_DP, enable, clk, rst);
	Datapath_Unit M1 (count, enable_DP, clk, rst);
endmodule
