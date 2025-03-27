-- WARNING: Do NOT edit the input and output ports in this file in a text
-- editor if you plan to continue editing the block that represents it in
-- the Block Editor! File corruption is VERY likely to occur.

-- Copyright (C) 1991-2003 Altera Corporation
-- Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
-- support information,  device programming or simulation file,  and any other
-- associated  documentation or information  provided by  Altera  or a partner
-- under  Altera's   Megafunction   Partnership   Program  may  be  used  only
-- to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
-- other  use  of such  megafunction  design,  netlist,  support  information,
-- device programming or simulation file,  or any other  related documentation
-- or information  is prohibited  for  any  other purpose,  including, but not
-- limited to  modification,  reverse engineering,  de-compiling, or use  with
-- any other  silicon devices,  unless such use is  explicitly  licensed under
-- a separate agreement with  Altera  or a megafunction partner.  Title to the
-- intellectual property,  including patents,  copyrights,  trademarks,  trade
-- secrets,  or maskworks,  embodied in any such megafunction design, netlist,
-- support  information,  device programming or simulation file,  or any other
-- related documentation or information provided by  Altera  or a megafunction
-- partner, remains with Altera, the megafunction partner, or their respective
-- licensors. No other licenses, including any licenses needed under any third
-- party's intellectual property, are provided herein.


-- Generated by Quartus II Version 2.2 (Build Build 191 03/31/2003)
-- Created on Wed Nov 19 12:02:12 2003

LIBRARY ieee;
USE ieee.std_logic_1164.all;


--  Entity Declaration
ENTITY tlv5637 IS
	PORT
	(
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		update_DACs : IN STD_LOGIC;
		dac1A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac1B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac2A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac2B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac3A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac3B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac4A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac4B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac5A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac5B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac6A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac6B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac7A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac7B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac8A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac8B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		clk_en : IN STD_LOGIC;
		sync : OUT STD_LOGIC;
		update_done : OUT STD_LOGIC;
		test1 : OUT STD_LOGIC;
		test2 : OUT STD_LOGIC;
		test3 : OUT STD_LOGIC;
		test4 : OUT STD_LOGIC;
		data1 : OUT STD_LOGIC;
		data2 : OUT STD_LOGIC;
		data3 : OUT STD_LOGIC;
		data4 : OUT STD_LOGIC;
		data5 : OUT STD_LOGIC;
		data6 : OUT STD_LOGIC;
		data7 : OUT STD_LOGIC;
		data8 : OUT STD_LOGIC;
		sck : OUT STD_LOGIC
	);
END tlv5637;


--  Architecture Body

ARCHITECTURE a OF tlv5637 IS

	TYPE STATE_TYPE IS (
	idle,
	sync_l,
	sync_h,
	data_l,
	data_h,
	data_end,
	next_tx			
	);
	
	TYPE STATE_MAIN IS (
	Midle,
	Mwait_config,
	Mwait_config_repeat,
	Mwait_DAC_A,
	Mwait_DAC_A_repeat,
	Mwait_DAC_B,
	Mwait_DAC_B_repeat,
	Mready		
	);
	
	
	SIGNAL state: STATE_TYPE;
	SIGNAL Mstate: STATE_MAIN;
    signal shift_count : integer range 0 to 35;
	SIGNAL shiftreg,
			dac1_data, dac2_data, dac3_data, dac4_data,
			dac5_data, dac6_data, dac7_data, dac8_data : STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL shiftreg_2, shiftreg_3, shiftreg_4,
			shiftreg_5, shiftreg_6, shiftreg_7, shiftreg_8 : STD_LOGIC_VECTOR (15 downto 0);
	SIGNAL shift_enable, shifter_load, sck_temp, sck_buffer,
			sync_temp, shift_reset, data_temp, data_2_temp,
			data_3_temp, data_4_temp, data_5_temp, data_6_temp,
			data_7_temp, data_8_temp, stop_shift, en_conv : STD_LOGIC;
					
	constant DAC_CONFIG : std_logic_vector (11 downto 0) := "000000000001" ;	
BEGIN
 

--***********************************************************************************************************************************************
--*******************************************	main control state machine	*********************************************************************
--***********************************************************************************************************************************************

