LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all;

entity ALU8 is
  port (
  		a,b: IN std_logic_vector(7 downto 0);
  		addsub: IN std_logic;
  		gt,zr,co: OUT std_logic;
  		r: OUT std_logic_vector(7 downto 0);
  );
end;
  
architecture ARCH of ALU8 is
	--- Decl
	signal mid: std_logic_vector(8 downto 0);
begin 
	mid <=  ('0'&a)+('0'&b) when addsub='1' else ('0'&a)-('0'&b);
	co 	<= 	mid(8);
	r 	<= 	mid(7 downto 0);
	gt 	<= 	'1' when a>b else '0';
	zr	<=	'1' when mid(7 downto 0)="00000000" else '0';
end architecture;

----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity ALU8_TB is end;

architecture ARCH of ALU8_TB is 
	--- Delc
	signal a,b: std_logic_vector(7 downto 0);
  	signal addsub: std_logic;
  	signal gt,zr,co: std_logic;
  	signal r: std_logic_vector(7 downto 0);
  		
	component ALU8 is
  	port (
  		a,b: IN std_logic_vector(7 downto 0);
  		addsub: IN std_logic;
  		gt,zr,co: OUT std_logic;
  		r: OUT std_logic_vector(7 downto 0);
  	);
	end component;
   ---
begin
	i: ALU8 port map(a,b,addsub,gt,zr,co,r);
	a <= "00001011"; -- a=11
	b <= "00000011"; -- b=3
	addsub <= '0','1' after 20ns,'0' after 30ns;
end;


  

