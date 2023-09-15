library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port ( sel : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0));
end mux;

architecture Behavioral of mux is

begin
    with sel select
        an <= "1110" when '0',
              "1101" when '1';
  
end Behavioral;