PROCESS (clk,reset)
	BEGIN
		IF reset = '1' THEN
			Mstate <= Midle;
		ELSIF clk'EVENT AND clk = '1' THEN	
			if clk_en = '1' then
				CASE Mstate IS
					WHEN Midle =>
						IF update_DACs = '1' THEN
							Mstate <=Mwait_config;
						END IF;
						
					when Mwait_config =>
						IF state = next_tx THEN
							Mstate <=Mwait_DAC_A;
						END IF;						
						
					when Mwait_config_repeat =>
						IF state = next_tx THEN
							Mstate <=Mwait_DAC_A;
						END IF;
						
					when Mwait_DAC_A =>	
						IF state = next_tx THEN
							Mstate <=Mwait_DAC_B;
						END IF;
						
					when Mwait_DAC_A_repeat =>	
						IF state = next_tx THEN
							Mstate <=Mwait_DAC_B;
						END IF;
												
					when Mwait_DAC_B =>  
						IF state = next_tx THEN
							Mstate <=Mready;
						END IF;
					when Mwait_DAC_B_repeat =>  
						IF state = next_tx THEN
							Mstate <=Mready;
						END IF;
						
					when Mready =>
						IF update_DACs = '0' THEN
							Mstate <=Midle;
						END IF;
					



				END CASE;
			end if;
		END IF;
	END PROCESS;



	WITH Mstate  SELECT
		en_conv 	<=		'0' when Midle,
							'1' when Mwait_config,
							'1' when Mwait_config_repeat,
							'1' when Mwait_DAC_A,							
							'1' when Mwait_DAC_A_repeat,
							'1' when Mwait_DAC_B,
							'1' when Mwait_DAC_B_repeat,
							'0' when Mready;
					



WITH Mstate  SELECT
		update_done 	<=	'1' when Midle,
							'1' when Mwait_config,
							'1' when Mwait_config_repeat,
							'1' when Mwait_DAC_A,
							'1' when Mwait_DAC_A_repeat,							
							'1' when Mwait_DAC_B,
							'1' when Mwait_DAC_B_repeat,
							'0' when Mready;
				
						
WITH Mstate SELECT
-- Fast Mode
--    dac1_data <= "1101" & DAC_CONFIG WHEN Midle,                    -- Write data to control register
--                 "1101" & DAC_CONFIG WHEN Mwait_config,             -- Write data to control register
--                 "1101" & DAC_CONFIG WHEN Mwait_config_repeat,      -- Write data to control register
--                 "0101" & dac1A_data WHEN Mwait_DAC_A,              -- Write data to BUFFER
--                 "0101" & dac1A_data WHEN Mwait_DAC_A_repeat,       -- Write data to BUFFER
--                 "1100" & dac1B_data WHEN Mwait_DAC_B,              -- Write data to DAC A and update DAC B with BUFFER content
--                 "1100" & dac1B_data WHEN Mwait_DAC_B_repeat,       -- Write data to DAC A and update DAC B with BUFFER content
--                 "1100" & dac1B_data WHEN Mready;
-- Slow Mode
    dac1_data <= "1001" & DAC_CONFIG WHEN Midle,                    -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config,             -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config_repeat,      -- Write data to control register
                 "0101" & dac1A_data WHEN Mwait_DAC_A,              -- Write data to BUFFER
                 "0101" & dac1A_data WHEN Mwait_DAC_A_repeat,       -- Write data to BUFFER
                 "1100" & dac1B_data WHEN Mwait_DAC_B,              -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac1B_data WHEN Mwait_DAC_B_repeat,       -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac1B_data WHEN Mready;

WITH Mstate SELECT
    dac2_data <= "1001" & DAC_CONFIG WHEN Midle,                    -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config,             -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config_repeat,      -- Write data to control register
                 "0101" & dac2A_data WHEN Mwait_DAC_A,              -- Write data to BUFFER
                 "0101" & dac2A_data WHEN Mwait_DAC_A_repeat,       -- Write data to BUFFER
                 "1100" & dac2B_data WHEN Mwait_DAC_B,              -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac2B_data WHEN Mwait_DAC_B_repeat,       -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac2B_data WHEN Mready;

