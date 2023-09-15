library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity subtrator is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           saida : out STD_LOGIC_VECTOR (3 downto 0);
           overflow : out STD_LOGIC;
           op : in STD_LOGIC);
end subtrator;
architecture Behavioral of subtrator is
    component soma4 
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Cin : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Cout : out STD_LOGIC);
    end component;
    
    component Comp1 
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           saida : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component ChaveSEL 
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               b : in STD_LOGIC_VECTOR (3 downto 0);
               sel : in STD_LOGIC;
               saida : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    signal fio1, fio2: STD_LOGIC_VECTOR(3 downto 0);
begin
    complemento: Comp1 port map(a => b, saida => fio1); 
    --complemento1: Comp1 port map (b , fio1);
    chave: ChaveSEL port map(a => b, b => fio1, saida => fio2 , sel => op);
    soma: soma4 port map (A => a, B =>fio2, Cin => op, S => saida, Cout => overflow);

end Behavioral;
