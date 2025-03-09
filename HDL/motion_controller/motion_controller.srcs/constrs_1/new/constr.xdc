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



connect_debug_port u_ila_0/probe0 [get_nets [list {sin_cos_inst/phase_inc_threshold[0]} {sin_cos_inst/phase_inc_threshold[1]} {sin_cos_inst/phase_inc_threshold[2]} {sin_cos_inst/phase_inc_threshold[3]} {sin_cos_inst/phase_inc_threshold[4]} {sin_cos_inst/phase_inc_threshold[5]} {sin_cos_inst/phase_inc_threshold[6]} {sin_cos_inst/phase_inc_threshold[7]} {sin_cos_inst/phase_inc_threshold[8]} {sin_cos_inst/phase_inc_threshold[9]} {sin_cos_inst/phase_inc_threshold[10]} {sin_cos_inst/phase_inc_threshold[11]} {sin_cos_inst/phase_inc_threshold[12]} {sin_cos_inst/phase_inc_threshold[13]} {sin_cos_inst/phase_inc_threshold[14]} {sin_cos_inst/phase_inc_threshold[15]} {sin_cos_inst/phase_inc_threshold[16]} {sin_cos_inst/phase_inc_threshold[17]} {sin_cos_inst/phase_inc_threshold[18]} {sin_cos_inst/phase_inc_threshold[19]} {sin_cos_inst/phase_inc_threshold[20]} {sin_cos_inst/phase_inc_threshold[21]} {sin_cos_inst/phase_inc_threshold[22]} {sin_cos_inst/phase_inc_threshold[23]} {sin_cos_inst/phase_inc_threshold[24]} {sin_cos_inst/phase_inc_threshold[25]} {sin_cos_inst/phase_inc_threshold[26]} {sin_cos_inst/phase_inc_threshold[27]} {sin_cos_inst/phase_inc_threshold[28]} {sin_cos_inst/phase_inc_threshold[29]} {sin_cos_inst/phase_inc_threshold[30]} {sin_cos_inst/phase_inc_threshold[31]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {sin_cos_inst/phase_inc_cnt[0]} {sin_cos_inst/phase_inc_cnt[1]} {sin_cos_inst/phase_inc_cnt[2]} {sin_cos_inst/phase_inc_cnt[3]} {sin_cos_inst/phase_inc_cnt[4]} {sin_cos_inst/phase_inc_cnt[5]} {sin_cos_inst/phase_inc_cnt[6]} {sin_cos_inst/phase_inc_cnt[7]} {sin_cos_inst/phase_inc_cnt[8]} {sin_cos_inst/phase_inc_cnt[9]} {sin_cos_inst/phase_inc_cnt[10]} {sin_cos_inst/phase_inc_cnt[11]} {sin_cos_inst/phase_inc_cnt[12]} {sin_cos_inst/phase_inc_cnt[13]} {sin_cos_inst/phase_inc_cnt[14]} {sin_cos_inst/phase_inc_cnt[15]} {sin_cos_inst/phase_inc_cnt[16]} {sin_cos_inst/phase_inc_cnt[17]} {sin_cos_inst/phase_inc_cnt[18]} {sin_cos_inst/phase_inc_cnt[19]} {sin_cos_inst/phase_inc_cnt[20]} {sin_cos_inst/phase_inc_cnt[21]} {sin_cos_inst/phase_inc_cnt[22]} {sin_cos_inst/phase_inc_cnt[23]} {sin_cos_inst/phase_inc_cnt[24]} {sin_cos_inst/phase_inc_cnt[25]} {sin_cos_inst/phase_inc_cnt[26]} {sin_cos_inst/phase_inc_cnt[27]} {sin_cos_inst/phase_inc_cnt[28]} {sin_cos_inst/phase_inc_cnt[29]} {sin_cos_inst/phase_inc_cnt[30]} {sin_cos_inst/phase_inc_cnt[31]}]]

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
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {sin_cos_inst/channel_en[0]} {sin_cos_inst/channel_en[1]} {sin_cos_inst/channel_en[2]} {sin_cos_inst/channel_en[3]} {sin_cos_inst/channel_en[4]} {sin_cos_inst/channel_en[5]} {sin_cos_inst/channel_en[6]} {sin_cos_inst/channel_en[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {quad_count[0]} {quad_count[1]} {quad_count[2]} {quad_count[3]} {quad_count[4]} {quad_count[5]} {quad_count[6]} {quad_count[7]} {quad_count[8]} {quad_count[9]} {quad_count[10]} {quad_count[11]} {quad_count[12]} {quad_count[13]} {quad_count[14]} {quad_count[15]} {quad_count[16]} {quad_count[17]} {quad_count[18]} {quad_count[19]} {quad_count[20]} {quad_count[21]} {quad_count[22]} {quad_count[23]} {quad_count[24]} {quad_count[25]} {quad_count[26]} {quad_count[27]} {quad_count[28]} {quad_count[29]} {quad_count[30]} {quad_count[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {sin_cos_inst/phase_inc_threshold[2][0]} {sin_cos_inst/phase_inc_threshold[2][1]} {sin_cos_inst/phase_inc_threshold[2][2]} {sin_cos_inst/phase_inc_threshold[2][3]} {sin_cos_inst/phase_inc_threshold[2][4]} {sin_cos_inst/phase_inc_threshold[2][5]} {sin_cos_inst/phase_inc_threshold[2][6]} {sin_cos_inst/phase_inc_threshold[2][7]} {sin_cos_inst/phase_inc_threshold[2][8]} {sin_cos_inst/phase_inc_threshold[2][9]} {sin_cos_inst/phase_inc_threshold[2][10]} {sin_cos_inst/phase_inc_threshold[2][11]} {sin_cos_inst/phase_inc_threshold[2][12]} {sin_cos_inst/phase_inc_threshold[2][13]} {sin_cos_inst/phase_inc_threshold[2][14]} {sin_cos_inst/phase_inc_threshold[2][15]} {sin_cos_inst/phase_inc_threshold[2][16]} {sin_cos_inst/phase_inc_threshold[2][17]} {sin_cos_inst/phase_inc_threshold[2][18]} {sin_cos_inst/phase_inc_threshold[2][19]} {sin_cos_inst/phase_inc_threshold[2][20]} {sin_cos_inst/phase_inc_threshold[2][21]} {sin_cos_inst/phase_inc_threshold[2][22]} {sin_cos_inst/phase_inc_threshold[2][23]} {sin_cos_inst/phase_inc_threshold[2][24]} {sin_cos_inst/phase_inc_threshold[2][25]} {sin_cos_inst/phase_inc_threshold[2][26]} {sin_cos_inst/phase_inc_threshold[2][27]} {sin_cos_inst/phase_inc_threshold[2][28]} {sin_cos_inst/phase_inc_threshold[2][29]} {sin_cos_inst/phase_inc_threshold[2][30]} {sin_cos_inst/phase_inc_threshold[2][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {sin_cos_inst/phase_inc_cnt[2][0]} {sin_cos_inst/phase_inc_cnt[2][1]} {sin_cos_inst/phase_inc_cnt[2][2]} {sin_cos_inst/phase_inc_cnt[2][3]} {sin_cos_inst/phase_inc_cnt[2][4]} {sin_cos_inst/phase_inc_cnt[2][5]} {sin_cos_inst/phase_inc_cnt[2][6]} {sin_cos_inst/phase_inc_cnt[2][7]} {sin_cos_inst/phase_inc_cnt[2][8]} {sin_cos_inst/phase_inc_cnt[2][9]} {sin_cos_inst/phase_inc_cnt[2][10]} {sin_cos_inst/phase_inc_cnt[2][11]} {sin_cos_inst/phase_inc_cnt[2][12]} {sin_cos_inst/phase_inc_cnt[2][13]} {sin_cos_inst/phase_inc_cnt[2][14]} {sin_cos_inst/phase_inc_cnt[2][15]} {sin_cos_inst/phase_inc_cnt[2][16]} {sin_cos_inst/phase_inc_cnt[2][17]} {sin_cos_inst/phase_inc_cnt[2][18]} {sin_cos_inst/phase_inc_cnt[2][19]} {sin_cos_inst/phase_inc_cnt[2][20]} {sin_cos_inst/phase_inc_cnt[2][21]} {sin_cos_inst/phase_inc_cnt[2][22]} {sin_cos_inst/phase_inc_cnt[2][23]} {sin_cos_inst/phase_inc_cnt[2][24]} {sin_cos_inst/phase_inc_cnt[2][25]} {sin_cos_inst/phase_inc_cnt[2][26]} {sin_cos_inst/phase_inc_cnt[2][27]} {sin_cos_inst/phase_inc_cnt[2][28]} {sin_cos_inst/phase_inc_cnt[2][29]} {sin_cos_inst/phase_inc_cnt[2][30]} {sin_cos_inst/phase_inc_cnt[2][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {sin_cos_inst/phase_inc_cnt[7][0]} {sin_cos_inst/phase_inc_cnt[7][1]} {sin_cos_inst/phase_inc_cnt[7][2]} {sin_cos_inst/phase_inc_cnt[7][3]} {sin_cos_inst/phase_inc_cnt[7][4]} {sin_cos_inst/phase_inc_cnt[7][5]} {sin_cos_inst/phase_inc_cnt[7][6]} {sin_cos_inst/phase_inc_cnt[7][7]} {sin_cos_inst/phase_inc_cnt[7][8]} {sin_cos_inst/phase_inc_cnt[7][9]} {sin_cos_inst/phase_inc_cnt[7][10]} {sin_cos_inst/phase_inc_cnt[7][11]} {sin_cos_inst/phase_inc_cnt[7][12]} {sin_cos_inst/phase_inc_cnt[7][13]} {sin_cos_inst/phase_inc_cnt[7][14]} {sin_cos_inst/phase_inc_cnt[7][15]} {sin_cos_inst/phase_inc_cnt[7][16]} {sin_cos_inst/phase_inc_cnt[7][17]} {sin_cos_inst/phase_inc_cnt[7][18]} {sin_cos_inst/phase_inc_cnt[7][19]} {sin_cos_inst/phase_inc_cnt[7][20]} {sin_cos_inst/phase_inc_cnt[7][21]} {sin_cos_inst/phase_inc_cnt[7][22]} {sin_cos_inst/phase_inc_cnt[7][23]} {sin_cos_inst/phase_inc_cnt[7][24]} {sin_cos_inst/phase_inc_cnt[7][25]} {sin_cos_inst/phase_inc_cnt[7][26]} {sin_cos_inst/phase_inc_cnt[7][27]} {sin_cos_inst/phase_inc_cnt[7][28]} {sin_cos_inst/phase_inc_cnt[7][29]} {sin_cos_inst/phase_inc_cnt[7][30]} {sin_cos_inst/phase_inc_cnt[7][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {sin_cos_inst/phase_inc_threshold[6][0]} {sin_cos_inst/phase_inc_threshold[6][1]} {sin_cos_inst/phase_inc_threshold[6][2]} {sin_cos_inst/phase_inc_threshold[6][3]} {sin_cos_inst/phase_inc_threshold[6][4]} {sin_cos_inst/phase_inc_threshold[6][5]} {sin_cos_inst/phase_inc_threshold[6][6]} {sin_cos_inst/phase_inc_threshold[6][7]} {sin_cos_inst/phase_inc_threshold[6][8]} {sin_cos_inst/phase_inc_threshold[6][9]} {sin_cos_inst/phase_inc_threshold[6][10]} {sin_cos_inst/phase_inc_threshold[6][11]} {sin_cos_inst/phase_inc_threshold[6][12]} {sin_cos_inst/phase_inc_threshold[6][13]} {sin_cos_inst/phase_inc_threshold[6][14]} {sin_cos_inst/phase_inc_threshold[6][15]} {sin_cos_inst/phase_inc_threshold[6][16]} {sin_cos_inst/phase_inc_threshold[6][17]} {sin_cos_inst/phase_inc_threshold[6][18]} {sin_cos_inst/phase_inc_threshold[6][19]} {sin_cos_inst/phase_inc_threshold[6][20]} {sin_cos_inst/phase_inc_threshold[6][21]} {sin_cos_inst/phase_inc_threshold[6][22]} {sin_cos_inst/phase_inc_threshold[6][23]} {sin_cos_inst/phase_inc_threshold[6][24]} {sin_cos_inst/phase_inc_threshold[6][25]} {sin_cos_inst/phase_inc_threshold[6][26]} {sin_cos_inst/phase_inc_threshold[6][27]} {sin_cos_inst/phase_inc_threshold[6][28]} {sin_cos_inst/phase_inc_threshold[6][29]} {sin_cos_inst/phase_inc_threshold[6][30]} {sin_cos_inst/phase_inc_threshold[6][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {sin_cos_inst/phase_inc_cnt[3][0]} {sin_cos_inst/phase_inc_cnt[3][1]} {sin_cos_inst/phase_inc_cnt[3][2]} {sin_cos_inst/phase_inc_cnt[3][3]} {sin_cos_inst/phase_inc_cnt[3][4]} {sin_cos_inst/phase_inc_cnt[3][5]} {sin_cos_inst/phase_inc_cnt[3][6]} {sin_cos_inst/phase_inc_cnt[3][7]} {sin_cos_inst/phase_inc_cnt[3][8]} {sin_cos_inst/phase_inc_cnt[3][9]} {sin_cos_inst/phase_inc_cnt[3][10]} {sin_cos_inst/phase_inc_cnt[3][11]} {sin_cos_inst/phase_inc_cnt[3][12]} {sin_cos_inst/phase_inc_cnt[3][13]} {sin_cos_inst/phase_inc_cnt[3][14]} {sin_cos_inst/phase_inc_cnt[3][15]} {sin_cos_inst/phase_inc_cnt[3][16]} {sin_cos_inst/phase_inc_cnt[3][17]} {sin_cos_inst/phase_inc_cnt[3][18]} {sin_cos_inst/phase_inc_cnt[3][19]} {sin_cos_inst/phase_inc_cnt[3][20]} {sin_cos_inst/phase_inc_cnt[3][21]} {sin_cos_inst/phase_inc_cnt[3][22]} {sin_cos_inst/phase_inc_cnt[3][23]} {sin_cos_inst/phase_inc_cnt[3][24]} {sin_cos_inst/phase_inc_cnt[3][25]} {sin_cos_inst/phase_inc_cnt[3][26]} {sin_cos_inst/phase_inc_cnt[3][27]} {sin_cos_inst/phase_inc_cnt[3][28]} {sin_cos_inst/phase_inc_cnt[3][29]} {sin_cos_inst/phase_inc_cnt[3][30]} {sin_cos_inst/phase_inc_cnt[3][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {sin_cos_inst/phase_inc_threshold[3][0]} {sin_cos_inst/phase_inc_threshold[3][1]} {sin_cos_inst/phase_inc_threshold[3][2]} {sin_cos_inst/phase_inc_threshold[3][3]} {sin_cos_inst/phase_inc_threshold[3][4]} {sin_cos_inst/phase_inc_threshold[3][5]} {sin_cos_inst/phase_inc_threshold[3][6]} {sin_cos_inst/phase_inc_threshold[3][7]} {sin_cos_inst/phase_inc_threshold[3][8]} {sin_cos_inst/phase_inc_threshold[3][9]} {sin_cos_inst/phase_inc_threshold[3][10]} {sin_cos_inst/phase_inc_threshold[3][11]} {sin_cos_inst/phase_inc_threshold[3][12]} {sin_cos_inst/phase_inc_threshold[3][13]} {sin_cos_inst/phase_inc_threshold[3][14]} {sin_cos_inst/phase_inc_threshold[3][15]} {sin_cos_inst/phase_inc_threshold[3][16]} {sin_cos_inst/phase_inc_threshold[3][17]} {sin_cos_inst/phase_inc_threshold[3][18]} {sin_cos_inst/phase_inc_threshold[3][19]} {sin_cos_inst/phase_inc_threshold[3][20]} {sin_cos_inst/phase_inc_threshold[3][21]} {sin_cos_inst/phase_inc_threshold[3][22]} {sin_cos_inst/phase_inc_threshold[3][23]} {sin_cos_inst/phase_inc_threshold[3][24]} {sin_cos_inst/phase_inc_threshold[3][25]} {sin_cos_inst/phase_inc_threshold[3][26]} {sin_cos_inst/phase_inc_threshold[3][27]} {sin_cos_inst/phase_inc_threshold[3][28]} {sin_cos_inst/phase_inc_threshold[3][29]} {sin_cos_inst/phase_inc_threshold[3][30]} {sin_cos_inst/phase_inc_threshold[3][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {sin_cos_inst/phase_inc_cnt[5][0]} {sin_cos_inst/phase_inc_cnt[5][1]} {sin_cos_inst/phase_inc_cnt[5][2]} {sin_cos_inst/phase_inc_cnt[5][3]} {sin_cos_inst/phase_inc_cnt[5][4]} {sin_cos_inst/phase_inc_cnt[5][5]} {sin_cos_inst/phase_inc_cnt[5][6]} {sin_cos_inst/phase_inc_cnt[5][7]} {sin_cos_inst/phase_inc_cnt[5][8]} {sin_cos_inst/phase_inc_cnt[5][9]} {sin_cos_inst/phase_inc_cnt[5][10]} {sin_cos_inst/phase_inc_cnt[5][11]} {sin_cos_inst/phase_inc_cnt[5][12]} {sin_cos_inst/phase_inc_cnt[5][13]} {sin_cos_inst/phase_inc_cnt[5][14]} {sin_cos_inst/phase_inc_cnt[5][15]} {sin_cos_inst/phase_inc_cnt[5][16]} {sin_cos_inst/phase_inc_cnt[5][17]} {sin_cos_inst/phase_inc_cnt[5][18]} {sin_cos_inst/phase_inc_cnt[5][19]} {sin_cos_inst/phase_inc_cnt[5][20]} {sin_cos_inst/phase_inc_cnt[5][21]} {sin_cos_inst/phase_inc_cnt[5][22]} {sin_cos_inst/phase_inc_cnt[5][23]} {sin_cos_inst/phase_inc_cnt[5][24]} {sin_cos_inst/phase_inc_cnt[5][25]} {sin_cos_inst/phase_inc_cnt[5][26]} {sin_cos_inst/phase_inc_cnt[5][27]} {sin_cos_inst/phase_inc_cnt[5][28]} {sin_cos_inst/phase_inc_cnt[5][29]} {sin_cos_inst/phase_inc_cnt[5][30]} {sin_cos_inst/phase_inc_cnt[5][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {sin_cos_inst/phase_inc_threshold[1][0]} {sin_cos_inst/phase_inc_threshold[1][1]} {sin_cos_inst/phase_inc_threshold[1][2]} {sin_cos_inst/phase_inc_threshold[1][3]} {sin_cos_inst/phase_inc_threshold[1][4]} {sin_cos_inst/phase_inc_threshold[1][5]} {sin_cos_inst/phase_inc_threshold[1][6]} {sin_cos_inst/phase_inc_threshold[1][7]} {sin_cos_inst/phase_inc_threshold[1][8]} {sin_cos_inst/phase_inc_threshold[1][9]} {sin_cos_inst/phase_inc_threshold[1][10]} {sin_cos_inst/phase_inc_threshold[1][11]} {sin_cos_inst/phase_inc_threshold[1][12]} {sin_cos_inst/phase_inc_threshold[1][13]} {sin_cos_inst/phase_inc_threshold[1][14]} {sin_cos_inst/phase_inc_threshold[1][15]} {sin_cos_inst/phase_inc_threshold[1][16]} {sin_cos_inst/phase_inc_threshold[1][17]} {sin_cos_inst/phase_inc_threshold[1][18]} {sin_cos_inst/phase_inc_threshold[1][19]} {sin_cos_inst/phase_inc_threshold[1][20]} {sin_cos_inst/phase_inc_threshold[1][21]} {sin_cos_inst/phase_inc_threshold[1][22]} {sin_cos_inst/phase_inc_threshold[1][23]} {sin_cos_inst/phase_inc_threshold[1][24]} {sin_cos_inst/phase_inc_threshold[1][25]} {sin_cos_inst/phase_inc_threshold[1][26]} {sin_cos_inst/phase_inc_threshold[1][27]} {sin_cos_inst/phase_inc_threshold[1][28]} {sin_cos_inst/phase_inc_threshold[1][29]} {sin_cos_inst/phase_inc_threshold[1][30]} {sin_cos_inst/phase_inc_threshold[1][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {sin_cos_inst/phase_inc_cnt[6][0]} {sin_cos_inst/phase_inc_cnt[6][1]} {sin_cos_inst/phase_inc_cnt[6][2]} {sin_cos_inst/phase_inc_cnt[6][3]} {sin_cos_inst/phase_inc_cnt[6][4]} {sin_cos_inst/phase_inc_cnt[6][5]} {sin_cos_inst/phase_inc_cnt[6][6]} {sin_cos_inst/phase_inc_cnt[6][7]} {sin_cos_inst/phase_inc_cnt[6][8]} {sin_cos_inst/phase_inc_cnt[6][9]} {sin_cos_inst/phase_inc_cnt[6][10]} {sin_cos_inst/phase_inc_cnt[6][11]} {sin_cos_inst/phase_inc_cnt[6][12]} {sin_cos_inst/phase_inc_cnt[6][13]} {sin_cos_inst/phase_inc_cnt[6][14]} {sin_cos_inst/phase_inc_cnt[6][15]} {sin_cos_inst/phase_inc_cnt[6][16]} {sin_cos_inst/phase_inc_cnt[6][17]} {sin_cos_inst/phase_inc_cnt[6][18]} {sin_cos_inst/phase_inc_cnt[6][19]} {sin_cos_inst/phase_inc_cnt[6][20]} {sin_cos_inst/phase_inc_cnt[6][21]} {sin_cos_inst/phase_inc_cnt[6][22]} {sin_cos_inst/phase_inc_cnt[6][23]} {sin_cos_inst/phase_inc_cnt[6][24]} {sin_cos_inst/phase_inc_cnt[6][25]} {sin_cos_inst/phase_inc_cnt[6][26]} {sin_cos_inst/phase_inc_cnt[6][27]} {sin_cos_inst/phase_inc_cnt[6][28]} {sin_cos_inst/phase_inc_cnt[6][29]} {sin_cos_inst/phase_inc_cnt[6][30]} {sin_cos_inst/phase_inc_cnt[6][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 32 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {sin_cos_inst/phase_inc_threshold[0][0]} {sin_cos_inst/phase_inc_threshold[0][1]} {sin_cos_inst/phase_inc_threshold[0][2]} {sin_cos_inst/phase_inc_threshold[0][3]} {sin_cos_inst/phase_inc_threshold[0][4]} {sin_cos_inst/phase_inc_threshold[0][5]} {sin_cos_inst/phase_inc_threshold[0][6]} {sin_cos_inst/phase_inc_threshold[0][7]} {sin_cos_inst/phase_inc_threshold[0][8]} {sin_cos_inst/phase_inc_threshold[0][9]} {sin_cos_inst/phase_inc_threshold[0][10]} {sin_cos_inst/phase_inc_threshold[0][11]} {sin_cos_inst/phase_inc_threshold[0][12]} {sin_cos_inst/phase_inc_threshold[0][13]} {sin_cos_inst/phase_inc_threshold[0][14]} {sin_cos_inst/phase_inc_threshold[0][15]} {sin_cos_inst/phase_inc_threshold[0][16]} {sin_cos_inst/phase_inc_threshold[0][17]} {sin_cos_inst/phase_inc_threshold[0][18]} {sin_cos_inst/phase_inc_threshold[0][19]} {sin_cos_inst/phase_inc_threshold[0][20]} {sin_cos_inst/phase_inc_threshold[0][21]} {sin_cos_inst/phase_inc_threshold[0][22]} {sin_cos_inst/phase_inc_threshold[0][23]} {sin_cos_inst/phase_inc_threshold[0][24]} {sin_cos_inst/phase_inc_threshold[0][25]} {sin_cos_inst/phase_inc_threshold[0][26]} {sin_cos_inst/phase_inc_threshold[0][27]} {sin_cos_inst/phase_inc_threshold[0][28]} {sin_cos_inst/phase_inc_threshold[0][29]} {sin_cos_inst/phase_inc_threshold[0][30]} {sin_cos_inst/phase_inc_threshold[0][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {sin_cos_inst/reset_channel[0]} {sin_cos_inst/reset_channel[1]} {sin_cos_inst/reset_channel[2]} {sin_cos_inst/reset_channel[3]} {sin_cos_inst/reset_channel[4]} {sin_cos_inst/reset_channel[5]} {sin_cos_inst/reset_channel[6]} {sin_cos_inst/reset_channel[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 32 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {sin_cos_inst/phase_inc_cnt[1][0]} {sin_cos_inst/phase_inc_cnt[1][1]} {sin_cos_inst/phase_inc_cnt[1][2]} {sin_cos_inst/phase_inc_cnt[1][3]} {sin_cos_inst/phase_inc_cnt[1][4]} {sin_cos_inst/phase_inc_cnt[1][5]} {sin_cos_inst/phase_inc_cnt[1][6]} {sin_cos_inst/phase_inc_cnt[1][7]} {sin_cos_inst/phase_inc_cnt[1][8]} {sin_cos_inst/phase_inc_cnt[1][9]} {sin_cos_inst/phase_inc_cnt[1][10]} {sin_cos_inst/phase_inc_cnt[1][11]} {sin_cos_inst/phase_inc_cnt[1][12]} {sin_cos_inst/phase_inc_cnt[1][13]} {sin_cos_inst/phase_inc_cnt[1][14]} {sin_cos_inst/phase_inc_cnt[1][15]} {sin_cos_inst/phase_inc_cnt[1][16]} {sin_cos_inst/phase_inc_cnt[1][17]} {sin_cos_inst/phase_inc_cnt[1][18]} {sin_cos_inst/phase_inc_cnt[1][19]} {sin_cos_inst/phase_inc_cnt[1][20]} {sin_cos_inst/phase_inc_cnt[1][21]} {sin_cos_inst/phase_inc_cnt[1][22]} {sin_cos_inst/phase_inc_cnt[1][23]} {sin_cos_inst/phase_inc_cnt[1][24]} {sin_cos_inst/phase_inc_cnt[1][25]} {sin_cos_inst/phase_inc_cnt[1][26]} {sin_cos_inst/phase_inc_cnt[1][27]} {sin_cos_inst/phase_inc_cnt[1][28]} {sin_cos_inst/phase_inc_cnt[1][29]} {sin_cos_inst/phase_inc_cnt[1][30]} {sin_cos_inst/phase_inc_cnt[1][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 32 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {sin_cos_inst/phase_inc_cnt[0][0]} {sin_cos_inst/phase_inc_cnt[0][1]} {sin_cos_inst/phase_inc_cnt[0][2]} {sin_cos_inst/phase_inc_cnt[0][3]} {sin_cos_inst/phase_inc_cnt[0][4]} {sin_cos_inst/phase_inc_cnt[0][5]} {sin_cos_inst/phase_inc_cnt[0][6]} {sin_cos_inst/phase_inc_cnt[0][7]} {sin_cos_inst/phase_inc_cnt[0][8]} {sin_cos_inst/phase_inc_cnt[0][9]} {sin_cos_inst/phase_inc_cnt[0][10]} {sin_cos_inst/phase_inc_cnt[0][11]} {sin_cos_inst/phase_inc_cnt[0][12]} {sin_cos_inst/phase_inc_cnt[0][13]} {sin_cos_inst/phase_inc_cnt[0][14]} {sin_cos_inst/phase_inc_cnt[0][15]} {sin_cos_inst/phase_inc_cnt[0][16]} {sin_cos_inst/phase_inc_cnt[0][17]} {sin_cos_inst/phase_inc_cnt[0][18]} {sin_cos_inst/phase_inc_cnt[0][19]} {sin_cos_inst/phase_inc_cnt[0][20]} {sin_cos_inst/phase_inc_cnt[0][21]} {sin_cos_inst/phase_inc_cnt[0][22]} {sin_cos_inst/phase_inc_cnt[0][23]} {sin_cos_inst/phase_inc_cnt[0][24]} {sin_cos_inst/phase_inc_cnt[0][25]} {sin_cos_inst/phase_inc_cnt[0][26]} {sin_cos_inst/phase_inc_cnt[0][27]} {sin_cos_inst/phase_inc_cnt[0][28]} {sin_cos_inst/phase_inc_cnt[0][29]} {sin_cos_inst/phase_inc_cnt[0][30]} {sin_cos_inst/phase_inc_cnt[0][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 32 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {sin_cos_inst/phase_inc_threshold[4][0]} {sin_cos_inst/phase_inc_threshold[4][1]} {sin_cos_inst/phase_inc_threshold[4][2]} {sin_cos_inst/phase_inc_threshold[4][3]} {sin_cos_inst/phase_inc_threshold[4][4]} {sin_cos_inst/phase_inc_threshold[4][5]} {sin_cos_inst/phase_inc_threshold[4][6]} {sin_cos_inst/phase_inc_threshold[4][7]} {sin_cos_inst/phase_inc_threshold[4][8]} {sin_cos_inst/phase_inc_threshold[4][9]} {sin_cos_inst/phase_inc_threshold[4][10]} {sin_cos_inst/phase_inc_threshold[4][11]} {sin_cos_inst/phase_inc_threshold[4][12]} {sin_cos_inst/phase_inc_threshold[4][13]} {sin_cos_inst/phase_inc_threshold[4][14]} {sin_cos_inst/phase_inc_threshold[4][15]} {sin_cos_inst/phase_inc_threshold[4][16]} {sin_cos_inst/phase_inc_threshold[4][17]} {sin_cos_inst/phase_inc_threshold[4][18]} {sin_cos_inst/phase_inc_threshold[4][19]} {sin_cos_inst/phase_inc_threshold[4][20]} {sin_cos_inst/phase_inc_threshold[4][21]} {sin_cos_inst/phase_inc_threshold[4][22]} {sin_cos_inst/phase_inc_threshold[4][23]} {sin_cos_inst/phase_inc_threshold[4][24]} {sin_cos_inst/phase_inc_threshold[4][25]} {sin_cos_inst/phase_inc_threshold[4][26]} {sin_cos_inst/phase_inc_threshold[4][27]} {sin_cos_inst/phase_inc_threshold[4][28]} {sin_cos_inst/phase_inc_threshold[4][29]} {sin_cos_inst/phase_inc_threshold[4][30]} {sin_cos_inst/phase_inc_threshold[4][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 32 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {sin_cos_inst/phase_inc_threshold[7][0]} {sin_cos_inst/phase_inc_threshold[7][1]} {sin_cos_inst/phase_inc_threshold[7][2]} {sin_cos_inst/phase_inc_threshold[7][3]} {sin_cos_inst/phase_inc_threshold[7][4]} {sin_cos_inst/phase_inc_threshold[7][5]} {sin_cos_inst/phase_inc_threshold[7][6]} {sin_cos_inst/phase_inc_threshold[7][7]} {sin_cos_inst/phase_inc_threshold[7][8]} {sin_cos_inst/phase_inc_threshold[7][9]} {sin_cos_inst/phase_inc_threshold[7][10]} {sin_cos_inst/phase_inc_threshold[7][11]} {sin_cos_inst/phase_inc_threshold[7][12]} {sin_cos_inst/phase_inc_threshold[7][13]} {sin_cos_inst/phase_inc_threshold[7][14]} {sin_cos_inst/phase_inc_threshold[7][15]} {sin_cos_inst/phase_inc_threshold[7][16]} {sin_cos_inst/phase_inc_threshold[7][17]} {sin_cos_inst/phase_inc_threshold[7][18]} {sin_cos_inst/phase_inc_threshold[7][19]} {sin_cos_inst/phase_inc_threshold[7][20]} {sin_cos_inst/phase_inc_threshold[7][21]} {sin_cos_inst/phase_inc_threshold[7][22]} {sin_cos_inst/phase_inc_threshold[7][23]} {sin_cos_inst/phase_inc_threshold[7][24]} {sin_cos_inst/phase_inc_threshold[7][25]} {sin_cos_inst/phase_inc_threshold[7][26]} {sin_cos_inst/phase_inc_threshold[7][27]} {sin_cos_inst/phase_inc_threshold[7][28]} {sin_cos_inst/phase_inc_threshold[7][29]} {sin_cos_inst/phase_inc_threshold[7][30]} {sin_cos_inst/phase_inc_threshold[7][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 32 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {sin_cos_inst/phase_inc_threshold[5][0]} {sin_cos_inst/phase_inc_threshold[5][1]} {sin_cos_inst/phase_inc_threshold[5][2]} {sin_cos_inst/phase_inc_threshold[5][3]} {sin_cos_inst/phase_inc_threshold[5][4]} {sin_cos_inst/phase_inc_threshold[5][5]} {sin_cos_inst/phase_inc_threshold[5][6]} {sin_cos_inst/phase_inc_threshold[5][7]} {sin_cos_inst/phase_inc_threshold[5][8]} {sin_cos_inst/phase_inc_threshold[5][9]} {sin_cos_inst/phase_inc_threshold[5][10]} {sin_cos_inst/phase_inc_threshold[5][11]} {sin_cos_inst/phase_inc_threshold[5][12]} {sin_cos_inst/phase_inc_threshold[5][13]} {sin_cos_inst/phase_inc_threshold[5][14]} {sin_cos_inst/phase_inc_threshold[5][15]} {sin_cos_inst/phase_inc_threshold[5][16]} {sin_cos_inst/phase_inc_threshold[5][17]} {sin_cos_inst/phase_inc_threshold[5][18]} {sin_cos_inst/phase_inc_threshold[5][19]} {sin_cos_inst/phase_inc_threshold[5][20]} {sin_cos_inst/phase_inc_threshold[5][21]} {sin_cos_inst/phase_inc_threshold[5][22]} {sin_cos_inst/phase_inc_threshold[5][23]} {sin_cos_inst/phase_inc_threshold[5][24]} {sin_cos_inst/phase_inc_threshold[5][25]} {sin_cos_inst/phase_inc_threshold[5][26]} {sin_cos_inst/phase_inc_threshold[5][27]} {sin_cos_inst/phase_inc_threshold[5][28]} {sin_cos_inst/phase_inc_threshold[5][29]} {sin_cos_inst/phase_inc_threshold[5][30]} {sin_cos_inst/phase_inc_threshold[5][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 32 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {sin_cos_inst/phase_inc_cnt[4][0]} {sin_cos_inst/phase_inc_cnt[4][1]} {sin_cos_inst/phase_inc_cnt[4][2]} {sin_cos_inst/phase_inc_cnt[4][3]} {sin_cos_inst/phase_inc_cnt[4][4]} {sin_cos_inst/phase_inc_cnt[4][5]} {sin_cos_inst/phase_inc_cnt[4][6]} {sin_cos_inst/phase_inc_cnt[4][7]} {sin_cos_inst/phase_inc_cnt[4][8]} {sin_cos_inst/phase_inc_cnt[4][9]} {sin_cos_inst/phase_inc_cnt[4][10]} {sin_cos_inst/phase_inc_cnt[4][11]} {sin_cos_inst/phase_inc_cnt[4][12]} {sin_cos_inst/phase_inc_cnt[4][13]} {sin_cos_inst/phase_inc_cnt[4][14]} {sin_cos_inst/phase_inc_cnt[4][15]} {sin_cos_inst/phase_inc_cnt[4][16]} {sin_cos_inst/phase_inc_cnt[4][17]} {sin_cos_inst/phase_inc_cnt[4][18]} {sin_cos_inst/phase_inc_cnt[4][19]} {sin_cos_inst/phase_inc_cnt[4][20]} {sin_cos_inst/phase_inc_cnt[4][21]} {sin_cos_inst/phase_inc_cnt[4][22]} {sin_cos_inst/phase_inc_cnt[4][23]} {sin_cos_inst/phase_inc_cnt[4][24]} {sin_cos_inst/phase_inc_cnt[4][25]} {sin_cos_inst/phase_inc_cnt[4][26]} {sin_cos_inst/phase_inc_cnt[4][27]} {sin_cos_inst/phase_inc_cnt[4][28]} {sin_cos_inst/phase_inc_cnt[4][29]} {sin_cos_inst/phase_inc_cnt[4][30]} {sin_cos_inst/phase_inc_cnt[4][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list sin_cos_inst/channel_start]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list sin_cos_inst/clk_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list index]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list quadA]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list quadB]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list sin_cos_inst/reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list sin_cos_inst/sync]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list sin_cos_inst/update_DACs]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list mc_wrapper_i/mc_design_i/clk_wiz/inst/clk_out5]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 10 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {sin_cos_inst/m_axis_data_tdata_cosine[1][0]} {sin_cos_inst/m_axis_data_tdata_cosine[1][1]} {sin_cos_inst/m_axis_data_tdata_cosine[1][2]} {sin_cos_inst/m_axis_data_tdata_cosine[1][3]} {sin_cos_inst/m_axis_data_tdata_cosine[1][4]} {sin_cos_inst/m_axis_data_tdata_cosine[1][5]} {sin_cos_inst/m_axis_data_tdata_cosine[1][6]} {sin_cos_inst/m_axis_data_tdata_cosine[1][7]} {sin_cos_inst/m_axis_data_tdata_cosine[1][8]} {sin_cos_inst/m_axis_data_tdata_cosine[1][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 10 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {sin_cos_inst/m_axis_data_tdata_cosine[2][0]} {sin_cos_inst/m_axis_data_tdata_cosine[2][1]} {sin_cos_inst/m_axis_data_tdata_cosine[2][2]} {sin_cos_inst/m_axis_data_tdata_cosine[2][3]} {sin_cos_inst/m_axis_data_tdata_cosine[2][4]} {sin_cos_inst/m_axis_data_tdata_cosine[2][5]} {sin_cos_inst/m_axis_data_tdata_cosine[2][6]} {sin_cos_inst/m_axis_data_tdata_cosine[2][7]} {sin_cos_inst/m_axis_data_tdata_cosine[2][8]} {sin_cos_inst/m_axis_data_tdata_cosine[2][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 10 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {sin_cos_inst/m_axis_data_tdata_cosine[0][0]} {sin_cos_inst/m_axis_data_tdata_cosine[0][1]} {sin_cos_inst/m_axis_data_tdata_cosine[0][2]} {sin_cos_inst/m_axis_data_tdata_cosine[0][3]} {sin_cos_inst/m_axis_data_tdata_cosine[0][4]} {sin_cos_inst/m_axis_data_tdata_cosine[0][5]} {sin_cos_inst/m_axis_data_tdata_cosine[0][6]} {sin_cos_inst/m_axis_data_tdata_cosine[0][7]} {sin_cos_inst/m_axis_data_tdata_cosine[0][8]} {sin_cos_inst/m_axis_data_tdata_cosine[0][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 10 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list {sin_cos_inst/m_axis_data_tdata_cosine[4][0]} {sin_cos_inst/m_axis_data_tdata_cosine[4][1]} {sin_cos_inst/m_axis_data_tdata_cosine[4][2]} {sin_cos_inst/m_axis_data_tdata_cosine[4][3]} {sin_cos_inst/m_axis_data_tdata_cosine[4][4]} {sin_cos_inst/m_axis_data_tdata_cosine[4][5]} {sin_cos_inst/m_axis_data_tdata_cosine[4][6]} {sin_cos_inst/m_axis_data_tdata_cosine[4][7]} {sin_cos_inst/m_axis_data_tdata_cosine[4][8]} {sin_cos_inst/m_axis_data_tdata_cosine[4][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 10 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list {sin_cos_inst/m_axis_data_tdata_cosine[7][0]} {sin_cos_inst/m_axis_data_tdata_cosine[7][1]} {sin_cos_inst/m_axis_data_tdata_cosine[7][2]} {sin_cos_inst/m_axis_data_tdata_cosine[7][3]} {sin_cos_inst/m_axis_data_tdata_cosine[7][4]} {sin_cos_inst/m_axis_data_tdata_cosine[7][5]} {sin_cos_inst/m_axis_data_tdata_cosine[7][6]} {sin_cos_inst/m_axis_data_tdata_cosine[7][7]} {sin_cos_inst/m_axis_data_tdata_cosine[7][8]} {sin_cos_inst/m_axis_data_tdata_cosine[7][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 10 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list {sin_cos_inst/m_axis_data_tdata_sine[1][0]} {sin_cos_inst/m_axis_data_tdata_sine[1][1]} {sin_cos_inst/m_axis_data_tdata_sine[1][2]} {sin_cos_inst/m_axis_data_tdata_sine[1][3]} {sin_cos_inst/m_axis_data_tdata_sine[1][4]} {sin_cos_inst/m_axis_data_tdata_sine[1][5]} {sin_cos_inst/m_axis_data_tdata_sine[1][6]} {sin_cos_inst/m_axis_data_tdata_sine[1][7]} {sin_cos_inst/m_axis_data_tdata_sine[1][8]} {sin_cos_inst/m_axis_data_tdata_sine[1][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe6]
set_property port_width 10 [get_debug_ports u_ila_1/probe6]
connect_debug_port u_ila_1/probe6 [get_nets [list {sin_cos_inst/m_axis_data_tdata_sine[2][0]} {sin_cos_inst/m_axis_data_tdata_sine[2][1]} {sin_cos_inst/m_axis_data_tdata_sine[2][2]} {sin_cos_inst/m_axis_data_tdata_sine[2][3]} {sin_cos_inst/m_axis_data_tdata_sine[2][4]} {sin_cos_inst/m_axis_data_tdata_sine[2][5]} {sin_cos_inst/m_axis_data_tdata_sine[2][6]} {sin_cos_inst/m_axis_data_tdata_sine[2][7]} {sin_cos_inst/m_axis_data_tdata_sine[2][8]} {sin_cos_inst/m_axis_data_tdata_sine[2][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe7]
set_property port_width 10 [get_debug_ports u_ila_1/probe7]
connect_debug_port u_ila_1/probe7 [get_nets [list {sin_cos_inst/m_axis_data_tdata_cosine[3][0]} {sin_cos_inst/m_axis_data_tdata_cosine[3][1]} {sin_cos_inst/m_axis_data_tdata_cosine[3][2]} {sin_cos_inst/m_axis_data_tdata_cosine[3][3]} {sin_cos_inst/m_axis_data_tdata_cosine[3][4]} {sin_cos_inst/m_axis_data_tdata_cosine[3][5]} {sin_cos_inst/m_axis_data_tdata_cosine[3][6]} {sin_cos_inst/m_axis_data_tdata_cosine[3][7]} {sin_cos_inst/m_axis_data_tdata_cosine[3][8]} {sin_cos_inst/m_axis_data_tdata_cosine[3][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe8]
set_property port_width 10 [get_debug_ports u_ila_1/probe8]
connect_debug_port u_ila_1/probe8 [get_nets [list {sin_cos_inst/m_axis_data_tdata_cosine[5][0]} {sin_cos_inst/m_axis_data_tdata_cosine[5][1]} {sin_cos_inst/m_axis_data_tdata_cosine[5][2]} {sin_cos_inst/m_axis_data_tdata_cosine[5][3]} {sin_cos_inst/m_axis_data_tdata_cosine[5][4]} {sin_cos_inst/m_axis_data_tdata_cosine[5][5]} {sin_cos_inst/m_axis_data_tdata_cosine[5][6]} {sin_cos_inst/m_axis_data_tdata_cosine[5][7]} {sin_cos_inst/m_axis_data_tdata_cosine[5][8]} {sin_cos_inst/m_axis_data_tdata_cosine[5][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe9]
set_property port_width 10 [get_debug_ports u_ila_1/probe9]
connect_debug_port u_ila_1/probe9 [get_nets [list {sin_cos_inst/m_axis_data_tdata_sine[3][0]} {sin_cos_inst/m_axis_data_tdata_sine[3][1]} {sin_cos_inst/m_axis_data_tdata_sine[3][2]} {sin_cos_inst/m_axis_data_tdata_sine[3][3]} {sin_cos_inst/m_axis_data_tdata_sine[3][4]} {sin_cos_inst/m_axis_data_tdata_sine[3][5]} {sin_cos_inst/m_axis_data_tdata_sine[3][6]} {sin_cos_inst/m_axis_data_tdata_sine[3][7]} {sin_cos_inst/m_axis_data_tdata_sine[3][8]} {sin_cos_inst/m_axis_data_tdata_sine[3][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe10]
set_property port_width 10 [get_debug_ports u_ila_1/probe10]
connect_debug_port u_ila_1/probe10 [get_nets [list {sin_cos_inst/m_axis_data_tdata_cosine[6][0]} {sin_cos_inst/m_axis_data_tdata_cosine[6][1]} {sin_cos_inst/m_axis_data_tdata_cosine[6][2]} {sin_cos_inst/m_axis_data_tdata_cosine[6][3]} {sin_cos_inst/m_axis_data_tdata_cosine[6][4]} {sin_cos_inst/m_axis_data_tdata_cosine[6][5]} {sin_cos_inst/m_axis_data_tdata_cosine[6][6]} {sin_cos_inst/m_axis_data_tdata_cosine[6][7]} {sin_cos_inst/m_axis_data_tdata_cosine[6][8]} {sin_cos_inst/m_axis_data_tdata_cosine[6][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe11]
set_property port_width 10 [get_debug_ports u_ila_1/probe11]
connect_debug_port u_ila_1/probe11 [get_nets [list {sin_cos_inst/m_axis_data_tdata_sine[0][0]} {sin_cos_inst/m_axis_data_tdata_sine[0][1]} {sin_cos_inst/m_axis_data_tdata_sine[0][2]} {sin_cos_inst/m_axis_data_tdata_sine[0][3]} {sin_cos_inst/m_axis_data_tdata_sine[0][4]} {sin_cos_inst/m_axis_data_tdata_sine[0][5]} {sin_cos_inst/m_axis_data_tdata_sine[0][6]} {sin_cos_inst/m_axis_data_tdata_sine[0][7]} {sin_cos_inst/m_axis_data_tdata_sine[0][8]} {sin_cos_inst/m_axis_data_tdata_sine[0][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe12]
set_property port_width 10 [get_debug_ports u_ila_1/probe12]
connect_debug_port u_ila_1/probe12 [get_nets [list {sin_cos_inst/m_axis_data_tdata_sine[4][0]} {sin_cos_inst/m_axis_data_tdata_sine[4][1]} {sin_cos_inst/m_axis_data_tdata_sine[4][2]} {sin_cos_inst/m_axis_data_tdata_sine[4][3]} {sin_cos_inst/m_axis_data_tdata_sine[4][4]} {sin_cos_inst/m_axis_data_tdata_sine[4][5]} {sin_cos_inst/m_axis_data_tdata_sine[4][6]} {sin_cos_inst/m_axis_data_tdata_sine[4][7]} {sin_cos_inst/m_axis_data_tdata_sine[4][8]} {sin_cos_inst/m_axis_data_tdata_sine[4][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe13]
set_property port_width 10 [get_debug_ports u_ila_1/probe13]
connect_debug_port u_ila_1/probe13 [get_nets [list {sin_cos_inst/m_axis_data_tdata_sine[5][0]} {sin_cos_inst/m_axis_data_tdata_sine[5][1]} {sin_cos_inst/m_axis_data_tdata_sine[5][2]} {sin_cos_inst/m_axis_data_tdata_sine[5][3]} {sin_cos_inst/m_axis_data_tdata_sine[5][4]} {sin_cos_inst/m_axis_data_tdata_sine[5][5]} {sin_cos_inst/m_axis_data_tdata_sine[5][6]} {sin_cos_inst/m_axis_data_tdata_sine[5][7]} {sin_cos_inst/m_axis_data_tdata_sine[5][8]} {sin_cos_inst/m_axis_data_tdata_sine[5][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe14]
set_property port_width 10 [get_debug_ports u_ila_1/probe14]
connect_debug_port u_ila_1/probe14 [get_nets [list {sin_cos_inst/m_axis_data_tdata_sine[7][0]} {sin_cos_inst/m_axis_data_tdata_sine[7][1]} {sin_cos_inst/m_axis_data_tdata_sine[7][2]} {sin_cos_inst/m_axis_data_tdata_sine[7][3]} {sin_cos_inst/m_axis_data_tdata_sine[7][4]} {sin_cos_inst/m_axis_data_tdata_sine[7][5]} {sin_cos_inst/m_axis_data_tdata_sine[7][6]} {sin_cos_inst/m_axis_data_tdata_sine[7][7]} {sin_cos_inst/m_axis_data_tdata_sine[7][8]} {sin_cos_inst/m_axis_data_tdata_sine[7][9]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe15]
set_property port_width 10 [get_debug_ports u_ila_1/probe15]
connect_debug_port u_ila_1/probe15 [get_nets [list {sin_cos_inst/m_axis_data_tdata_sine[6][0]} {sin_cos_inst/m_axis_data_tdata_sine[6][1]} {sin_cos_inst/m_axis_data_tdata_sine[6][2]} {sin_cos_inst/m_axis_data_tdata_sine[6][3]} {sin_cos_inst/m_axis_data_tdata_sine[6][4]} {sin_cos_inst/m_axis_data_tdata_sine[6][5]} {sin_cos_inst/m_axis_data_tdata_sine[6][6]} {sin_cos_inst/m_axis_data_tdata_sine[6][7]} {sin_cos_inst/m_axis_data_tdata_sine[6][8]} {sin_cos_inst/m_axis_data_tdata_sine[6][9]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_1mhz]
