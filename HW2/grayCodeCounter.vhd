----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2017 10:57:41 AM
-- Design Name: 
-- Module Name: grayCodeCounter - Behavioral
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity grayCodeCounter is
Port (clk: in std_logic;
       reset: in std_logic;
       counter: out std_logic_vector(3 downto 0)
     );
end grayCodeCounter;

architecture Behavioral of grayCodeCounter is
    signal c_sig : std_logic_vector (3 downto 0):="0000";
begin
    process(clk , reset)
    begin
        if (reset ='1') then 
            c_sig <= "0000";
        elsif (rising_edge(clk))then
            if (c_sig = "1001") then
                c_sig <="0000";
            else
                c_sig <= c_sig+ 1;
            end if;
        end if;
    end process;
    counter(0)<=c_sig(0) xor c_sig(1);
    counter(1)<=c_sig(1) xor c_sig(2);
    counter(2)<=c_sig(2) xor c_sig(3);
    counter(3)<=c_sig(3);
                
end Behavioral;
