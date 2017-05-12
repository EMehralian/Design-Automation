----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2017 07:41:24 PM
-- Design Name: 
-- Module Name: FSM - Behavioral
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
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2017 05:38:32 PM
-- Design Name: 
-- Module Name: BCDMultiplier_TB - Behavioral
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

entity FSM_TB is
end FSM_TB;

architecture tb of FSM_TB is
    component FSM is
    port(
        clk,rst: in std_logic;
        x : in std_logic_vector(1 downto 0);            
        y : out std_logic    
    );
    end component;
   signal clk :std_logic :='0';
    signal rst,y: std_logic;
         signal x:  std_logic_vector(1 downto 0);
begin
    inst: FSM port map (clk,rst,x,y);
    
    clk <= not clk after 25 ns ; 
    rst <= '0';
    x <= "01",
     "10" AFTER 50 ns,
      "11" AFTER 100 ns,
       "00" AFTER 150 ns,
        "10" AFTER 200 ns,
         "11" AFTER 250 ns,
          "00" AFTER 300 ns,
           "01" AFTER 350 ns,
            "10" AFTER 400 ns,
              "10" AFTER 450 ns,
                "01" AFTER 500 ns;
                 
               
end tb;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
    port(
        clk,rst: in std_logic;
        x : in std_logic_vector(1 downto 0);            
        y : out std_logic    
    );
end FSM;

architecture Behavioral of FSM is
type State is (s0,s1,s2,s3,s4,s5);
signal current_state , next_state : State :=s0 ;  
attribute fsm_encoding :string;
attribute fsm_encoding of current_state : signal is "sequential";
begin

    process ( clk , rst)
    begin
        if(rst = '1') then
            current_state <= s0;
        elsif( clk'event and clk ='1') then
            current_state <= next_state;
        end if;
    end process;
    
    process (current_state , x)
    begin  
        case current_state is
         when s0 =>
            y <= '0';
            if( x = "00" or x="11") then
                next_state <= s0;
            elsif(x="01")then
                next_state <= s2;  
            else
                next_state <= s4;
            end if;
         when s1 =>
            y <= '1';
            if( x = "00" or x="11") then
             next_state <= s1;
            elsif( x = "01") then
               next_state <= s3;
             else
             next_state <= s5;
          end if;
         when s2 =>
            y <= '0';
            if( x = "00" or x="11") then
             next_state <= s0;
            elsif( x = "01") then
              next_state <= s2;
            else
             next_state <= s4;
            end if;
         when s3 =>
            y <= '1';
            if( x = "00") then
             next_state <= s1;
            elsif( x = "01") then
               next_state <= s3;
             elsif( x = "10") then
                 next_state <= s5;                           
         else
             next_state <= s0;
         end if;
         when s4 =>
            y <= '0';
            if( x = "00") then
             next_state <= s0;
             elsif( x = "01") then
               next_state <= s3;
             elsif( x = "10") then
                 next_state <= s4;  
         else
             next_state <= s1;
         end if;
         
         when others =>
            y <= '1';
            if( x = "00" or x="11") then
             next_state <= s1;
             elsif( x = "01") then
               next_state <= s2;            
           else
             next_state <= s5;
         end if;
        end case;
    end process;


end Behavioral;
