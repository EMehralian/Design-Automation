----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2017 04:38:19 PM
-- Design Name: 
-- Module Name: BCDMultiplier - Behavioral
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

entity BCDMultiplier is
Port ( 
       a,b:in std_logic_vector(3 downto 0);
       v: out std_logic_vector(7 downto 0));
end BCDMultiplier;

architecture Behavioral of BCDMultiplier is

component fullAdder is
Port (  a: in std_logic;
		b: in std_logic;
		cin: in std_logic;
		s: out std_logic;
		cout: out std_logic);
end component;
component halfAdder is
Port (  a: in std_logic;
		b: in std_logic;
		s: out std_logic;
		cout: out std_logic);
end component;
component multiplier2bit is
Port ( 
       a,b:in std_logic_vector(1 downto 0);
       s: out std_logic_vector(3 downto 0));
end component;

signal mult1,mult2, mult3, mult4: std_logic_vector(3 downto 0):= (others=> '0');
signal fa1,fa2,fa3,fa4,fa5,fa6,fa7: std_logic_vector(1 downto 0):= (others=> '0');
signal ha1,ha2 :std_logic_vector (1 downto 0):= (others=> '0');

  begin
    multiplier1:multiplier2bit port map(a(1 downto 0),b(1 downto 0),mult1);
    multiplier2:multiplier2bit port map(a(3 downto 2),b(1 downto 0),mult2);
    multiplier3:multiplier2bit port map(a(1 downto 0),b(3 downto 2),mult3);
    multiplier4:multiplier2bit port map(a(3 downto 2),b(3 downto 2),mult4);
    
    FAA1:fullAdder port map (mult1(2),mult2(0),mult3(0),fa1(0),fa1(1));
    FAA2:fullAdder port map (mult1(3),mult2(1),mult3(1),fa2(0),fa2(1));
    FAA3:fullAdder port map (fa2(1),mult2(2),mult3(2),fa3(0),fa3(1));
    FAA4:fullAdder port map (ha1(1),fa3(0),mult4(0),fa4(0),fa4(1));
    FAA5:fullAdder port map (fa3(1),mult2(3),mult3(3),fa5(0),fa5(1));
    FAA6:fullAdder port map (fa5(1),fa7(1),mult4(2),fa6(0),fa6(1));
    FAA7:fullAdder port map (fa4(1),fa5(0),mult4(1),fa7(0),fa7(1));
    
    HAA1:halfAdder port map (fa1(1),fa2(0),ha1(0),ha1(1));
    HAA2:halfAdder port map (fa6(1),mult4(3),ha2(0),ha2(1));
    
    v(0) <= mult1(0);
    v(1) <= mult1(1);
    v(2) <= fa1(0);
    v(3) <= ha1(0);
    v(4) <= fa4(0);
    v(5) <= fa7(0);
    v(6) <= fa6(0);
    v(7) <= ha2(0);
    
end Behavioral;