-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- ALU16
-- 16Bit ALU Unit

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity alu16 is
	port(	A, B : in std_logic_vector(15 downto 0);
			SEL : in std_logic_vector(2 downto 0);
			F : out std_logic_vector(15 downto 0);
			COUT, OVERFLOW, ZERO : out std_logic
			);
end;

architecture logic of alu16 is

-- C: carry out
-- O: ovrrflow
-- S: set
-- Z: zero
-- L: junk!
signal C, O, S : std_logic_vector(2 downto 0);
signal Z : std_logic_vector(3 downto 0);
signal L : std_logic := '0';

begin

-- Zero indicator
zero <= (Z(0) and Z(1) and Z(2) and Z(3));

-- (0-3)
cALU1: ALU4 port map(A(3 downto 0), B(3 downto 0), L, SEL(2), SEL, F(3 downto 0), C(0), O(0), S(0), Z(0));

-- (4-7)
cALU2: ALU4 port map(A(7 downto 4), B(7 downto 4),  '0', C(0), SEL, F(7 downto 4), C(1), O(1), S(1), Z(1));

-- (8-11)
cALU3: ALU4 port map(A(11 downto 8), B(11 downto 8), '0', C(1), SEL, F(11 downto 8), C(2), O(2), S(2), Z(2));

-- (12-15)
cALU4: ALU4 port map(A(15 downto 12), B(15 downto 12), '0', C(2), SEL, F(15 downto 12), COUT, OVERFLOW, L, Z(3));


end;