----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2017 04:00:25 PM
-- Design Name: 
-- Module Name: Configuration - Behavioral
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

entity M1 is
--  Port ( );
end M1;

architecture Behavioral of Configuration is
 component multiplier? 
      port(A, B:in   bit;
      ?    SUM: out bit);
 ?end component;
 for MODULE1:multiplier 
                 use entity work.multiplier (sequential);
 for MODULE2:multiplier
     use entity work.multiplier (array);
begin

   MODULE1:multiplier port map();
   
   MODULE2:multiplier port map();
end Behavioral;
