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
       a:in std_logic_vector(35 downto 0);
       b:in std_logic_vector(63 downto 0);
       cin:in std_logic;
       s:out std_logic_vector(63 downto 0)
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
    signal cout0,cout1,cout2,cout3,cout4,cout5,cout6,cout7,cout8 : std_logic := '0';
    
begin
    
    inst0:BCDAdder port map(a(3 downto 0),b(3 downto 0),cin,cout0,s(3 downto 0));
    inst1:BCDAdder port map(a(7 downto 4),b(7 downto 4),cout0,cout1,s(7 downto 4));
    inst2:BCDAdder port map(a(11 downto 8),b(11 downto 8),cout1,cout2,s(11 downto 8));
    inst3:BCDAdder port map(a(15 downto 12),b(15 downto 12),cout2,cout3,s(15 downto 12));
    inst4:BCDAdder port map(a(19 downto 16),b(19 downto 16),cout3,cout4,s(19 downto 16));
    inst5:BCDAdder port map(a(23 downto 20),b(23 downto 20),cout4,cout5,s(23 downto 20));
    inst6:BCDAdder port map(a(27 downto 24),b(27 downto 24),cout5,cout6,s(27 downto 24));
    inst7:BCDAdder port map(a(31 downto 28),b(31 downto 28),cout6,cout7,s(31 downto 28));
    inst8:BCDAdder port map(a(35 downto 32),b(35 downto 32),cout7,cout8,s(35 downto 32));
    s(63 downto 36)<= b(63 downto 36);
end Behavioral;
