library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity shiftr00 is

port( 
	clkcshr: in std_logic ;
	codopcshr: in std_logic_vector ( 3 downto 0 );
	portAcshr: in std_logic_vector ( 7 downto 0 );
	inFlagcshr: in std_logic;
	outcshr: out std_logic_vector ( 7 downto 0 );
	outFlagcshr: out std_logic  );

end;

architecture shiftr0 of shiftr00 is
begin
pshr: process(codopcshr, portAcshr)
	begin
		if(codopcshr = "1010") then
			outcshr(7) <= '0';
			outcshr(6 downto 0) <= portAcshr(7 downto 1);
			outFlagcshr <= '1';
		else
			outcshr <= (others => 'Z');
			outFlagcshr <= 'Z';
		end if;
	end process pshr;
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
end shiftr0;
