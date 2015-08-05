library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity topadder00 is

port( 
	clkadd: in std_logic ;
	codopadd: in std_logic_vector ( 3 downto 0 );
	inFlagadd: in std_logic ;
	portAaddin: in std_logic_vector ( 7 downto 0 );
	portBaddin: in std_logic_vector ( 7 downto 0 );
	SLaddin: in std_logic ;
	LEDaddin: in std_logic ;
        portAaddout: out std_logic_vector ( 7 downto 0 );
	portBaddout: out std_logic_vector ( 7 downto 0 );
	SLaddout: out std_logic ;
	LEDaddout: out std_logic ;
        outFlagadd: out std_logic;
        Soaddin: in std_logic_vector ( 7 downto 0 );
	Soaddout: out std_logic_vector ( 7 downto 0 ) );

end;

architecture topadder0 of topadder00 is
begin
  padd: process(clkadd, inFlagadd)
    begin
     if (clkadd'event and clkadd = '1') then
        if ((codopadd = "0101") or (codopadd = "0110")) then
          portAaddout <= portAaddin;
          portBaddout <= portBaddin;
          SLaddout <= SLaddin;
          if (inFlagadd = '1') then
            Soaddout <= Soaddin;
            LEDaddout <= LEDaddin;
            outFlagadd <= '1';
          else
            outFlagadd <= '0';
          end if;
        else
          Soaddout <= (others => 'Z');
          outFlagadd <= 'Z';
          LEDaddout <= 'Z';
        end if;
     end if;
  end process padd;
end topadder0;
