@echo off
set xv_path=D:\\IDE\\vivado\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 5973ea0c7fa24710bf204ab33c9741a7 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip --snapshot ControllerReadTMP101_tb_behav xil_defaultlib.ControllerReadTMP101_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
