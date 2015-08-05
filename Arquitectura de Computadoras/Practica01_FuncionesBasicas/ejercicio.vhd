library ieee;
use ieee.std_logic_1164.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

-- Primer dip-switch permite seleccionar la función a realizar
--  Función | Código
--  AND     | 000
--  OR      | 001
--  NOT     | 010
--  XOR     | 011
--  NAND    | 100
--  NOR     | 101
--  XNOR    | 110

-- Entidad
entity Prac01 is
  port(
    seleccion1: in std_logic;
    seleccion2: in std_logic;
    seleccion3: in std_logic;
    entrada1: in std_logic;
    entrada2: in std_logic;
    salida: out std_logic);

  -- Loc = Location
  attribute loc: string;
  attribute loc of seleccion1: signal is "p125";
  attribute loc of seleccion2: signal is "p124";
  attribute loc of seleccion3: signal is "p123";
  attribute loc of entrada1: signal is "p116";
  attribute loc of entrada2: signal is "p115";
  attribute loc of salida: signal is "p24";
end;

-- Arquitectura
architecture APrac01 of Prac01 is
  begin
    process(seleccion1, seleccion2, seleccion3, entrada1, entrada2) -- El proceso se ejecuta cada que uno de los parámetros cambia de valor
      variable seleccion: std_logic_vector(2 downto 0); -- MSB a LSB porque estoy usando DOWNTO
    begin
      seleccion := seleccion1 & seleccion2 & seleccion3; -- Concatenando los valores de los interruptores de selección
      case seleccion is
        when "000" =>
          salida <= entrada1 AND entrada2;
        when "001" =>
          salida <= entrada1 OR entrada2;
        when "010" =>
          salida <= NOT entrada1;
        when "011" =>
          salida <= entrada1 XOR entrada2;
        when "100" =>
          salida <= entrada1 NAND entrada2;
        when "101" =>
          salida <= entrada1 NOR entrada2;
        when "110" =>
          salida <= entrada1 XNOR entrada2;
        when others =>
          salida <= '1';
      end case;
    end process;
end APrac01;
