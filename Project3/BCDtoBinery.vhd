----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2017 05:34:28 AM
-- Design Name: 
-- Module Name: BCDtoBinery - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCDtoBinery is
port(
    A: in std_logic_vector (31 downto 0);
    B: out std_logic_vector (27 downto 0) := (others => '0')
    );
end BCDtoBinery;

architecture Behavioral of BCDtoBinery is

begin


B <= (A(3 downto 0) * "01") 
                + (A(7 downto 4) * "1010")
                + (A(11 downto 8) * "1100100")
                + (A(15 downto 12) * "1111101000")
                + (A(19 downto 16) * "10011100010000")
                + (A(23 downto 20) * "11000011010100000")
                + (A(27 downto 24) * "11110100001001000000")
                + (A(31 downto 28) * "100110001001011010000000");
end Behavioral;
