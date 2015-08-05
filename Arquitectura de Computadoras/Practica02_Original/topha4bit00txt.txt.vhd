library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packageha4bit00.all;

entity topha4bit00 is

port( 
	A0: in std_logic ;
	B0: in std_logic ;
	S0: out std_logic ;
	C0: out std_logic  );

end;

architecture topha4bit0 of topha4bit00 is
begin

   U1: and00 port map(Aa => A0,
                      Ba => B0,
                      Ya => C0);

   U2: xor00 port map(Ax => A0,
                      Bx => B0,
                      Yx => S0);


end topha4bit0;
