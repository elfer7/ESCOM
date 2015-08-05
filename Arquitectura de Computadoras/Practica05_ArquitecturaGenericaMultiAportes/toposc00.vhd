library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packageosc00.all;

entity toposc00 is

port( 
	indivosc: in std_logic_vector ( 3 downto 0 );
        oscout: out std_logic;
        soscdis: in std_logic;
        stmrrst: in std_logic;
	outdivosc: inout std_logic  );

end;

architecture toposc0 of toposc00 is
signal sclkdiv: std_logic;
begin
  
  D00: osc00 port map(osc_dis => soscdis,
                      tmr_rst => stmrrst,
                      osc_out => oscout,
                      tmr_out => sclkdiv);

  D01: div00 port map(clkdiv => sclkdiv,
                      indiv => indivosc,
                      outdiv => outdivosc);


end toposc0;
