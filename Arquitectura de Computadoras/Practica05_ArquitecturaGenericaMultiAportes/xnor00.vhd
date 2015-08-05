library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xnor00 is

port( 
	clkxnr: in std_logic ;
	codopxnr: in std_logic_vector ( 3 downto 0 );
	portAxnr: in std_logic_vector ( 7 downto 0 );
	portBxnr: in std_logic_vector ( 7 downto 0 );
	inFlagxnr: in std_logic;
	outxnr: out std_logic_vector ( 7 downto 0 );
	outFlagxnr: out std_logic  );

end;

architecture xnor0 of xnor00 is
begin
pxnor: process(codopxnr, portAxnr, portBxnr)
	begin
		if(codopxnr = "0110") then
			outxnr <= portAxnr xnor portBxnr;
			outFlagxnr <= '1';
		else
			outxnr <= (others => 'Z');
			outFlagxnr <= 'Z';
		end if;
	end process pxnor;
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
end xnor0;
