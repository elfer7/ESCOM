library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use pack_sum.all;

-- IPN - ESCOM
-- Arquitectura de Computadoras
-- Ortega Ortuño Eder - 3CM9
-- multiaportes.com/arquitectura

-- Entidad
entity eTopSum is
  port(
      carry: in std_logic;
      entradas1: in std_logic_vector(3 downto 0);
      entradas2: in std_logic_vector(3 downto 0);
      salidas: out std_logic_vector(3 downto 0);
      overflow: out std_logic);
  attribute loc: string;
  attribute loc of carry: signal is "p104";
  attribute loc of entradas1: signal is "p125, p124, p123, p122";
  attribute loc of entradas2: signal is "p121, p120, p117, p110";
  attribute loc of salidas: signal is "p21, p22, p23, p24";
  attribute loc of overflow: signal is "p12";
end;

-- Arquitectura
architecture aTopSum of eTopSum is
  signal sb, cs, sa: std_logic_vector(3 downto 0);
  signal sao: std_logic;
  begin
  	U6: eXor port map(
  		entrada1_xor => carry,
  		entrada2_xor => entradas2(0),
  		salida_xor => sb(0));
  	U7: eXor port map(
  		entrada1_xor => carry,
  		entrada2_xor => entradas2(1),
  		salida_xor => sb(1));
  	U8: eXor port map(
  		entrada1_xor => carry,
  		entrada2_xor => entradas2(2),
  		salida_xor => sb(2));
  	U9: eXor port map(
  		entrada1_xor => carry,
  		entrada2_xor => entradas2(3),
  		salida_xor => sb(3));
  	U10: eTopSumCompleto port map(
  		acarreoI_tsc => carry,
  		entrada1_tsc => entradas1(0),
  		entrada2_tsc => sb(0),
  		acarreoO_tsc => cs(0),
  		resultado_tsc => sa(0));
  	U11: eTopSumCompleto port map(
  		acarreoI_tsc => cs(0),
  		entrada1_tsc => entradas1(1),
  		entrada2_tsc => sb(1),
  		acarreoO_tsc => cs(1),
  		resultado_tsc => sa(1));
  	U12: eTopSumCompleto port map(
  		acarreoI_tsc => cs(1),
  		entrada1_tsc => entradas1(2),
  		entrada2_tsc => sb(2),
  		acarreoO_tsc => cs(2),
  		resultado_tsc => sa(2));
  	U13: eTopSumCompleto port map(
  		acarreoI_tsc => cs(2),
  		entrada1_tsc => entradas1(3),
  		entrada2_tsc => sb(3),
  		acarreoO_tsc => cs(3),
  		resultado_tsc => sa(3));
  	U14: eAnd port map(
  		entrada1_and => sao,
  		entrada2_and => sa(0),
  		salida_and => salidas(0));
  	U15: eAnd port map(
  		entrada1_and => sao,
  		entrada2_and => sa(1),
  		salida_and => salidas(1));
  	U16: eAnd port map(
  		entrada1_and => sao,
  		entrada2_and => sa(2),
  		salida_and => salidas(2));
  	U17: eAnd port map(
  		entrada1_and => sao,
  		entrada2_and => sa(3),
  		salida_and => salidas(3));
  	U18: eXnor port map(
  		entrada1_xnor => cs(3),
  		entrada2_xnor => cs(2),
  		salida_xnor => sao);
  	U19: eXor port map(
  		entrada1_xor => cs(3),
  		entrada2_xor => cs(2),
  		salida_xor => overflow);
end aTopSum;
