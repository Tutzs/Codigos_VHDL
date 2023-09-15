library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity info is
    Port ( clk : in STD_LOGIC;
           A : out STD_LOGIC_VECTOR (3 downto 0);
           B : out STD_LOGIC_VECTOR (3 downto 0);
           C : out STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0));
end info;

architecture Behavioral of info is

    signal counter : integer range 0 to 2 := 0;

begin
    
    numbers : process(clk)
    begin
        if rising_edge(clk) then
            case counter is
                when 0 =>
                     A <= "1111"; -- BLANK
                     B <= "1111"; -- BLANK
                     C <= "0000"; -- 0
                     D <= "1001"; -- 9
                     counter <= 1;
                when 1 =>  
                     A <= "0010"; -- 2
                     B <= "0100"; -- 4
                     C <= "0110"; -- 6
                     D <= "0010"; -- 2
                     counter <= 2;
                when 2 => 
                     A <= "1111"; -- BLANK
                     B <= "1111"; -- BLANK
                     C <= "1111"; -- BLANK
                     D <= "1111"; -- BLANK
                     counter <= 0;
            end case;
        end if;
    end process;
    
    

end Behavioral;
