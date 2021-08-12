set_property SRC_FILE_INFO {cfile:c:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/ip/ClockGenerator50MHz/ClockGenerator50MHz.xdc rfile:../../../TransmitRAM2021summer.srcs/sources_1/ip/ClockGenerator50MHz/ClockGenerator50MHz.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in125MHz]] 0.08
