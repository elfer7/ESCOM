library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packagefa00.all;

entity topfa00 is

port( 
	C00: in std_logic ;
	A00: in std_logic ;
	B00: in std_logic ;
	S00: out std_logic ;
	C01: out std_logic  );

end;

architecture topfa0 of topfa00 is
signal Sint1, Cint1, Cint2: std_logic;
begin

   U00: topha00 port map(A0 => A00,
                         B0 => B00,
                         S0 => Sint1,
                         C0 => Cint1);

   U01: topha00 port map(A0 => C00,
                         B0 => Sint1,
                         S0 => S00,
                         C0 => Cint2);

   U02: or00  port map(Ao => Cint2,
                       Bo => Cint1,
                       Yo => C01);

end topfa0;
