-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- MUX2X3
-- 2 input, 3-bit multiplexer

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity mux2x3 is
port(S : in std_logic;
	  X,Y : in std_logic_vector(2 downto 0);
	  O : out std_logic_vector(2 downto 0));
end;

architecture logic of mux2x3 is
begin
with S select O <= X when '0',
                   Y when '1',
                   "XXX" when others;

end;