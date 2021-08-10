//in Verilog 2001
module Datapath_Unit #(parameter	size = 4)(
  output reg	[size-1: 0] count,
  input		enable,
  input		clk, rst
); 

  always @ (posedge clk) 
    if (rst == 1) count <= 0; 
      else if (enable == 1) count <= count + 1;
endmodule
