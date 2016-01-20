-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- SHLONE
-- Shift 16bit input left by one

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity shlone is
	port (DIN : in std_logic_vector(15 downto 0);
			DOUT : out std_logic_vector(15 downto 0));
end;

architecture logic of shlone is
begin

DOUT<=DIN(14 downto 0)&'0'; -- Shift Left

end;