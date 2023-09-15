library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_funcionando is
  Port ( a : in STD_LOGIC_VECTOR (3 downto 0); -- BCD A
         b : in STD_LOGIC_VECTOR (3 downto 0); -- BCD B
         an: out STD_LOGIC_VECTOR(3 downto 0); -- indica display que será aceso 
         sel : in STD_LOGIC; -- indica qual dos dois valores BCD será mostrado 
         seg: out STD_LOGIC_VECTOR(6 downto 0));
end display_funcionando;

architecture Behavioral of display_funcionando is

    component bcd_7seg 
        Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
               seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    component mux 
        Port ( sel : in STD_LOGIC;
               an : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal anodo : STD_LOGIC_VECTOR (3 downto 0);
    signal A1, B1 : STD_LOGIC_VECTOR (6 downto 0);
    
begin
    mux_on: mux port map(sel, anodo);
    display1: bcd_7seg port map(a, A1);
    display2: bcd_7seg port map(b, B1);
    an <= anodo;
    
    with anodo select 
            seg <= A1 when "1110",
                   B1 when "1101",
                   "1111111" when others;
end Behavioral;
