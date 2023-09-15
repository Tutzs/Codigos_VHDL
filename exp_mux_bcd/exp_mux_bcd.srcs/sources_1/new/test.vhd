library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end test;

architecture Behavioral of test is
   
    component bcd_7seg 
        Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
               seg : out STD_LOGIC_VECTOR (6 downto 0);
               an : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal i : std_logic_vector(3 downto 0);
    signal counter : unsigned(1 downto 0) := "00";

begin

    decode : bcd_7seg port map (sw => i, seg => seg);

    display_on : process(clk, rst)
        begin
            if rst = '1' then
                an <= "1111";
                i <= (others => '0');
            elsif rising_edge(clk) then
                case counter is
                    when "00" => -- primeiro liga o primeiro display com o numero D
                         i <= D;
                         an <= "1110";
                    when "01" => -- depois liga o segundo display com o numero C
                         i <= C;
                         an <= "1101";
                    when "10" => -- depois liga o terceiro display com o numero B
                         i <= B;
                         an <= "1011";  
                    when "11" => -- depois liga o quarto display com o numero A
                         i <= A;
                         an <= "0111";
                    when others =>
                         an <= "    1111";
                end case;
                 
                 counter <= counter + "01";
                 
            end if;
        end process;

end Behavioral;