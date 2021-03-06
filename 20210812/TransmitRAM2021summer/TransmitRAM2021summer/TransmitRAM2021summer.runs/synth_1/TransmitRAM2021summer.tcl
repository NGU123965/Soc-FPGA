# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.cache/wt [current_project]
set_property parent.project_path C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:zybo-z7-10:part0:1.0 [current_project]
add_files -quiet c:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/ip/ClockGenerator50MHz/ClockGenerator50MHz.dcp
set_property used_in_implementation false [get_files c:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/ip/ClockGenerator50MHz/ClockGenerator50MHz.dcp]
read_verilog -library xil_defaultlib {
  C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/imports/TransmitRAM2021summer/kcuart_tx.v
  C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/imports/TransmitRAM2021summer/bbfifo_16x8.v
  C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/imports/TransmitRAM2021summer/RAM21x7bits.v
  C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/imports/TransmitRAM2021summer/uart_tx.v
  C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/imports/TransmitRAM2021summer/OverallController.v
  C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/imports/TransmitRAM2021summer/BaudRateGenerator.v
  C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/sources_1/imports/TransmitRAM2021summer/TransmitRAM2021summer.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/constrs_1/imports/TransmitRAM2021summer/TransmitRAM2021summer.xdc
set_property used_in_implementation false [get_files C:/Xilinx/SHCodesign2021/TransmitRAM2021summer/TransmitRAM2021summer.srcs/constrs_1/imports/TransmitRAM2021summer/TransmitRAM2021summer.xdc]


synth_design -top TransmitRAM2021summer -part xc7z010clg400-1


write_checkpoint -force -noxdef TransmitRAM2021summer.dcp

catch { report_utilization -file TransmitRAM2021summer_utilization_synth.rpt -pb TransmitRAM2021summer_utilization_synth.pb }
