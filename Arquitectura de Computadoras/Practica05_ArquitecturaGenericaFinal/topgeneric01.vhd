library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packagene01.all;

entity topgeneric01 is
port( 
	clk0: in std_logic ;
	codop00: in std_logic_vector ( 3 downto 0 );
	enable00: in std_logic ;
	en20: in std_logic ;
	PortA00: in std_logic_vector ( 7 downto 0 );
	PortB00: in std_logic_vector ( 7 downto 0 );
	outuc0: inout std_logic_vector ( 7 downto 0 );
	sinFlag00: inout std_logic ; 
	outFlag00: inout std_logic; 
        osc_dis0: in std_logic;
        tmr_rst0: in std_logic;
        osc_out0: out std_logic;
        tmr_out0: out std_logic);


   attribute loc: string;
   attribute loc of PortA00: signal is "p125, p124, p123, p122, p121, p120, p117, p110";
   attribute loc of PortB00: signal is "p116, p115, p114, p113, p112, p111, p105, p104";
   attribute loc of codop00: signal is "p103, p102, p101, p100";

   attribute loc of clk0: signal is "p98";
   attribute loc of enable00: signal is "p79";
   attribute loc of en20: signal is "p78";
   attribute loc of osc_dis0: signal is "p77";
   attribute loc of tmr_rst0: signal is "p76";
   
   attribute loc of outuc0: signal is "p4, p5, p6, p7, p8, p9, p11, p12";
   attribute loc of sinFlag00: signal is "p21";
   attribute loc of outFlag00: signal is "p22";
   attribute loc of osc_out0: signal is "p23";
   attribute loc of tmr_out0: signal is "p24";

end;

architecture topgeneric01 of topgeneric01 is
signal soutua, sPortA00, sPortB00: std_logic_vector(7 downto 0);
--signal scodop0x: std_logic_vector(3 downto 0);
signal sclka: std_logic;

begin
  --scodop0x <= codop00;
  sclka <= clk0;
  sPortA00 <= PortA00;
  sPortB00 <= PortB00;

 U01: uc01 port map(clkuc => sclka,
                    inACuc => soutua,
                    FlagInstuc => sinFlag00,
                    outACuc => outuc0,
                    FlagReadyuc => outFlag00);

U02: osc03 port map(osc_dis => osc_dis0,
                     tmr_rst => tmr_rst0,
                     osc_out => osc_out0,
                     tmr_out => tmr_out0);

U03: generic0x port map( 
	clka => sclka,
	codop0x => codop00,
	PortA0x => sPortA00,
	PortB0x => sPortB00,
	out0x => soutua,
	sinFlag0x => outFlag00,
	enable =>enable00,
        en2 => en20,
	outFlag0x => sinFlag00);

end topgeneric01;

