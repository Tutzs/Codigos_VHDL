library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity clock200 is
    Port(
        clk : in std_logic;
        clk_200 : out std_logic
    );
end clock200;

architecture Behavioral of clock200 is

    signal prescaler : integer range 0 to 100_000 := 100_000;
    signal counter : integer range 1 to 100_000 := 1;
    signal newClock : std_logic := '0';

begin

    clkDivisor : process(clk)
        begin
            if rising_edge(clk) then
                if counter = prescaler then
                    counter <= 1;
                    newClock <= not newClock;
                else
                    counter <= counter + 1;
                end if;
            end if;
        end process;

    clk_200 <= newClock;

end Behavioral;