WITH Mstate SELECT
    dac3_data <= "1001" & DAC_CONFIG WHEN Midle,                    -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config,             -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config_repeat,      -- Write data to control register
                 "0101" & dac3A_data WHEN Mwait_DAC_A,              -- Write data to BUFFER
                 "0101" & dac3A_data WHEN Mwait_DAC_A_repeat,       -- Write data to BUFFER
                 "1100" & dac3B_data WHEN Mwait_DAC_B,              -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac3B_data WHEN Mwait_DAC_B_repeat,       -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac3B_data WHEN Mready;

WITH Mstate SELECT
    dac4_data <= "1001" & DAC_CONFIG WHEN Midle,                    -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config,             -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config_repeat,      -- Write data to control register
                 "0101" & dac4A_data WHEN Mwait_DAC_A,              -- Write data to BUFFER
                 "0101" & dac4A_data WHEN Mwait_DAC_A_repeat,       -- Write data to BUFFER
                 "1100" & dac4B_data WHEN Mwait_DAC_B,              -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac4B_data WHEN Mwait_DAC_B_repeat,       -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac4B_data WHEN Mready;

WITH Mstate SELECT
    dac5_data <= "1001" & DAC_CONFIG WHEN Midle,                    -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config,             -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config_repeat,      -- Write data to control register
                 "0101" & dac5A_data WHEN Mwait_DAC_A,              -- Write data to BUFFER
                 "0101" & dac5A_data WHEN Mwait_DAC_A_repeat,       -- Write data to BUFFER
                 "1100" & dac5B_data WHEN Mwait_DAC_B,              -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac5B_data WHEN Mwait_DAC_B_repeat,       -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac5B_data WHEN Mready;

WITH Mstate SELECT
    dac6_data <= "1001" & DAC_CONFIG WHEN Midle,                    -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config,             -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config_repeat,      -- Write data to control register
                 "0101" & dac6A_data WHEN Mwait_DAC_A,              -- Write data to BUFFER
                 "0101" & dac6A_data WHEN Mwait_DAC_A_repeat,       -- Write data to BUFFER
                 "1100" & dac6B_data WHEN Mwait_DAC_B,              -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac6B_data WHEN Mwait_DAC_B_repeat,       -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac6B_data WHEN Mready;

WITH Mstate SELECT
    dac7_data <= "1001" & DAC_CONFIG WHEN Midle,                    -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config,             -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config_repeat,      -- Write data to control register
                 "0101" & dac7A_data WHEN Mwait_DAC_A,              -- Write data to BUFFER
                 "0101" & dac7A_data WHEN Mwait_DAC_A_repeat,       -- Write data to BUFFER
                 "1100" & dac7B_data WHEN Mwait_DAC_B,              -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac7B_data WHEN Mwait_DAC_B_repeat,       -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac7B_data WHEN Mready;

WITH Mstate SELECT
    dac8_data <= "1001" & DAC_CONFIG WHEN Midle,                    -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config,             -- Write data to control register
                 "1001" & DAC_CONFIG WHEN Mwait_config_repeat,      -- Write data to control register
                 "0101" & dac8A_data WHEN Mwait_DAC_A,              -- Write data to BUFFER
                 "0101" & dac8A_data WHEN Mwait_DAC_A_repeat,       -- Write data to BUFFER
                 "1100" & dac8B_data WHEN Mwait_DAC_B,              -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac8B_data WHEN Mwait_DAC_B_repeat,       -- Write data to DAC A and update DAC B with BUFFER content
                 "1100" & dac8B_data WHEN Mready;
--***********************************************************************************************************************************************
--*******************************************	data transfer state machine	*********************************************************************
--***********************************************************************************************************************************************


	PROCESS (clk,reset)
	BEGIN
		IF reset = '1' THEN
			state <= idle;
		ELSIF clk'EVENT AND clk = '1' THEN	
			if clk_en = '1' then
				CASE state IS
					WHEN idle =>
						IF en_conv = '1' THEN
							state <=sync_l;
						END IF;
					when sync_l =>
							state<=sync_h;
					when sync_h =>	
							state<=data_l;
					when data_l =>  
						if stop_shift = '1' then
							state <= data_end;
						else	
							state<=data_h;
						end if;	
					when data_h =>
							state<=data_l; 
					when data_end =>
							state<=next_tx;
					when next_tx=>
							state<=idle;
					



				END CASE;
			end if;
		END IF;
	END PROCESS;

	WITH state SELECT
		shift_reset 	<=	'1' when idle,
							'1' when sync_l,
							'1' when sync_h,							
							'0' when data_l,
							'0' when data_h,
							'0' when data_end,
							'0' when next_tx;
							
							
	WITH state SELECT
		sck_temp        <=  '0' when idle,
							'0' when sync_l,
							'0' when sync_h,							
							'0' when data_l,
							'1' when data_h,
							'1' when data_end,
							'1' when next_tx;
		 
