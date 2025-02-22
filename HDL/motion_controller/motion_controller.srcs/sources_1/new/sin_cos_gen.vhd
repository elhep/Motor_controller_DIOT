library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity sin_cos_gen is
   port (
         clk_dac : in std_logic;
         clk_dds : in std_logic;
         reset : in std_logic;
         phase_inc_threshold : in std_logic_vector(31 downto 0);
         phase_inc_delta : in std_logic_vector(31 downto 0);
         channel_status : out std_logic; 
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
   signal dac3A_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac3B_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac4A_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac4B_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac5A_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac5B_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac6A_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac6B_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac7A_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac7B_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac8A_data : STD_LOGIC_VECTOR(11 downto 0);
   signal dac8B_data : STD_LOGIC_VECTOR(11 downto 0);
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
     
   
attribute MARK_DEBUG : string;
attribute MARK_DEBUG of update_DACs: signal is "TRUE";  
attribute MARK_DEBUG of sync: signal is "TRUE";  
attribute MARK_DEBUG of dac1A_data: signal is "TRUE";  
attribute MARK_DEBUG of dac1B_data: signal is "TRUE";  
attribute MARK_DEBUG of clk_en: signal is "TRUE";  
attribute MARK_DEBUG of channel_en: signal is "TRUE";  
attribute MARK_DEBUG of channel_start: signal is "TRUE";  
attribute MARK_DEBUG of m_axis_data_tdata_cosine: signal is "TRUE";  
attribute MARK_DEBUG of m_axis_data_tdata_sine: signal is "TRUE"; 
attribute MARK_DEBUG of phase_inc_cnt: signal is "TRUE";
attribute MARK_DEBUG of phase_inc_threshold: signal is "TRUE";

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
		dac3A_data    => dac3A_data,
		dac3B_data    => dac3B_data,
		dac4A_data    => dac4A_data,
		dac4B_data    => dac4B_data,
		dac5A_data    => dac5A_data,
		dac5B_data    => dac5B_data,
		dac6A_data    => dac6A_data,
		dac6B_data    => dac6B_data,
		dac7A_data    => dac7A_data,
		dac7B_data    => dac7B_data,
		dac8A_data    => dac8A_data,
		dac8B_data    => dac8B_data,
		clk_en        => clk_en,
		sync          => sync,
		update_done   => update_done,
		test1         => test1,
		test2         => test2,
		test3         => test3,
		test4         => test4,
		data1         => dac_dataA,
		data2         => dac_dataB,
		data3         => dac_dataC,
		data4         => dac_dataD,
		data5         => dac_dataE,
		data6         => dac_dataF,
		data7         => dac_dataG,
		data8         => dac_dataH,
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
  dac_sync <= sync;
  -- Data master channel alias signals: update these only when they are valid
  m_axis_data_tdata_cosine      <= m_axis_data_tdata(9 downto 0) when m_axis_data_tvalid = '1';
  m_axis_data_tdata_sine        <= m_axis_data_tdata(25 downto 16) when m_axis_data_tvalid = '1';
  
  dac1A_data <= std_logic_vector(UNSIGNED(m_axis_data_tdata_cosine)+2**9) & "00";
  dac1B_data <= std_logic_vector(UNSIGNED(m_axis_data_tdata_sine)+2**9) & "00";
    
  dac2A_data <= m_axis_data_tdata_cosine & "00";
  dac2B_data <= m_axis_data_tdata_sine & "00";
  
  dac3A_data <= m_axis_data_tdata_cosine & "00";
  dac3B_data <= m_axis_data_tdata_sine & "00";
  
  dac4A_data <= m_axis_data_tdata_cosine & "00";
  dac4B_data <= m_axis_data_tdata_sine & "00";
  
  dac5A_data <= m_axis_data_tdata_cosine & "00";
  dac5B_data <= m_axis_data_tdata_sine & "00";
  
  dac6A_data <= m_axis_data_tdata_cosine & "00";
  dac6B_data <= m_axis_data_tdata_sine & "00";
  
  dac7A_data <= m_axis_data_tdata_cosine & "00";
  dac7B_data <= m_axis_data_tdata_sine & "00";
  
  dac8A_data <= m_axis_data_tdata_cosine & "00";
  dac8B_data <= m_axis_data_tdata_sine & "00";

  channel_status <= channel_en;



--    For easy debugging
--    dac1A_data <= "00" & m_axis_data_tdata_cosine;
--    dac1B_data <= "00" & m_axis_data_tdata_sine;
--    dac1A_data <=  x"B55";
--    dac1B_data <=  x"A13"; 
--    dac2A_data <= "00" & m_axis_data_tdata_cosine;
--    dac2B_data <= "00" & m_axis_data_tdata_sine;

end behav;
