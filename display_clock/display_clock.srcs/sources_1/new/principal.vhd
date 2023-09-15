library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity principal is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end principal;

architecture Behavioral of principal is
    component clock05
        Port(
            clk : in std_logic;
            clk_05 : out std_logic);
    end component;
    
    component clock200
        Port(
            clk : in std_logic;
            clk_200 : out std_logic);
    end component;

    component display7
        Port(
            clk : in std_logic;
            A : in std_logic_vector(3 downto 0); 
            B : in std_logic_vector(3 downto 0); 
            C : in std_logic_vector(3 downto 0); 
            D : in std_logic_vector(3 downto 0); 
            an : out std_logic_vector(3 downto 0); 
            seg : out std_logic_vector(6 downto 0));
    end component;

    component info
        Port(
            clk : in std_logic;
            A : out std_logic_vector(3 downto 0);
            B : out std_logic_vector(3 downto 0);
            C : out std_logic_vector(3 downto 0);
            D : out std_logic_vector(3 downto 0));
    end component;

    signal clk_05, clk_200 : std_logic;
    signal A, B, C, D : std_logic_vector(3 downto 0);


begin
        
    clock_05hz  : clock05  port map(clk => clk, clk_05  => clk_05);
    clock_200hz : clock200 port map(clk => clk, clk_200 => clk_200);

    info1 : info port map(clk => clk_05, A => A, B => B, C => C, D => D);

    display1 : display7 port map(clk => clk_200, A => A, B => B, C => C, D => D, an => an, seg => seg);

end Behavioral;
