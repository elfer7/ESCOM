library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package packagene01 is

component uc01
  port( 
	clkuc: in std_logic ;
	inACuc: in std_logic_vector ( 7 downto 0 );
	FlagInstuc: inout std_logic ;
	outACuc: out std_logic_vector ( 7 downto 0 );
	FlagReadyuc: out std_logic  );
  end component;

 

  component osc03
  port( 
	osc_dis: in std_logic ;
	tmr_rst: in std_logic ;
	osc_out: out std_logic ;
	tmr_out: out std_logic  );
  end component;

   component generic0x
  port( 
	clka:in std_logic;
	codop0x: in std_logic_vector ( 3 downto 0 );
	PortA0x: in std_logic_vector ( 7 downto 0 );
	PortB0x: in std_logic_vector ( 7 downto 0 );
	out0x: out std_logic_vector ( 7 downto 0 );
	sinFlag0x: in std_logic ;
	enable: in std_logic ;
	en2: in std_logic ;  
	outFlag0x: out std_logic );
  end component;

end packagene01;

