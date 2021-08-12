-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz_clk_wiz.v" \
  "../../../../lab2ph2tmp101summer2021template.srcs/sources_1/ip/SystemClk60MHz/SystemClk60MHz.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