WITH state SELECT
		shift_enable    <=  '0' when idle,
							'0' when sync_l,
							'1' when sync_h,							
							'0' when data_l,
							'1' when data_h,
							'0' when data_end,
							'0' when next_tx;
							
	
							
	WITH state SELECT
	shifter_load        <=  '1' when idle,
							'1' when sync_l,
							'0' when sync_h,							
							'0' when data_l,
							'0' when data_h,
							'0' when data_end,
							'0' when next_tx;
							
	WITH state SELECT
	sync_temp          <=   '1' when idle,
							'1' when sync_l,
							'1' when sync_h,							
							'0' when data_l,
							'0' when data_h,
							'0' when data_end,
							'1' when next_tx;
		
		
		

process(clk,shift_count)
begin
	if clk'event and clk='1' then
		if clk_en = '1' then
			if shift_reset='1' or reset = '1'  then
	            shift_count<=0;	
				stop_shift <= '0';
			elsif  stop_shift='0' then
					shift_count <=shift_count+1;		
			end if;
		end if;
	end if;
   	if shift_count = 32 then	
		stop_shift<='1';
	else
		stop_shift<='0';
	end if;
		end process;
		
		
		
							
process(clk)
begin
if clk'event and clk='0' then
	sck_buffer<=sck_temp;
	sync<=sync_temp; 
--	data<=data_temp;
end if;
end process;

	sck<=sck_buffer;
-- Process to handle data signals for 8 channels
process(clk)
begin
	if clk'event and clk='1' then
		if clk_en = '1' then
			data1 <= data_temp; 
			data2 <= data_2_temp; 
			data3 <= data_3_temp;
			data4 <= data_4_temp;
			data5 <= data_5_temp;
			data6 <= data_6_temp;
			data7 <= data_7_temp;
			data8 <= data_8_temp;
		end if;
	end if;	
end process;

-- Process to handle shift registers for 8 channels
process(clk)
begin
	if clk'event and clk='1' then
		if clk_en = '1' then
			if shifter_load = '1' then
				shiftreg   <= dac1_data;
				shiftreg_2 <= dac2_data;
				shiftreg_3 <= dac3_data;
				shiftreg_4 <= dac4_data;
				shiftreg_5 <= dac5_data;
				shiftreg_6 <= dac6_data;
				shiftreg_7 <= dac7_data;
				shiftreg_8 <= dac8_data;
			else
				if (shift_enable) = '1' then
					shiftreg(15 downto 0)   <= shiftreg(14 downto 0) & '0';
					shiftreg_2(15 downto 0) <= shiftreg_2(14 downto 0) & '0';
					shiftreg_3(15 downto 0) <= shiftreg_3(14 downto 0) & '0';
					shiftreg_4(15 downto 0) <= shiftreg_4(14 downto 0) & '0';
					shiftreg_5(15 downto 0) <= shiftreg_5(14 downto 0) & '0';
					shiftreg_6(15 downto 0) <= shiftreg_6(14 downto 0) & '0';
					shiftreg_7(15 downto 0) <= shiftreg_7(14 downto 0) & '0';
					shiftreg_8(15 downto 0) <= shiftreg_8(14 downto 0) & '0';
					data_temp   <= shiftreg(15);
					data_2_temp <= shiftreg_2(15);
					data_3_temp <= shiftreg_3(15);
					data_4_temp <= shiftreg_4(15);
					data_5_temp <= shiftreg_5(15);
					data_6_temp <= shiftreg_6(15);
					data_7_temp <= shiftreg_7(15);
					data_8_temp <= shiftreg_8(15);
				end if;
			end if;
		end if;
	end if;
end process;

	

test1<= en_conv;
test2<=stop_shift;
test3<='1';
test4<=shift_enable;


END a;
