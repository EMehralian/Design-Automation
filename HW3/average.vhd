----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2017 04:27:46 PM
-- Design Name: 
-- Module Name: average - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity average is
port(
    
    clk: in std_logic;
    input: in integer;
    output: inout integer :=0
);
end average;

architecture Behavioral of average is

    type mytype is array (0 to 1) of integer;
    
    function  calculate  (Finput  :  in  mytype)  return  integer  is                                                                                                     
      begin                                                        
        add: if Finput(0)>0 then
        
            return Finput(0)+Finput(1);
        end if add;
        result: if Finput(0)=0 then
                    return Finput(1)/16;
        end if result; 
                                                        
    end function; 
    signal temp: integer;
begin
    temp <= output ;
    process(clk, input)
    begin
        if( clk'event and clk ='1') then
            output <= calculate((input,temp));
        end if;
    end process;
end Behavioral;
