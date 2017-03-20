----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2017 03:45:40 PM
-- Design Name: 
-- Module Name: BCDAdder8Bit - Behavioral
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

entity BCDAdder8Bit is
Port ( 
       a:in std_logic_vector(31 downto 0);
       b:in std_logic_vector(31 downto 0);
       cin:in std_logic;
       cout: out std_logic;
       s0,s1,s2,s3,s4,s5,s6,s7:out std_logic_vector(3 downto 0)
);
end BCDAdder8Bit;

architecture Behavioral of BCDAdder8Bit is

component BCDAdder is
Port ( 
       a,b:in std_logic_vector(3 downto 0);
       cin : in std_logic;
       cout : out std_logic;  
       s: out std_logic_vector(3 downto 0));
end component;
    signal cout0,cout1,cout2,cout3,cout4,cout5,cout6 : std_logic;
    
begin
    
    inst0:BCDAdder port map(a(3 downto 0),b(3 downto 0),cin,cout0,s0);
    inst1:BCDAdder port map(a(7 downto 4),b(7 downto 4),cout0,cout1,s1);
    inst2:BCDAdder port map(a(11 downto 8),b(11 downto 8),cout1,cout2,s2);
    inst3:BCDAdder port map(a(15 downto 12),b(15 downto 12),cout2,cout3,s3);
    inst4:BCDAdder port map(a(19 downto 16),b(19 downto 16),cout3,cout4,s4);
    inst5:BCDAdder port map(a(23 downto 20),b(23 downto 20),cout4,cout5,s5);
    inst6:BCDAdder port map(a(27 downto 24),b(27 downto 24),cout5,cout6,s6);
    inst7:BCDAdder port map(a(31 downto 28),b(31 downto 28),cout6,cout,s7);

end Behavioral;
