onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+SystemClk60MHz -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.SystemClk60MHz xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {SystemClk60MHz.udo}

run -all

endsim

quit -force
