#UartTyperwriter2021summer

#125 MHz oscillator
set_property PACKAGE_PIN L16 [get_ports clock]
#btn0
set_property PACKAGE_PIN R18 [get_ports reset]
#JB1
set_property PACKAGE_PIN T20 [get_ports tx]
#JB2
set_property PACKAGE_PIN U20 [get_ports rx]
#LD3 LD2 LD1 LD0
set_property PACKAGE_PIN D18 [get_ports {transmitted_bits[3]}]
set_property PACKAGE_PIN G14 [get_ports {transmitted_bits[2]}]
set_property PACKAGE_PIN M15 [get_ports {transmitted_bits[1]}]
set_property PACKAGE_PIN M14 [get_ports {transmitted_bits[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {transmitted_bits[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {transmitted_bits[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {transmitted_bits[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {transmitted_bits[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]