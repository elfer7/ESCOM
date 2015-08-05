library ieee;
use ieee.std_logic_1164.all;
use pack_sum_completo.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

-- Entidad
entity eTopSumCompleto is
  port(
      acarreoI_tsc: in std_logic;
      entrada1_tsc: in std_logic;
      entrada2_tsc: in std_logic;
      resultado_tsc: out std_logic;
      acarreoO_tsc: out std_logic);
end;

-- Arquitectura
architecture aTopSumCompleto of eTopSumCompleto is
  signal suma1, acarreo1, acarreo2: std_logic;
  begin
  	U3: eOr port map(
  		entrada1_or => acarreo2,
  		entrada2_or => acarreo1,
  		salida_or => acarreoO_tsc);
  	U4: eTopSumMedio port map(
  		entrada1_tsm => acarreoI_tsc,
  		entrada2_tsm => suma1,
  		resultado_tsm => resultado_tsc,
  		acarreo_tsm => acarreo2);
  	U5: eTopSumMedio port map(
  		entrada1_tsm => entrada1_tsc,
  		entrada2_tsm => entrada2_tsc,
  		resultado_tsm => suma1,
  		acarreo_tsm => acarreo1);
end aTopSumCompleto;
