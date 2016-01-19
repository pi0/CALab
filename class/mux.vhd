library IEEE;
use IEEE.std_logic_1164.all;

entity MUX4T1 is
	port(
		D:in std_logic_vector(3 downto 0);
		S:in std_logic_vector(1 downto 0);
		O: OUT std_logic;
	);
end;

architecture ARCH of MUX4T1 is 
begin
	with S select 
		O <= D(3) when "00",
		     D(2) when "01",
		     D(1) when "10",
		     D(0) when "11";
end;

----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity MUX4T1_TB is end;

architecture ARCH of MUX4T1_TB is 
	--- Delc
	signal D:std_logic_vector(3 downto 0);
	signal S:std_logic_vector(1 downto 0);
	signal O:std_logic;
	component MUX4T1 is
	port(
		D:in std_logic_vector(3 downto 0);
		S:in std_logic_vector(1 downto 0);
		O: OUT std_logic;
	);
	end component;
   ---
begin
	i: MUX4T1 port map(D,S,O);
	D <= "0101";
	S <= "00" after 0ns,
		 "01" after 1ns,
		 "10" after 2ns,
		 "11" after 3ns,
		 "00" after 4ns;
end;


