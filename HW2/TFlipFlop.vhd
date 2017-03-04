----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 01:59:23 AM
-- Design Name: 
-- Module Name: TFlipFlop - Behavioral
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

entity TFlipFlop is
port
  (
    clk: in std_logic;
    T: in std_logic;
    reset : in std_logic;
    output: out std_logic;
    output_not: out std_logic);

end TFlipFlop;

architecture Behavioral of TFlipFlop is
signal output_buf:std_logic := '0';
begin
output <= output_buf;
    output_not <= not output_buf;
    
    process(clk,reset)
      begin
        if(reset = '0') then
          output_buf <= '0';
        elsif(clk'event and clk = '1') then
         if (T='1')then
          output_buf <= not output_buf  ;
         end if;
        end if;
      end process;



end Behavioral;
