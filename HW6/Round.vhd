----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2017 07:23:57 PM
-- Design Name: 
-- Module Name: Round - Behavioral
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

entity Round is
port(
    input1, input2: in std_logic_vector(7 downto 0);
    key: in std_logic_vector(7 downto 0);
    out1,out2: out std_logic_vector(7 downto 0)
    );
end Round;

architecture Behavioral of Round is
component adder is  
  port(A,B : in std_logic_vector(7 downto 0);  
      SUM : out std_logic_vector(7 downto 0));  
end component adder;
component xorer is  
  port(A,B : in std_logic_vector(7 downto 0);  
      output : out std_logic_vector(7 downto 0));  
end component xorer; 
signal sumSig,xorSig,shiftSig: std_logic_vector (7 downto 0);
signal sumSig2,xorSig2,shiftSig2: std_logic_vector (7 downto 0);
begin
inst0: xorer port map(input1,input2,xorSig);
shiftSig <= xorSig(6 downto 0) & xorSig(7);
inst1: adder port map(shiftSig, key , sumSig);

inst2: xorer port map(sumSig,input2,xorSig2);
shiftSig2 <= xorSig2(6 downto 0) & xorSig2(7);
inst3: adder port map(shiftSig2, key , sumSig2);
out1<= sumSig;
out2 <= sumSig2;
end Behavioral;
