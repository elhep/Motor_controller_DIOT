set_property IOSTANDARD LVCMOS33 [get_ports spi_clk]
set_property IOSTANDARD LVCMOS33 [get_ports spi_cs]
set_property IOSTANDARD LVCMOS33 [get_ports spi_miso]
set_property IOSTANDARD LVCMOS33 [get_ports spi_mosi]
set_property PACKAGE_PIN A18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property IOSTANDARD LVCMOS33 [get_ports uart_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_txd]
set_property PACKAGE_PIN G19 [get_ports uart_txd]

set_property PACKAGE_PIN V3 [get_ports spi_miso]

set_property PACKAGE_PIN C16 [get_ports {led_2bits_tri_o[1]}]
set_property PACKAGE_PIN T1 [get_ports index]
set_property PACKAGE_PIN C15 [get_ports quadA]
set_property PACKAGE_PIN W2 [get_ports quadB]
set_property IOSTANDARD LVCMOS33 [get_ports index]
set_property IOSTANDARD LVCMOS33 [get_ports quadA]
set_property IOSTANDARD LVCMOS33 [get_ports quadB]
set_property IOSTANDARD LVCMOS33 [get_ports {led_2bits_tri_o[1]}]







create_clock -period 83.333 -name clk_12MHz -waveform {0.000 41.667} [get_ports clk_12MHz]



set_property IOSTANDARD LVCMOS33 [get_ports dac_sck]
set_property PACKAGE_PIN L3 [get_ports dac_sck]

set_property PACKAGE_PIN U4 [get_ports led1]
set_property IOSTANDARD LVCMOS33 [get_ports led1]
set_property PACKAGE_PIN R3 [get_ports dac_dataH]
set_property PACKAGE_PIN N2 [get_ports dac_dataG]
set_property IOSTANDARD LVCMOS33 [get_ports dac_dataG]
set_property IOSTANDARD LVCMOS33 [get_ports dac_dataH]
set_property PACKAGE_PIN P3 [get_ports dac_dataF]
set_property PACKAGE_PIN L2 [get_ports dac_dataE]
set_property PACKAGE_PIN J1 [get_ports dac_dataD]
set_property PACKAGE_PIN B15 [get_ports dac_dataC]
set_property PACKAGE_PIN K3 [get_ports dac_dataB]
set_property PACKAGE_PIN A16 [get_ports dac_dataA]
set_property IOSTANDARD LVCMOS33 [get_ports dac_dataA]
set_property IOSTANDARD LVCMOS33 [get_ports dac_dataB]
set_property IOSTANDARD LVCMOS33 [get_ports dac_dataC]
set_property IOSTANDARD LVCMOS33 [get_ports dac_dataD]
set_property IOSTANDARD LVCMOS33 [get_ports dac_dataE]
set_property IOSTANDARD LVCMOS33 [get_ports dac_dataF]
set_property PACKAGE_PIN M3 [get_ports spi_cs]
set_property PACKAGE_PIN G17 [get_ports uart_rxd]

set_property PACKAGE_PIN W5 [get_ports spi_clk]
set_property PACKAGE_PIN V2 [get_ports spi_mosi]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
connect_debug_port u_ila_0/clk [get_nets [list u_ila_0_clk_out1]]
connect_debug_port dbg_hub/clk [get_nets clk_12MHz_IBUF_BUFG]


