library ieee;
use ieee.std_logic_1164.all;

package packageoscint is
	component oscint
		port(
		osc_dis: in std_logic;
		tmr_rst: in std_logic;
		osc_out: out std_logic;
		tmr_out: out std_logic);
	end component;

	component div
		port(
		clkdiv: in std_logic;
		indiv: in std_logic_vector(3 downto 0);
		outdiv: inout std_logic);
	end component;

	component enable
		port(
		enable_in: in std_logic;
		enable: out std_logic);
	end component;

end packageoscint;
