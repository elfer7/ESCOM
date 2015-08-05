library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity uc01 is
port( 
	clkuc: in std_logic ;
	inACuc: in std_logic_vector ( 7 downto 0 );
	FlagInstuc: inout std_logic ;
	outACuc: out std_logic_vector ( 7 downto 0 );
	FlagReadyuc: out std_logic  );

end;

architecture uc0 of uc01 is
signal sinACuc: std_logic_vector(7 downto 0);
begin
   puc: process(clkuc, inACuc, FlagInstuc)
     begin
       if (clkuc'event and clkuc = '1') then
         if (FlagInstuc = '1') then
            sinACuc <= inACuc;
            outACuc <= sinACuc;
            FlagReadyuc <= '1';
         elsif (FlagInstuc = '0') then
         FlagReadyuc <= '0';
         end if;
      end if;
   end process puc;

end uc0;

