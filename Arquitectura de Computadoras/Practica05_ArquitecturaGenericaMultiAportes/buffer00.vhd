library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity buffer00 is

port(
        clkb: in std_logic;
        enableb: in std_logic;
	inFlagb2: in std_logic ;
	inFlagb: in std_logic ;
	inucb: in std_logic_vector ( 7 downto 0 );
	inucb2: in std_logic_vector ( 7 downto 0 );
	outucb: out std_logic_vector ( 7 downto 0 );
	outFlagb: out std_logic  );

end;

architecture buffer0 of buffer00 is
begin
    pbuff: process(clkb, enableb, inucb)
    begin
      if(clkb = '1' and enableb = '1') then
        outFlagb <= '1';
        outucb <= inucb;
      else
        outFlagb <= '0';
        outucb <= (others => '0');
      end if;
    end process pbuff;
  --pbuff:  process(clkb, inFlagb, inFlagb2, inucb, inucb2)
  --begin
  --  if (clkb'event and clkb = '1') then
  --   if (inFlagb = '0' and inFlagb2 = '0') then
  --      if (enableb = '1') then
  --        outucb <= inucb;
  --        outFlagb <= '1';
  --      else
  --        outucb <= (others => 'Z');
  --        outFlagb <= 'Z';
  --      end if;
  --   elsif (inFlagb = '0' and inFlagb2 = '1') then
  --      if (enableb = '1') then
  --        outucb <= inucb2;
  --        outFlagb <= '1';
  --      else
  --        outucb <= (others => 'Z');
  --        outFlagb <= 'Z';
  --      end if;
  --   elsif (inFlagb = '1' and inFlagb2 = '0') then
  --      if (enableb = '1') then
  --        outucb <= inucb;
  --        outFlagb <= '1';
  --      else
  --        outucb <= (others => 'Z');
  --        outFlagb <= 'Z';
  --      end if;
  --   elsif (inFlagb = '1' and inFlagb2 = '1') then
  --      if (enableb = '1') then
  --        outucb <= inucb2;
  --        outFlagb <= '1';
  --      else
  --        outucb <= (others => 'Z');
  --        outFlagb <= 'Z';
  --      end if;
  --   end if;
  -- end if;
  --end process pbuff;
end buffer0;
