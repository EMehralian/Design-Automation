----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2017 12:45:08 AM
-- Design Name: 
-- Module Name: multiplier2bit - Behavioral
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

entity multiplier2bit is
Port ( 
       a,b:in bit_vector(1 downto 0);
       s: out bit_vector(3 downto 0));
end multiplier2bit;

architecture Behavioral of multiplier2bit is

begin

    s(3)<= a(0) and a(1) and b(1) and b(0);
    s(2)<= (a(1) and (not a(0)) and b(1)) or (a(1) and b(1) and (not b(0)) );
    s(1)<= (a(1) and (not a(0)) and b(0)) or (a(1) and (not b(1)) and b(0)) or ( (not a(1)) and a(0) and b(1)) or (a(0) and b(1) and (not b(0)));
    s(0)<= a(0) and b(0);
    
end Behavioral;
