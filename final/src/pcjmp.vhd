-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- PCJMP
-- Combines the 3 most significant bits from the PC counter with the 12 bits of the jump address and a 0

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity pcjmp is
port(	PC_ADD	: in std_logic_vector(15 downto 0);
		JMP_ADD  : in std_logic_vector(11 downto 0);
		OUT_ADD 	: out std_logic_vector(15 downto 0));
end;

architecture logic of pcjmp is
begin

	OUT_ADD <= PC_ADD(15 downto 13) & JMP_ADD & '0';
	
end ;

