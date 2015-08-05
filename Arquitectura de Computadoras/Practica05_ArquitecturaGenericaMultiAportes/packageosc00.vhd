library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package packageosc00 is

  component osc00
  port( 
	osc_dis: in std_logic ;
	tmr_rst: in std_logic ;
	tmr_out: out std_logic ;
	osc_out: out std_logic  );
  end component;

  component div00
  port( 
	clkdiv: in std_logic ;
	indiv: in std_logic_vector ( 3 downto 0 );
	outdiv: inout std_logic  );
  end component;

  component start00
  port( 
	oscdis: out std_logic ;
	tmrrst: out std_logic  );
  end component;


end packageosc00;
