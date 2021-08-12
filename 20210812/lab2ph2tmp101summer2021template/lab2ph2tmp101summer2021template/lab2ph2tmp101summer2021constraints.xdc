#Zybo Board
#125 MHz oscillator
set_property PACKAGE_PIN L16 [get_ports Clock]
#LD0
set_property PACKAGE_PIN M14 [get_ports ClockLocked]
#btn0
set_property PACKAGE_PIN R18 [get_ports Reset]
#JD4
set_property PACKAGE_PIN R14 [get_ports SDA]
#JD3
set_property PACKAGE_PIN P14 [get_ports SCL]
#JB1
set_property PACKAGE_PIN T20 [get_ports tx]
#JB2
set_property PACKAGE_PIN U20 [get_ports rx]
#BTN3
set_property PACKAGE_PIN Y16 [get_ports Start]
#SW3
set_property PACKAGE_PIN T16 [get_ports Mode]
#SW1 and SW2
set_property PACKAGE_PIN W13 [get_ports {Address[1]}]
set_property PACKAGE_PIN P15 [get_ports {Address[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports ClockLocked]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports SCL]
set_property IOSTANDARD LVCMOS33 [get_ports SDA]
set_property IOSTANDARD LVCMOS33 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports Mode]
set_property IOSTANDARD LVCMOS33 [get_ports Start]
set_property IOSTANDARD LVCMOS33 [get_ports {Address[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Address[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports Clock]
