library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity som1 is
    Port ( a : in std_logic;
           b : in std_logic;
           cin : in std_logic;
           s : out std_logic;
           cout : out std_logic);
end som1;

architecture Behavioral of som1 is

begin

    s <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);

end Behavioral;