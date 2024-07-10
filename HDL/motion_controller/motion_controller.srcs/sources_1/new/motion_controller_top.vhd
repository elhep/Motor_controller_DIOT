----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2024 12:36:44
-- Design Name: 
-- Module Name: motion_controller_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity motion_controller_top is
    generic (MAX_CHANNELS : positive := 8);
  Port (
        clk_12MHz : in STD_LOGIC;
        reset : in STD_LOGIC;
        spi_miso : inout STD_LOGIC;
        spi_mosi : inout STD_LOGIC;
        spi_clk : inout STD_LOGIC;
        spi_cs : in STD_LOGIC;
        uart_rxd : in STD_LOGIC;
        uart_txd : out STD_LOGIC;
        led_2bits_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
        push_buttons_1bit_tri_i : in STD_LOGIC;
        -- TODO: Expand to 8 channels
        dac_dataA : out std_logic_vector(MAX_CHANNELS-1 downto 0);
        dac_dataB : out std_logic_vector(MAX_CHANNELS-1 downto 0);
        dac_sck :   out std_logic_vector(MAX_CHANNELS-1 downto 0);
        quadA : in STD_LOGIC;
        quadB : in STD_LOGIC;
        index : in STD_LOGIC
   );
end motion_controller_top;

architecture Behavioral of motion_controller_top is

  component mc_design_wrapper is
  port (
    clk_12MHz : in STD_LOGIC;
    clk_1mhz : out STD_LOGIC;
    gpio_mc : out STD_LOGIC;
    led_2bits_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    push_buttons_1bit_tri_i : in STD_LOGIC;
    quad_count : in STD_LOGIC_VECTOR ( 7 downto 0 );
    quad_index : out STD_LOGIC;
    reset : in STD_LOGIC;
    sin_cos_ch0_phase_inc_delta     : out STD_LOGIC_VECTOR ( 31 downto 0 );    
    sin_cos_ch0_phase_inc_threshold : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sin_cos_ch1_phase_inc_delta     : out STD_LOGIC_VECTOR ( 31 downto 0 );    
    sin_cos_ch1_phase_inc_threshold : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sin_cos_ch2_phase_inc_delta     : out STD_LOGIC_VECTOR ( 31 downto 0 );    
    sin_cos_ch2_phase_inc_threshold : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sin_cos_ch3_phase_inc_delta     : out STD_LOGIC_VECTOR ( 31 downto 0 );    
    sin_cos_ch3_phase_inc_threshold : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sin_cos_ch4_phase_inc_delta     : out STD_LOGIC_VECTOR ( 31 downto 0 );    
    sin_cos_ch4_phase_inc_threshold : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sin_cos_ch5_phase_inc_delta     : out STD_LOGIC_VECTOR ( 31 downto 0 );    
    sin_cos_ch5_phase_inc_threshold : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sin_cos_ch6_phase_inc_delta     : out STD_LOGIC_VECTOR ( 31 downto 0 );    
    sin_cos_ch6_phase_inc_threshold : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sin_cos_ch7_phase_inc_delta     : out STD_LOGIC_VECTOR ( 31 downto 0 );    
    sin_cos_ch7_phase_inc_threshold : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sin_cos_reset : out STD_LOGIC_VECTOR ( 7 downto 0 );
    spi_rtl_io0_io : inout STD_LOGIC;
    spi_rtl_io1_io : inout STD_LOGIC;
    spi_rtl_sck_io : inout STD_LOGIC;
    spi_rtl_spisel : in STD_LOGIC;
    spi_rtl_ss_io : inout STD_LOGIC_VECTOR ( 0 to 0 );
    uart_rxd : in STD_LOGIC;
    uart_txd : out STD_LOGIC
  );
