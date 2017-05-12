
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity MemoryBaseSqrt is
  port ( P : in  std_logic_vector(4 downto 0);
       U : out std_logic_vector(2 downto 0)
       );
end MemoryBaseSqrt;

architecture Behavioral of MemoryBaseSqrt is
type mem_t is array (31 downto 0) of integer;
signal memory : mem_t ;
begin
    memory(1)<=1;
    memory(2)<=1;
    memory(3)<=1;
    memory(4)<=2;
    memory(5)<=2;
    memory(6)<=2;
    memory(7)<=2;
    memory(8)<=2;
    memory(9)<=3;
    memory(10)<=3;
    memory(11)<=3;
    memory(12)<=3;
    memory(13)<=3;
    memory(14)<=3;
    memory(15)<=3;
    memory(16)<=4;
    memory(17)<=4;
    memory(18)<=4;
    memory(19)<=4;
    memory(20)<=4;
    memory(21)<=4;
    memory(22)<=4;
    memory(23)<=4;
    memory(24)<=4;
    memory(25)<=5;
    memory(26)<=5;
    memory(27)<=5;
    memory(28)<=5;
    memory(29)<=5;
    memory(30)<=5;
    memory(31)<=5;
    U <= std_logic_vector(to_unsigned(memory(to_integer(unsigned(P))),3));
    
end Behavioral;
