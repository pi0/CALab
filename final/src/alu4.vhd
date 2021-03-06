-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- ALU4
-- 4Bit ALU Unit 



library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity alu4 is
	port(	A, B : in std_logic_vector(3 downto 0);
			LESS, CIN : in std_logic;
			SEL : in std_logic_vector(2 downto 0);
			F : out std_logic_vector(3 downto 0);
			COUT, OVERFLOW, SET, ZERO : out std_logic
			);
end;

architecture logic of alu4 is

signal s0, s1, s2, s3, s4, s5, s6, s7 : std_logic_vector(3 downto 0);
signal c0, c1 : std_logic;

begin

-- ADD 010   s0
-- OR  001   s1
-- AND 000   s2
-- SUB 110   s3
-- INV       s4



-- Basic Components

cADD: ADD4 port map(A, B, CIN, s0, c0);
cOR: BWOR4 port map(A, B, s1);
cAND: BWAND4 port map(A, B, s2);

cINV1: PINV4 port map(B, SEL(2), s4);
cSUB: ADD4 port map(A, s4, CIN, s3, c1);

-- 

process(LESS, s3, s6)
begin
	if LESS = '1' then 
		s6 <= "0001";
		SET <= s3(3);
	else
		s6 <= "0000";
		SET <= s3(3);
	end if;
end process;

-- Select Operation using MUX4
-- SEL: ABC
MUX0: MUX4X4 port map(SEL(1) & (SEL(2) or SEL(0)), s2, s1, s0, s3, s5); --A(B|C)
MUX1: MUX4X4 port map('0' & (SEL(2) and SEL(0)), s5, s6, "0000", "0000", s7); 

-- Carry Out

process(SEL, c0, c1)
begin
	if SEL = "010" then
		COUT <= c0;
	elsif SEL = "110" then
		COUT <= c1;
	end if;
end process;

-- Flags

process(s7, A, B)
begin
	-- Zero Flag
	if s7 = "0000" then
		ZERO <= '1';
	else
		ZERO <= '0';
	end if;
	-- OverFlow Flag
	if ((A(3) = B(3)) and (s7(3) /= B(3))) then
		OVERFLOW <= '1';
	else
		OVERFLOW <= '0';
	end if;
end process;

F <= s7;

end;