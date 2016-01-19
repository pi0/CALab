library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ILATCH is
PORT(
 d,c: in std_logic;
 q: out std_logic;
 );
end;


architecture BEHAVIORAL of ILATCH is 
	-- decl
begin
  
  process(d,c) 
  begin
  	if c = '1' then
  		q <= d;
  	else
  		q <= q;
  	end if;
  end process;
  
end architecture BEHAVIORAL;
 