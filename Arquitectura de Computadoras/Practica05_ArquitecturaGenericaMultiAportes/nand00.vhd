library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity nand00 is

port( 
	clknd: in std_logic ;
	codopnd: in std_logic_vector ( 3 downto 0 );
	portAnd: in std_logic_vector ( 7 downto 0 );
	portBnd: in std_logic_vector ( 7 downto 0 );
	inFlagnd: in std_logic;
	outnd: out std_logic_vector ( 7 downto 0 );
	outFlagnd: out std_logic  );

end;

architecture nand0 of nand00 is
begin
pnand: process(codopnd, portAnd, portBnd)
	begin
		if(codopnd = "0100") then
			outnd <= portAnd nand portBnd;
			outFlagnd <= '1';
		else
			outnd <= (others => 'Z');
			outFlagnd <= 'Z';
		end if;
	end process pnand;
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
end nand0;
