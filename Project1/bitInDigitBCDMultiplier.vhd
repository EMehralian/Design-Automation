----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2017 11:59:12 AM
-- Design Name: 
-- Module Name: bitInDigitBCDMultiplier - Behavioral
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

entity bitInDigitBCDMultiplier is
Port ( 
       a0,a1,a2,a3,a4,a5,a6,a6:in std_logic_vector(3 downto 0);
       b:in std_logic_vector(3 downto 0);
       v: out std_logic_vector(35 downto 0));
end bitInDigitBCDMultiplier;

architecture Behavioral of bitInDigitBCDMultiplier is
    
    component BCDMultiplier is
    Port ( 
       a,b:in std_logic_vector(3 downto 0);
       v: out std_logic_vector(7 downto 0));
    end component;

    signal ba0,ba1,ba2,ba3,ba4,ba5,ba6,ba7 : std_logic_vector(7 downto 0);
    
begin
    
    ins0:BCDMultiplier port map (a0,b,ba0);
    ins1:BCDMultiplier port map (a1,b,ba1);
    ins2:BCDMultiplier port map (a2,b,ba2);
    ins3:BCDMultiplier port map (a3,b,ba3);
    ins4:BCDMultiplier port map (a4,b,ba4);
    ins5:BCDMultiplier port map (a5,b,ba5);
    ins6:BCDMultiplier port map (a6,b,ba6);
    ins7:BCDMultiplier port map (a7,b,ba7);

end Behavioral;
