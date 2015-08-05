library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package packagegeneric00 is

  component toposc00
port( 
	indivosc: in std_logic_vector ( 3 downto 0 );
        oscout: out std_logic;
        soscdis: in std_logic;
        stmrrst: in std_logic;
	outdivosc: inout std_logic  );
  end component;

  component and00
  port( 
	clka: in std_logic ;
	codopa: in std_logic_vector ( 3 downto 0 );
	portAa: in std_logic_vector ( 7 downto 0 );
	portBa: in std_logic_vector ( 7 downto 0 );
	inFlaga: in std_logic ;
	outa: out std_logic_vector ( 7 downto 0 );
	outFlaga: out std_logic  );
  end component;

  component xor00
  port( 
	clkx: in std_logic ;
	codopx: in std_logic_vector ( 3 downto 0 );
	portAx: in std_logic_vector ( 7 downto 0 );
	portBx: in std_logic_vector ( 7 downto 0 );
	inFlagx: in std_logic ;
	outx: out std_logic_vector ( 7 downto 0 );
	outFlagx: out std_logic  );
  end component;

  component uc00
  port( 
	clkuc: in std_logic ;
	inFlaguc: in std_logic ;
	inFlaguc2: in std_logic ;
	enable: in std_logic ;
	inuc: in std_logic_vector ( 7 downto 0 );
	outuc: out std_logic_vector ( 7 downto 0 );
	outFlaguc: out std_logic  );
  end component;

  component or00
  port( 
	clko: in std_logic ;
	codopo: in std_logic_vector ( 3 downto 0 );
	portAo: in std_logic_vector ( 7 downto 0 );
	portBo: in std_logic_vector ( 7 downto 0 );
	inFlago: in std_logic ;
	outo: out std_logic_vector ( 7 downto 0 );
	outFlago: out std_logic  );
  end component;

  component not00
  port( 
	clkn: in std_logic ;
	codopn: in std_logic_vector ( 3 downto 0 );
	inFlagn: in std_logic;
	portAn: in std_logic_vector ( 7 downto 0 );
	outn: out std_logic_vector ( 7 downto 0 );
	outFlagn: out std_logic  );
  end component;


  component nand00
  port( 
	clknd: in std_logic ;
	codopnd: in std_logic_vector ( 3 downto 0 );
	portAnd: in std_logic_vector ( 7 downto 0 );
	portBnd: in std_logic_vector ( 7 downto 0 );
	inFlagnd: in std_logic;
	outnd: out std_logic_vector ( 7 downto 0 );
	outFlagnd: out std_logic  );
  end component;


  component topadder00

  port( 
	clkadd: in std_logic ;
	codopadd: in std_logic_vector ( 3 downto 0 );
	inFlagadd: in std_logic ;
	portAaddin: in std_logic_vector ( 7 downto 0 );
	portBaddin: in std_logic_vector ( 7 downto 0 );
	SLaddin: in std_logic ;
	LEDaddin: in std_logic ;
        portAaddout: out std_logic_vector ( 7 downto 0 );
	portBaddout: out std_logic_vector ( 7 downto 0 );
	SLaddout: out std_logic ;
	LEDaddout: out std_logic ;
        outFlagadd: out std_logic;
        Soaddin: in std_logic_vector ( 7 downto 0 );
	Soaddout: out std_logic_vector ( 7 downto 0 ) );
  end component;

  component adder8bita00
     port(
	Ai: in std_logic_vector ( 7 downto 0 );
	Bi: in std_logic_vector ( 7 downto 0 );
	SL: in std_logic ;
	LED: out std_logic ;
	So: out std_logic_vector ( 7 downto 0 ) );
     end component;

  component buffer00
     port(
        clkb: in std_logic;
        enableb: in std_logic;
	inFlagb: in std_logic ;
	inFlagb2: in std_logic ;
	inucb: in std_logic_vector ( 7 downto 0 );
	inucb2: in std_logic_vector ( 7 downto 0 );
	outucb: out std_logic_vector ( 7 downto 0 );
	outFlagb: out std_logic  );
     end component;

component nor00
  port( 
	clknr: in std_logic ;
	codopnr: in std_logic_vector ( 3 downto 0 );
	portAnr: in std_logic_vector ( 7 downto 0 );
	portBnr: in std_logic_vector ( 7 downto 0 );
	inFlagnr: in std_logic ;
	outnr: out std_logic_vector ( 7 downto 0 );
	outFlagnr: out std_logic);
  end component;

component xnor00
  port( 
	clkxnr: in std_logic ;
	codopxnr: in std_logic_vector ( 3 downto 0 );
	portAxnr: in std_logic_vector ( 7 downto 0 );
	portBxnr: in std_logic_vector ( 7 downto 0 );
	inFlagxnr: in std_logic ;
	outxnr: out std_logic_vector ( 7 downto 0 );
	outFlagxnr: out std_logic  );
  end component;

component comp200
  port( 
	clkcmp2: in std_logic ;
	codopcmp2: in std_logic_vector ( 3 downto 0 );
	portAcmp2: in std_logic_vector ( 7 downto 0 );
	inFlagcmp2: in std_logic ;
	outcmp2: out std_logic_vector ( 7 downto 0 );
	outFlagcmp2: out std_logic  );
  end component;

component shiftl00
  port( 
	clkcshl: in std_logic ;
	codopcshl: in std_logic_vector ( 3 downto 0 );
	portAcshl: in std_logic_vector ( 7 downto 0 );
	inFlagcshl: in std_logic ;
	outcshl: out std_logic_vector ( 7 downto 0 );
	outFlagcshl: out std_logic  );
  end component;

component shiftr00
  port( 
	clkcshr: in std_logic ;
	codopcshr: in std_logic_vector ( 3 downto 0 );
	portAcshr: in std_logic_vector ( 7 downto 0 );
	inFlagcshr: in std_logic ;
	outcshr: out std_logic_vector ( 7 downto 0 );
	outFlagcshr: out std_logic  );
  end component;

component rotl00
  port( 
	clkrotl: in std_logic ;
	codoprotl: in std_logic_vector ( 3 downto 0 );
	portArotl: in std_logic_vector ( 7 downto 0 );
	inFlagrotl: in std_logic ;
	outrotl: out std_logic_vector ( 7 downto 0 );
	outFlagrotl: out std_logic  );
  end component;

component rotr00
  port( 
	clkrotr: in std_logic ;
	codoprotr: in std_logic_vector ( 3 downto 0 );
	portArotr: in std_logic_vector ( 7 downto 0 );
	inFlagrotr: in std_logic ;
	outrotr: out std_logic_vector ( 7 downto 0 );
	outFlagrotr: out std_logic  );
  end component;

component comp00
  port( 
	clkcmp: in std_logic ;
	codopcmp: in std_logic_vector ( 3 downto 0 );
	portAcmp: in std_logic_vector ( 7 downto 0 );
	portBcmp: in std_logic_vector ( 7 downto 0 );
	inFlagcmp: in std_logic ;
	outcmp: out std_logic_vector ( 7 downto 0 );
	outFlagcmp: out std_logic);
  end component;

end packagegeneric00;
