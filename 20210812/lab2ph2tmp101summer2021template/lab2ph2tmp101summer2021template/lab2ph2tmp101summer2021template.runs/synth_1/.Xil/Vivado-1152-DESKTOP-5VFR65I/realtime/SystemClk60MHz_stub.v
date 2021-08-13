// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module SystemClk60MHz(clk_in125MHz, clk_out60MHz, locked);
  input clk_in125MHz;
  output clk_out60MHz;
  output locked;
endmodule
