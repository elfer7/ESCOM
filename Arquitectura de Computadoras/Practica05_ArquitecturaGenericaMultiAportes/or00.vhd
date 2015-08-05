library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity or00 is

port( 
	clko: in std_logic ;
	codopo: in std_logic_vector ( 3 downto 0 );
	portAo: in std_logic_vector ( 7 downto 0 );
	portBo: in std_logic_vector ( 7 downto 0 );
	inFlago: in std_logic ;
	outo: out std_logic_vector ( 7 downto 0 );
	outFlago: out std_logic  );

end;

architecture or0 of or00 is
begin
por: process(codopo, portAo, portBo)
	begin
		if(codopo = "0010") then
			outo <= portAo or portBo;
			outFlago <= '1';
		else
			outo <= (others => 'Z');
			outFlago <= 'Z';
		end if;
	end process por;
--   por: process(clko, codopo, inFlago)
--     --variable auxo: bit:='0';
--     begin
--       if (clko = '1') then 
----clko'event and 
--         if (codopo = "0010") then
--           if (inFlago = '1') then
--              --if (auxo = '0') then
--                  --auxo:= '1';
--                  outo <= portAo or portBo;
--                  outFlago <= '1';
--              --end if;
--           else
--              outFlago <= '0';
--           end if;
--         else
--           outo <= (others => 'Z');
--           outFlago <= 'Z';
--           --auxo:='0';
--         end if;
--       end if;
--     end process por;
end or0;