set_property OFFCHIP_TERM NONE [get_ports dac_dataA]
set_property OFFCHIP_TERM NONE [get_ports dac_dataB]
set_property OFFCHIP_TERM NONE [get_ports dac_dataC]
set_property OFFCHIP_TERM NONE [get_ports dac_dataD]
set_property OFFCHIP_TERM NONE [get_ports dac_dataE]
set_property OFFCHIP_TERM NONE [get_ports dac_dataF]
set_property OFFCHIP_TERM NONE [get_ports dac_dataG]
set_property OFFCHIP_TERM NONE [get_ports dac_dataH]
set_property OFFCHIP_TERM NONE [get_ports dac_sck]
set_property OFFCHIP_TERM NONE [get_ports led1]
set_property OFFCHIP_TERM NONE [get_ports spi_clk]
set_property OFFCHIP_TERM NONE [get_ports spi_miso]
set_property OFFCHIP_TERM NONE [get_ports spi_mosi]
set_property OFFCHIP_TERM NONE [get_ports uart_txd]
set_property OFFCHIP_TERM NONE [get_ports led_2bits_tri_o[1]]
set_property OFFCHIP_TERM NONE [get_ports led_2bits_tri_o[0]]
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list mc_wrapper_i/mc_design_i/clk_wiz/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {sin_cos_ch0_phase_inc_threshold[0]} {sin_cos_ch0_phase_inc_threshold[1]} {sin_cos_ch0_phase_inc_threshold[2]} {sin_cos_ch0_phase_inc_threshold[3]} {sin_cos_ch0_phase_inc_threshold[4]} {sin_cos_ch0_phase_inc_threshold[5]} {sin_cos_ch0_phase_inc_threshold[6]} {sin_cos_ch0_phase_inc_threshold[7]} {sin_cos_ch0_phase_inc_threshold[8]} {sin_cos_ch0_phase_inc_threshold[9]} {sin_cos_ch0_phase_inc_threshold[10]} {sin_cos_ch0_phase_inc_threshold[11]} {sin_cos_ch0_phase_inc_threshold[12]} {sin_cos_ch0_phase_inc_threshold[13]} {sin_cos_ch0_phase_inc_threshold[14]} {sin_cos_ch0_phase_inc_threshold[15]} {sin_cos_ch0_phase_inc_threshold[16]} {sin_cos_ch0_phase_inc_threshold[17]} {sin_cos_ch0_phase_inc_threshold[18]} {sin_cos_ch0_phase_inc_threshold[19]} {sin_cos_ch0_phase_inc_threshold[20]} {sin_cos_ch0_phase_inc_threshold[21]} {sin_cos_ch0_phase_inc_threshold[22]} {sin_cos_ch0_phase_inc_threshold[23]} {sin_cos_ch0_phase_inc_threshold[24]} {sin_cos_ch0_phase_inc_threshold[25]} {sin_cos_ch0_phase_inc_threshold[26]} {sin_cos_ch0_phase_inc_threshold[27]} {sin_cos_ch0_phase_inc_threshold[28]} {sin_cos_ch0_phase_inc_threshold[29]} {sin_cos_ch0_phase_inc_threshold[30]} {sin_cos_ch0_phase_inc_threshold[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {sin_cos_ch0_phase_inc_delta[0]} {sin_cos_ch0_phase_inc_delta[1]} {sin_cos_ch0_phase_inc_delta[2]} {sin_cos_ch0_phase_inc_delta[3]} {sin_cos_ch0_phase_inc_delta[4]} {sin_cos_ch0_phase_inc_delta[5]} {sin_cos_ch0_phase_inc_delta[6]} {sin_cos_ch0_phase_inc_delta[7]} {sin_cos_ch0_phase_inc_delta[8]} {sin_cos_ch0_phase_inc_delta[9]} {sin_cos_ch0_phase_inc_delta[10]} {sin_cos_ch0_phase_inc_delta[11]} {sin_cos_ch0_phase_inc_delta[12]} {sin_cos_ch0_phase_inc_delta[13]} {sin_cos_ch0_phase_inc_delta[14]} {sin_cos_ch0_phase_inc_delta[15]} {sin_cos_ch0_phase_inc_delta[16]} {sin_cos_ch0_phase_inc_delta[17]} {sin_cos_ch0_phase_inc_delta[18]} {sin_cos_ch0_phase_inc_delta[19]} {sin_cos_ch0_phase_inc_delta[20]} {sin_cos_ch0_phase_inc_delta[21]} {sin_cos_ch0_phase_inc_delta[22]} {sin_cos_ch0_phase_inc_delta[23]} {sin_cos_ch0_phase_inc_delta[24]} {sin_cos_ch0_phase_inc_delta[25]} {sin_cos_ch0_phase_inc_delta[26]} {sin_cos_ch0_phase_inc_delta[27]} {sin_cos_ch0_phase_inc_delta[28]} {sin_cos_ch0_phase_inc_delta[29]} {sin_cos_ch0_phase_inc_delta[30]} {sin_cos_ch0_phase_inc_delta[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {sin_cos_ch1_phase_inc_threshold[0]} {sin_cos_ch1_phase_inc_threshold[1]} {sin_cos_ch1_phase_inc_threshold[2]} {sin_cos_ch1_phase_inc_threshold[3]} {sin_cos_ch1_phase_inc_threshold[4]} {sin_cos_ch1_phase_inc_threshold[5]} {sin_cos_ch1_phase_inc_threshold[6]} {sin_cos_ch1_phase_inc_threshold[7]} {sin_cos_ch1_phase_inc_threshold[8]} {sin_cos_ch1_phase_inc_threshold[9]} {sin_cos_ch1_phase_inc_threshold[10]} {sin_cos_ch1_phase_inc_threshold[11]} {sin_cos_ch1_phase_inc_threshold[12]} {sin_cos_ch1_phase_inc_threshold[13]} {sin_cos_ch1_phase_inc_threshold[14]} {sin_cos_ch1_phase_inc_threshold[15]} {sin_cos_ch1_phase_inc_threshold[16]} {sin_cos_ch1_phase_inc_threshold[17]} {sin_cos_ch1_phase_inc_threshold[18]} {sin_cos_ch1_phase_inc_threshold[19]} {sin_cos_ch1_phase_inc_threshold[20]} {sin_cos_ch1_phase_inc_threshold[21]} {sin_cos_ch1_phase_inc_threshold[22]} {sin_cos_ch1_phase_inc_threshold[23]} {sin_cos_ch1_phase_inc_threshold[24]} {sin_cos_ch1_phase_inc_threshold[25]} {sin_cos_ch1_phase_inc_threshold[26]} {sin_cos_ch1_phase_inc_threshold[27]} {sin_cos_ch1_phase_inc_threshold[28]} {sin_cos_ch1_phase_inc_threshold[29]} {sin_cos_ch1_phase_inc_threshold[30]} {sin_cos_ch1_phase_inc_threshold[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {sin_cos_ch1_phase_inc_delta[0]} {sin_cos_ch1_phase_inc_delta[1]} {sin_cos_ch1_phase_inc_delta[2]} {sin_cos_ch1_phase_inc_delta[3]} {sin_cos_ch1_phase_inc_delta[4]} {sin_cos_ch1_phase_inc_delta[5]} {sin_cos_ch1_phase_inc_delta[6]} {sin_cos_ch1_phase_inc_delta[7]} {sin_cos_ch1_phase_inc_delta[8]} {sin_cos_ch1_phase_inc_delta[9]} {sin_cos_ch1_phase_inc_delta[10]} {sin_cos_ch1_phase_inc_delta[11]} {sin_cos_ch1_phase_inc_delta[12]} {sin_cos_ch1_phase_inc_delta[13]} {sin_cos_ch1_phase_inc_delta[14]} {sin_cos_ch1_phase_inc_delta[15]} {sin_cos_ch1_phase_inc_delta[16]} {sin_cos_ch1_phase_inc_delta[17]} {sin_cos_ch1_phase_inc_delta[18]} {sin_cos_ch1_phase_inc_delta[19]} {sin_cos_ch1_phase_inc_delta[20]} {sin_cos_ch1_phase_inc_delta[21]} {sin_cos_ch1_phase_inc_delta[22]} {sin_cos_ch1_phase_inc_delta[23]} {sin_cos_ch1_phase_inc_delta[24]} {sin_cos_ch1_phase_inc_delta[25]} {sin_cos_ch1_phase_inc_delta[26]} {sin_cos_ch1_phase_inc_delta[27]} {sin_cos_ch1_phase_inc_delta[28]} {sin_cos_ch1_phase_inc_delta[29]} {sin_cos_ch1_phase_inc_delta[30]} {sin_cos_ch1_phase_inc_delta[31]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_12MHz_IBUF]
