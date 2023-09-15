library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ChaveSEL is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           saida : out STD_LOGIC_VECTOR (3 downto 0));
end ChaveSEL;

architecture Behavioral of ChaveSEL is

begin
    saida <= a when sel = '0' else b when sel = '1';

end Behavioral;