end component mc_design_wrapper;

   component sin_cos_gen is
   port (clk_dac : in std_logic;
         clk_dds : in std_logic;
         reset : in std_logic;
         phase_inc_threshold : in std_logic_vector(31 downto 0);
         phase_inc_delta : in std_logic_vector(31 downto 0);
         channel_status : out std_logic; 
         dac_dataA : out std_logic;
         dac_dataB : out std_logic;
         dac_sck : out std_logic
         );
    end component sin_cos_gen;
     
    component quad is
    Port ( clk : in STD_LOGIC;
           quadA : in STD_LOGIC;
           quadB : in STD_LOGIC;
           index : in STD_LOGIC; -- New reset input
           count : out STD_LOGIC_VECTOR(7 downto 0));
    end component quad;

   type array_type is array (natural range <>) of std_logic_vector(31 downto 0);
   signal phase_in_cnt : std_logic_vector(31 downto 0) := (others => '1');
   signal channel_en : std_logic := '0'; 
   signal channel_start : std_logic := '0';
   signal clk_1mhz : STD_LOGIC;
   signal gpio_mc : STD_LOGIC;
   signal quad_count : STD_LOGIC_VECTOR ( 7 downto 0 );
   signal quad_index : STD_LOGIC;
   signal sin_cos_ch0_phase_inc_delta : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch0_phase_inc_threshold : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch1_phase_inc_delta : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch1_phase_inc_threshold : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch2_phase_inc_delta : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch2_phase_inc_threshold : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch3_phase_inc_delta : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch3_phase_inc_threshold : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch4_phase_inc_delta : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch4_phase_inc_threshold : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch5_phase_inc_delta : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch5_phase_inc_threshold : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch6_phase_inc_delta : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch6_phase_inc_threshold : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch7_phase_inc_delta : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_ch7_phase_inc_threshold : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal sin_cos_reset : STD_LOGIC_VECTOR ( 7 downto 0 );
   signal spisel : std_logic_vector(0 downto 0) := "0";
   signal clk_dac : std_logic;
   signal clk_dds : std_logic;                      
   signal channel_status : STD_LOGIC_VECTOR ( 7 downto 0 ); 
   signal dac_dataA_tmp : std_logic_vector(MAX_CHANNELS-1 downto 0);
   signal dac_dataB_tmp : std_logic_vector(MAX_CHANNELS-1 downto 0);
   signal dac_sck_tmp : std_logic_vector(MAX_CHANNELS-1 downto 0);
   signal led_2bits_tri_o_tmp : STD_LOGIC_VECTOR ( 1 downto 0 );
   signal counter : integer range 0 to 12000000; -- Counter for 1 Hz frequency
   signal probe0 :  STD_LOGIC_VECTOR(0 DOWNTO 0);
   signal probe1 :  STD_LOGIC_VECTOR(0 DOWNTO 0);
   signal probe2 :  STD_LOGIC_VECTOR(0 DOWNTO 0);
   signal probe3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
   signal probe4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
   signal probe5 :  STD_LOGIC_VECTOR(0 DOWNTO 0);
   signal probe6 :  STD_LOGIC_VECTOR(0 DOWNTO 0);
   signal probe7 :  STD_LOGIC_VECTOR(0 DOWNTO 0);   
   signal probe8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
   signal probe9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
   signal clk_out1 : std_logic;
   signal clk_out2 : std_logic;
   signal clk_out3 : std_logic;
   signal clk_out4 : std_logic;
   signal clk_100kHz : std_logic;
   signal clk_out6 : std_logic;
   signal clk_out7 : std_logic;
   signal locked : std_logic;
 
   signal phase_inc_delta : array_type(0 to MAX_CHANNELS - 1);
   --signal sin_cos_reset : STD_LOGIC_VECTOR(7 downto 0);
   signal phase_inc_threshold : array_type(0 to MAX_CHANNELS - 1);

   
begin
   
   mc_wrapper_i: component mc_design_wrapper
     port map (
        clk_12MHz                       => clk_12MHz,
        reset                           => reset,
        clk_1MHz                        => clk_1MHz,
        gpio_mc                         => gpio_mc,
        led_2bits_tri_o                 => led_2bits_tri_o_tmp,
        push_buttons_1bit_tri_i         => push_buttons_1bit_tri_i,
        quad_count                      => quad_count,
        quad_index                      => quad_index,
        sin_cos_ch0_phase_inc_delta     => sin_cos_ch0_phase_inc_delta,
        sin_cos_ch0_phase_inc_threshold => sin_cos_ch0_phase_inc_threshold,
        sin_cos_ch1_phase_inc_delta     => sin_cos_ch1_phase_inc_delta,
        sin_cos_ch1_phase_inc_threshold => sin_cos_ch1_phase_inc_threshold,
        sin_cos_ch2_phase_inc_delta     => sin_cos_ch2_phase_inc_delta,
        sin_cos_ch2_phase_inc_threshold => sin_cos_ch2_phase_inc_threshold,
        sin_cos_ch3_phase_inc_delta     => sin_cos_ch3_phase_inc_delta,
        sin_cos_ch3_phase_inc_threshold => sin_cos_ch3_phase_inc_threshold,
        sin_cos_ch4_phase_inc_delta     => sin_cos_ch4_phase_inc_delta,
        sin_cos_ch4_phase_inc_threshold => sin_cos_ch4_phase_inc_threshold,
        sin_cos_ch5_phase_inc_delta     => sin_cos_ch5_phase_inc_delta,
        sin_cos_ch5_phase_inc_threshold => sin_cos_ch5_phase_inc_threshold,    
        sin_cos_ch6_phase_inc_delta     => sin_cos_ch6_phase_inc_delta,
        sin_cos_ch6_phase_inc_threshold => sin_cos_ch6_phase_inc_threshold,
        sin_cos_ch7_phase_inc_delta     => sin_cos_ch7_phase_inc_delta,
        sin_cos_ch7_phase_inc_threshold => sin_cos_ch7_phase_inc_threshold,     
        sin_cos_reset                   => sin_cos_reset,
        spi_rtl_io0_io                  => spi_miso,
        spi_rtl_io1_io                  => spi_mosi,
        spi_rtl_sck_io                  => spi_clk,
        spi_rtl_spisel                  => spi_cs,
        spi_rtl_ss_io                   => spisel,       
        uart_rxd                        => uart_rxd,
        uart_txd                        => uart_txd
    ); 
    
     ila_i: entity work.ila_0
     port map (
        clk => clk_12Mhz,
        probe0 => probe0,
        probe1 => probe1,
        probe2 => probe2,
        probe3 => probe3,
        probe4 => probe4,
        probe5 => probe5,
        probe6 => probe6,
        probe7 => probe7,
        probe8 => probe8,
        probe9 => probe9 
    ); 
