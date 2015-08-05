library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rotl00 is

port( 
	clkrotl: in std_logic ;
	codoprotl: in std_logic_vector ( 3 downto 0 );
	portArotl: in std_logic_vector ( 7 downto 0 );
	inFlagrotl: in std_logic;
	outrotl: out std_logic_vector ( 7 downto 0 );
	outFlagrotl: out std_logic  );

end;

architecture rotl0 of rotl00 is
begin
rotl: process(codoprotl, portArotl)
	begin
		if(codoprotl = "1101") then
			outrotl(0) <= portArotl(7);
			outrotl(7 downto 1) <= portArotl(6 downto 0);
			outFlagrotl <= '1';
		else
			outrotl <= (others => 'Z');
			outFlagrotl <= 'Z';
		end if;
	end process rotl;

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
end rotl0;
