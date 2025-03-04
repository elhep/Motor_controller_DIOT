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
set_property PACKAGE_PIN U1 [get_ports spi_cs]
set_property PACKAGE_PIN G17 [get_ports uart_rxd]

set_property PACKAGE_PIN W5 [get_ports spi_clk]
set_property PACKAGE_PIN V2 [get_ports spi_mosi]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]


connect_debug_port u_ila_0/clk [get_nets [list u_ila_0_clk_out1]]
connect_debug_port dbg_hub/clk [get_nets clk_12MHz_IBUF_BUFG]






connect_debug_port u_ila_1/probe0 [get_nets [list {sin_cos_ch0_phase_inc_delta[0]} {sin_cos_ch0_phase_inc_delta[1]} {sin_cos_ch0_phase_inc_delta[2]} {sin_cos_ch0_phase_inc_delta[3]} {sin_cos_ch0_phase_inc_delta[4]} {sin_cos_ch0_phase_inc_delta[5]} {sin_cos_ch0_phase_inc_delta[6]} {sin_cos_ch0_phase_inc_delta[7]} {sin_cos_ch0_phase_inc_delta[8]} {sin_cos_ch0_phase_inc_delta[9]} {sin_cos_ch0_phase_inc_delta[10]} {sin_cos_ch0_phase_inc_delta[11]} {sin_cos_ch0_phase_inc_delta[12]} {sin_cos_ch0_phase_inc_delta[13]} {sin_cos_ch0_phase_inc_delta[14]} {sin_cos_ch0_phase_inc_delta[15]} {sin_cos_ch0_phase_inc_delta[16]} {sin_cos_ch0_phase_inc_delta[17]} {sin_cos_ch0_phase_inc_delta[18]} {sin_cos_ch0_phase_inc_delta[19]} {sin_cos_ch0_phase_inc_delta[20]} {sin_cos_ch0_phase_inc_delta[21]} {sin_cos_ch0_phase_inc_delta[22]} {sin_cos_ch0_phase_inc_delta[23]} {sin_cos_ch0_phase_inc_delta[24]} {sin_cos_ch0_phase_inc_delta[25]} {sin_cos_ch0_phase_inc_delta[26]} {sin_cos_ch0_phase_inc_delta[27]} {sin_cos_ch0_phase_inc_delta[28]} {sin_cos_ch0_phase_inc_delta[29]} {sin_cos_ch0_phase_inc_delta[30]} {sin_cos_ch0_phase_inc_delta[31]}]]
connect_debug_port u_ila_1/probe1 [get_nets [list {sin_cos_ch1_phase_inc_delta[0]} {sin_cos_ch1_phase_inc_delta[1]} {sin_cos_ch1_phase_inc_delta[2]} {sin_cos_ch1_phase_inc_delta[3]} {sin_cos_ch1_phase_inc_delta[4]} {sin_cos_ch1_phase_inc_delta[5]} {sin_cos_ch1_phase_inc_delta[6]} {sin_cos_ch1_phase_inc_delta[7]} {sin_cos_ch1_phase_inc_delta[8]} {sin_cos_ch1_phase_inc_delta[9]} {sin_cos_ch1_phase_inc_delta[10]} {sin_cos_ch1_phase_inc_delta[11]} {sin_cos_ch1_phase_inc_delta[12]} {sin_cos_ch1_phase_inc_delta[13]} {sin_cos_ch1_phase_inc_delta[14]} {sin_cos_ch1_phase_inc_delta[15]} {sin_cos_ch1_phase_inc_delta[16]} {sin_cos_ch1_phase_inc_delta[17]} {sin_cos_ch1_phase_inc_delta[18]} {sin_cos_ch1_phase_inc_delta[19]} {sin_cos_ch1_phase_inc_delta[20]} {sin_cos_ch1_phase_inc_delta[21]} {sin_cos_ch1_phase_inc_delta[22]} {sin_cos_ch1_phase_inc_delta[23]} {sin_cos_ch1_phase_inc_delta[24]} {sin_cos_ch1_phase_inc_delta[25]} {sin_cos_ch1_phase_inc_delta[26]} {sin_cos_ch1_phase_inc_delta[27]} {sin_cos_ch1_phase_inc_delta[28]} {sin_cos_ch1_phase_inc_delta[29]} {sin_cos_ch1_phase_inc_delta[30]} {sin_cos_ch1_phase_inc_delta[31]}]]
connect_debug_port u_ila_1/probe2 [get_nets [list {sin_cos_ch1_phase_inc_threshold[0]} {sin_cos_ch1_phase_inc_threshold[1]} {sin_cos_ch1_phase_inc_threshold[2]} {sin_cos_ch1_phase_inc_threshold[3]} {sin_cos_ch1_phase_inc_threshold[4]} {sin_cos_ch1_phase_inc_threshold[5]} {sin_cos_ch1_phase_inc_threshold[6]} {sin_cos_ch1_phase_inc_threshold[7]} {sin_cos_ch1_phase_inc_threshold[8]} {sin_cos_ch1_phase_inc_threshold[9]} {sin_cos_ch1_phase_inc_threshold[10]} {sin_cos_ch1_phase_inc_threshold[11]} {sin_cos_ch1_phase_inc_threshold[12]} {sin_cos_ch1_phase_inc_threshold[13]} {sin_cos_ch1_phase_inc_threshold[14]} {sin_cos_ch1_phase_inc_threshold[15]} {sin_cos_ch1_phase_inc_threshold[16]} {sin_cos_ch1_phase_inc_threshold[17]} {sin_cos_ch1_phase_inc_threshold[18]} {sin_cos_ch1_phase_inc_threshold[19]} {sin_cos_ch1_phase_inc_threshold[20]} {sin_cos_ch1_phase_inc_threshold[21]} {sin_cos_ch1_phase_inc_threshold[22]} {sin_cos_ch1_phase_inc_threshold[23]} {sin_cos_ch1_phase_inc_threshold[24]} {sin_cos_ch1_phase_inc_threshold[25]} {sin_cos_ch1_phase_inc_threshold[26]} {sin_cos_ch1_phase_inc_threshold[27]} {sin_cos_ch1_phase_inc_threshold[28]} {sin_cos_ch1_phase_inc_threshold[29]} {sin_cos_ch1_phase_inc_threshold[30]} {sin_cos_ch1_phase_inc_threshold[31]}]]
connect_debug_port u_ila_1/probe3 [get_nets [list {sin_cos_reset[0]} {sin_cos_reset[1]}]]
connect_debug_port u_ila_1/probe4 [get_nets [list {sin_cos_ch0_phase_inc_threshold[0]} {sin_cos_ch0_phase_inc_threshold[1]} {sin_cos_ch0_phase_inc_threshold[2]} {sin_cos_ch0_phase_inc_threshold[3]} {sin_cos_ch0_phase_inc_threshold[4]} {sin_cos_ch0_phase_inc_threshold[5]} {sin_cos_ch0_phase_inc_threshold[6]} {sin_cos_ch0_phase_inc_threshold[7]} {sin_cos_ch0_phase_inc_threshold[8]} {sin_cos_ch0_phase_inc_threshold[9]} {sin_cos_ch0_phase_inc_threshold[10]} {sin_cos_ch0_phase_inc_threshold[11]} {sin_cos_ch0_phase_inc_threshold[12]} {sin_cos_ch0_phase_inc_threshold[13]} {sin_cos_ch0_phase_inc_threshold[14]} {sin_cos_ch0_phase_inc_threshold[15]} {sin_cos_ch0_phase_inc_threshold[16]} {sin_cos_ch0_phase_inc_threshold[17]} {sin_cos_ch0_phase_inc_threshold[18]} {sin_cos_ch0_phase_inc_threshold[19]} {sin_cos_ch0_phase_inc_threshold[20]} {sin_cos_ch0_phase_inc_threshold[21]} {sin_cos_ch0_phase_inc_threshold[22]} {sin_cos_ch0_phase_inc_threshold[23]} {sin_cos_ch0_phase_inc_threshold[24]} {sin_cos_ch0_phase_inc_threshold[25]} {sin_cos_ch0_phase_inc_threshold[26]} {sin_cos_ch0_phase_inc_threshold[27]} {sin_cos_ch0_phase_inc_threshold[28]} {sin_cos_ch0_phase_inc_threshold[29]} {sin_cos_ch0_phase_inc_threshold[30]} {sin_cos_ch0_phase_inc_threshold[31]}]]




