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
  --  generic (n : integer);
    Port ( clk: in std_logic;
           reset: in std_logic;
           o: out std_logic_vector(3 downto 0)
    );
end rippleCounter;

architecture RTL of rippleCounter is
    component TFlipFlop is
    port(
      clk: in std_logic;
       T: in std_logic;
      reset : in std_logic;
      output: out std_logic;
      output_not: out std_logic);
    end component;
   signal o_not: std_logic_vector(3 downto 0);
   begin
     tff_ins0: TFlipFlop port map (clk, '1', reset, o(0), o_not(0));
     tff_ins1: TFlipFlop port map (o_not(0), '1', reset, o(1), o_not(1));
     tff_ins2: TFlipFlop port map (o_not(1), '1', reset, o(2), o_not(2));
     tff_ins3: TFlipFlop port map (o_not(2), '1', reset, o(3), o_not(3));
end RTL;
