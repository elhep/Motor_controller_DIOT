library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity motion_controller is
   port (clk_dac : in std_logic;
         clk_dds : in std_logic;
         reset : in std_logic;
         phase_in_threshold : in std_logic_vector(31 downto 0);
         channel_status : out std_logic;
         data1 : out std_logic;
         data2 : out std_logic;
         sck : out std_logic
         );
end motion_controller;

architecture behav of motion_controller is

  -----------------------------------------------------------------------
  -- Timing constants
  -----------------------------------------------------------------------
  constant CLOCK_PERIOD_DDS : time := 10 us;
  constant CLOCK_PERIOD_TLV : time := 1000 us;
  constant T_HOLD       : time := 10 ns;
  constant T_STROBE     : time := CLOCK_PERIOD_DDS - (1 ns);

  -----------------------------------------------------------------------
  -- DUT input signals
  -----------------------------------------------------------------------

  -- Phase slave channel signals
  signal s_axis_phase_tvalid             : std_logic := '0';  -- payload is valid
  signal s_axis_phase_tdata              : std_logic_vector(15 downto 0) := (others => '0');  -- data payload

  -- Data master channel signals
  signal m_axis_data_tvalid              : std_logic := '0';  -- payload is valid
  signal m_axis_data_tdata               : std_logic_vector(31 downto 0) := (others => '0');  -- data payload

  -- Phase slave channel alias signals
  signal s_axis_phase_tdata_inc        : std_logic_vector(15 downto 0) := (others => '0');

  -- Data master channel alias signals
  signal m_axis_data_tdata_cosine      : std_logic_vector(9 downto 0) := (others => '0');
  signal m_axis_data_tdata_sine        : std_logic_vector(9 downto 0) := (others => '0');

   --signal reset : STD_LOGIC := '1';
   signal reset2 : STD_LOGIC := '0';
   signal update_DACs : STD_LOGIC := '1';
   signal dac1A_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac1B_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac2A_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac2B_data : STD_LOGIC_VECTOR(11 downto 0);
   signal sync : STD_LOGIC;
   signal update_done : std_logic;
   signal test1 : STD_LOGIC;
   signal test2 : STD_LOGIC;
   signal test3 : STD_LOGIC;
   signal test4 : STD_LOGIC;
   signal clk_en : STD_LOGIC;   
   signal aclken : STD_LOGIC := '1';
   
   signal phase_in_cnt : std_logic_vector(31 downto 0) := (others => '1');
   signal channel_en : std_logic := '0'; 
   signal channel_start : std_logic := '0';
   signal clk : STD_LOGIC;
   signal quadA : STD_LOGIC;
   signal quadB : STD_LOGIC;
   signal index : STD_LOGIC; -- New reset input
   signal count : STD_LOGIC_VECTOR(7 downto 0);
     
  component tlv5637 IS
	PORT
	(
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		update_DACs : IN STD_LOGIC;
		dac1A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac1B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac2A_data : IN STD_LOGIC_VECTOR(11 downto 0);
		dac2B_data : IN STD_LOGIC_VECTOR(11 downto 0);
		clk_en : IN STD_LOGIC;
		sync : OUT STD_LOGIC;
		update_done : out std_logic;
		test1 : OUT STD_LOGIC;
		test2 : OUT STD_LOGIC;
		test3 : OUT STD_LOGIC;
		test4 : OUT STD_LOGIC;
		data1 : OUT STD_LOGIC;
		data2 : OUT STD_LOGIC;
		sck : OUT STD_LOGIC
	);
    end component tlv5637;
    
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

  dds_ins : entity work.dds_compiler_0
    port map (
      aclk                            => clk_dds, 
      aclken                          => aclken,
      s_axis_phase_tvalid             => s_axis_phase_tvalid,
      s_axis_phase_tdata              => s_axis_phase_tdata,
      m_axis_data_tvalid              => m_axis_data_tvalid,
      m_axis_data_tdata               => m_axis_data_tdata
      );
      
      
    quad_inst : entity quad
    port map (
      clk                            => clk_dds, 
      quadA                          => quadA,
      quadB                          => quadB,
      index                          => index,
      count                          => count
      );

    tlv5637_ip : tlv5637
	port map
	(
		clk           => clk_dac,
		reset         => reset2,
		update_DACs   => update_DACs,
		dac1A_data    => dac1A_data,
		dac1B_data    => dac1B_data,
		dac2A_data    => dac2A_data,
		dac2B_data    => dac2B_data,
		clk_en        => clk_en,
		sync          => sync,
		update_done   => update_done,
		test1         => test1,
		test2         => test2,
		test3         => test3,
		test4         => test4,
		data1         => data1,
		data2         => data2,
		sck           => sck
	);
  -----------------------------------------------------------------------
  -- Generate clock
  -----------------------------------------------------------------------
  
  phase_in_cnt_proc : process
  begin
    wait until rising_edge(clk_dac);
    if(phase_in_cnt < phase_in_threshold) then
        channel_en <= '0';
        phase_in_cnt <= (others => '0');
    else
        channel_en <= '1';
        phase_in_cnt <= std_logic_vector(unsigned(phase_in_cnt) - 1);
    end if;  
  end process phase_in_cnt_proc;
 
  -----------------------------------------------------------------------
  -- Generate inputs
  -----------------------------------------------------------------------

  update_dacs_proc : process
    begin
    -- Drive inputs T_HOLD time after rising edge of clock
    wait until rising_edge(clk_dac);
    if update_done = '0' or channel_en = '0' then
        update_DACs <= '0';
    else
        update_DACs <= '1';
    end if;
  end process update_dacs_proc;
  
  
  stimuli3 : process
    variable phase : unsigned(15 downto 0) := (others => '0');
    variable sync_flag : std_logic;
  begin
    -- Drive inputs T_HOLD time after rising edge of clock
    wait until rising_edge(clk_dds);
    --DAC update
    if(sync = '1' and update_done = '0' and sync_flag = '0' and channel_en = '1') then
        s_axis_phase_tvalid <= '1';    
        aclken <= '1';
        phase := phase + to_unsigned(1,16);
        s_axis_phase_tdata(15 downto 0) <= std_logic_vector(phase);  -- constant phase increment
        sync_flag := '1';
    elsif(sync = '1' and update_done = '1') then
        sync_flag := '0';
    else
        s_axis_phase_tvalid <= '0';
        s_axis_phase_tdata(15 downto 0) <= (others => '0');
        aclken <= '0';
    end if;

  end process stimuli3;

  -- Phase slave channel alias signals
  s_axis_phase_tdata_inc        <= s_axis_phase_tdata(15 downto 0);
  clk_en <= '1';

  -- Data master channel alias signals: update these only when they are valid
  m_axis_data_tdata_cosine      <= m_axis_data_tdata(9 downto 0) when m_axis_data_tvalid = '1';
  m_axis_data_tdata_sine        <= m_axis_data_tdata(25 downto 16) when m_axis_data_tvalid = '1';
  
  dac1A_data <= m_axis_data_tdata_cosine & "00";
  dac1B_data <= m_axis_data_tdata_sine & "00";
    
  dac2A_data <= m_axis_data_tdata_cosine & "00";
  dac2B_data <= m_axis_data_tdata_sine & "00";
  
  channel_status <= channel_en;

--    For easy debugging
--    dac1A_data <= "00" & m_axis_data_tdata_cosine;
--    dac1B_data <= "00" & m_axis_data_tdata_sine;
    
--    dac2A_data <= "00" & m_axis_data_tdata_cosine;
--    dac2B_data <= "00" & m_axis_data_tdata_sine;

end behav;
