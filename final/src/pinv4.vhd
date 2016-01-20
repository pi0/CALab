-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- PINV4
-- 4Bit Programmable inverter

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity pinv4 is
	port(	A : in std_logic_vector(3 downto 0);
			EN : in std_logic;
			D : out std_logic_vector(3 downto 0)
			);
end pinv4;

architecture logic of pinv4 is
	begin
		process(EN)
		begin
			if EN = '1' then
				D <= NOT A;
			else
				D <= A;	
			end if;
		end process;
end;