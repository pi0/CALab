-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- SGNEXT6X16
-- Sign Extend 6bit to 16bit

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity sgnext6x16 is
	port (  DIN : in std_logic_vector(5 downto 0);
			DOUT : out std_logic_vector(15 downto 0));
end;

architecture logic of sgnext6x16 is
begin

-- use this trick to extend DIN(5) bit to DOUT(6-15)
DOUT <= DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN;

end;