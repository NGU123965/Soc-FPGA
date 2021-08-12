onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib SystemClk60MHz_opt

do {wave.do}

view wave
view structure
view signals

do {SystemClk60MHz.udo}

run -all

quit -force
