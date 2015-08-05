library ieee;

use ieee.std_logic_1164.all;

use ieee.std_logic_arith.all;

use ieee.std_logic_unsigned.all;



entity and00 is



port( 

	clka: in std_logic ;

	codopa: in std_logic_vector ( 3 downto 0 );

	portAa: in std_logic_vector ( 7 downto 0 );

	portBa: in std_logic_vector ( 7 downto 0 );

	inFlaga: in std_logic ;

	outa: out std_logic_vector ( 7 downto 0 );

	outFlaga: out std_logic  );



end;



architecture and0 of and00 is

begin
	pand: process(codopa, portAa, portBa)
	begin
		if(codopa = "0001") then
			outa <= portAa and portBa;
			outFlaga <= '1';
		else
			outa <= (others => 'Z');
			outFlaga <= 'Z';
		end if;
	end process pand;
--   pand: process(clka, codopa, inFlaga)

--     --variable auxa: bit:='0';

--     begin

--       if (clka'event and clka = '1') then

--         if (codopa = "0000") then

--           if (inFlaga = '1') then

--              --if (auxa = '0') then

--                  --auxa:= '1';

--                  outa <= portAa and portBa;

--                  outFlaga <= '1';

--              --end if;

--           else

--              outFlaga <= '0';

--           end if;

--         else

--           outa <= (others => 'Z');

--           outFlaga <= 'Z';

--           --auxa:='0';

--         end if;

--       end if;

--     end process pand;

end and0;


