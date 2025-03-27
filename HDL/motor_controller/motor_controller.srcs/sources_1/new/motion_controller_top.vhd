library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.slv_array_pkg.all;


entity motor_controller_top is
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
        qspi_flash_io0_io : inout STD_LOGIC;
        qspi_flash_io1_io : inout STD_LOGIC;
        qspi_flash_io2_io : inout STD_LOGIC;
        qspi_flash_io3_io : inout STD_LOGIC;
        qspi_flash_ss_io : inout STD_LOGIC; 
        dac_dataA : out std_logic;
        dac_dataB : out std_logic;
        dac_dataC : out std_logic;
        dac_dataD : out std_logic;
        dac_dataE : out std_logic;
        dac_dataF : out std_logic;
        dac_dataG : out std_logic;
        dac_dataH : out std_logic;
        dac_sck : out std_logic;
        dac_sync : out std_logic;
        enc_a : in std_logic_vector(MAX_CHANNELS-1 downto 0);
        enc_b : in std_logic_vector(MAX_CHANNELS-1 downto 0);
        enc_r : in std_logic_vector(MAX_CHANNELS-1 downto 0);
        led1 : out STD_LOGIC
   );
end motor_controller_top;

architecture Behavioral of motor_controller_top is

  component mc_design_wrapper is
  port (
    clk_12MHz : in STD_LOGIC;
    clk_1mhz : out STD_LOGIC;
    gpio_mc : out STD_LOGIC;
    led_2bits_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    push_buttons_1bit_tri_i : in STD_LOGIC;
    qspi_flash_io0_io : inout STD_LOGIC;
    qspi_flash_io1_io : inout STD_LOGIC;
    qspi_flash_io2_io : inout STD_LOGIC;
    qspi_flash_io3_io : inout STD_LOGIC;
    qspi_flash_ss_io : inout STD_LOGIC;
    quad_count0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    quad_count1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    quad_count2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    quad_count3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    quad_count4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    quad_count5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    quad_count6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    quad_count7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
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
    sin_cos_reset : out STD_LOGIC;
    sin_cos_channel_reset : out STD_LOGIC_VECTOR ( 7 downto 0 );
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
   port (
         clk_dac : in std_logic;
         clk_dds : in std_logic;
         reset : in std_logic;
         reset_channel : in std_logic_vector(MAX_CHANNELS-1 downto 0);
         phase_inc_threshold : in slv_array(0 to MAX_CHANNELS-1);
         phase_inc_delta : in slv_array(0 to MAX_CHANNELS-1);
         channel_status : out std_logic_vector(MAX_CHANNELS-1 downto 0); 
         dac_dataA : out std_logic;
         dac_dataB : out std_logic;
         dac_dataC : out std_logic;
         dac_dataD : out std_logic;
         dac_dataE : out std_logic;
         dac_dataF : out std_logic;
         dac_dataG : out std_logic;
         dac_dataH : out std_logic;
         dac_sck : out std_logic;
         dac_sync : out std_logic
         );
end component sin_cos_gen;
     
    component quad is
    Port ( clk : in STD_LOGIC;
           quadA : in STD_LOGIC;
           quadB : in STD_LOGIC;
           index : in STD_LOGIC; -- New reset input
           count : out STD_LOGIC_VECTOR(31 downto 0));
    end component quad;

   signal phase_in_cnt : std_logic_vector(31 downto 0) := (others => '1');
   signal channel_en : std_logic := '0'; 
   signal channel_start : std_logic := '0';
   signal clk_1mhz : STD_LOGIC;
   signal gpio_mc : STD_LOGIC;
   signal quad_count0 : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal quad_count1 : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal quad_count2 : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal quad_count3 : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal quad_count4 : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal quad_count5 : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal quad_count6 : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal quad_count7 : STD_LOGIC_VECTOR ( 31 downto 0 );
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
   signal sin_cos_channel_reset : STD_LOGIC_VECTOR ( 7 downto 0 );
   signal sin_cos_reset : STD_LOGIC;
   signal spisel : std_logic_vector(0 downto 0) := "0";
   signal clk_dac : std_logic;
   signal clk_dds : std_logic;                      
   signal channel_status : STD_LOGIC_VECTOR ( 7 downto 0 ); 
   signal dac_dataA_tmp : std_logic;
   signal dac_dataB_tmp : std_logic;
   signal dac_dataC_tmp : std_logic;
   signal dac_dataD_tmp : std_logic;
   signal dac_dataE_tmp : std_logic;
   signal dac_dataF_tmp : std_logic;
   signal dac_dataG_tmp : std_logic;
   signal dac_dataH_tmp : std_logic;
   signal dac_sck_tmp : std_logic;
   signal led_2bits_tri_o_tmp : STD_LOGIC_VECTOR ( 1 downto 0 );
   signal counter : unsigned(23 downto 0) := (others => '0');
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
   signal quad_count : slv_array(0 to MAX_CHANNELS - 1);
   signal phase_inc_delta : slv_array(0 to MAX_CHANNELS - 1);
   signal phase_inc_threshold : slv_array(0 to MAX_CHANNELS - 1);

   
--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of enc_a: signal is "TRUE";  
--attribute MARK_DEBUG of enc_b: signal is "TRUE";  
--attribute MARK_DEBUG of enc_r: signal is "TRUE";  
--attribute MARK_DEBUG of clk_100kHz: signal is "TRUE";  

--attribute MARK_DEBUG of sin_cos_ch0_phase_inc_delta: signal is "TRUE";  
--attribute MARK_DEBUG of sin_cos_ch0_phase_inc_threshold: signal is "TRUE";  
--attribute MARK_DEBUG of sin_cos_ch1_phase_inc_delta: signal is "TRUE";  
--attribute MARK_DEBUG of sin_cos_ch1_phase_inc_threshold: signal is "TRUE";  

begin
   
   mc_wrapper_i: component mc_design_wrapper
     port map (
        clk_12MHz                       => clk_12MHz,
        reset                           => reset,
        clk_1MHz                        => clk_1MHz,
        gpio_mc                         => gpio_mc,
        led_2bits_tri_o                 => led_2bits_tri_o_tmp,
        push_buttons_1bit_tri_i         => push_buttons_1bit_tri_i,
        qspi_flash_io0_io               => qspi_flash_io0_io,
        qspi_flash_io1_io               => qspi_flash_io1_io,
        qspi_flash_io2_io               => qspi_flash_io2_io,
        qspi_flash_io3_io               => qspi_flash_io3_io,
        qspi_flash_ss_io                => qspi_flash_ss_io,
        quad_count0                     => quad_count0,
        quad_count1                     => quad_count1,
        quad_count2                     => quad_count2,
        quad_count3                     => quad_count3,
        quad_count4                     => quad_count4,
        quad_count5                     => quad_count5,
        quad_count6                     => quad_count6,
        quad_count7                     => quad_count7,
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
        sin_cos_channel_reset           => sin_cos_channel_reset,
        sin_cos_reset                   => sin_cos_reset,
        spi_rtl_io0_io                  => spi_mosi,
        spi_rtl_io1_io                  => spi_miso,
        spi_rtl_sck_io                  => spi_clk,
        spi_rtl_spisel                  => spi_cs,
        spi_rtl_ss_io                   => spisel,       
        uart_rxd                        => uart_rxd,
        uart_txd                        => uart_txd
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
 
sin_cos_inst : sin_cos_gen
   port map (
        clk_dac             => clk_100kHz,
        clk_dds             => clk_1mhz,
        reset               => sin_cos_reset,
        reset_channel       => sin_cos_channel_reset,
        phase_inc_threshold => phase_inc_threshold,
        phase_inc_delta     => phase_inc_delta,
        channel_status      => channel_status,
        dac_dataA           => dac_dataA_tmp,
        dac_dataB           => dac_dataB_tmp,
        dac_dataC           => dac_dataC_tmp,
        dac_dataD           => dac_dataD_tmp,
        dac_dataE           => dac_dataE_tmp,
        dac_dataF           => dac_dataF_tmp,
        dac_dataG           => dac_dataG_tmp,
        dac_dataH           => dac_dataH_tmp,
        dac_sck             => dac_sck_tmp,
        dac_sync            => dac_sync
   );
           
GEN_QUAD_INSTANCES:
   for I in 0 to MAX_CHANNELS - 1 generate
   quad_inst : quad
   port map (
     clk             => clk_100kHz, 
     quadA           => enc_a(I),
     quadB           => enc_b(I),
     index           => enc_r(I),
     count           => quad_count(I)
  );
  end generate GEN_QUAD_INSTANCES;     
  
  
   -- blinky
   process (clk_12MHz)
    begin
        if rising_edge(clk_12MHz) then
            -- Increment the counter
            counter <= counter + 1;
        end if;
    end process;
 
    -- Generate LED drive signal (1 Hz frequency)
    led_2bits_tri_o(1) <= counter(23);
    led_2bits_tri_o(0) <= led_2bits_tri_o_tmp(0);
    
    led1 <= gpio_mc;
   
    dac_dataA <= dac_dataA_tmp;
    dac_dataB <= dac_dataB_tmp;
    dac_dataC <= dac_dataC_tmp;
    dac_dataD <= dac_dataD_tmp;
    dac_dataE <= dac_dataE_tmp;
    dac_dataF <= dac_dataF_tmp;
    dac_dataG <= dac_dataG_tmp;
    dac_dataH <= dac_dataH_tmp;
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
    
    quad_count0  <= quad_count(0);
    quad_count1  <= quad_count(1);
    quad_count2  <= quad_count(2);
    quad_count3  <= quad_count(3);
    quad_count4  <= quad_count(4);
    quad_count5  <= quad_count(5);
    quad_count6  <= quad_count(6);
    quad_count7  <= quad_count(7);
    
    
end Behavioral;
