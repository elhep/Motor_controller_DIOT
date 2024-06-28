library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity sin_cos_gen is
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
end sin_cos_gen;

architecture behav of sin_cos_gen is

  -----------------------------------------------------------------------
  -- Timing constants
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------
  -- DUT input signals
  -----------------------------------------------------------------------

  -- Phase slave channel signals
  signal s_axis_phase_tvalid             : std_logic := '0';  -- payload is valid
  signal s_axis_phase_tdata              : std_logic_vector(31 downto 0) := (others => '0');  -- data payload

  -- Data master channel signals
  signal m_axis_data_tvalid              : std_logic := '0';  -- payload is valid
  signal m_axis_data_tdata               : std_logic_vector(31 downto 0) := (others => '0');  -- data payload

  -- Phase slave channel alias signals
  signal s_axis_phase_tdata_inc        : std_logic_vector(31 downto 0) := (others => '0');

  -- Data master channel alias signals
  signal m_axis_data_tdata_cosine      : std_logic_vector(9 downto 0) := (others => '0');
  signal m_axis_data_tdata_sine        : std_logic_vector(9 downto 0) := (others => '0');

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
   
   signal sync_flag : STD_LOGIC := '0';
   
   signal phase_inc_cnt : std_logic_vector(31 downto 0) := (others => '1');
   signal channel_en : std_logic := '0'; 
   signal channel_start : std_logic := '0';
     
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
    
begin

  -----------------------------------------------------------------------
  -- Instantiate the DUT
  -----------------------------------------------------------------------

  dds_ins : entity work.dds_compiler_1
    port map (
      aclk                            => clk_dds, 
      aclken                          => aclken,
      s_axis_phase_tvalid             => s_axis_phase_tvalid,
      s_axis_phase_tdata              => s_axis_phase_tdata,
      m_axis_data_tvalid              => m_axis_data_tvalid,
      m_axis_data_tdata               => m_axis_data_tdata
      );
      
    tlv5637_ip : tlv5637
	port map
	(
		clk           => clk_dac,
		reset         => reset,
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
		data1         => dac_dataA,
		data2         => dac_dataB,
		sck           => dac_sck
	);
  -----------------------------------------------------------------------
  -- Generate clock
  -----------------------------------------------------------------------
  
  phase_inc_cnt_proc : process(clk_dac, reset)
  begin
    if reset = '1' then
        channel_en <= '0';
        phase_inc_cnt <= (others => '1');
    elsif rising_edge(clk_dac) then
        if(phase_inc_cnt < phase_inc_threshold) then
            channel_en <= '0';
            phase_inc_cnt <= (others => '0');
        else
            channel_en <= '1';
            phase_inc_cnt <= std_logic_vector(unsigned(phase_inc_cnt) - 1);
        end if;  
    end if;
  end process phase_inc_cnt_proc;
 
  -----------------------------------------------------------------------
  -- Generate inputs
  -----------------------------------------------------------------------

  update_dacs_proc : process(clk_dac, reset)
    begin
    if reset = '1' then
        update_DACs <= '0';
    elsif rising_edge(clk_dac) then
        if update_done = '0' or channel_en = '0' then
            update_DACs <= '0';
        else
            update_DACs <= '1';
        end if;
    end if;
  end process update_dacs_proc;
  
  
  dds_dac : process(clk_dds, reset)
    variable phase : unsigned(31 downto 0) := (others => '0');
    --variable sync_flag : std_logic := '0';
  begin
     if reset = '1' then
        s_axis_phase_tvalid <= '0';
        s_axis_phase_tdata(31 downto 0) <= (others => '0');
        aclken <= '0';
    elsif rising_edge(clk_dds) then
        --DAC update
        if(sync = '1' and update_done = '0' and sync_flag = '0' and channel_en = '1') then
            s_axis_phase_tvalid <= '1';    
            aclken <= '1';
            phase := phase + unsigned(phase_inc_delta);
            s_axis_phase_tdata(31 downto 0) <= std_logic_vector(phase);  -- constant phase increment
            sync_flag <= '1';
        elsif(sync = '1' and update_done = '1') then
            sync_flag <= '0';
        else
            s_axis_phase_tvalid <= '0';
            s_axis_phase_tdata(31 downto 0) <= (others => '0');
            aclken <= '0';
        end if;
    end if;

  end process dds_dac;

  -- Phase slave channel alias signals
  s_axis_phase_tdata_inc        <= s_axis_phase_tdata(31 downto 0);
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
