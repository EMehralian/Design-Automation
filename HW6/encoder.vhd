----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2017 08:19:48 PM
-- Design Name: 
-- Module Name: encoder - Behavioral
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

entity encoder is
generic (N : integer:=6);
Port ( 
    A: in std_logic_vector(15 downto 0);
    key: in std_logic_vector(7 downto 0);
    output :out std_logic_vector(15 downto 0)
        );
end encoder;

architecture Behavioral of encoder is
component adder is  
  port(A,B : in std_logic_vector(7 downto 0);  
      SUM : out std_logic_vector(7 downto 0));  
end component adder; 
component Round is
port(
    input1, input2: in std_logic_vector(7 downto 0);
    key: in std_logic_vector(7 downto 0);
    out1,out2: out std_logic_vector(7 downto 0)
    );
end component Round;
signal sumSig1,sumSig2:std_logic_vector(7 downto 0);
signal out1,out2:std_logic_vector(7 downto 0);
signal temp1,temp2:std_logic_vector(63 downto 0);
begin
inst0: adder port map(A(15 downto 8),key,sumSig1);
inst1: adder port map(A(7 downto 0),key, sumSig2);
temp1(7 downto 0) <= sumSig1;
temp2(7 downto 0) <= sumSig2;
   FG:for I in 0 to N generate
    RND : Round port map(temp1((I+1)*8-1 downto I*8 ) ,temp2((I+1)*8-1 downto I*8 ),
                        key,temp1((I+2)*8-1 downto (I+1)*8),temp2( (I+2)*8-1)downto (I+1)*8);
                        
   end generate FG;
    output <= temp1(63 downto 56)&temp2(63 downto 56);
end Behavioral;
