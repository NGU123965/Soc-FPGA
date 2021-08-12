-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Wed Aug 11 17:13:04 2021
-- Host        : RHIT-R90XZ2Q6 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/ip/ClockGenerator50MHz/ClockGenerator50MHz_stub.vhdl
-- Design      : ClockGenerator50MHz
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockGenerator50MHz is
  Port ( 
    clk_in125MHz : in STD_LOGIC;
    clk_out50MHz : out STD_LOGIC;
    locked : out STD_LOGIC
  );

end ClockGenerator50MHz;

architecture stub of ClockGenerator50MHz is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_in125MHz,clk_out50MHz,locked";
begin
end;
