----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2017 03:30:41 PM
-- Design Name: 
-- Module Name: BCDMultipler8in8 - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCDMultipler8in8 is
Port ( 
       clk:in std_logic;
       a:in std_logic_vector(31 downto 0);
       b:in std_logic_vector(31 downto 0);
       output:out std_logic_vector(63 downto 0)
);
end BCDMultipler8in8;

architecture Behavioral of BCDMultipler8in8 is
    component bitInDigitBCDMultiplier is
    Port ( 
       a:in std_logic_vector(31 downto 0);
       b:in std_logic_vector(3 downto 0);
       vo:out std_logic_vector(35 downto 0)
    );
     end component;
    component BCDAdder8Bit is
    Port ( 
         a:in std_logic_vector(35 downto 0);
         b:in std_logic_vector(63 downto 0);
         cin:in std_logic;
         s:out std_logic_vector(63 downto 0)
    );
    end component;
   --signal res,resss,result0,result1,result2,result3,result4,result5,result6,result7,final : std_logic_vector (63 downto 0);
    signal v0,v1,v2,v3,v4,v5,v6,v7: std_logic_vector(35 downto 0);
    --signal cout0,cout1,cout2,cout3,cout4,cout5,cout6,cout7 :std_logic;
    --signal counter: std_logic;
    signal ehsan,ehsan1,mamad,ali : std_logic_vector (63 downto 0):= (others=>'0');
        
begin
    --result0 <= (others=>'0');
    --counter <= '0';

    inst0:bitInDigitBCDMultiplier port map(a,b(3 downto 0),v0);
    inst1:bitInDigitBCDMultiplier port map(a,b(7 downto 4),v1);
    inst2:bitInDigitBCDMultiplier port map(a,b(11 downto 8),v2);
    inst3:bitInDigitBCDMultiplier port map(a,b(15 downto 12),v3);
    inst4:bitInDigitBCDMultiplier port map(a,b(19 downto 16),v4);
    inst5:bitInDigitBCDMultiplier port map(a,b(23 downto 20),v5);
    inst6:bitInDigitBCDMultiplier port map(a,b(27 downto 24),v6);
    inst7:bitInDigitBCDMultiplier port map(a,b(31 downto 28),v7);

    --adding0:BCDAdder8Bit port map(v7,result0,'0',result1);
    --adding1:BCDAdder8Bit port map(v6,result1(59 downto 0)&"0000",'0',result2);
    --adding2:BCDAdder8Bit port map(v5,result2(59 downto 0)&"0000",'0',result3);
    --adding3:BCDAdder8Bit port map(v4,result3(59 downto 0)&"0000",'0',result4);
    --adding4:BCDAdder8Bit port map(v3,result4(59 downto 0)&"0000",'0',result5);
    --adding5:BCDAdder8Bit port map(v2,result5(59 downto 0)&"0000",'0',result6);
    --adding6:BCDAdder8Bit port map(v1,result6(59 downto 0)&"0000",'0',result7);
    --adding7:BCDAdder8Bit port map(v0,result7(59 downto 0)&"0000",'0',final);
   adding12:BCDAdder8Bit port map(v7,ali,'0',mamad);
    ehsan1 <= ehsan;
    GEN_ADD: for I in 0 to 7 generate 
        LOWER_BIT7: if I=0 generate
          adding0:BCDAdder8Bit port map(v7,ehsan1,'0',ehsan);
        end generate LOWER_BIT7;
        LOWER_BIT6: if I=1 generate
          adding1:BCDAdder8Bit port map(v6,ehsan1(59 downto 0)&"0000",'0',ehsan);
        end generate LOWER_BIT6;
        LOWER_BIT5: if I=2 generate
          adding1:BCDAdder8Bit port map(v5,ehsan1(59 downto 0)&"0000",'0',ehsan);
        end generate LOWER_BIT5;
        LOWER_BIT4: if I=3 generate
          adding1:BCDAdder8Bit port map(v4,ehsan1(59 downto 0)&"0000",'0',ehsan);
        end generate LOWER_BIT4;
        LOWER_BIT3: if I=4 generate
          adding1:BCDAdder8Bit port map(v3,ehsan1(59 downto 0)&"0000",'0',ehsan);
        end generate LOWER_BIT3; 
        LOWER_BIT2: if I=5 generate
          adding1:BCDAdder8Bit port map(v2,ehsan1(59 downto 0)&"0000",'0',ehsan);
        end generate LOWER_BIT2;
        LOWER_BIT1: if I=6 generate
          adding1:BCDAdder8Bit port map(v1,ehsan1(59 downto 0)&"0000",'0',ehsan);
        end generate LOWER_BIT1;
        LOWER_BIT0: if I=7 generate
          adding1:BCDAdder8Bit port map(v0,ehsan1(59 downto 0)&"0000",'0',ehsan);
        end generate LOWER_BIT0;
      end generate GEN_ADD;
    
        output<= ehsan;

end Behavioral;



architecture sequential of BCDMultipler8in8 is
    component bitInDigitBCDMultiplier is
    Port ( 
       a:in std_logic_vector(31 downto 0);
       b:in std_logic_vector(3 downto 0);
       vo:out std_logic_vector(35 downto 0)
    );
     end component;
    component BCDAdder8Bit is
    Port ( 
         a:in std_logic_vector(35 downto 0);
         b:in std_logic_vector(63 downto 0);
         cin:in std_logic;
         s:out std_logic_vector(63 downto 0)
    );
    end component;
    signal res,ress: std_logic_vector (63 downto 0):=(others=>'0');
    signal vv: std_logic_vector(35 downto 0):=(others=>'0');
    signal temp:std_logic_vector(3 downto 0);
    signal test : std_logic_vector (63 downto 0):=(others=>'0');
begin
    inst8:bitInDigitBCDMultiplier port map(a,temp,vv);
    adding8:BCDAdder8Bit port map(vv,res,'0',ress);
    output <= res;
   process(clk)
    variable counter : integer := 7;
    variable flag: integer := 0;
   begin
           if(clk'event and clk = '1') then
               if(counter >= 0) then
                   if(flag = 0) then
                       temp <= b((counter+1)*4-1 downto (counter)*4);
                       res <= res(59 downto 0)&"0000";
                       flag := 1;
                   elsif(flag = 1) then
                       res <= ress;
                       counter := counter - 1;
                       flag := 0;                       
                   end if;
           end if;
        end if;
     
   end process;
end sequential;
