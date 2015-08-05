library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use package8bita00.all;

entity adder8bita00 is

port(
	Ai: in std_logic_vector ( 7 downto 0 );
	Bi: in std_logic_vector ( 7 downto 0 );
	SL: in std_logic ;
	LED: out std_logic ;
	So: out std_logic_vector ( 7 downto 0 ) );

end;

architecture adder8bita0 of adder8bita00 is
signal SB0, SB1, SB2, SB3, SB4, SB5, SB6, SB7: std_logic;
signal CS1, CS2, CS3, CS4, CS5, CS6, CS7, CS8: std_logic;
signal SA0, SA1, SA2, SA3, SA4, SA5, SA6, SA7: std_logic;
signal Bx0, Bx1, Bx2, Bx3, Bx4, Bx5, Bx6, Bx7: std_logic;
signal enablea: std_logic;
begin

             A00: xora00 port map(Ax => SL, Bx => Bi(0), Yx => SB0);
             A01: xora00 port map(Ax => SL, Bx => Bi(1), Yx => SB1);
             A02: xora00 port map(Ax => SL, Bx => Bi(2), Yx => SB2);
             A03: xora00 port map(Ax => SL, Bx => Bi(3), Yx => SB3);
             A04: xora00 port map(Ax => SL, Bx => Bi(4), Yx => SB4);
             A05: xora00 port map(Ax => SL, Bx => Bi(5), Yx => SB5);
             A06: xora00 port map(Ax => SL, Bx => Bi(6), Yx => SB6);
             A07: xora00 port map(Ax => SL, Bx => Bi(7), Yx => SB7);

             A08: topfaa00 port map(A00 => Ai(0), B00 => SB0, C00 => SL, C01 => CS1, S00 => SA0);
             A09: topfaa00 port map(A00 => Ai(1), B00 => SB1, C00 => CS1, C01 => CS2, S00 => SA1);
             A10: topfaa00 port map(A00 => Ai(2), B00 => SB2, C00 => CS2, C01 => CS3, S00 => SA2);
             A11: topfaa00 port map(A00 => Ai(3), B00 => SB3, C00 => CS3, C01 => CS4, S00 => SA3);
             A12: topfaa00 port map(A00 => Ai(4), B00 => SB4, C00 => CS4, C01 => CS5, S00 => SA4);
             A13: topfaa00 port map(A00 => Ai(5), B00 => SB5, C00 => CS5, C01 => CS6, S00 => SA5);
             A14: topfaa00 port map(A00 => Ai(6), B00 => SB6, C00 => CS6, C01 => CS7, S00 => SA6);
             A15: topfaa00 port map(A00 => Ai(7), B00 => SB7, C00 => CS7, C01 => CS8, S00 => SA7);
             A16: xora00 port map(Bx => CS8, AX => CS7, Yx => LED);
             A17: xnora00 port map(Bnx => CS8, Anx => CS7, Ynx => enablea);
             A18: anda00 port map(Ba => SA0, Aa => enablea, Ya => So(0));
             A19: anda00 port map(Ba => SA1, Aa => enablea, Ya => So(1));
             A20: anda00 port map(Ba => SA2, Aa => enablea, Ya => So(2));
             A21: anda00 port map(Ba => SA3, Aa => enablea, Ya => So(3));
             A22: anda00 port map(Ba => SA4, Aa => enablea, Ya => So(4));
             A23: anda00 port map(Ba => SA5, Aa => enablea, Ya => So(5));
             A24: anda00 port map(Ba => SA6, Aa => enablea, Ya => So(6));
             A25: anda00 port map(Ba => SA7, Aa => enablea, Ya => So(7));

end adder8bita0;

