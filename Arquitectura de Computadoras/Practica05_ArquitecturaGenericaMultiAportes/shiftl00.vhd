library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity shiftl00 is

port( 
	clkcshl: in std_logic ;
	codopcshl: in std_logic_vector ( 3 downto 0 );
	portAcshl: in std_logic_vector ( 7 downto 0 );
	inFlagcshl: in std_logic;
	outcshl: out std_logic_vector ( 7 downto 0 );
	outFlagcshl: out std_logic  );

end;

architecture shiftl0 of shiftl00 is
begin
pshl: process(codopcshl, portAcshl)
	begin
		if(codopcshl = "1011") then
			outcshl(0) <= '0';
			outcshl(7 downto 1) <= portAcshl(6 downto 0);
			outFlagcshl <= '1';
		else
			outcshl <= (others => 'Z');
			outFlagcshl <= 'Z';
		end if;
	end process pshl;
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
end shiftl0;
