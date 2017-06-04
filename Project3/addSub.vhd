--4 bit Adder Subtractor
library ieee;
use ieee.std_logic_1164.all;
entity addsub is
   port( OP: in std_logic;
          A,B  : in std_logic_vector(3 downto 0);
          output  : out std_logic_vector(3 downto 0);
          Cout: out std_logic);
end addsub;

architecture struct of addsub is
component fulladder is
    Port ( a : in std_logic;
       b : in std_logic;
       cin : in std_logic;
       s : out std_logic;
       cout : out std_logic);
end component;
signal C1, C2, C3, C4: std_logic;
signal TMP: std_logic_vector(3 downto 0);

begin
TMP(0) <= OP xor B(0);
TMP(1) <= OP xor B(1);
TMP(2) <= OP xor B(2);
TMP(3) <= OP xor B(3);
FA0:fulladder port map(A(0),TMP(0),OP, output(0),C1);-- R0
FA1:fulladder port map(A(1),TMP(1),C1, output(1),C2);-- R1
FA2:fulladder port map(A(2),TMP(2),C2, output(2),C3);-- R2
FA3:fulladder port map(A(3),TMP(3),C3, output(3),C4);-- R3
Cout <= C4;
end struct;