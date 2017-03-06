----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 06:22:59 PM
-- Design Name: 
-- Module Name: temperatureSeq - Behavioral
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

entity temperatureSeq is
  port( 
      t1,t2,t3,t4,t5: in integer;
      heater, cooler: out boolean
  );
end temperatureSeq;

architecture Behavioral of temperatureSeq is
     signal control: integer;
begin
  control <= to_integer( to_unsigned(t1+t2+t3+t4, 5) srl 2 );
  process(control,t5)
          begin
              if(control < t5-4)then
                  heater <= True;
                  cooler <= False;
              elsif(control > t5-2 and control < t5+2) then
                  heater <= False;
                  cooler <= False;
              elsif(control > t5 + 4)then
                  heater <= False;
                  cooler <= True;
              end if;
   end process;
end Behavioral;