-- DAC clock generation 100 kHz
 clk_wiz_i : entity work.clk_wiz_0 
 port map (
        clk_out1 => clk_out1,
        clk_out2 => clk_out2,
        clk_out3 => clk_out3,
        clk_out4 => clk_out4,
        clk_out5 => clk_100kHz,
        clk_out6 => clk_out6,
        clk_out7 => clk_out7,
        reset => reset,
        locked => locked,
        clk_in1 => clk_12Mhz
 );
 
 GEN_INSTANCES:
    for I in 0 to MAX_CHANNELS - 1 generate
 
   sin_cos_inst : sin_cos_gen
   port map (
        clk_dac             => clk_100kHz,
        clk_dds             => clk_1mhz,
        reset               => sin_cos_reset(I),
        phase_inc_threshold => phase_inc_threshold(I),
        phase_inc_delta     => phase_inc_delta(I),
        channel_status      => channel_status(I),
        dac_dataA           => dac_dataA_tmp(I),
        dac_dataB           => dac_dataB_tmp(I),
        dac_sck             => dac_sck_tmp(I));
    end generate GEN_INSTANCES;
           
      
    quad_inst : quad
    port map (
      clk             => clk_100kHz, 
      quadA           => quadA,
      quadB           => quadB,
      index           => index,
      count           => quad_count
      );
      
   -- blinky
   process (clk_12MHz)
    begin
        if rising_edge(clk_12MHz) then
            -- Increment the counter
            counter <= counter + 1;
        end if;
    end process;
 
    -- Generate LED drive signal (1 Hz frequency)
    led_2bits_tri_o(1) <= '1' when counter < 6000000 else '0'; -- 1 Hz = 12 MHz / 6000000   
    led_2bits_tri_o(0) <= led_2bits_tri_o_tmp(0);
    probe3 <= sin_cos_ch0_phase_inc_threshold;
    probe4 <= sin_cos_ch0_phase_inc_delta;
    probe8 <= sin_cos_ch1_phase_inc_threshold;
    probe9 <= sin_cos_ch1_phase_inc_delta;
    
    probe0(0) <= sin_cos_reset(0);
    probe1(0) <= dac_sck_tmp(0);
    probe2(0) <= dac_dataA_tmp(0);
    
    probe5(0) <= sin_cos_reset(1);
    probe6(0) <= dac_sck_tmp(1);
    probe7(0) <= dac_dataA_tmp(1);
    
    dac_dataA <= dac_dataA_tmp;
    dac_dataB <= dac_dataB_tmp;
    dac_sck <= dac_sck_tmp;
    
    phase_inc_threshold(0) <= sin_cos_ch0_phase_inc_threshold;
    phase_inc_delta(0) <= sin_cos_ch0_phase_inc_delta;
    phase_inc_threshold(1) <= sin_cos_ch1_phase_inc_threshold;
    phase_inc_delta(1) <= sin_cos_ch1_phase_inc_delta;
    phase_inc_threshold(2) <= sin_cos_ch2_phase_inc_threshold;
    phase_inc_delta(2) <= sin_cos_ch2_phase_inc_delta;
    phase_inc_threshold(3) <= sin_cos_ch3_phase_inc_threshold;
    phase_inc_delta(3) <= sin_cos_ch3_phase_inc_delta;
    phase_inc_threshold(4) <= sin_cos_ch4_phase_inc_threshold;
    phase_inc_delta(4) <= sin_cos_ch4_phase_inc_delta;
    phase_inc_threshold(5) <= sin_cos_ch5_phase_inc_threshold;
    phase_inc_delta(5) <= sin_cos_ch5_phase_inc_delta;
    phase_inc_threshold(6) <= sin_cos_ch6_phase_inc_threshold;
    phase_inc_delta(6) <= sin_cos_ch6_phase_inc_delta;
    phase_inc_threshold(7) <= sin_cos_ch7_phase_inc_threshold;
    phase_inc_delta(7) <= sin_cos_ch7_phase_inc_delta;
    
end Behavioral;
