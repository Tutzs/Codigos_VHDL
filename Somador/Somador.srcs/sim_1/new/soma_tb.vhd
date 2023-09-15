library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity soma_tb is
--  Port ( );
end soma_tb;

architecture Behavioral of soma_tb is
    component subtrator 
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               b : in STD_LOGIC_VECTOR (3 downto 0);
               saida : out STD_LOGIC_VECTOR (3 downto 0);
               overflow : out STD_LOGIC;
               op : in STD_LOGIC);
    end component;

    signal sa,sb,ss: STD_LOGIC_VECTOR (3 downto 0);
    signal sover, sop: STD_LOGIC;

begin
    uuu: subtrator port map (a => sa, b=> sb, saida => ss, overflow => sover, op => sop);
    
    stimulus: process
    begin
    sa <= "0000"; sb <= "0000"; sop <= '0';
    wait for 10ns;
    
    wait;
    end process; 

end Behavioral;
