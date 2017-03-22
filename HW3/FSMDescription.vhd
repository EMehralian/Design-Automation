----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2017 11:59:36 AM
-- Design Name: 
-- Module Name: FSMDescription - Behavioral
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

entity FSMDescription is
port(
    x,rst,clk: in std_logic;
    y: out std_logic
     );
end FSMDescription;

architecture TwoProcess of FSMDescription is
type State is (stateA, stateB, stateC, stateD);
signal current_state , next_state : State;  
begin

    process ( clk , rst)
    begin
        if(rst = '1') then
            current_state <= stateA;
        elsif( clk'event and clk ='1') then
            current_state <= next_state;
        end if;
    end process;
    
    process (current_state , x)
    begin  
        case current_state is
         when stateA =>
            y <= '0';
            if( x = '1') then
                next_state <= stateB;
            else
                next_state <= stateA;
            end if;
         when stateB =>
            y <= '0';
            if( x = '1') then
             next_state <= stateC;
          else
             next_state <= stateA;
          end if;
         when stateC =>
            y <= '0';
            if( x = '1') then
             next_state <= stateD;
         else
             next_state <= stateA;
         end if;
         when others =>
            y <= '1';
            if( x = '1') then
             next_state <= stateD;
         else
             next_state <= stateA;
         end if;
        end case;
    end process;
end TwoProcess;

architecture ThreeProcess of FSMDescription is
type State is (stateA, stateB, stateC, stateD);
signal current_state , next_state : State;  
begin

    process ( clk , rst)
    begin
        if(rst = '1') then
            current_state <= stateA;
        elsif( clk'event and clk ='1') then
            current_state <= next_state;
        end if;
    end process;
    
    process (current_state , x)
    begin  
        case current_state is
         when stateA =>
            if( x = '1') then
                next_state <= stateB;
            else
                next_state <= stateA;
            end if;
         when stateB =>
            if( x = '1') then
             next_state <= stateC;
          else
             next_state <= stateA;
          end if;
         when stateC =>
            if( x = '1') then
             next_state <= stateD;
         else
             next_state <= stateA;
         end if;
         when others =>
            if( x = '1') then
             next_state <= stateD;
         else
             next_state <= stateA;
         end if;
        end case;
    end process;
    
        process ( clk , rst)
        begin
            if(rst = '1') then
                y<='0';
             elsif(rising_edge(clk)) then
                case current_state is
                      when stateA =>
                        y <= '0';
                      when stateB =>
                        y <= '0';
                      when stateC =>
                        y <= '0';
                      when others =>
                        y <= '1';
                   end case;     
            end if;
        end process;
        
end ThreeProcess;
