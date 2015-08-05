library ieee;
use ieee.std_logic_1164.all;

entity enable is
	port(
		enable_in: in std_logic;
		enable: out std_logic);
end;

architecture aenable of enable is
begin
	enable <= not enable_in;
end aenable;
