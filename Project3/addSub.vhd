--4 bit Adder Subtractor
library ieee;
use ieee.std_logic_1164.all;
entity addsub is
   port( OP: in std_logic;
          A,B  : in std_logic_vector(15 downto 0);
          output  : out std_logic_vector(15 downto 0);
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
signal C: std_logic_vector(16 downto 0);
signal TMP: std_logic_vector(15 downto 0);

begin
c(0)<= OP;
temp:for I in 0 to 15 generate
    TMP(I) <= OP xor B(I);  
end generate temp;

fin:for I in 0 to 15 generate
    FAI:fulladder port map(A(I),TMP(I),C(I), output(I),C(I+1));
end generate fin;
Cout <= C(16);
end struct;