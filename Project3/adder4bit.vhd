library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
 
entity adder4bit is
    Port ( x : in std_logic_vector(3 downto 0);
           y : in std_logic_vector(3 downto 0);
           sum : out std_logic_vector(3 downto 0);
           cout: out std_logic);
end adder4bit;
 
architecture Behavioral of adder4bit is
signal c : std_logic_vector (3 downto 0):="0000";
component adder1bit 
port(a,b,cin:in std_logic; 
 s,cout:out std_logic);
end component;
 
begin
 
bit1: adder1bit port map (a=>x(0), b=>y(0), s=>sum(0), cin=>c(0), cout=>c(1));
bit2: adder1bit port map (a=>x(1), b=>y(1), s=>sum(1), cin=>c(1), cout=>c(2));
bit3: adder1bit port map (a=>x(2), b=>y(2), s=>sum(2), cin=>c(2), cout=>c(3));
bit4: adder1bit port map (a=>x(3), b=>y(3), s=>sum(3), cin=>c(3), cout=>c(0));
cout <= c(0);
end Behavioral;