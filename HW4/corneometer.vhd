----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2017 11:08:30 AM
-- Design Name: 
-- Module Name: corneometer - Behavioral
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

entity corneometer is
port(
    clk: in std_logic;
    rst : in std_logic;
    pause : in std_logic;
    resume : in std_logic;
    output : out integer
    
    );
end corneometer;

architecture Behavioral of corneometer is

begin
    process (clk, rst, pause, resume)
        variable temp : integer :=0;
    begin
        if (rst='1')then
            output <= 0;
        end if; 
        if (rising_edge(clk))then
            if (resume ='1' and pause ='0')then
                temp := temp + 1;
            else 
                temp := temp;
            end if;
        end if;
        output <= temp;
    end process;
    
end Behavioral;
