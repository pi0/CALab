-- A Part of AUT-MIPS Project
-- Contributers: Pooya Parsa <pooya@pi0.ir>, Javad Hashemi
-- Released Under GNU General Public License GPL V3

-- PC
-- Program Counter Module

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity pc is
	port(	CLK, EN, RST : in std_logic;
			INPUT : in std_logic_vector(15 downto 0);
			OUTPUT : out std_logic_vector(15 downto 0)
			);
end;

architecture logic of pc is
begin

	process(CLK, EN, RST)
	begin
		
		-- Set PC on EN=1
		if (CLK'event and CLK = '1') and EN = '1' then
			OUTPUT <= INPUT;
		end if;
		
		-- Reset PC on RST=1
		if (CLK'event and CLK = '1') and RST = '1' then
			 OUTPUT <= "0000000000000000";	
		end if;
		
	end process;
	
end;