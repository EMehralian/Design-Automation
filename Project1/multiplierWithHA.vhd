----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2017 03:24:23 PM
-- Design Name: 
-- Module Name: multiplierWithHA - Behavioral
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

entity multiplierWithHA is
Port ( 
       a,b:in std_logic_vector(1 downto 0);
       s: out std_logic_vector(3 downto 0));
end multiplierWithHA;

architecture Behavioral of multiplierWithHA is
component halfAdder is
Port (  a: in std_logic;
		b: in std_logic;
		s: out std_logic;
		cout: out std_logic);
end component;
signal sig1, sig2 , sig3 , sig4: std_logic;
begin
    s(0) <= a(0) and b(0);
    sig1 <= a(1) and b(0);
    sig2 <= a(0) and b(1);
    sig3 <= a(1) and b(1);
    Half1:halfAdder port map (sig1,sig2,s(1),sig4);
    Half2:halfAdder port map (sig3,sig4,s(2),s(3));

end Behavioral;
