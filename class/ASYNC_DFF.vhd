library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFF_ASYNC is 
	port 
	( d, clk, r, s : IN std_logic ,
	 q : out std_logic);
end ;


architecture BEHAVIORAL of DFF_ASYNC is  
	begin
		process(clk, r)
		begin
			if s  = '1' then 
				q <= '1';
			elsif r = '1' then 
				q <= '0';
			elsif clk = '1' AND clk'EVENT then
				q <= d ;
			elsif clk = '0' AND clk'EVENT then 
				q <= q;
			end if;		
	end process;	
end architecture;

--------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IDFF_ASYNC_TB is end;

architecture ARCH_ASYNC of IDFF_ASYNC_TB is 
	-- decl
	component DFF_SYNC is 
	port 
		( d, clk, r, s : IN std_logic ,
	 	q : out std_logic);
	end component;

	
	signal clk: std_logic:= '0';
	signal d : std_logic := '1';
	signal r : std_logic := '0';
	signal s : std_logic := '0';
	signal q : std_logic := '0';
begin
  instance: DFF_ASYNC port map (d,clk,r,s,q);
  
  clk <= not clk after 60 ns , not clk after 120 ns;
  r  <= not r after 130 ns , not r after 160 ns;
  s  <= not s after 170 ns , not s after 200 ns;
  
end architecture ARCH_ASYNC;
