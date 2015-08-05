library ieee;
use ieee.std_logic_1164.all;
use pack_sum_medio.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

-- Entidad
entity eTopSumMedio is
  port(
      entrada1_tsm: in std_logic;
      entrada2_tsm: in std_logic;
      resultado_tsm: out std_logic;
      acarreo_tsm: out std_logic);
  attribute loc: string;
  attribute loc of entrada1_tsm: signal is "p125";
  attribute loc of entrada2_tsm: signal is "p124";
  attribute loc of resultado_tsm: signal is "p4";
  attribute loc of acarreo_tsm: signal is "p5";
end;

-- Arquitectura
architecture aTopSumMedio of eTopSumMedio is
  begin
  	U1: eAnd port map(
  		entrada1_and => entrada1_tsm,
  		entrada2_and => entrada2_tsm,
  		salida_and => acarreo_tsm);
  	U2: eXor port map(
  		entrada1_xor => entrada1_tsm,
  		entrada2_xor => entrada2_tsm,
  		salida_xor => resultado_tsm);
end aTopSumMedio;
