----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 07:55:03 PM
-- Design Name: 
-- Module Name: conditional - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conditional is
 port(
       p: in integer;
       output :out std_logic_vector(1 downto 0)
   );
end conditional;

architecture Behavioral of conditional is

begin
output <= "00" when p > 5 and p < 10 else
       "01" when p > 15 and p < 10  else
       "10" when p > 20 and p < 15  else
       "11" when p > 25 and p < 20 ;

end Behavioral;
