library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity uc00 is

port( 
	clkuc: in std_logic ;
	inFlaguc: in std_logic ;
	inFlaguc2: in std_logic ;
	enable: in std_logic ;
	inuc: in std_logic_vector ( 7 downto 0 );
	outuc: out std_logic_vector ( 7 downto 0 );
	outFlaguc: out std_logic  );

end;

architecture uc0 of uc00 is
begin
     puc: process(clkuc, enable, inuc)
     begin
       if(clkuc = '1' and enable = '1') then
          outFlaguc <= '1';
          outuc <= inuc;
        else
          outFlaguc <= '0';
          outuc <= (others => '0');
        end if;
     end process puc;
   --puc: process(clkuc, inFlaguc, enable)
   --  begin
   --     if (clkuc'event and clkuc = '1') then
   --         if (inFlaguc = '0' and inFlaguc2 = '0') then
   --           if (enable = '1') then
   --              outuc <= inuc;
   --              outFlaguc <= '1';
   --           else
   --              outuc <= (others => 'Z');
   --              outFlaguc <= 'Z';
   --           end if;
   --         elsif (inFlaguc = '0' and inFlaguc2 = '1') then
   --            if (enable = '1') then
   --              outuc <= (others => 'Z');
   --              outFlaguc <= 'Z';
   --            else
   --              outuc <= (others => 'Z');
   --              outFlaguc <= 'Z';
   --            end if;
   --         elsif (inFlaguc = '1' and inFlaguc2 = '0') then
   --            if (enable = '1') then
   --              outuc <= inuc;
   --              outFlaguc <= '1';
   --            else
   --              outuc <= (others => 'Z');
   --              outFlaguc <= 'Z';
   --            end if;
   --         elsif (inFlaguc = '1' and inFlaguc2 = '1') then
   --            if (enable = '1') then
   --              outuc <= (others => 'Z');
   --              outFlaguc <= 'Z';
   --            else
   --              outuc <= (others => 'Z');
   --              outFlaguc <= 'Z';
   --            end if;
   --        end if;
   --     end if;
   --  end process puc;
end uc0;
