library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comp200 is

port( 
	clkcmp2: in std_logic ;
	codopcmp2: in std_logic_vector ( 3 downto 0 );
	portAcmp2: in std_logic_vector ( 7 downto 0 );
	inFlagcmp2: in std_logic;
	outcmp2: out std_logic_vector ( 7 downto 0 );
	outFlagcmp2: out std_logic  );

end;

architecture comp20 of comp200 is
begin
pcomp2: process(codopcmp2, portAcmp2)
	begin
		if(codopcmp2 = "0111") then
			outcmp2 <= not(portAcmp2)+1;
			outFlagcmp2 <= '1';
		else
			outcmp2 <= (others => 'Z');
			outFlagcmp2 <= 'Z';
		end if;
	end process pcomp2;
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
end comp20;
