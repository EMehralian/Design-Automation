entity fulladder is
    Port ( a : in std_logic;
           b : in std_logic;
           cin : in std_logic;
           s : out std_logic;
           cout : out std_logic);
end fulladder;
 
architecture RTL of fulladder is
 
begin
s<=(a xor (b xor cin)); 
cout<=(b and cin) or (a and cin) or (a and b);
 
end RTL;