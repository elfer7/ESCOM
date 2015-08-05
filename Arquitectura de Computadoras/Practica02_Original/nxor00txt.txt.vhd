library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity nxor00 is

port( 
	Anx: in std_logic ;
	Bnx: in std_logic ;
	Ynx: out std_logic  );

end;

architecture nxor0 of nxor00 is
begin
   Ynx <= NOT(Anx xor Bnx);
end nxor0;
