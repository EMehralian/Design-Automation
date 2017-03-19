----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2017 09:40:59 PM
-- Design Name: 
-- Module Name: BCDAdder - Behavioral
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

entity BCDAdder is
Port ( 
       a,b:in std_logic_vector(3 downto 0);
       cin : in std_logic;
       cout : out std_logic;  
       s: out std_logic_vector(3 downto 0));
end BCDAdder;

architecture Behavioral of BCDAdder is
    component fullAdder is
    Port (  a: in std_logic;
		b: in std_logic;
		cin: in std_logic;
		s: out std_logic;
		cout: out std_logic);
    end component;
    signal co0,co1,co2,co3,co4,co5,s0,s1,s2,s3,s4,s5,coutSig,Andsig1,Andsig2: std_logic;
begin

    ins0:fullAdder port map(a(0),b(0),cin,s0,co0);
    ins1:fullAdder port map(a(1),b(1),co0,s1,co1);
    ins2:fullAdder port map(a(2),b(2),co1,s2,co2);
    ins3:fullAdder port map(a(3),b(3),co2,s3,co3);
    ins4:fullAdder port map(s1,coutSig,'0',s4,co4);
    ins5:fullAdder port map(s2,coutSig,co4,s5,co5);
    Andsig1 <= s3 and s2;
    Andsig2 <= s3 and s1;
    coutSig <= co3 or Andsig1 or Andsig2 ;
    s(0) <= s0;
    s(1) <= s4;
    s(2) <= s5;
    s(3) <= co5 xor s3;
    cout <= coutSig;
end Behavioral;
