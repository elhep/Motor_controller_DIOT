create_clock -period 10.000 -name VIRTUAL_clk_out1_design_2_clk_wiz_0_0 -waveform {0.000 5.000}
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_design_2_clk_wiz_0_0] -min -add_delay 2.000 [get_ports reset_rtl]
set_input_delay -clock [get_clocks VIRTUAL_clk_out1_design_2_clk_wiz_0_0] -max -add_delay 2.000 [get_ports reset_rtl]
set_property PACKAGE_PIN P16 [get_ports reset_rtl]

set_property IOSTANDARD LVCMOS33 [get_ports reset_rtl]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
