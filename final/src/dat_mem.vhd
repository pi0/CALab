-- DAT_MEM
-- Data Memory (RAM)
-- Contains 512 Lines of 16bit data

library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.lib.all;

entity dat_mem is
	port (  DIN, ADD : in std_logic_vector(15 downto 0); -- Data In / Address
			WE, RE, CLK : in std_logic;					 -- Write Enabled / Read Enabled / Clock
			DOUT : out std_logic_vector(15 downto 0)	 -- Data Out
			);
end;

architecture Logic of dat_mem is

	type memT is array (512 downto 0) of std_logic_vector(15 downto 0); -- 2D Array
	signal mem : memT := (256 => x"0100", 258 => x"0102", others => x"0000"); -- Fill with sample data
	signal read_address : std_logic_vector(15 downto 0); -- Read Address is set only on clock edges to ADD

begin	

	-- Do Write and Update address on Clock Edges
	process(CLK)
	begin
		if rising_edge(CLK) then 
			if WE = '1' then -- Write
				mem(to_integer(unsigned(ADD))) <= DIN;
			end if;
			read_address <= ADD; -- Update read_address
		end if;
	end process;
	
	-- Read Operation
	process(RE)
	begin
		if RE = '1' then
			DOUT <= mem(to_integer(unsigned(read_address))); -- Read
		else
			DOUT <= "ZZZZZZZZZZZZZZZZ"; -- Invalidate output
		end if;
	end process;
	
end;