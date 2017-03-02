library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp2biy is
port( x,y:in bit_vector(1 downto 0);
      G,E,L:out bit);
end comp2biy;

architecture Behavioral of comp2biy is

begin
 process(x,y)
  begin
   if((x(1)='0' and Y(1)='0') or (x(1)='1'and y(1)='1')) then
       if(x(0)='1' and y(0)='0')then
           G<='1';L<='0';E<='0';
       elsif(x(0)='0' and y(0)='1')then
           L<='1';G<='0';E<='0';
       elsif ((x(0)='0' and y(0)='0') or (x(0)='1' and y(0)='1')) then
         E<='1';G<='0';L<='0';
       end if;
    elsif(x(1)='1' and y(1)='0') then
       G<='1'; L<='0';E<='0';
    elsif(x(1)='0' and y(1)='1') then
       G<='0'; L<='1';E<='0';
     end if;
   end process;

end Behavioral;

architecture gatelevel of comp2biy is
begin
    E <= not(x(1) xor y(1)) and not(x(0) xor y(0));
	G <= (x(1) and not y(1))or(not(x(1) xor y(1)) and x(0) and not y(0));
	L <= (y(1) and not x(1))or(not(y(1) xor x(1)) and y(0) and not x(0));

end gatelevel;
