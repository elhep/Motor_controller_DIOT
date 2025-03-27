library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package slv_array_pkg is
        type slv_array is array(natural range <>) of std_logic_vector(31 downto 0);
end package;

package body slv_array_pkg is
    -- No additional functionality needed for just a type declaration
end slv_array_pkg;