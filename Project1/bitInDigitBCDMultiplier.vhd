----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2017 11:59:12 AM
-- Design Name: 
-- Module Name: bitInDigitBCDMultiplier - Behavioral
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

entity bitInDigitBCDMultiplier is
Port ( 
       a0,a1,a2,a3,a4,a5,a6,a7:in std_logic_vector(3 downto 0);
       b:in std_logic_vector(3 downto 0);
       vo0,vo1,vo2,vo3,vo4,vo5,vo6,vo7:out std_logic_vector(3 downto 0)
);
end bitInDigitBCDMultiplier;

architecture Behavioral of bitInDigitBCDMultiplier is
    
    component BCDMultiplier is
    Port ( 
       a,b:in std_logic_vector(3 downto 0);
       v: out std_logic_vector(7 downto 0));
    end component;

    component bineryToBCD is
    Port ( 
       a:in std_logic_vector(7 downto 0);
       b,c: out std_logic_vector(3 downto 0)
       );
    end component;
    component BCDAdder is
    Port ( 
           a,b:in std_logic_vector(3 downto 0);
           cin : in std_logic;
           cout : out std_logic;  
           s: out std_logic_vector(3 downto 0));
    end component;
    signal ba0,ba1,ba2,ba3,ba4,ba5,ba6,ba7 : std_logic_vector(7 downto 0);
    signal v0,vc0,v1,vc1,v2,vc2,v3,vc3,v4,vc4,v5,vc5,v6,vc6,v7,vc7:std_logic_vector(3 downto 0);
    signal s0,s1,s2,s3,s4,s5,s6,s7:std_logic_vector(3 downto 0);
    signal c0,c1,c2,c3,c4,c5,c6,c7:std_logic;
begin
    
    ins0:BCDMultiplier port map (a0,b,ba0);
    ins1:BCDMultiplier port map (a1,b,ba1);
    ins2:BCDMultiplier port map (a2,b,ba2);
    ins3:BCDMultiplier port map (a3,b,ba3);
    ins4:BCDMultiplier port map (a4,b,ba4);
    ins5:BCDMultiplier port map (a5,b,ba5);
    ins6:BCDMultiplier port map (a6,b,ba6);
    ins7:BCDMultiplier port map (a7,b,ba7);
    
    conv0:bineryToBCD port map (ba0,v0,vc0);
    conv1:bineryToBCD port map (ba1,v1,vc1);
    conv2:bineryToBCD port map (ba2,v2,vc2);
    conv3:bineryToBCD port map (ba3,v3,vc3);
    conv4:bineryToBCD port map (ba4,v4,vc4);
    conv5:bineryToBCD port map (ba5,v5,vc5);
    conv6:bineryToBCD port map (ba6,v6,vc6);
    conv7:bineryToBCD port map (ba7,v7,vc7);
    
    addins0:BCDAdder port map (v1,vc0,'0',c1,s1);
    addins1:BCDAdder port map (v2,vc1,c1,c2,s2);
    addins2:BCDAdder port map (v3,vc2,c2,c3,s3);
    addins3:BCDAdder port map (v4,vc3,c3,c4,s4);
    addins4:BCDAdder port map (v5,vc4,c4,c5,s5);
    addins5:BCDAdder port map (v6,vc5,c5,c6,s6);
    addins6:BCDAdder port map (v7,vc6,c6,c7,s7);
    
    vo0<=v0;
    vo1<=s1;
    vo2<=s2;
    vo3<=s3;
    vo4<=s4;
    vo5<=s5;
    vo6<=s6;
    vo7<=s7;
    
    
end Behavioral;
