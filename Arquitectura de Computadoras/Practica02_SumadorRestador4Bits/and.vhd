library ieee;
use ieee.std_logic_1164.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

-- Entidad
entity eAnd is
  port(
    entrada1_and: in std_logic;
    entrada2_and: in std_logic;
    salida_and: out std_logic);
end;

-- Arquitectura
architecture aAnd of eAnd is
  begin
    salida_and <= entrada1_and AND entrada2_and;
end aAnd;
