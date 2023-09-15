library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ovf_detec is
    Port ( a : in std_logic;
           b : in std_logic;
           c : in std_logic;
           e : out std_logic);
end ovf_detec;

architecture Behavioral of ovf_detec is

begin

    e <= ((not a) and (not b) and c) or (a and b and (not c));

end Behavioral;