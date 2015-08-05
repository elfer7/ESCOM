library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity or00 is

port( 
	Ao: in std_logic ;
	Bo: in std_logic ;
	Yo: out std_logic  );

end;

architecture or0 of or00 is
begin
  Yo <= Ao or Bo;
end or0;
