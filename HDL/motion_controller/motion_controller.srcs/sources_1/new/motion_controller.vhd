----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2024 01:20:49
-- Design Name: 
-- Module Name: motion_controller - Behavioral
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

entity motion_controller is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    clk_125MHz : in STD_LOGIC;
    dip_switches_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    led_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    reset : in STD_LOGIC;
    spi_miso : inout STD_LOGIC;
    spi_mosi : inout STD_LOGIC;
    spi_clk : inout STD_LOGIC;
    spi_cs : in STD_LOGIC;
    uart_rxd : in STD_LOGIC;
    uart_txd : out STD_LOGIC;
    eth_rst : out std_logic
  );
end motion_controller;

architecture Behavioral of motion_controller is
    component mc_design_wrapper is
        port (
        DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
        DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
        DDR_cas_n : inout STD_LOGIC;
        DDR_ck_n : inout STD_LOGIC;
        DDR_ck_p : inout STD_LOGIC;
        DDR_cke : inout STD_LOGIC;
        DDR_cs_n : inout STD_LOGIC;
        DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
        DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_odt : inout STD_LOGIC;
        DDR_ras_n : inout STD_LOGIC;
        DDR_reset_n : inout STD_LOGIC;
        DDR_we_n : inout STD_LOGIC;
        FIXED_IO_ddr_vrn : inout STD_LOGIC;
        FIXED_IO_ddr_vrp : inout STD_LOGIC;
        FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
        FIXED_IO_ps_clk : inout STD_LOGIC;
        FIXED_IO_ps_porb : inout STD_LOGIC;
        FIXED_IO_ps_srstb : inout STD_LOGIC;
        clk_125MHz : in STD_LOGIC;
        dip_switches_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );    
        gpio_rtl_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
        reset : in STD_LOGIC;
        spi_rtl_io0_io : inout STD_LOGIC;
        spi_rtl_io1_io : inout STD_LOGIC;
        spi_rtl_sck_io : inout STD_LOGIC;
        spi_rtl_spisel : in STD_LOGIC;
        spi_rtl_ss_io : inout STD_LOGIC_VECTOR ( 0 to 0 ); 
        uart_rxd : in STD_LOGIC;
        uart_txd : out STD_LOGIC
      );
    end component mc_design_wrapper;
    
      signal spisel : STD_LOGIC_VECTOR(0 downto 0); 
      signal counter : integer range 0 to 124999999; -- Counter for 1 Hz frequency
      signal gpio_rtl_tri_o : STD_LOGIC_VECTOR ( 3 downto 0 );
begin


mc_wrapper_i: component mc_design_wrapper
     port map (
        DDR_addr            => DDR_addr,          			
        DDR_ba              => DDR_ba,            
        DDR_cas_n           => DDR_cas_n,         
        DDR_ck_n            => DDR_ck_n,          
        DDR_ck_p            => DDR_ck_p,          
        DDR_cke             => DDR_cke,           
        DDR_cs_n            => DDR_cs_n,            
        DDR_dm              => DDR_dm,            
        DDR_dq              => DDR_dq,            
        DDR_dqs_n           => DDR_dqs_n,         
        DDR_dqs_p           => DDR_dqs_p,         
        DDR_odt             => DDR_odt,           
        DDR_ras_n           => DDR_ras_n,         
        DDR_reset_n         => DDR_reset_n,       
        DDR_we_n            => DDR_we_n,          
        FIXED_IO_ddr_vrn    => FIXED_IO_ddr_vrn,  
        FIXED_IO_ddr_vrp    => FIXED_IO_ddr_vrp,  
        FIXED_IO_mio        => FIXED_IO_mio,      
        FIXED_IO_ps_clk     => FIXED_IO_ps_clk,   
        FIXED_IO_ps_porb    => FIXED_IO_ps_porb,  
        FIXED_IO_ps_srstb   => FIXED_IO_ps_srstb, 
        clk_125MHz => clk_125MHz,
        dip_switches_4bits_tri_i => dip_switches_4bits_tri_i,
        gpio_rtl_tri_o => gpio_rtl_tri_o,
        reset => reset,
        spi_rtl_io0_io => spi_miso,
        spi_rtl_io1_io => spi_mosi,
        spi_rtl_sck_io  => spi_clk,
        spi_rtl_spisel => spi_cs,
        spi_rtl_ss_io => spisel,       
        uart_rxd => uart_rxd,
        uart_txd => uart_txd
    );
    
   process (clk_125MHz)
    begin
        if rising_edge(clk_125MHz) then
            -- Increment the counter
            counter <= counter + 1;
        end if;
    end process;
    
    -- Generate LED drive signal (1 Hz frequency)
    led_4bits_tri_o(0) <= '1' when counter < 62500000 else '0'; -- 1 Hz = 125 MHz / 125000000   
    led_4bits_tri_o(3 downto 1) <= gpio_rtl_tri_o(3 downto 1);
    eth_rst <= '1';
    
end Behavioral;
