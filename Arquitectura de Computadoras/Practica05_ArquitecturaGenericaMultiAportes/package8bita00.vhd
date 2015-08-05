library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package package8bita00 is

   component xora00
     port (Ax: in std_logic;
           Bx: in std_logic;
           Yx: out std_logic);
     end component;

   component topfaa00
     port (A00: in std_logic;
           B00: in std_logic;
           C00: in std_logic;
           C01: out std_logic;
           S00: out std_logic);
    end component;

   component xnora00
     port (Anx: in std_logic;
           Bnx: in std_logic;
           Ynx: out std_logic);
     end component;

   component anda00
     port (Aa: in std_logic;
           Ba: in std_logic;
           Ya: out std_logic);
    end component;


end package8bita00;

