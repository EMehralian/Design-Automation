----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2017 03:30:41 PM
-- Design Name: 
-- Module Name: BCDMultipler8in8 - Behavioral
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

entity BCDMultipler8in8 is
Port ( 
       a0,a1,a2,a3,a4,a5,a6,a7:in std_logic_vector(3 downto 0);
       b0,b1,b2,b3,b4,b5,b6,b7:in std_logic_vector(3 downto 0);
       vo0,vo1,vo2,vo3,vo4,vo5,vo6,vo7:out std_logic_vector(3 downto 0)
);
end BCDMultipler8in8;

architecture Behavioral of BCDMultipler8in8 is

begin


end Behavioral;
