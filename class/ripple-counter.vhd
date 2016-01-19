library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; -- for t_ff4

entity T_FF4 is
	Port (
		t : in  STD_LOGIC;
		clk : in  STD_LOGIC;
		pr: in STD_LOGIC;
		cr: in STD_LOGIC;
		q : inout  STD_LOGIC;
		qbar : inout  STD_LOGIC
	);
end entity;

---------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; -- for t_ff4

entity RIPPLE is
    Port ( 
		t1 : in  STD_LOGIC; 
		clk1 : in  STD_LOGIC;
		pr1: in STD_LOGIC;
		cr1: in STD_LOGIC;
		a : inout  STD_LOGIC;
		b : inout  STD_LOGIC;
		c : inout STD_LOGIC ;
		q1 : inout  STD_LOGIC;
		qbar1 : inout  STD_LOGIC
		);
end entity;

architecture ARCH of RIPPLE is
-- Decl
signal abar,bbar,cbar:STD_LOGIC;
-- decl of t_ff4 component
component t_ff4 is
    Port (
    		t : in  STD_LOGIC;
    		clk : in  STD_LOGIC;
			pr: in STD_LOGIC;
			cr: in STD_LOGIC;
            q : inout  STD_LOGIC;
    		qbar : inout  STD_LOGIC
    	);
end component;
 
begin

tff1: t_ff4 port map (t1,clk1,pr1,cr1,a,abar);
tff2: t_ff4 port map (t1,a,pr1,cr1,b,bbar);
tff3: t_ff4 port map (t1,b,pr1,cr1,c,cbar);
tff4: t_ff4 port map (t1,c,pr1,cr1,q1,qbar1);

end Arch;


-----------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RIPPLE_TEST is end;

architecture ARCH of RIPPLE_TEST is 
	-- decl
	signal t,clk,pr,cr,a,b,c,q,qbar : STD_LOGIC;
	component RIPPLE is
	    Port ( 
			t1 : in  STD_LOGIC; 
			clk1 : in  STD_LOGIC;
			pr1: in STD_LOGIC;
			cr1: in STD_LOGIC;
			a : inout  STD_LOGIC;
			b : inout  STD_LOGIC;
			c : inout STD_LOGIC ;
			q1 : inout  STD_LOGIC;
			qbar1 : inout  STD_LOGIC
			);
	end component;
begin

	counter:  RIPPLE port map(t,clk,pr,cr,a,b,c,q1,qbar1);
	clk <= '0' after 10ns, not clk after 20ns,not clk after 30ns,not clk after 40ns;
	
end architecture ARCH;
