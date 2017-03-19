----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 01:53:02 AM
-- Design Name: 
-- Module Name: rippleCounter - Behavioral
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

entity rippleCounter is

    generic (n : natural := 4);
    Port ( clk: in std_logic;
           reset: in std_logic;
           o: out std_logic_vector(n-1 downto 0)
    );
end rippleCounter;

architecture RTL of rippleCounter is
    component DFlipFlop is
    port(
      clk: in std_logic;
       D: in std_logic;
      reset : in std_logic;
      output: out std_logic;
      output_not: out std_logic);
    end component;
   signal i_thClk, i_thOutNot: std_logic_vector(n-1 downto 0);
   
   begin
   i_thClk(0) <= clk;
   i_thClk(n-1 downto 1) <= i_thOutNot(n-2 downto 0);
   
   gen_cnt: for i in 0 to n-1 generate
      dff_i:DFlipFlop port map (i_thClk(i),i_thOutNot(i),reset,o(i),i_thOutNot(i));
   end generate;

end RTL;
