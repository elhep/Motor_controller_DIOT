library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity quad is
    Port ( clk : in STD_LOGIC;
           quadA : in STD_LOGIC;
           quadB : in STD_LOGIC;
           index : in STD_LOGIC; -- New reset input
           count : out STD_LOGIC_VECTOR(7 downto 0));
end quad;

    architecture Behavioral of quad is
    signal quadA_delayed, quadB_delayed : STD_LOGIC_VECTOR(2 downto 0);
    signal count_enable, count_direction : STD_LOGIC;
    signal count_internal : UNSIGNED(7 downto 0);
begin

    process(clk)
    begin
        if rising_edge(clk) then
            quadA_delayed <= quadA_delayed(1 downto 0) & quadA;
            quadB_delayed <= quadB_delayed(1 downto 0) & quadB;                 
        end if;
    end process;

    count_enable <= quadA_delayed(1) xor quadA_delayed(2) xor quadB_delayed(1) xor quadB_delayed(2);
    count_direction <= quadA_delayed(1) xor quadB_delayed(2);

    process(clk)
    begin
        if rising_edge(clk) then
            if index = '1' then
                count_internal <= (others => '0'); -- Reset the counter if index is high
            elsif count_enable = '1' then
                if count_direction = '1' then
                    count_internal <= count_internal + 1;
                else
                    count_internal <= count_internal - 1;
                end if;
            end if;
        end if;
    end process;

    count <= STD_LOGIC_VECTOR(count_internal);

end Behavioral;