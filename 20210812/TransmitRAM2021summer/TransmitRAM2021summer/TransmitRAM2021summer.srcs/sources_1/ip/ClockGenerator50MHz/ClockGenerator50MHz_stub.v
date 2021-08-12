// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Aug 11 17:13:04 2021
// Host        : RHIT-R90XZ2Q6 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/ip/ClockGenerator50MHz/ClockGenerator50MHz_stub.v
// Design      : ClockGenerator50MHz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module ClockGenerator50MHz(clk_in125MHz, clk_out50MHz, locked)
/* synthesis syn_black_box black_box_pad_pin="clk_in125MHz,clk_out50MHz,locked" */;
  input clk_in125MHz;
  output clk_out50MHz;
  output locked;
endmodule
