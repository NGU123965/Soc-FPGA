proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7z010clg400-1
  set_property board_part digilentinc.com:zybo-z7-10:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.cache/wt [current_project]
  set_property parent.project_path D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.xpr [current_project]
  set_property ip_repo_paths d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.cache/ip [current_project]
  set_property ip_output_repo d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.cache/ip [current_project]
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  add_files -quiet D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.runs/synth_1/Lab2I2Cphase2TMP101summer2021template.dcp
  add_files -quiet d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz.dcp
  set_property netlist_only true [get_files d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz.dcp]
  read_xdc -mode out_of_context -ref SystemClk60MHz -cells inst d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz_ooc.xdc
  set_property processing_order EARLY [get_files d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz_ooc.xdc]
  read_xdc -prop_thru_buffers -ref SystemClk60MHz -cells inst d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz_board.xdc
  set_property processing_order EARLY [get_files d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz_board.xdc]
  read_xdc -ref SystemClk60MHz -cells inst d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz.xdc
  set_property processing_order EARLY [get_files d:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz.xdc]
  read_xdc D:/资料/学习资料/课程资料/大三种子班/大三下/soc/Soc-FPGA/20210812/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021template/lab2ph2tmp101summer2021constraints.xdc
  link_design -top Lab2I2Cphase2TMP101summer2021template -part xc7z010clg400-1
  write_hwdef -file Lab2I2Cphase2TMP101summer2021template.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Lab2I2Cphase2TMP101summer2021template_opt.dcp
  report_drc -file Lab2I2Cphase2TMP101summer2021template_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force Lab2I2Cphase2TMP101summer2021template_placed.dcp
  report_io -file Lab2I2Cphase2TMP101summer2021template_io_placed.rpt
  report_utilization -file Lab2I2Cphase2TMP101summer2021template_utilization_placed.rpt -pb Lab2I2Cphase2TMP101summer2021template_utilization_placed.pb
  report_control_sets -verbose -file Lab2I2Cphase2TMP101summer2021template_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Lab2I2Cphase2TMP101summer2021template_routed.dcp
  report_drc -file Lab2I2Cphase2TMP101summer2021template_drc_routed.rpt -pb Lab2I2Cphase2TMP101summer2021template_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file Lab2I2Cphase2TMP101summer2021template_timing_summary_routed.rpt -rpx Lab2I2Cphase2TMP101summer2021template_timing_summary_routed.rpx
  report_power -file Lab2I2Cphase2TMP101summer2021template_power_routed.rpt -pb Lab2I2Cphase2TMP101summer2021template_power_summary_routed.pb -rpx Lab2I2Cphase2TMP101summer2021template_power_routed.rpx
  report_route_status -file Lab2I2Cphase2TMP101summer2021template_route_status.rpt -pb Lab2I2Cphase2TMP101summer2021template_route_status.pb
  report_clock_utilization -file Lab2I2Cphase2TMP101summer2021template_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Lab2I2Cphase2TMP101summer2021template.mmi }
  write_bitstream -force Lab2I2Cphase2TMP101summer2021template.bit 
  catch { write_sysdef -hwdef Lab2I2Cphase2TMP101summer2021template.hwdef -bitfile Lab2I2Cphase2TMP101summer2021template.bit -meminfo Lab2I2Cphase2TMP101summer2021template.mmi -file Lab2I2Cphase2TMP101summer2021template.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

