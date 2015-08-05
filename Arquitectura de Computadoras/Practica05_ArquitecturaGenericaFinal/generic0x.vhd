library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity generic0x is
port( 
	clka:in std_logic;
	codop0x: in std_logic_vector ( 3 downto 0 );
	PortA0x: in std_logic_vector ( 7 downto 0 );
	PortB0x: in std_logic_vector ( 7 downto 0 );
	out0x: out std_logic_vector ( 7 downto 0 );
	sinFlag0x: in std_logic ;
	enable: in std_logic ; 
	en2: in std_logic ;
	outFlag0x: out std_logic );
  
end;

architecture generic0 of generic0x is
signal sPortA0x , sPortB0x: std_logic_vector(7 downto 0);
begin

   pgen0x : process (clka, enable, sinFlag0x)
   variable aux: bit:='0';
	begin 
		if (clka'event and clka = '1') then 
	    	if (sinFlag0x = '1' or enable ='0') then
			sPortA0x <= PortA0x;
                        sPortB0x <= PortB0x; 
			outFlag0x <= '0';
		elsif (enable = '1') then 
		
		case codop0x is 
			
			
			--xor
			when "0000" => 
			out0x <= sPortA0x xor sPortB0x;
			outFlag0x <= '1'; 
			
			--AND
			when "0001" =>
			out0x <= sPortA0x and sPortB0x;
			outFlag0x <= '1';
 
			--NAND
			when "0010" =>
			out0x <= not (sPortA0x and sPortB0x);
			outFlag0x <= '1'; 
 
			--NOR
			when "0011" =>
			out0x <= sPortA0x nor sPortB0x;
			outFlag0x <= '1';  

			--or
			when "0100" =>
			out0x<= sPortA0x or sPortB0x;
			outFlag0x <= '1';
			  
			--xnor
			when "0101" =>  

			out0x <= sPortA0x xnor sPortB0x;
			outFlag0x <= '1';
	
			--not
			when "0110" =>  

			out0x <= not(sPortA0x);
			outFlag0x <= '1';

			--com2
			when "0111" => 
			out0x <= not(sPortA0x) + 1;
			outFlag0x <= '1';

			--suma
			when "1000" => 
			out0x <= sPortA0x + sPortB0x;
			outFlag0x <= '1';

			--resta
			when "1001" => 
			out0x <= sPortA0x - sPortB0x;
			outFlag0x <= '1';

			--shiftr
			when "1010" =>
                        if (aux = '0' and en2 = '0') then
                           aux:='1';
                           sPortA0x(7) <= '0';
                           sPortA0x(6 downto 0) <= sPortA0x(7 downto 1);
		           out0x <= sPortA0x;
			   outFlag0x <= '1';
                        elsif (en2 = '1') then
                           aux:='0';
                        end if;

			--shiftl
			when "1011" =>
			sPortA0x(0) <= '0';
                        sPortA0x(7 downto 1) <= sPortA0x(6 downto 0);
			out0x <= sPortA0x;
			outFlag0x <= '1';
			
			--rotr
			when "1100" =>
                          sPortA0x(7) <= sPortA0x(0);
                          sPortA0x(6 downto 0) <= sPortA0x(7 downto 1);
                          out0x <= sPortA0x;
                          outFlag0x <= '1';
                        
			--rotl
			when "1101" =>
                          sPortA0x(0) <= sPortA0x(7);
                          sPortA0x(7 downto 1) <= sPortA0x(6 downto 0);
                          out0x <= sPortA0x;
                          outFlag0x <= '1';

			when "1110" =>
	                    if (sPortA0x < sPortB0x) then
        	                out0x <= "00000001";
                	    elsif(sPortA0x = sPortB0x) then
                        	out0x <= "00000010";
	                    elsif(sPortA0x > sPortB0x) then
        	                out0x <= "00000100";
                	    end if;
	                    outFlag0x <= '1';  
                                   
      		         when others => NULL; 
		end case;
	 	else
	             out0x <= (others => 'Z');
	             outFlag0x <= 'Z';
	         end if;
	end if;
			
end  process pgen0x;
end generic0;

