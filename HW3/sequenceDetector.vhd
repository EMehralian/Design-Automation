----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2017 10:02:00 PM
-- Design Name: 
-- Module Name: sequenceDetector - Behavioral
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

entity sequenceDetector is
port(
    rst,clk: in std_logic;
    x: in character;
    y: out std_logic_vector(1 downto 0)
     );
end sequenceDetector;

architecture Behavioral of sequenceDetector is
type State is (init, p1, p2, p3, p4, p5, p6, p7 , p8, p9, q1, q2, q3, q4);
signal current_state , next_state : State;  
begin

    process ( clk , rst)
    begin
       if( clk'event and clk ='1') then
            current_state <= next_state;
        end if;
    end process;
    
    process (current_state , x)
    begin  
        case current_state is
         when init =>
            y <= "00";
            if( x = 'A') then
                next_state <= q1;
            elsif ( x = 'G') then
                next_state <= p1;
            else
                next_state <= init;
            end if;
         when p1 =>
            y <= "00";
            if( x = 'A') then
                next_state <= p2;
            else
                next_state <= init;
            end if;
         when p2 =>
            y <= "00";
            if( x = 'T') then
                next_state <= p3;
            else
                next_state <= init;
            end if;   
         when p3 =>
            y <= "00";
            if( x = 'A') then
                next_state <= p4;
            else
                next_state <= init;
            end if;            
         when p4 =>
            y <= "00";
            if( x = 'T') then
                next_state <= p5;
            else
                next_state <= init;
            end if;            
         when p5 =>
            y <= "00";
            if( x = 'A') then
                next_state <= p6;
            else
                next_state <= init;
            end if;            
         when p6 =>
            y <= "00";
            if( x = 'T') then
                next_state <= p7;
            else
                next_state <= init;
            end if;            
         when p7 =>
            y <= "00";
            if( x = 'G') then
                next_state <= p8;
             else
                next_state <= init;
             end if;
         when p8 =>
            y <= "00";
            if( x = 'C') then
                next_state <= p9;
            else
                next_state <= init;
            end if;                        
         when p9 =>
               y <= "01";
               if( x = 'G') then
                   next_state <= p1;
               elsif( x = 'A') then
                   next_state <= q1;    
               else
                   next_state <= init;
               end if;
         when q1 =>
            y <= "00";
            if( x = 'C') then
                next_state <= q2;    
            else
                next_state <= init;
            end if;
         when q2 =>
            y <= "00";
            if( x = 'G') then
                next_state <= q3;
            else
                next_state <= init;
            end if;
         when q3 =>
            y <= "10";
            if( x = 'C') then
                next_state <= q4;    
            elsif( x = 'G') then
               next_state <= p1;
            else
                next_state <= init;
            end if;
         when q4 =>
            y <= "00";
            if( x = 'G') then
                next_state <= q3;    
            else
                next_state <= init;
            end if;
         when others =>
            y <= "00";
            next_state <= init;                                                                                                   
        end case;
    end process;


end Behavioral;
