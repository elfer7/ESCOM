library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packagefa4bit00.all;

entity topfa4bit00 is

port( 
	C00: in std_logic ;
	A00: in std_logic ;
	B00: in std_logic ;
	S00: out std_logic ;
	C01: out std_logic  );

end;

architecture topfa4bit0 of topfa4bit00 is
signal Sint1, Cint1, Cint2: std_logic;
begin

   U3: or00 port map(Ao => Cint2,
                     Bo => Cint1,
                     Yo => C01);

   U4: topha4bit00 port map(A0 => C00,
                            B0 => Sint1,
                            S0 => S00,
                            C0 => Cint2);

   U5: topha4bit00 port map(A0 => A00,
                            B0 => B00,
                            S0 => Sint1,
                            C0 => Cint1);

end topfa4bit0;
