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
    clk_125MHz : in STD_LOGIC;
    dip_switches_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    led_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    reset : in STD_LOGIC;
    spi_miso : inout STD_LOGIC;
    spi_mosi : inout STD_LOGIC;
    spi_clk : inout STD_LOGIC;
    spi_cs : in STD_LOGIC
  );
end motion_controller;

architecture Behavioral of motion_controller is
    component mc_design_wrapper is
        port (
        clk_125MHz : in STD_LOGIC;
        dip_switches_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
        led_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
        reset : in STD_LOGIC;
        spi_rtl_io0_io : inout STD_LOGIC;
        spi_rtl_io1_io : inout STD_LOGIC;
        spi_rtl_sck_io : inout STD_LOGIC;
        spi_rtl_spisel : in STD_LOGIC;
        spi_rtl_ss_io : inout STD_LOGIC_VECTOR ( 0 to 0 )
      );
    end component mc_design_wrapper;
    
      signal spisel : STD_LOGIC_VECTOR(0 downto 0); 
begin


mc_wrapper_i: component mc_design_wrapper
     port map (
        clk_125MHz => clk_125MHz,
        dip_switches_4bits_tri_i => dip_switches_4bits_tri_i,
        led_4bits_tri_o => led_4bits_tri_o,
        reset => reset,
        spi_rtl_io0_io => spi_miso,
        spi_rtl_io1_io => spi_mosi,
        spi_rtl_sck_io  => spi_clk,
        spi_rtl_spisel => spi_cs,
        spi_rtl_ss_io => spisel
    );

end Behavioral;
