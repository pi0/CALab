library IEEE;
use IEEE.std_logic_1164.all;

entity DEC2T4 is
	port(
		A:in std_logic_vector(2 downto 0);
		O: OUT std_logic_vector(3 downto 0);
	);
end;

architecture ARCH of DEC2T4 is 
begin
	with A select 
		O <= "0001" when "00",
		     "0010" when "01",
		     "0100" when "10",
		     "1000" when "11";
end;

----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity DEC2T4_TB is end;

architecture ARCH of DEC2T4_TB is 
	--- Delc
	signal A:std_logic_vector(1 downto 0);
	signal O:std_logic_vector(3 downto 0);
	component DEC2T4 is
		port(
			A:in std_logic_vector(2 downto 0);
			O: OUT std_logic_vector(3 downto 0);
		);
	end component;
   ---
begin
	i: DEC2T4 port map(A,O);
	A <= "00" after 0ns,
		 "01" after 1ns,
		 "10" after 2ns,
		 "11" after 3ns,
		 "00" after 4ns;
end;


