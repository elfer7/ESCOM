library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comp00 is

port( 
	clkcmp: in std_logic ;
	codopcmp: in std_logic_vector ( 3 downto 0 );
	portAcmp: in std_logic_vector ( 7 downto 0 );
	portBcmp: in std_logic_vector ( 7 downto 0 );
	inFlagcmp: in std_logic;
	outcmp: out std_logic_vector ( 7 downto 0 );
	outFlagcmp: out std_logic  );

end;

architecture comp0 of comp00 is
begin
pcmp: process(codopcmp, portAcmp, portBcmp)
	begin
		if(codopcmp = "1111") then
			if(portAcmp > portBcmp) then
				outcmp <= portAcmp;
			else
				outcmp <= portBcmp;
			end if;
			outFlagcmp <= '1';
		else
			outcmp <= (others => 'Z');
			outFlagcmp <= 'Z';
		end if;
	end process pcmp;
--   pnand: process(clknd, codopnd, inFlagnd)
--     --variable auxnd: bit:='0';
--     begin
--       if (clknd = '1') then 
----clknd'event and 
--         if (codopnd = "0100") then
--           if (inFlagnd = '1') then
--              --if (auxnd = '0') then
--                  --auxnd:= '1';
--                  outnd <= portAnd nand portBnd;
--                  outFlagnd <= '1';
--              --end if;
--           else
--              outFlagnd <= '0';
--           end if;
--         else
--           outnd <= (others => 'Z');
--           outFlagnd <= 'Z';
--           --auxnd:='0';
--         end if;
--       end if;
--     end process pnand;
end comp0;
