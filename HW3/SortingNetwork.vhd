
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
package mytypes is
    type data is array (natural range <>) of std_logic_vector(7 downto 0);
end package mytypes;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Comparator is
 port (  
     A1,B1   : in std_logic_vector(7 downto 0);
     A2,B2   : out std_logic_vector(7 downto 0)
  );

end Comparator;

architecture Behavioral of Comparator is
begin
 A2 <= A1 when (A1>B1) else B1;
 B2 <= B1 when (A1>B1) else A1;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.mytypes.all;

entity SortingNetwork is
generic(N: integer := 8);
port(
    
    clk: in std_logic;
    input: in data(N-1 downto 0);
    output: inout integer :=0
);
end SortingNetwork;

architecture Behavioral of SortingNetwork is
component Comparator is
 port (  
     A1,B1   : in std_logic_vector(7 downto 0);
     A2,B2   : out std_logic_vector(7 downto 0)
  );
end component;
begin
  GEN_REG:for I in 0 to 2*N-3 generate
    ODD: if I mod 2 = 1 generate
        GEN_REG:for J in 0 to 2*N-3 generate
            
        end generate GEN_REG;    
    end generate ODD;
    
     Even: if I mod 2 =0 generate
        GEN_REG:for K in 0 to 2*N-2 generate
            
        end generate GEN_REG;    
    end generate ODD;
    end generate Even;
  end generate GEN_REG;

end Behavioral;