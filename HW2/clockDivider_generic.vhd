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
    signal counter:integer :=0 ;
    signal tempCLK : std_logic :='0'; 
begin
    devided_clk <= tempCLK;
    process(clk,reset)
    begin
        if(reset = '1') then
            counter <= 0;
        
        elsif rising_edge(clk) then
            if(counter = n ) then
                counter <=0;
                tempCLK <= not (tempCLK); 
            else
                counter <= counter + 1;
            end if;
         end if;    
        
    end process;

end Behavioral;
