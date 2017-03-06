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

    component BCDMultiplier is
    Port ( 
       a,b:in std_logic_vector(3 downto 0);
       v: out std_logic_vector(7 downto 0));
    end component;
    signal a,b: std_logic_vector(3 downto 0);
         signal v:  std_logic_vector(7 downto 0);
begin
    inst: BCDMultiplier port map (a,b,v);
    a <= "0001",
     "0010" AFTER 50 ns,
      "0011" AFTER 100 ns,
       "0100" AFTER 150 ns,
        "0110" AFTER 200 ns,
         "0111" AFTER 250 ns,
          "1000" AFTER 300 ns,
           "1001" AFTER 350 ns,
            "0110" AFTER 400 ns,
              "0110" AFTER 450 ns,
                "0101" AFTER 500 ns;
                 
                
    b <= "0001",
      "0010" AFTER 50 ns,
        "0011" AFTER 100 ns,
         "0100" AFTER 150 ns,
          "0010" AFTER 200 ns,
           "0101" AFTER 250 ns,
            "1001" AFTER 300 ns,
             "1001" AFTER 350 ns,
              "0110" AFTER 400 ns,
                "0010" AFTER 450 ns,
                  "0111" AFTER 500 ns;
end tb;

