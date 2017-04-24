----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2017 11:53:38 AM
-- Design Name: 
-- Module Name: unlock - Behavioral
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

entity unlock is
port(
    clk: in std_logic;
    one : in std_logic;
    zero : in std_logic;
    rst: in std_logic;
    sharp: in std_logic;
    unlocked : out std_logic
    );
end unlock;

architecture Behavioral of unlock is
   type State is (start, s0, s01, s010, s0101, s01011);
   signal current_state , next_state : State;
   signal x : std_logic;  
begin
    x <= '1' when one ='1' else
        '0' when zero ='1';
        
    process ( clk , rst)
    begin
       if ( rst ='1')then
           current_state <= start;
       elsif( clk'event and clk ='1') then
            current_state <= next_state;
       end if;
    end process;
    
    process (current_state , x)
    begin     
        case current_state is
            when start =>
                unlocked <= '0';   
                if( rst = '1') then 
                    next_state <= start;    
                elsif ( x = '0') then
                    next_state<= s0;
                else
                    next_state<=start;
                end if;    
            when s0 =>
                unlocked <= '0';
                if( rst = '1') then 
                    next_state <= start;
                elsif ( x = '1')then
                    next_state <= s01;
                else
                     next_state <= s0; 
                end if; 
            when s01 =>
                unlocked <= '0'; 
                if( rst = '1') then 
                    next_state <= start; 
                elsif ( x= '0') then
                    next_State <= s010;
                else
                   next_State <= s0;
                end if;
             when s010 =>
                 unlocked <= '0'; 
                 if( rst = '1') then 
                    next_state <= start;
                 elsif (x='1')then
                    next_State <= s0101;
                 else
                    next_State  <= s0;
                end if;
             when s0101 =>
                unlocked <= '0';
                if( rst = '1') then 
                    next_state <= start;
                 elsif (x='1')then
                       next_State <= s01011;
                 else
                       next_State  <= s0; 
                 end if;
              when s01011 =>
                    unlocked <= '1';
                    next_state <= start;
             when others =>
                unlocked <= '0';
                next_state <= start;                                                                                                                          
        end case;
    end process;


end Behavioral;
