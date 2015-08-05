library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packagetopadder4bit00.all;

entity topadder4bit00 is

port( 
	SL: in std_logic ;
	Ai: in std_logic_vector ( 3 downto 0 );
	Bi: in std_logic_vector ( 3 downto 0 );
	So: out std_logic_vector ( 3 downto 0 );
	LED: out std_logic  );
  attribute loc: string;
  attribute loc of SL: signal is "p104";
  attribute loc of Ai: signal is "p125, p124, p123, p122";
  attribute loc of Bi: signal is "p116, p115, p114, p113";
  attribute loc of So: signal is "p24, p23, p22, p21";
  attribute loc of LED: signal is "p12";
end;

architecture topadder4bit0 of topadder4bit00 is
signal SB, CS, SA: std_logic_vector(3 downto 0);
signal Sao: std_logic;
begin

   U06: xor00 port map(Ax => SL,
                       Bx => Bi(0),
                       Yx => SB(0));

   U07: xor00 port map(Ax => SL,
                       Bx => Bi(1),
                       Yx => SB(1));

   U08: xor00 port map(Ax => SL,
                       Bx => Bi(2),
                       Yx => SB(2));

   U09: xor00 port map(Ax => SL,
                       Bx => Bi(3),
                       Yx => SB(3));

   U10: topfa4bit00 port map(C00 => SL,
                             A00 => Ai(0),
                             B00 => SB(0),
                             C01 => CS(0),
                             S00 => SA(0));

   U11: topfa4bit00 port map(C00 => CS(0),
                             A00 => Ai(1),
                             B00 => SB(1),
                             C01 => CS(1),
                             S00 => SA(1));

   U12: topfa4bit00 port map(C00 => CS(1),
                             A00 => Ai(2),
                             B00 => SB(2),
                             C01 => CS(2),
                             S00 => SA(2));

   U13: topfa4bit00 port map(C00 => CS(2),
                             A00 => Ai(3),
                             B00 => SB(3),
                             C01 => CS(3),
                             S00 => SA(3));

   U14: and00 port map(Aa => Sao,
                       Ba => SA(0),
                       Ya => So(0));

   U15: and00 port map(Aa => Sao,
                       Ba => SA(1),
                       Ya => So(1));

   U16: and00 port map(Aa => Sao,
                       Ba => SA(2),
                       Ya => So(2));

   U17: and00 port map(Aa => Sao,
                       Ba => SA(3),
                       Ya => So(3));

   U18: nxor00 port map(Anx => CS(3),
                        Bnx => CS(2),
                        Ynx => Sao);

   U19: xor00 port map(Ax => CS(3),
                       Bx => CS(2),
                        Yx => LED);

end topadder4bit0;
