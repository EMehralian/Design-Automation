
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

entity Adders is
Port (  a: in std_logic;
		b: in std_logic;
		cin: in std_logic;
		s: out std_logic;
		cout: out std_logic);
end Adders;

architecture Behavioral of Adders is

  signal xorSig , andSig1, andSig2 : std_logic;
  begin
  xorSig <= a xor b ;
  andSig1 <= cin and xorSig ;
  andSig2 <= a and b;
  s <= xorSig xor cin;
  cout<= andSig1 or andSig2;
end Behavioral;

