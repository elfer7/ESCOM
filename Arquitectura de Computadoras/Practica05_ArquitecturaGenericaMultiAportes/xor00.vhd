library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xor00 is

port( 
	clkx: in std_logic ;
	codopx: in std_logic_vector ( 3 downto 0 );
	portAx: in std_logic_vector ( 7 downto 0 );
	portBx: in std_logic_vector ( 7 downto 0 );
	inFlagx: in std_logic ;
	outx: out std_logic_vector ( 7 downto 0 );
	outFlagx: out std_logic  );

end;

architecture xor0 of xor00 is
begin
pxor: process(codopx, portAx, portBx)
	begin
		if(codopx = "1110") then
			outx <= portAx xor portBx;
			outFlagx <= '1';
		else
			outx <= (others => 'Z');
			outFlagx <= 'Z';
		end if;
	end process pxor;
--  pxor: process(clkx, codopx, inFlagx)
--    --variable auxx: bit:='0';
--    begin
--       if (clkx = '1') then 
----clkx'event and 
--          if (codopx = "0001") then
--            if (inFlagx = '1') then
--               --if (auxx = '0') then
--                  --auxx:='1';
--                  outx <= portAx xor portBx;
--                  outFlagx <= '1';
--               --end if;
--            else
--              outFlagx <= '0';
--            end if;
--          else
--            outx <= (others => 'Z');
--            outFlagx <= 'Z';
--            --auxx:='0';
--          end if;
--       end if;
--    end process pxor;
end xor0;
