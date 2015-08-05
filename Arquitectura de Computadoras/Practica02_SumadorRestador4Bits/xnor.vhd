library ieee;
use ieee.std_logic_1164.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

-- Entidad
entity eXnor is
  port(
    entrada1_xnor: in std_logic;
    entrada2_xnor: in std_logic;
    salida_xnor: out std_logic);
end;

-- Arquitectura
architecture aXnor of eXnor is
  begin
    salida_xnor <= entrada1_xnor XNOR entrada2_xnor;
end aXnor;
