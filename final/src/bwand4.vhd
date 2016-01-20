-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- BWAND4
-- 4Bit Bitwise AND

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity bwand4 is
	port(	X, Y : in std_logic_vector(3 downto 0);
			D : out std_logic_vector(3 downto 0)
			);
end;

architecture logic of bwand4 is
begin
	D <= X AND Y;
end;