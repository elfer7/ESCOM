library ieee;
use ieee.std_logic_1164.all;
use packageoscint.all;

entity toposc is
	port(
		indiv0: in std_logic_vector(3 downto 0);
		habilitar: in std_logic;
		resetear: in std_logic;
		outdiv0: inout std_logic);
	attribute loc: string;
	attribute loc of indiv0: signal is "p125, p124, p123, p122";
	attribute loc of habilitar: signal is "p121";
	attribute loc of resetear: signal is "p120";
	attribute loc of outdiv0: signal is "p24";
end toposc;
	--port(
		--oscdis0: in std_logic;
		--tmrrst0: in std_logic;
		--oscout0: out std_logic);
	--attribute loc: string;
	--attribute loc of oscdis0: signal is "p125";
	--attribute loc of tmrrst0: signal is "p124";
	--attribute loc of oscout0: signal is "p5";
--end;

architecture atoposc of toposc is
	signal oscout0, tmrout, enb: std_logic;
	begin
		U1: OSCINT port map(
			osc_dis => enb,
			tmr_rst => resetear,
			tmr_out => outdiv0,
			osc_out => oscout0); --tmr_out => tmrout
		--U2: div port map(
		--	clkdiv => tmrout,
		--	indiv => indiv0,
		--	outdiv => outdiv0);
		U3: enable port map(
			enable_in => habilitar,
			enable => enb);
end atoposc;
