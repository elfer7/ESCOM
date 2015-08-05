library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package packagefa00 is

   component or00
     port( 
	Ao: in std_logic ;
	Bo: in std_logic ;
	Yo: out std_logic  );
   end component;

   component topha00
     port( 
	A0: in std_logic ;
	B0: in std_logic ;
	S0: out std_logic ;
	C0: out std_logic  );
   end component;

end packagefa00;
