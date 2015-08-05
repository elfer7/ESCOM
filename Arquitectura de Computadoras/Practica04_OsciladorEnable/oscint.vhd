library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity OSCINT is
	port(
		osc_dis: in std_logic;
		tmr_rst: in std_logic;
		osc_out: out std_logic;
		tmr_out: out std_logic);
end;

architecture OSCIN of OSCINT is
	component OSCTIMER
		generic(TIMER_DIV: string);
		port(
			DYNOSCDIS: in std_logic;
			TIMERRES: in std_logic;
			OSCOUT: out std_logic;
			TIMEROUT: out std_logic);
	end component;
	begin
		inst00: OSCTIMER
			generic map(TIMER_DIV => "1048576")
			port map(
				DYNOSCDIS => osc_dis,
				TIMERRES => tmr_rst,
				OSCOUT => osc_out,
				TIMEROUT => tmr_out
				);
end OSCIN;
