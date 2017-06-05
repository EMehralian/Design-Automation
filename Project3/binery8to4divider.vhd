----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2017 05:03:33 AM
-- Design Name: 
-- Module Name: binery8to4divider - Behavioral
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

entity binery8to4divider is
port(
    clk: in std_logic;
    A2,A1,B:in std_logic_vector(3 downto 0);
    ov: out std_logic
);
end binery8to4divider;

architecture Behavioral of binery8to4divider is

component xorer is  
  port(A,B : in std_logic_vector(7 downto 0);  
      output : out std_logic_vector(7 downto 0));  
end component;

component addsub is
   port( OP: in std_logic;
          A,B  : in std_logic_vector(3 downto 0);
          output  : out std_logic_vector(3 downto 0);
          Cout: out std_logic);
end component; 

signal SC: integer := 4;
signal sub,sum: std_logic_vector(3 downto 0);
signal A: std_logic_vector(3 downto 0):=A2;
signal Q: std_logic_vector(3 downto 0):=A1;
signal c,c1,c2: std_logic;
begin
    inst0: addsub port map('1',A,B,sub,c1);
    inst1: addsub port map('0',A,B,sum,c2);
    process(clk)
        begin   
            if rising_edge(clk) then
                A <= sub;
                if (c1 = '1') then
                    A <= sum;
                    ov<='1';
                else
                    A<= sum;
                    for I in 0 to SC loop
                        c<= A(3);
                        A(3 downto 1) <= A(2 downto 0) & Q(3);
                        Q(3 downto 1) <= Q( 3 downto 1) & '0';
                        if (c = '1') then
                            Q(0)<='1';
                            A<= sub;
                        else
                            A<=sub;
                            if(c1 = '1') then
                                Q(0)<='1';
                                
                            else
                                Q(0)<='0';
                                A<=sum;
                            end if;
                        end if;
                    end loop;
                end if;
            end if;
        end process;
end Behavioral;
