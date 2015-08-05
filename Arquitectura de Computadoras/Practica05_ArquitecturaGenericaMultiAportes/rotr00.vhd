library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rotr00 is

port( 
	clkrotr: in std_logic ;
	codoprotr: in std_logic_vector ( 3 downto 0 );
	portArotr: in std_logic_vector ( 7 downto 0 );
	inFlagrotr: in std_logic;
	outrotr: out std_logic_vector ( 7 downto 0 );
	outFlagrotr: out std_logic  );

end;

architecture rotr0 of rotr00 is
begin
protr: process(codoprotr, portArotr)
	begin
		if(codoprotr = "1100") then
			outrotr(7) <= portArotr(0);
			outrotr(6 downto 0) <= portArotr(7 downto 1);
			outFlagrotr <= '1';
		else
			outrotr <= (others => 'Z');
			outFlagrotr <= 'Z';
		end if;
	end process protr;

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
end rotr0;
