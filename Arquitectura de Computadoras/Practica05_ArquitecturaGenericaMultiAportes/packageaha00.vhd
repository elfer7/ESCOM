library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package packageaha00 is

  component xora00
    port( Ax: in std_logic;
          Bx: in std_logic;
          Yx: out std_logic);
    end component;

  component anda00
    port( Aa: in std_logic;
          Ba: in std_logic;
          Ya: out std_logic);
    end component;

end packageaha00;
