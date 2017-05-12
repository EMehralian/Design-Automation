
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity module3 is
port(
    clk: in std_logic;
    x: std_logic;
    result: out std_logic_vector(1 downto 0)
     );
end module3;

architecture Behavioral of module3 is
type State is (init,start,s00,s10,s01,s11,s21,s02,s12,s22,s03,s13,s23,s04,s14,s24,s05,s15,s25,s06,s16,s26,s07,s17,s27,s08,s18,s28,s0f,s1f,s2f);
signal current_state , next_state : State;  
signal number : std_logic_vector(7 downto 0);
begin

    process (clk)
    begin
        if( clk'event and clk ='1') then
            current_state <= next_state;
        end if;
    end process;
    
    process (current_state , x)
    
    begin  
        
        case current_state is
         when init =>
            result<="UU";
            if( x = '0') then
             next_state <= init;
            else
             next_state <= start;
            end if;
         when start =>
            result<="UU";
            if( x = '0') then
             next_state <= s00;
            else
             next_state <= s10;
            end if;
          when s00 =>
            result<="UU";
            if( x = '0') then
               next_state <= s01;
            else
               next_state <= s11;
            end if;
          when s10 =>
            result<="UU";
            if( x = '0') then
                next_state <= s01;
            else
                next_state <= s21;
            end if;
          when s01 =>
            result<="UU";
              if( x = '0') then
                 next_state <= s02;
              else
                 next_state <= s12;
              end if;
         when s11 =>
            result<="UU";
              if( x = '0') then
                  next_state <= s02;
              else
                  next_state <= s22;
              end if;
         when s21 =>
            result<="UU";
              if( x = '0') then
                next_state <= s11;
              else
                next_state <= s22;
              end if;
         when s02 =>
           result<="UU";
           if( x = '0') then
            next_state <= s03;
           else
            next_state <= s13;
           end if;
         when s12 =>
            result<="UU";
            if( x = '0') then
                next_state <= s03;
            else
                next_state <= s23;
            end if;
          when s22 =>
            result<="UU";
            if( x = '0') then
                next_state <= s13;
            else
                next_state <= s23;
            end if;
          when s03 =>
            result<="UU";
            if( x = '0') then
                next_state <= s04;
            else
                next_state <= s14;
            end if;
          when s13 =>
            result<="UU";
            if( x = '0') then
                next_state <= s04;
            else
                next_state <= s24;
            end if;
          when s23 =>
            result<="UU";
            if( x = '0') then
                next_state <= s14;
            else
                next_state <= s24;
            end if;
          when s04 =>
            result<="UU";
            if( x = '0') then
                next_state <= s05;
            else
                next_state <= s15;
            end if;
          when s14 =>
            result<="UU";
            if( x = '0') then
                next_state <= s05;
            else
                next_state <= s25;
            end if;
          when s24 =>
            result<="UU";
                if( x = '0') then
                    next_state <= s15;
                else
                    next_state <= s25;
                end if;
          when s05 =>
            result<="UU";
            if( x = '0') then
                next_state <= s06;
            else
                next_state <= s16;
            end if;
          when s15 =>
            result<="UU";
            if( x = '0') then
                next_state <= s06;
            else
                next_state <= s26;
            end if;
          when s25 =>
            result<="UU";
            if( x = '0') then
                next_state <= s16;
            else
                next_state <= s26;
            end if;
          when s06 =>
            result<="UU";
            if( x = '0') then
                next_state <= s07;
            else
                next_state <= s17;
            end if;
          when s16 =>
            result<="UU";
            if( x = '0') then
                next_state <= s07;
            else
                next_state <= s27;
            end if;
          when s26 =>
            result<="UU";
            if( x = '0') then
                next_state <= s17;
            else
                next_state <= s27;
            end if;
          when s07 =>
            result<="UU";
            if( x = '0') then
                next_state <= s0f;
            else
                next_state <= s1f;
            end if;
          when s17 =>
            result<="UU";
            if( x = '0') then
                next_state <= s0f;
            else
                next_state <= s2f;
            end if;
          when s27 =>
            result<="UU";
            if( x = '0') then
                next_state <= s1f;
            else
                next_state <= s2f;
            end if;
          when s0f =>
            result<="00";
            if( x = '0') then
                next_state <= init;
            else
                next_state <= start;
            end if;
          when s1f =>
            result<="01";
            if( x = '0') then
                next_state <= init;
            else
                next_state <= start;
            end if;
          when s2f =>
            result<="10";
            if( x = '0') then
                next_state <= init;
            else
                next_state <= start;
            end if;                                                                                                                                                                                                                    
        when others =>
            result<="UU";
            if( x = '1') then
             next_state <= start;
            else
             next_state <= init;
            end if;           
        end case;
    end process;

end Behavioral;
