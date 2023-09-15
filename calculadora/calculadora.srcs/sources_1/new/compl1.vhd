library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compl1 is
    Port ( a : in std_logic_vector (3 downto 0);
           sel : in std_logic;
           z : out std_logic_vector (3 downto 0));
end compl1;

architecture Behavioral of compl1 is

begin
    process (sel, a) 
    begin
        if (sel = '1') then
            z <= not a;
        else
            z <= a;
        end if;
    end process;

end Behavioral;