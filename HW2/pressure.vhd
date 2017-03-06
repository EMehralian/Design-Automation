----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 07:38:06 PM
-- Design Name: 
-- Module Name: pressure - Behavioral
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

entity pressure is
    port(
        p: in integer;
        output :out std_logic_vector(1 downto 0)
    );
end pressure;

architecture arc_select of pressure is

begin
    with p select output <=
    "00" when 5 to 9,
    "01" when 10 to 14,
    "10" when 15 to 19,
    "11" when 20 to 25,
    "UU" when others;


end arc_select;
