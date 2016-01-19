library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFF_SYNC is 
	port 
	( d, clk, r : IN std_logic ,
	 q : out std_logic);
end ;


architecture BEHAVIORAL of DFF_SYNC is  
	begin
		process(clk)
		begin
			if clk = '1' AND clk'EVENT then
				q <= d ;
			elsif r = '1' then 
				q <= '0';
			else 
				q <= q;
			end if;		
	end process;	
end architecture;

--------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IDFF_SYNC_TB is end;

architecture ARCH_SYNC of IDFF_SYNC_TB is 
	-- decl
	component DFF_SYNC is 
	port 
		( d, clk, r : IN std_logic ,
	 	q : out std_logic);
	end component;

	
	signal clk: std_logic:= '0';
	signal d : std_logic := '1';
	signal r : std_logic := '0';
	signal q : std_logic := '0';
begin
  instance: DFF_SYNC port map (d,clk,r,q);
  
  clk <= not clk after 50 ns , not clk after 100 ns , not clk after 150 ns , not clk after 200 ns;
  r  <= not r after 80 ns , not r after 160 ns;
  
end architecture ARCH_SYNC;
