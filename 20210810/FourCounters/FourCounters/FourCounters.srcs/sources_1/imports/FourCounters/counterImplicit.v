//in Verilog 2001
module counterImplicit # (parameter word_size = 5) (
  output reg [word_size -1: 0] count, 
  input enable, clock, reset
);

  always @ (posedge clock)
    if (reset==1'b1) count <= {(word_size){1'b0}}; else
      case (enable)
			0: count<=count;
			1: if (count<{(word_size){1'b1}}) count <= count+1'b1;
				else count<=0;
		endcase
endmodule
