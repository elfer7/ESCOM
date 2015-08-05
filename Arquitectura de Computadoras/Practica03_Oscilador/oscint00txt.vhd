library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity oscint00 is

port( 
	osc_dis: in std_logic ;
	tmr_rst: in std_logic ;
	tmr_out: out std_logic ;
	osc_out: out std_logic  );
   attribute loc: string;
   attribute loc of osc_dis: signal is "p125";
   attribute loc of tmr_rst: signal is "p110";
   attribute loc of tmr_out: signal is "p58";
   attribute loc of osc_out: signal is "p59";
end;

architecture oscint0 of oscint00 is

component osctimer
generic(TIMER_DIV : string);
     port( DYNOSCDIS : in std_logic;
           TIMERRES : in std_logic;
           OSCOUT : out std_logic;
           TIMEROUT : out std_logic);
     end component;

begin

I1: OSCTIMER
    generic map (TIMER_DIV => "1048576")
    port map ( DYNOSCDIS => osc_dis,
               TIMERRES => tmr_rst,
               OSCOUT => osc_out,
              TIMEROUT => tmr_out);


end oscint0;
