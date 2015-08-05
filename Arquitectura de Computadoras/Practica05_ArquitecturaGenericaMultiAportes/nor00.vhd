library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity nor00 is

port( 
	clknr: in std_logic ;
	codopnr: in std_logic_vector ( 3 downto 0 );
	portAnr: in std_logic_vector ( 7 downto 0 );
	portBnr: in std_logic_vector ( 7 downto 0 );
	inFlagnr: in std_logic;
	outnr: out std_logic_vector ( 7 downto 0 );
	outFlagnr: out std_logic  );

end;

architecture nor0 of nor00 is
begin
pnor: process(codopnr, portAnr, portBnr)
	begin
		if(codopnr = "0101") then
			outnr <= portAnr nor portBnr;
			outFlagnr <= '1';
		else
			outnr <= (others => 'Z');
			outFlagnr <= 'Z';
		end if;
	end process pnor;
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
end nor0;
