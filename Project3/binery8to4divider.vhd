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
use ieee.numeric_std;
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
    A:in std_logic_vector(15 downto 0):="0000000000000000";
    Q:in std_logic_vector(15 downto 0):="0000000000001100";
    B:in std_logic_vector(15 downto 0):="0000000000000010";
    ov: out std_logic;
    F,D:out std_logic_vector(15 downto 0)
);
end binery8to4divider;

architecture Behavioral of binery8to4divider is

component addsub is
   port( OP: in std_logic;
          A,B  : in std_logic_vector(15 downto 0);
          output  : out std_logic_vector(15 downto 0);
          Cout: out std_logic);
end component; 

signal SC: integer := 15;
signal sub,sub1,sum,sum1,sum2: std_logic_vector(15 downto 0);
signal temp1 : std_logic_vector(15 downto 0):=A;
signal temp2 : std_logic_vector(15 downto 0):=Q;
signal c,c1,c2,c3,c4: std_logic;
begin
    F<=temp1;
    D<=temp2;
    inst0: addsub port map('1',temp1,B,sub,c1);
    inst1: addsub port map('0',temp1,B,sum,c2);
 --   sum1 <=  sum(2 downto 0) & Q(3);
    inst2: addsub port map('0',sub1,B,sum2,c3);
    inst3: addsub port map('1',temp1(14 downto 0) & temp2(15),B,sub1,c3);
    process(clk)
        variable varA: std_logic_vector(15 downto 0);
        variable varQ: std_logic_vector(15 downto 0);
        variable varC:std_logic;
        variable flag: boolean:=True;
        begin  
            if rising_edge(clk) then
                if flag then
                    flag := False;
                    varA := sub;
                    if (c1 = '1') then
                        varA := sum;
                        ov<='1';
                    else
                        varA := sum;
                        ov<= '0';
                    end if;
                    varQ := Q;
                    varA := A;
                else
                    if SC > 0 then
                        varC:= varA(15);
                        varA := temp1(14 downto 0) & temp2(15);
                        varQ := temp2(14 downto 0) & '0';
                        if (varC = '1') then
                            varQ(0):='1';
                            varA:= sub1;
                        else
                            varA:=sub1;
                            if(c = '1') then
                                varQ(0):='1';          
                            else
                                varQ(0):='0';
                                varA:=sum2;
                            end if;
                        end if; 
                        SC <= SC - 1;

                    end if;         
                end if;

            end if;
            temp1 <= varA;
            temp2 <= varQ;
        end process;
end Behavioral;
