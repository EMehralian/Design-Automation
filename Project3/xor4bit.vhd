library ieee;  
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all; 
 
entity xorer is  
  port(A,B : in std_logic_vector(7 downto 0);  
      output : out std_logic_vector(7 downto 0));  
end xorer; 
architecture archi of xorer is  
  begin  
    lots_of_xor: for i in 0 to 7 generate
        output(i) <= A(i) xor B(i);
    end generate;
end archi; 