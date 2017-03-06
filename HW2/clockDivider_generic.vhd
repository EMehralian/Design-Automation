----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 08:07:44 PM
-- Design Name: 
-- Module Name: clockDivider_generic - Behavioral
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

entity clockDivider_generic is
generic (n:integer :=4);
port(
        clk, reset: in std_logic;
        devided_clk: out std_logic
    );
end clockDivider_generic;

architecture Behavioral of clockDivider_generic is
    signal count:integer :=0 ;
begin
    process(clk_in,reset)
    begin
        if(reset = '1') then
            count <=0;
        end if
        if rising_edge(clk_in) then
            
    end process;

end Behavioral;
