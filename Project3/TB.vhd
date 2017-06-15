----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 05:38:32 PM
-- Design Name: 
-- Module Name: BCDMultiplier_TB - Behavioral
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

entity BCDMultiplier_TB is
end BCDMultiplier_TB;

architecture tb of BCDMultiplier_TB is

component BCDdivider is
port(
        clk: in std_logic;
        A:in std_logic_vector(31 downto 0);
        B:in std_logic_vector(15 downto 0);
        C,D:out std_logic_vector(15 downto 0);
        ov: out std_logic
);
end component;
       signal  clk:  std_logic;
       signal  A: std_logic_vector(31 downto 0);
       signal  B: std_logic_vector(15 downto 0);
       signal  C,D: std_logic_vector(15 downto 0);
       signal  ov: std_logic;
begin
    clk <= not clk after 10 ns;
    inst: BCDdivider port map (clk,A,B,C,D,ov);
    A<= "00000000000000000000000010000010",
    "00000000000000000000000000001110" after 50 ns;
    B<= "0000000000000010";
end tb;
