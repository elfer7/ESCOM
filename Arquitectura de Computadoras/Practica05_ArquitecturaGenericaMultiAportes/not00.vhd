library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity not00 is

port( 
	clkn: in std_logic ;
	codopn: in std_logic_vector ( 3 downto 0 );
	inFlagn: in std_logic;
	portAn: in std_logic_vector ( 7 downto 0 );
	outn: out std_logic_vector ( 7 downto 0 );
	outFlagn: out std_logic  );

end;

architecture not0 of not00 is
begin
pnot: process(codopn, portAn)
	begin
		if(codopn = "0011") then
			outn <= not portAn;
			outFlagn <= '1';
		else
			outn <= (others => 'Z');
			outFlagn <= 'Z';
		end if;
	end process pnot;
--   pnot: process(clkn, codopn, inFlagn)
--     --variable auxn: bit:='0';
--     begin
--       if (clkn = '1') then 
----clkn'event and 
--         if (codopn = "0011") then
--           --if (inFlagn = '1') then
--              --if (auxn = '0') then
--                  --auxn:= '1';
--                  outn <= not(portAn);
--                  outFlagn <= '1';
--              --end if;
--           --else
--              --outFlagn <= '0';
--           --end if;
--         else
--           outn <= (others => 'Z');
--           outFlagn <= 'Z';
--           --auxn:='0';
--         end if;
--       end if;
--     end process pnot;
end not0;
