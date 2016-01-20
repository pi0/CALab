-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- MUX3X16
-- 2 input, 16-bit multiplexer

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity mux2x16 is
port(S : in std_logic;
	  X,Y : in std_logic_vector(15 downto 0);
	  O : out std_logic_vector(15 downto 0));
end;

architecture logic of mux2x16 is
begin
with S select O <= X when '0',
                   Y when '1',
                   "XXXXXXXXXXXXXXXX" when others;

end;