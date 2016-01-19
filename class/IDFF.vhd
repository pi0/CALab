library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IDFF is
PORT(
 d,clk: in std_logic;
 q: out std_logic;
 );
end;


architecture BEHAVIORAL of IDFF is 
	-- decl
begin
  
  process(clk) 
  begin
  	if clk = '1' AND clk'EVENT then
  		q <= d;
  	else
  		q <= q;
  	end if;
  end process;
  
end architecture BEHAVIORAL;



-----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IDFF_TB is end;

architecture ARCH of IDFF_TB is 
	-- decl
	component IDFF is
		PORT(
		 d,clk: in std_logic;
		 q: out std_logic;
		 );
		end component;
	
	signal clk: std_logic:='0';
	signal d : std_logic := '1' ;
	signal q : std_logic := '0';
begin
  instance: IDFF port map (d,clk,q);
  
  clk <= not clk after 50 ns , not clk after 100 ns;
  
end architecture ARCH;


-- entity tb is 
--	 generic (
--	 	Ton : time := 30 ns;
--	 	Toff : time := 50 ns;
--	 );
-- 	port (clk : out std_logic);	
-- end;
-- 
-- architecture behave of tb is
-- begin
-- 	process 
-- 	begin 
-- 		clk <= '1';
-- 		wait for Ton;
-- 		clk <= '0';
-- 		wait for Toff;
-- 	end process;
-- end;