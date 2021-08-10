@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim detect011_test_circuit_behav -key {Behavioral:sim_1:Functional:detect011_test_circuit} -tclbatch detect011_test_circuit.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
