library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity div00 is
  port(
       clkdiv: in std_logic;
       outdiv: out std_logic);
end;

architecture div0 of div00 is
signal sdiv: std_logic_vector(11 downto 0);
begin
   pdiv: process()
      begin
       if (clkdiv'event and clkdiv = '1') then
          if (sdiv < "100000000000") then
             outdiv <= '1';
             sdiv <= sdiv + 1;
          elsif (sdiv > "100000000000") then
             outdiv <= '0';
             sdiv <= sdiv + 1;
          end if;
       end if;
      end process pdiv;
end div0;
