library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity master is
    Port(
        clk: in std_logic;
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Sel: in std_logic;
        led: out std_logic;
        OVF: out std_logic;
        an : out std_logic_vector(3 downto 0);
        seg: out std_logic_vector(6 downto 0)
    );  
end master;

architecture Behavioral of master is
    component comp1 
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           saida : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component clock200
        Port(
            clk : in std_logic;
            clk_200 : out std_logic
        );
    end component;

    component display_mux
        Port(
            clk : in std_logic;
            A : in std_logic_vector(3 downto 0); 
            B : in std_logic_vector(3 downto 0); 
            C : in std_logic_vector(3 downto 0); 
            D : in std_logic_vector(3 downto 0); 
            an : out std_logic_vector(3 downto 0);
            seg : out std_logic_vector(6 downto 0)
        );
    end component;

    component full_adder
        Port(
            clk : in std_logic;
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Sel : in std_logic;
            OVF : out std_logic;
            S: out std_logic_vector(3 downto 0)
        );
    end component;

    signal clk_200 : std_logic;
    signal D : std_logic_vector(3 downto 0);
    signal sel_1 : std_logic_vector(3 downto 0);
 
begin

    led <= '1' when sel = '1' else '0' when sel = '0';
     
    display_clock : clock200 port map(clk => clk, clk_200 => clk_200);

    adder : full_adder port map(clk => clk, A => A, B => B, Sel => Sel, OVF => OVF, S => D);

    display : display_mux port map(clk => clk_200, A => A, B => B, C => "1111", D => D, an => an, seg => seg);
    
end Behavioral;

                