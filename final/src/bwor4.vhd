-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- BWOR4
-- 4Bit Bitwise OR

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity bwor4 is
	port(	A, B : in std_logic_vector(3 downto 0);
			D : out std_logic_vector(3 downto 0)
			);
end;

architecture logic of bwor4 is
begin
	D <= A OR B;
end;