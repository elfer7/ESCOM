library ieee;
use ieee.std_logic_1164.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

-- Entidad
entity eXor is
  port(
    entrada1_xor: in std_logic;
    entrada2_xor: in std_logic;
    salida_xor: out std_logic);
end;

-- Arquitectura
architecture aXor of eXor is
  begin
    salida_xor <= entrada1_xor XOR entrada2_xor;
end aXor;
