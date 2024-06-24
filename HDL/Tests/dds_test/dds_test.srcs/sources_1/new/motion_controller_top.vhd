library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity motion_controller_top is
   port (clk_dac : in std_logic;
         clk_dds : in std_logic;
         reset : in std_logic;
         phase_inc_threshold : in std_logic_vector(31 downto 0);
         phase_inc_delta : in std_logic_vector(15 downto 0);
         channel_status : out std_logic; 
         dac_dataA : out std_logic;
         dac_dataB : out std_logic;
         dac_sck : out std_logic;
         clk : in STD_LOGIC;
         quadA : in STD_LOGIC;
         quadB : in STD_LOGIC;
         index : in STD_LOGIC; -- New reset input
         count : out STD_LOGIC_VECTOR(7 downto 0)
          );
end motion_controller_top;

architecture behav of motion_controller_top is

   signal phase_in_cnt : std_logic_vector(31 downto 0) := (others => '1');
   signal channel_en : std_logic := '0'; 
   signal channel_start : std_logic := '0';
   
   component sin_cos_gen is
   port (clk_dac : in std_logic;
         clk_dds : in std_logic;
         reset : in std_logic;
         phase_inc_threshold : in std_logic_vector(31 downto 0);
         phase_inc_delta : in std_logic_vector(15 downto 0);
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
	
begin

  -----------------------------------------------------------------------
  -- Instantiate the DUT
  -----------------------------------------------------------------------

   sin_cos_inst : sin_cos_gen
   port map (
        clk_dac             => clk_dac,
        clk_dds             => clk_dds,
        reset               => reset,
        phase_inc_threshold => phase_inc_threshold,
        phase_inc_delta     => phase_inc_delta,
        channel_status      => channel_status,
        dac_dataA           => dac_dataA,
        dac_dataB           => dac_dataB,
        dac_sck             => dac_sck);
           
      
    quad_inst : quad
    port map (
      clk             => clk_dds, 
      quadA           => quadA,
      quadB           => quadB,
      index           => index,
      count           => count
      );


end behav;
