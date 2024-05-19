----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.05.2024 02:04:42
-- Design Name: 
-- Module Name: dds_test - Behavioral
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
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dds_test is
  port (
    reset_rtl : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end dds_test;

architecture Behavioral of dds_test is
  component design_2_wrapper is
  port (
    sys_clock : in STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    S_AXIS_PHASE_0_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 ):= (others => '0');  -- data payload
    S_AXIS_PHASE_0_tvalid : in STD_LOGIC := '0';  -- payload is valid
    clk_out : out STD_LOGIC
  );
  end component design_2_wrapper;

  signal s_axis_phase_tdata : STD_LOGIC_VECTOR ( 15 downto 0 ):= (others => '0');  -- data payload
  signal s_axis_phase_tvalid : STD_LOGIC; 
  signal clk : STD_LOGIC;
  
begin

phase_increment: process (clk)
   variable phase : unsigned(15 downto 0) := (others => '0');
begin
  if rising_edge(clk) then
    -- Input an incrementing phase each cycle, and run for long enough to produce 5 periods of outputs
    s_axis_phase_tvalid  <= '1';
    s_axis_phase_tdata(15 downto 0) <= std_logic_vector(phase);  -- phase index
    phase := phase + to_unsigned(655,16);  -- increment input phase by fixed amount each cycle
  end if;
end process;

design_2_wrapper_i: component design_2_wrapper
     port map (
      S_AXIS_PHASE_0_tdata(15 downto 0) => s_axis_phase_tdata(15 downto 0),
      S_AXIS_PHASE_0_tvalid => s_axis_phase_tvalid,
      clk_out => clk ,
      reset_rtl => reset_rtl,
      sys_clock => sys_clock
    );

end Behavioral;
