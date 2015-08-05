library ieee;
use ieee.std_logic_1164.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

-- Entidad
entity eOr is
  port(
    entrada1_or: in std_logic;
    entrada2_or: in std_logic;
    salida_or: out std_logic);
end;

-- Arquitectura
architecture aOr of eOr is
  begin
    salida_or <= entrada1_or OR entrada2_or;
end aOr;
