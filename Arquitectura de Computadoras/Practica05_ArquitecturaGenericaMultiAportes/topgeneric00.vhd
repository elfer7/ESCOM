library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packagegeneric00.all;

entity topgeneric00 is

port( 
	clk0: in std_logic ;
        --SL0: in std_logic;
        enable0: in std_logic;
        oscdis0: in std_logic;
        tmrrst0: in std_logic;
        oscout0: out std_logic;
        outdiv0: inout std_logic;
        --LED0: out std_logic;
	cdiv0: in std_logic_vector ( 3 downto 0 );
	codop0: in std_logic_vector ( 3 downto 0 );
	portA0: in std_logic_vector ( 7 downto 0 );
	portB0: in std_logic_vector ( 7 downto 0 );
	AC0: inout std_logic_vector ( 7 downto 0 );
	outFlag0: inout std_logic);

   attribute loc: string;
   -- Entradas
   attribute loc of portA0: signal is "p125, p124, p123, p122, p121, p120, p117, p110";
   attribute loc of portB0: signal is "p116, p115, p114, p113, p112, p111, p105, p104";
   attribute loc of codop0: signal is "p103, p102, p101, p100";
   attribute loc of cdiv0: signal is "p84, p83, p81, p80";

   attribute loc of enable0: signal is "p79";
   attribute loc of tmrrst0: signal is "p78";
   attribute loc of oscdis0: signal is "p77";

   attribute loc of clk0: signal is "p76";
   --attribute loc of SL0: signal is "";

   -- Salidas
   attribute loc of AC0: signal is "p4, p5, p6, p7, p8, p9, p11, p12"; --Acumulador
   attribute loc of outFlag0: signal is "p22";
   attribute loc of outdiv0: signal is "p23";
   attribute loc of oscout0: signal is "p24";
   --attribute loc of LED0: signal is "";
end;

