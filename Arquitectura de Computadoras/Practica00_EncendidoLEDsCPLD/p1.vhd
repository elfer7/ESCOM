library ieee;

use ieee.std_logic_1164.all;

use ieee.std_logic_arith.all;

use ieee.std_logic_unsigned.all;



entity Demo0 is



port( 

	LED0: out std_logic ;

	LED1: out std_logic ;

	LED2: out std_logic ;

	LED3: out std_logic ;

	LED4: out std_logic ;

	LED5: out std_logic ;

	LED6: out std_logic ;

	LED7: out std_logic  );



-- LOC: LOCATION

attribute loc:string;

attribute loc of LED0: signal is "p58";

attribute loc of LED1: signal is "p59";

attribute loc of LED2: signal is "p60";

attribute loc of LED3: signal is "p61";

attribute loc of LED4: signal is "p62";

attribute loc of LED5: signal is "p63";

attribute loc of LED6: signal is "p70";

attribute loc of LED7: signal is "p71";



end;



architecture ADemo0 of Demo0 is

begin



LED0 <= '0';

LED1 <= '0';

LED2 <= '0';

LED3 <= '0';

LED4 <= '0';

LED5 <= '0';

LED6 <= '0';

LED7 <= '0';



end ADemo0;




