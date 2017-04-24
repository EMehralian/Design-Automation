----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2017 01:54:27 PM
-- Design Name: 
-- Module Name: LockPro - Behavioral
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
entity LockPro is
port(
    clk: in std_logic;
    one : in std_logic;
    zero : in std_logic;
    rst: in std_logic;
    sharp: in std_logic;
    unlocked : out std_logic
    );
end LockPro;

architecture Behavioral of LockPro is
    type State is (start, s0, s01, s010, s0101, s01011);
    signal current_state , next_state : State;
    signal x : std_logic;
    signal user: std_logic_vector(1 downto 0);
begin
    x <= '1' when one ='1' else
        '0' when zero ='1';
        
    process ( clk , rst)
    begin
       if ( rst ='1')then
           current_state <= start;
       if( clk'event and clk ='1') then
            current_state <= next_state;
       end if;
    end process;
    
    
end Behavioral;
