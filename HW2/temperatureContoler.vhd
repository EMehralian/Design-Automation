----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 04:34:16 PM
-- Design Name: 
-- Module Name: temperatureContoler - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity temperatureContoler is
    port( 
        t1,t2,t3,t4,t5: in integer;
        heater, cooler: out boolean
    );
end temperatureContoler;

architecture Behavioral of temperatureContoler is
    signal control: integer;
begin
    control <= to_integer( to_unsigned(t1+t2+t3+t4, 5) srl 2 );
    
        heater <= True when (control < t5-4 ) else 
                  False when (control > t5-2 and control < t5+2) else
                  False when (control > t5 + 4);
 
    cooler<= False when (control < t5-4 ) else 
             False when (control > t5-2 and control < t5+2) else
             True when (control > t5 + 4);
    
    
end Behavioral;
