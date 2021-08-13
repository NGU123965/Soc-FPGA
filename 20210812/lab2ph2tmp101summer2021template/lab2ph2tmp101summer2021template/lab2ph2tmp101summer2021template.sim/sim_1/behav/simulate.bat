@echo off
set xv_path=D:\\IDE\\vivado\\Vivado\\2016.2\\bin
call %xv_path%/xsim ControllerReadTMP101_tb_behav -key {Behavioral:sim_1:Functional:ControllerReadTMP101_tb} -tclbatch ControllerReadTMP101_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
