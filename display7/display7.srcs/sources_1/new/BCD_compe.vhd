library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_compe is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0); -- BCD A
           B : in STD_LOGIC_VECTOR (3 downto 0); -- BCD B
           an: out STD_LOGIC_VECTOR(3 downto 0); -- indica display que será aceso 
           selet : in STD_LOGIC; -- indica qual dos dois valores BCD será mostrado 
           segOut: out STD_LOGIC_VECTOR(6 downto 0));
end BCD_compe;

architecture Behavioral of BCD_compe is
    component multiplexador2
    Port ( 
           sel: in STD_LOGIC;
           an : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component driver_bcd7 
    Port ( BCD : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal A_decod, B_decod: STD_LOGIC_VECTOR (6 downto 0);
    signal anodo: std_logic_vector(3 downto 0);
    
begin
    mux_in: multiplexador2 port map(selet, anodo);
    decoder_A: driver_bcd7  port map(A, A_decod );
    decoder_B: driver_bcd7  port map(B, B_decod);
    an <= anodo;
    
    with anodo select 
        segOut <= A_decod when "1110",
                  B_decod when "1101",
                  "1111111" when others;  
                
    
    
end Behavioral;