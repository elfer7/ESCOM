library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xor00 is

port( 
	Ax: in std_logic ;
	Bx: in std_logic ;
	Yx: out std_logic  );

end;

architecture xor0 of xor00 is
begin
   Yx <= Ax xor Bx;
end xor0;
