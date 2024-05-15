LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY quad_tb IS
END quad_tb;

ARCHITECTURE behavior OF quad_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT quad
    PORT(
         clk : IN  std_logic;
         quadA : IN  std_logic;
         quadB : IN  std_logic;
         index : IN  std_logic; -- New reset input
         count : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
   
    --Inputs
    signal clk : std_logic := '0';
    signal quadA : std_logic := '0';
    signal quadB : std_logic := '0';
    signal index : std_logic := '0'; -- Initialize index input

    --Outputs
    signal count : std_logic_vector(7 downto 0);

    -- Clock period definitions
    constant clk_period : time := 10 ns;
 
BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: quad PORT MAP (
          clk => clk,
          quadA => quadA,
          quadB => quadB,
          index => index, -- Connect index input
          count => count
        );

    -- Clock process definitions
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin        
        -- Hold reset state for 100 ns.
        wait for 100 ns;  
        
        -- Insert stimulus here 
        quadA <= '1';
        wait for clk_period*10;
        quadA <= '0';
        wait for clk_period*10;

        quadB <= '1';
        wait for clk_period*10;
        quadB <= '0';
        wait for clk_period*10;

        -- Simulate index reset
        index <= '1';
        wait for clk_period*10;
        index <= '0';

        -- Add more stimulus here if needed

        wait;
    end process;

END;