#125MHz oscillator
set_property PACKAGE_PIN L16 [get_ports clock]
//LD0
set_property PACKAGE_PIN M14 [get_ports ClockLocked]
//SW0
set_property PACKAGE_PIN G15 [get_ports Go]
set_property PACKAGE_PIN R18 [get_ports Reset]
#JD3
set_property PACKAGE_PIN P14 [get_ports SCL]
#JD4
set_property PACKAGE_PIN R14 [get_ports SDA]

set_property IOSTANDARD LVCMOS33 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports ClockLocked]
set_property IOSTANDARD LVCMOS33 [get_ports Go]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports SCL]
set_property IOSTANDARD LVCMOS33 [get_ports SDA]
