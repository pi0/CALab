LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

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
  

