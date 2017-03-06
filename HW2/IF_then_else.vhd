----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 08:00:32 PM
-- Design Name: 
-- Module Name: IF_then_else - Behavioral
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

entity IF_then_else is
 port(
      p: in integer;
      output :out std_logic_vector(1 downto 0)
  );
end IF_then_else;

architecture Behavioral of IF_then_else is

begin

    process(p)
    begin
        if(p>5 and p<10)then
            output<= "00";
        elsif(p>10 and p<15)then
            output<= "01";
        elsif(p>15 and p<20)then
            output<= "10";
        elsif(p>20 and p<25)then
            output<="11";
        end if;
    end process;
end Behavioral;
