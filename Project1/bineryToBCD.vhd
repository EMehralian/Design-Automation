----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2017 05:05:40 PM
-- Design Name: 
-- Module Name: bineryToBCD - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bineryToBCD is
Port ( 
       a:in std_logic_vector(7 downto 0);
       b,c: out std_logic_vector(3 downto 0)
       );
end bineryToBCD;

architecture Behavioral of bineryToBCD is
    
begin
    process(a)
    variable v : std_logic_vector(19 downto 0);
    begin
        v := "000000000000" & a ;
        for i in 1 to a'Length loop
            if (v(11 downto 8) >= "0101" ) then
                v(11 downto 8) := v(11 downto 8)+ "0011";
            end if;    
            if(v(15 downto 12) >= "0101" ) then
                v(15 downto 12) := v(15 downto 12)+ "0011";     
            end if; 
             if(v(19 downto 16) >= "0101" ) then
                v(19 downto 16) := v(19 downto 16)+ "0011";     
             end if; 
            v := v(18 downto 0)&'0' ;
        end loop;
        b <= v(11 downto 8);
        c <= v(15 downto 12);
    end process;

end Behavioral;
