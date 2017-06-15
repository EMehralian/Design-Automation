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
    A:in std_logic_vector(15 downto 0);
    Q:in std_logic_vector(15 downto 0);
    B:in std_logic_vector(15 downto 0);
    ov: out std_logic;
    F,D:out std_logic_vector(15 downto 0)
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
signal temp1,temp2:std_logic_vector(15 downto 0);
begin
inst0: BCDtoBinery port map(A ,biner1 );
inst1: BCDtoBinery port map("0000000000000000"&B ,biner2 );
inst2: binery8to4divider port map(clk,"0000"&biner1(27 downto 16),biner1(15 downto 0),biner2(15 downto 0),ov,temp1,temp2);
inst3:bin2bcd port map(temp1,C(3 downto 0),C(7 downto 4),C(11 downto 8),C(15 downto 12));
inst4:bin2bcd port map(temp2,D(3 downto 0),D(7 downto 4),D(11 downto 8),D(15 downto 12));
end Behavioral;
