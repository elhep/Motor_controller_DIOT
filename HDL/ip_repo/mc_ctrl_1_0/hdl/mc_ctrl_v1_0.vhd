library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mc_ctrl_v1_0 is
	generic (
		-- Users to add parameters here
        MAX_CHANNELS : integer := 8;
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 7
	);
	port (
		-- Users to add ports here
		gpio : out std_logic;
		
        sin_cos_ch0_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch0_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch1_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch1_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch2_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch2_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch3_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch3_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch4_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch4_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch5_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch5_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch6_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch6_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch7_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch7_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_channel_reset : out std_logic_vector(MAX_CHANNELS-1 downto 0);
        sin_cos_reset : out std_logic;        
        quad_count0 : in std_logic_vector(31 downto 0);
        quad_count1 : in std_logic_vector(31 downto 0);
        quad_count2 : in std_logic_vector(31 downto 0);
        quad_count3 : in std_logic_vector(31 downto 0);
        quad_count4 : in std_logic_vector(31 downto 0);
        quad_count5 : in std_logic_vector(31 downto 0);
        quad_count6 : in std_logic_vector(31 downto 0);
        quad_count7 : in std_logic_vector(31 downto 0);
        quad_index : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		
		s00_axi_rready	: in std_logic
	);
end mc_ctrl_v1_0;

architecture arch_imp of mc_ctrl_v1_0 is

	-- component declaration
	component mc_ctrl_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 7
		);
		port (
		gpio : out std_logic;
        sin_cos_ch0_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch0_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch1_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch1_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch2_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch2_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch3_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch3_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch4_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch4_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch5_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch5_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch6_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch6_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_ch7_phase_inc_threshold : out std_logic_vector(31 downto 0);
        sin_cos_ch7_phase_inc_delta : out std_logic_vector(31 downto 0);
        sin_cos_channel_reset : out std_logic_vector(MAX_CHANNELS-1 downto 0);
        sin_cos_reset : out std_logic;
        quad_count0 : in std_logic_vector(31 downto 0);
        quad_count1 : in std_logic_vector(31 downto 0);
        quad_count2 : in std_logic_vector(31 downto 0);
        quad_count3 : in std_logic_vector(31 downto 0);
        quad_count4 : in std_logic_vector(31 downto 0);
        quad_count5 : in std_logic_vector(31 downto 0);
        quad_count6 : in std_logic_vector(31 downto 0);
        quad_count7 : in std_logic_vector(31 downto 0);
        quad_index : out std_logic;
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component mc_ctrl_v1_0_S00_AXI;

begin

-- Instantiation of Axi Bus Interface S00_AXI
mc_ctrl_v1_0_S00_AXI_inst : mc_ctrl_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
		gpio => gpio,
        sin_cos_ch0_phase_inc_threshold => sin_cos_ch0_phase_inc_threshold,
        sin_cos_ch0_phase_inc_delta => sin_cos_ch0_phase_inc_delta,
        sin_cos_ch1_phase_inc_threshold => sin_cos_ch1_phase_inc_threshold,
        sin_cos_ch1_phase_inc_delta => sin_cos_ch1_phase_inc_delta,
        sin_cos_ch2_phase_inc_threshold => sin_cos_ch2_phase_inc_threshold,
        sin_cos_ch2_phase_inc_delta => sin_cos_ch2_phase_inc_delta,
        sin_cos_ch3_phase_inc_threshold => sin_cos_ch3_phase_inc_threshold,
        sin_cos_ch3_phase_inc_delta => sin_cos_ch3_phase_inc_delta,
        sin_cos_ch4_phase_inc_threshold => sin_cos_ch4_phase_inc_threshold,
        sin_cos_ch4_phase_inc_delta => sin_cos_ch4_phase_inc_delta,
        sin_cos_ch5_phase_inc_threshold => sin_cos_ch5_phase_inc_threshold,
        sin_cos_ch5_phase_inc_delta => sin_cos_ch5_phase_inc_delta,
        sin_cos_ch6_phase_inc_threshold => sin_cos_ch6_phase_inc_threshold,
        sin_cos_ch6_phase_inc_delta => sin_cos_ch6_phase_inc_delta,
        sin_cos_ch7_phase_inc_threshold => sin_cos_ch7_phase_inc_threshold,
        sin_cos_ch7_phase_inc_delta => sin_cos_ch7_phase_inc_delta,
        sin_cos_reset => sin_cos_reset,
        quad_count0 => quad_count0,
        quad_count1 => quad_count1,
        quad_count2 => quad_count2,
        quad_count3 => quad_count3,
        quad_count4 => quad_count4,
        quad_count5 => quad_count5,
        quad_count6 => quad_count6,
        quad_count7 => quad_count7,
        quad_index => quad_index,
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
