----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2017 04:27:46 PM
-- Design Name: 
-- Module Name: average - Behavioral
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
package mytypes is
    type data is array (0 to 15) of integer range 15 to 40;
end package mytypes;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.mytypes.all;

entity average is
port(
    
    clk: in std_logic;
    input: inout data;
    last_input: in integer;
    output: inout integer :=0
);
end average;

architecture Behavioral of average is
begin
    process(clk)
    begin
        if( clk'event and clk ='1') then
            for I in 0 to 15 loop
                if( input(I) /=  0) then
                    output <= output + input(I);
                end if;
            end loop;   
        end if;
    end process;
    --output <= output/16;
end Behavioral;
