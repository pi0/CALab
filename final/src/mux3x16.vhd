-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- MUX3X16
-- 3 input, 16-bit multiplexer

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity mux3x16 is
port( S : in std_logic_vector(1 downto 0);
	  X,Y,Z : in std_logic_vector(15 downto 0);
	  O : out std_logic_vector(15 downto 0));
end;

architecture logic of mux3x16 is
begin
with S select O <= X 					when "00",
                   Y 					when "01",
                   Z	 				when "10",
                   "XXXXXXXXXXXXXXXX"	when "11",
                   "XXXXXXXXXXXXXXXX"   when others;
end;