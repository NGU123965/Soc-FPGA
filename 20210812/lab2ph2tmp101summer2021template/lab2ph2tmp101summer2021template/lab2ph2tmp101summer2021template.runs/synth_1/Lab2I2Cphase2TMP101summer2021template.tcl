# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.cache/wt [current_project]
set_property parent.project_path D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:zybo-z7-10:part0:1.0 [current_project]
add_files -quiet d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz.dcp
set_property used_in_implementation false [get_files d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz.dcp]
read_verilog -library xil_defaultlib {
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/kcuart_tx.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/kcuart_rx.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/bbfifo_16x8.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/ClockedNegativeOneShot.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/I2C_ShiftRegister.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/I2C_SDAmodule.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/DelayTimeReset.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/ClockedPositiveOneShot.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/uart_tx.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/uart_rx.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/BaudRateGenerator.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2templatesources/ControllerReadTMP101template.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/I2C_DataUnit.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/I2C_BaudRateGenerator.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/UARTmodule2021summer.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/ReadTMP101summer2021.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/TemperatureRAM2021summer.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/SendTemperature.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2sources/OneTemperatureConverter.v
  D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/imports/lab2phase2templatesources/Lab2I2Cphase2TMP101summer2021template.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021constraints.xdc
set_property used_in_implementation false [get_files D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021constraints.xdc]


synth_design -top Lab2I2Cphase2TMP101summer2021template -part xc7z010clg400-1


write_checkpoint -force -noxdef Lab2I2Cphase2TMP101summer2021template.dcp

catch { report_utilization -file Lab2I2Cphase2TMP101summer2021template_utilization_synth.rpt -pb Lab2I2Cphase2TMP101summer2021template_utilization_synth.pb }
