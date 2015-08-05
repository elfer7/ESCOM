library ieee;
use ieee.std_logic_1164.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

package pack_sum_medio is

  component eAnd
    port(
      entrada1_and: in std_logic;
      entrada2_and: in std_logic;
      salida_and: out std_logic);
  end component;

  component eXor
    port(
      entrada1_xor: in std_logic;
      entrada2_xor: in std_logic;
      salida_xor: out std_logic);
  end component;

end pack_sum_medio;
    
    
    
