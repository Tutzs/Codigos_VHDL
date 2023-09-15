library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp1 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end comp1;

architecture Behavioral of comp1 is

begin
    with A select
        seg <=  "1000000" when "0000", -- 0
                "1111001" when "1111", -- 1
                "0100100" when "1110", -- 2
                "0110000" when "1101", -- 3
                "0011001" when "1100", -- 4
                "0010010" when "1011", -- 5
                "0000010" when "1010", -- 6
                "1111000" when "1001", -- 7
                "0000000" when "1000", -- 8
                --"0010000" when "1001", -- 9
                "1111111" when others;   -- Blank

end Behavioral;
