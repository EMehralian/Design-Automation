----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2017 02:08:45 AM
-- Design Name: 
-- Module Name: updown5bitCounter - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity updown5bitCounter is
port(
        dir,rst,clk: in std_logic;
        y: out std_logic_vector(4 downto 0)
);
end updown5bitCounter;

architecture Behavioral of updown5bitCounter is
    signal count: std_logic_vector(4 downto 0):= (others =>'0');
begin
    process(clk , dir)
    begin
        if(rst = '1') then
            count <= (others => '0');
        elsif( clk'event and clk ='1') then
            if(dir = '0') then
                if (count = "10010") then
                    count <= (others => '0');
                else
                    count <= count + '1';
                end if;              
            elsif ( dir = '1') then
                if count = "00000" then
                    count <= "10010";
                else
                    count <= count - '1';
                end if;     
            end if;
         end if;
    end process;
    y <= count;



end Behavioral;
