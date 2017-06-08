----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2017 01:32:09 AM
-- Design Name: 
-- Module Name: BCDdivider - Behavioral
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

entity BCDdivider is
port(
        clk: in std_logic;
        A:in std_logic_vector(31 downto 0);
        B:in std_logic_vector(15 downto 0);
        C,D:out std_logic_vector(15 downto 0);
        ov: out std_logic
);
end BCDdivider;

architecture Behavioral of BCDdivider is
component binery8to4divider is
port(
    clk: in std_logic;
    A,Q,B:inout std_logic_vector(13 downto 0);
    ov: out std_logic;
    F,D:out std_logic_vector(13 downto 0)
);
end component;
component BCDtoBinery is
port(
    A: in std_logic_vector (31 downto 0);
    B: out std_logic_vector (27 downto 0) := (others => '0')
    );
end component;
component bin2bcd is
    port ( 
        input:      in   std_logic_vector (15 downto 0);
        ones:       out  std_logic_vector (3 downto 0);
        tens:       out  std_logic_vector (3 downto 0);
        hundreds:   out  std_logic_vector (3 downto 0);
        thousands:  out  std_logic_vector (3 downto 0)
    );
end component;
signal biner1,biner2:std_logic_vector(27 downto 0);
signal temp1,temp2:std_logic_vector(13 downto 0);
begin
inst0: BCDtoBinery port map(A ,biner1 );
inst1: BCDtoBinery port map("0000000000000000"&b ,biner2 );
inst2: binery8to4divider port map(clk,biner1(27 downto 14),biner1(13 downto 0),biner2(13 downto 0),temp1,temp2,ov );
inst3:bin2bcd port map("00"&temp1,C(3 downto 0),C(4 downto 7),C(8 downto 11),C(12 downto 15));
inst4:bin2bcd port map("00"&temp2,D(3 downto 0),D(4 downto 7),D(8 downto 11),D(12 downto 15));
end Behavioral;
