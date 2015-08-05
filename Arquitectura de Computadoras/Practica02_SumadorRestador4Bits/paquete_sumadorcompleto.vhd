library ieee;
use ieee.std_logic_1164.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

package pack_sum_completo is

  component eOr
    port(
      entrada1_or: in std_logic;
      entrada2_or: in std_logic;
      salida_or: out std_logic);
  end component;

  component eTopSumMedio is
    port(
      entrada1_tsm: in std_logic;
      entrada2_tsm: in std_logic;
      resultado_tsm: out std_logic;
      acarreo_tsm: out std_logic);
  end component;

end pack_sum_completo;

