--------------------------------------------------------------------------------
-- (c) Copyright 2010 - 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--------------------------------------------------------------------------------
-- Description:
-- This is an example testbench for the DDS Compiler IP core.
-- The testbench has been generated by Vivado to accompany the IP core
-- instance you have generated.
--
-- This testbench is for demonstration purposes only.  See note below for
-- instructions on how to use it with your core.
--
-- See the DDS Compiler product guide for further information
-- about this core.
--
--------------------------------------------------------------------------------
-- Using this testbench
--
-- This testbench instantiates your generated DDS Compiler core
-- instance named "dds_compiler_0".
--
-- Use Vivado's Run Simulation flow to run this testbench.  See the Vivado
-- documentation for details.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity tb_motion_controller is
end tb_motion_controller;

architecture tb of tb_motion_controller is

  -----------------------------------------------------------------------
  -- Timing constants
  -----------------------------------------------------------------------
  constant CLOCK_PERIOD_DDS : time := 1000 ns;
  constant CLOCK_PERIOD_TLV : time := 5000 ns;
  constant T_HOLD       : time := 10 ns;
  constant T_STROBE     : time := CLOCK_PERIOD_DDS - (1 ns);

  -----------------------------------------------------------------------
  -- DUT input signals
  -----------------------------------------------------------------------

  -- General inputs
  signal clk_dds                         : std_logic := '0'; -- DDS clock
  signal clk_dac                         : std_logic := '0'; -- DAC control clock

  signal reset : STD_LOGIC := '1';
  signal phase_inc_threshold :  std_logic_vector(31 downto 0) := x"FFFF1000";
  signal phase_inc_delta :  std_logic_vector(15 downto 0) := x"0001";
  signal channel_status :  std_logic; 
  signal dac_dataA :  std_logic;
  signal dac_dataB :  std_logic;
  signal dac_sck :  std_logic;
  signal clk :  STD_LOGIC := '0';
  signal quadA :  STD_LOGIC := '0';
  signal quadB :  STD_LOGIC := '0';
  signal index :  STD_LOGIC := '0'; -- New reset input
  signal count :  STD_LOGIC_VECTOR(7 downto 0);
      
component motion_controller_top is
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
end component motion_controller_top;
	
begin

mc_inst : motion_controller_top 
   port map (
        clk_dac             => clk_dac,
        clk_dds             => clk_dds,
        reset               => reset,
        phase_inc_threshold => phase_inc_threshold,
        phase_inc_delta     => phase_inc_delta,
        channel_status      => channel_status,
        dac_dataA           => dac_dataA,
        dac_dataB           => dac_dataB,
        dac_sck             => dac_sck,
        clk                 => clk_dac,
        quadA               => quadA,
        quadB               => quadB,
        index               => index,
        count               => count
          );


  clock_gen_dds : process
  begin
    clk_dds <= '0';
    wait for CLOCK_PERIOD_DDS;
      loop
        clk_dds <= '0';
        wait for CLOCK_PERIOD_DDS/2;
        clk_dds <= '1';
        wait for CLOCK_PERIOD_DDS/2;
      end loop;
  end process clock_gen_dds;
  
  
  clock_gen_tlv : process
  begin
    clk_dac <= '0';
    wait for CLOCK_PERIOD_TLV;
      loop
        clk_dac <= '0';
        wait for CLOCK_PERIOD_TLV/2;
        clk_dac <= '1';
        wait for CLOCK_PERIOD_TLV/2;
      end loop;
  end process clock_gen_tlv;
  
  quadA_proc : process
  begin
      wait for CLOCK_PERIOD_TLV;
      loop
        quadA <= '1';
        wait for 2 ms;
        quadA <= '0';
        wait for 2 ms;
      end loop;
  end process quadA_proc;
  
  quadB_proc : process
  begin
      wait for CLOCK_PERIOD_TLV;
      loop
        wait for 2 ms;
        quadB <= '1';
        wait for 2 ms;
        quadB <= '0';
      end loop;
  end process quadB_proc;
  
  stimuli : process
    
  begin
    -- Drive inputs T_HOLD time after rising edge of clock
    --wait until rising_edge(clk_dac);
    wait for 5 ms;
    reset <= '1';
    wait for 5 ms;
    reset <= '0';
    wait;
    -- Input a constant phase increment each cycle, and run for long enough to produce 5 periods of outputs
--    for cycle in 0 to 100000 loop

--      wait for CLOCK_PERIOD_TLV;
--    end loop;
       
--    report "Not a real failure. Simulation finished successfully. Test completed successfully" severity failure;
--    wait;

  end process stimuli;
  
  
end tb;