set_property PACKAGE_PIN M3 [get_ports dac_sync]
set_property IOSTANDARD LVCMOS33 [get_ports dac_sync]
set_property DRIVE 4 [get_ports dac_sck]
set_property DRIVE 12 [get_ports spi_mosi]

connect_debug_port dbg_hub/clk [get_nets u_ila_2_clk_out1]


connect_debug_port u_ila_1/probe0 [get_nets [list {sin_cos_inst/phase_inc_cnt_reg[0]} {sin_cos_inst/phase_inc_cnt_reg[1]} {sin_cos_inst/phase_inc_cnt_reg[2]} {sin_cos_inst/phase_inc_cnt_reg[3]} {sin_cos_inst/phase_inc_cnt_reg[4]} {sin_cos_inst/phase_inc_cnt_reg[5]} {sin_cos_inst/phase_inc_cnt_reg[6]} {sin_cos_inst/phase_inc_cnt_reg[7]} {sin_cos_inst/phase_inc_cnt_reg[8]} {sin_cos_inst/phase_inc_cnt_reg[9]} {sin_cos_inst/phase_inc_cnt_reg[10]} {sin_cos_inst/phase_inc_cnt_reg[11]} {sin_cos_inst/phase_inc_cnt_reg[12]} {sin_cos_inst/phase_inc_cnt_reg[13]} {sin_cos_inst/phase_inc_cnt_reg[14]} {sin_cos_inst/phase_inc_cnt_reg[15]} {sin_cos_inst/phase_inc_cnt_reg[16]} {sin_cos_inst/phase_inc_cnt_reg[17]} {sin_cos_inst/phase_inc_cnt_reg[18]} {sin_cos_inst/phase_inc_cnt_reg[19]} {sin_cos_inst/phase_inc_cnt_reg[20]} {sin_cos_inst/phase_inc_cnt_reg[21]} {sin_cos_inst/phase_inc_cnt_reg[22]} {sin_cos_inst/phase_inc_cnt_reg[23]} {sin_cos_inst/phase_inc_cnt_reg[24]} {sin_cos_inst/phase_inc_cnt_reg[25]} {sin_cos_inst/phase_inc_cnt_reg[26]} {sin_cos_inst/phase_inc_cnt_reg[27]} {sin_cos_inst/phase_inc_cnt_reg[28]} {sin_cos_inst/phase_inc_cnt_reg[29]} {sin_cos_inst/phase_inc_cnt_reg[30]} {sin_cos_inst/phase_inc_cnt_reg[31]}]]


