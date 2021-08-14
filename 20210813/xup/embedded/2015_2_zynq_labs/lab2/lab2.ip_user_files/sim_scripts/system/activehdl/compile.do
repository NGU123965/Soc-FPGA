vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_protocol_checker_v2_0_2
vlib activehdl/axi_vip_v1_1_2
vlib activehdl/processing_system7_vip_v1_0_4

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_2 activehdl/axi_protocol_checker_v2_0_2
vmap axi_vip_v1_1_2 activehdl/axi_vip_v1_1_2
vmap processing_system7_vip_v1_0_4 activehdl/processing_system7_vip_v1_0_4

vlog -work xilinx_vip  -sv2k12 "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" \
"D:/XiLinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/XiLinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/XiLinx/Vivado/2018.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/XiLinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/XiLinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/XiLinx/Vivado/2018.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/XiLinx/Vivado/2018.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/XiLinx/Vivado/2018.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/XiLinx/Vivado/2018.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" \
"D:/XiLinx/Vivado/2018.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/XiLinx/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"D:/XiLinx/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"D:/XiLinx/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_2  -sv2k12 "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../lab_1.srcs/sources_1/bd/system/ipshared/3755/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_2  -sv2k12 "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../lab_1.srcs/sources_1/bd/system/ipshared/725c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_4  -sv2k12 "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" "+incdir+../../../../lab_1.srcs/sources_1/bd/system/ipshared/b193/hdl" "+incdir+D:/XiLinx/Vivado/2018.1/data/xilinx_vip/include" \
"../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \
"../../../bd/system/sim/system.v" \

vlog -work xil_defaultlib \
"glbl.v"

