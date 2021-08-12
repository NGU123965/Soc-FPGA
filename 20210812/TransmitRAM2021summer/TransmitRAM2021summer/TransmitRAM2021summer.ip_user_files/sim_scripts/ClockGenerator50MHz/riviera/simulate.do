onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ClockGenerator50MHz -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.ClockGenerator50MHz xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {ClockGenerator50MHz.udo}

run -all

endsim

quit -force
