library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comp1 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           saida : out STD_LOGIC_VECTOR (3 downto 0));
end Comp1;

architecture Behavioral of Comp1 is

begin
    saida <= NOT a;

end Behavioral;