set_property SLEW SLOW [get_ports dac_sck]
set_property DRIVE 4 [get_ports dac_sync]
set_property SLEW SLOW [get_ports dac_sync]
set_property DRIVE 8 [get_ports dac_dataA]
set_property DRIVE 8 [get_ports dac_dataB]
set_property DRIVE 8 [get_ports dac_dataC]
set_property DRIVE 8 [get_ports dac_dataD]
set_property DRIVE 8 [get_ports dac_dataE]
set_property DRIVE 8 [get_ports dac_dataF]
set_property DRIVE 8 [get_ports dac_dataG]
set_property DRIVE 8 [get_ports dac_dataH]
set_property SLEW SLOW [get_ports dac_dataG]
set_property SLEW SLOW [get_ports dac_dataH]
set_property SLEW SLOW [get_ports dac_dataA]
set_property SLEW SLOW [get_ports dac_dataB]
set_property SLEW SLOW [get_ports {led_2bits_tri_o[1]}]

set_property PACKAGE_PIN U8 [get_ports enc_a1]
set_property IOSTANDARD LVCMOS33 [get_ports enc_a1]
set_property PACKAGE_PIN V8 [get_ports enc_b1]
set_property PACKAGE_PIN W7 [get_ports enc_r1]
set_property IOSTANDARD LVCMOS33 [get_ports enc_b1]
set_property IOSTANDARD LVCMOS33 [get_ports enc_r1]



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
connect_debug_port u_ila_0/clk [get_nets [list clk_wiz_i/inst/clk_out5]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {sin_cos_inst/phase_inc_threshold[0]} {sin_cos_inst/phase_inc_threshold[1]} {sin_cos_inst/phase_inc_threshold[2]} {sin_cos_inst/phase_inc_threshold[3]} {sin_cos_inst/phase_inc_threshold[4]} {sin_cos_inst/phase_inc_threshold[5]} {sin_cos_inst/phase_inc_threshold[6]} {sin_cos_inst/phase_inc_threshold[7]} {sin_cos_inst/phase_inc_threshold[8]} {sin_cos_inst/phase_inc_threshold[9]} {sin_cos_inst/phase_inc_threshold[10]} {sin_cos_inst/phase_inc_threshold[11]} {sin_cos_inst/phase_inc_threshold[12]} {sin_cos_inst/phase_inc_threshold[13]} {sin_cos_inst/phase_inc_threshold[14]} {sin_cos_inst/phase_inc_threshold[15]} {sin_cos_inst/phase_inc_threshold[16]} {sin_cos_inst/phase_inc_threshold[17]} {sin_cos_inst/phase_inc_threshold[18]} {sin_cos_inst/phase_inc_threshold[19]} {sin_cos_inst/phase_inc_threshold[20]} {sin_cos_inst/phase_inc_threshold[21]} {sin_cos_inst/phase_inc_threshold[22]} {sin_cos_inst/phase_inc_threshold[23]} {sin_cos_inst/phase_inc_threshold[24]} {sin_cos_inst/phase_inc_threshold[25]} {sin_cos_inst/phase_inc_threshold[26]} {sin_cos_inst/phase_inc_threshold[27]} {sin_cos_inst/phase_inc_threshold[28]} {sin_cos_inst/phase_inc_threshold[29]} {sin_cos_inst/phase_inc_threshold[30]} {sin_cos_inst/phase_inc_threshold[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {sin_cos_inst/phase_inc_cnt[0]} {sin_cos_inst/phase_inc_cnt[1]} {sin_cos_inst/phase_inc_cnt[2]} {sin_cos_inst/phase_inc_cnt[3]} {sin_cos_inst/phase_inc_cnt[4]} {sin_cos_inst/phase_inc_cnt[5]} {sin_cos_inst/phase_inc_cnt[6]} {sin_cos_inst/phase_inc_cnt[7]} {sin_cos_inst/phase_inc_cnt[8]} {sin_cos_inst/phase_inc_cnt[9]} {sin_cos_inst/phase_inc_cnt[10]} {sin_cos_inst/phase_inc_cnt[11]} {sin_cos_inst/phase_inc_cnt[12]} {sin_cos_inst/phase_inc_cnt[13]} {sin_cos_inst/phase_inc_cnt[14]} {sin_cos_inst/phase_inc_cnt[15]} {sin_cos_inst/phase_inc_cnt[16]} {sin_cos_inst/phase_inc_cnt[17]} {sin_cos_inst/phase_inc_cnt[18]} {sin_cos_inst/phase_inc_cnt[19]} {sin_cos_inst/phase_inc_cnt[20]} {sin_cos_inst/phase_inc_cnt[21]} {sin_cos_inst/phase_inc_cnt[22]} {sin_cos_inst/phase_inc_cnt[23]} {sin_cos_inst/phase_inc_cnt[24]} {sin_cos_inst/phase_inc_cnt[25]} {sin_cos_inst/phase_inc_cnt[26]} {sin_cos_inst/phase_inc_cnt[27]} {sin_cos_inst/phase_inc_cnt[28]} {sin_cos_inst/phase_inc_cnt[29]} {sin_cos_inst/phase_inc_cnt[30]} {sin_cos_inst/phase_inc_cnt[31]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_100kHz]