architecture topgeneric0 of topgeneric00 is
signal sinuc0: std_logic_vector(7 downto 0);
signal senable0: std_logic;
signal sclk0: std_logic; -- Variable comentada por defecto
signal S1intFlag0, sFlagucBuf, S2intFlag0: std_logic;
signal soutFlag0: std_logic; --, sinucFlag0
--signal soutdiv0, sSL, sLED: std_logic;
signal sAC0, sucBuff, S2inuc0: std_logic_vector(7 downto 0); --sAi, sBi, sSo,
signal S1portA0, S1portB0, S2portA0, S2portB0: std_logic_vector(7 downto 0);
signal scdiv0, S1codop0, S2codop0: std_logic_vector(3 downto 0);
begin
  sclk0 <= clk0;
  S1portA0 <= portA0;
  S1portB0 <= portB0;
  S2portA0 <= portA0;
  S2portB0 <= portB0;
  --inuc0 <= sinuc0;
  S1codop0 <= codop0;
  S2codop0 <= codop0;
  --outdiv0 <= soutdiv0;
  scdiv0 <= cdiv0;
  AC0 <= sAC0;
  outFlag0 <= soutFlag0;
  senable0 <= enable0;

  G00: toposc00 port map(indivosc => scdiv0, -- Opcode para el divisor implementado en clase
                         soscdis => oscdis0, -- Enable/Disable oscilador interno
                         stmrrst => tmrrst0, -- Timer reset
                         oscout => oscout0, -- Salida del oscilador interno (su frecuencia no cambia)
                         outdivosc => outdiv0); -- Salida del timer (oscilador con divisor de frecuencia interno) + divisor implementado en clase

  -- Checar si es válido reemplazar sclk0 por outdiv0 para que todo se realice en función de la frecuencia de salida con el timer implementado en clase,
  -- de lo contrario todo parecerá estático ya que sclk solo cambia de valor mediante una entrada externa

  G01: and00 port map(clka => sclk0, --sclk0
                      codopa => S1codop0,
                      portAa => S1portA0,
                      portBa => S1portB0,
                      inFlaga => soutFlag0,
                      outa => sinuc0,
                      outFlaga => S1intFlag0);

  G02: xor00 port map(clkx => sclk0,
                      codopx => S2codop0,
                      portAx => S2portA0,
                      portBx => S2portB0,
                      inFlagx => soutFlag0,
                      outx => S2inuc0,
                      outFlagx => S2intFlag0);

  G03: uc00 port map(clkuc => sclk0,
                     inFlaguc => S1intFlag0,
                     inFlaguc2 => S2intFlag0,
                     enable => senable0,
                     inuc => sinuc0,
                     outuc => sucBuff,
                     outFlaguc => sFlagucBuf);

  G04: or00 port map(clko => sclk0,
                     codopo => S1codop0,
                     portAo => S1portA0,
                     portBo => S1portB0,
                     inFlago => soutFlag0,
                     outo => sinuc0,
                     outFlago => S1intFlag0);

  G05: not00 port map(clkn => sclk0,
                      codopn => S1codop0,
                      portAn => S1portA0,
                      inFlagn => soutFlag0,
                      outn => sinuc0,
                      outFlagn => S1intFlag0);


  G06: nand00 port map(clknd => sclk0,
                       codopnd => S1codop0,
                       portAnd => S1portA0,
                       portBnd => S1portB0,
                       inFlagnd => soutFlag0,
                       outnd => sinuc0,
                       outFlagnd => S1intFlag0);

  --G07: topadder00 port map(clkadd => sclk0,
  --                         codopadd => S2codop0,
  --                         inFlagadd => soutFlag0,
  --                         portAaddin => S2portA0,
  --                         portBaddin => S2portB0,
  --                         SLaddin => SL0,
  --                         LEDaddin => sLED,
  --                         portAaddout => sAi,
  --                         portBaddout => sBi,
  --                         SLaddout => sSL,
  --                         LEDaddout => LED0,
  --                         outFlagadd => S2intFlag0,
  --                         Soaddin => sSo,
  --                         Soaddout => S2inuc0);

  --G08: adder8bita00 port map(Ai => sAi,
  --                           Bi => sBi,
  --                           SL => sSL,
  --                           LED => sLED,
  --                           So => sSo);


  G09: buffer00 port map(clkb => sclk0,
                         enableb => senable0,
                         inFlagb => sFlagucBuf,
                         inFlagb2 => S2intFlag0,
                         inucb => sucBuff,
                         inucb2 => S2inuc0,
                         outucb =>sAC0,
                         outFlagb => soutFlag0);

  G10: nor00 port map(clknr => sclk0,
                       codopnr => S1codop0,
                       portAnr => S1portA0,
                       portBnr => S1portB0,
                       inFlagnr => soutFlag0,
                       outnr => sinuc0,
                       outFlagnr => S1intFlag0);
  G11: xnor00 port map(clkxnr => sclk0,
                       codopxnr => S1codop0,
                       portAxnr => S1portA0,
                       portBxnr => S1portB0,
                       inFlagxnr => soutFlag0,
                       outxnr => sinuc0,
                       outFlagxnr => S1intFlag0);
  G12: comp200 port map(clkcmp2 => sclk0,
                      codopcmp2 => S1codop0,
                      portAcmp2 => S1portA0,
                      inFlagcmp2 => soutFlag0,
                      outcmp2 => sinuc0,
                      outFlagcmp2 => S1intFlag0);
  G13: shiftl00 port map(clkcshl => sclk0,
                      codopcshl => S1codop0,
                      portAcshl => S1portA0,
                      inFlagcshl => soutFlag0,
                      outcshl => sinuc0,
                      outFlagcshl => S1intFlag0);
  G14: shiftr00 port map(clkcshr => sclk0,
                      codopcshr => S1codop0,
                      portAcshr => S1portA0,
                      inFlagcshr => soutFlag0,
                      outcshr => sinuc0,
                      outFlagcshr => S1intFlag0);
  G15: rotl00 port map(clkrotl => sclk0,
                      codoprotl => S1codop0,
                      portArotl => S1portA0,
                      inFlagrotl => soutFlag0,
                      outrotl => sinuc0,
                      outFlagrotl => S1intFlag0);
  G16: rotr00 port map(clkrotr => sclk0,
                      codoprotr => S1codop0,
                      portArotr => S1portA0,
                      inFlagrotr => soutFlag0,
                      outrotr => sinuc0,
                      outFlagrotr => S1intFlag0);
  G17: comp00 port map(clkcmp => sclk0,
                      codopcmp => S1codop0,
                      portAcmp => S1portA0,
                      portBcmp => S2portB0,
                      inFlagcmp => soutFlag0,
                      outcmp => sinuc0,
                      outFlagcmp => S1intFlag0);

end topgeneric0;
