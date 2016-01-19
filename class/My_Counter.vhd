library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CLK_DIV is
    port (
        clk    :in  std_logic;  -- Input clock
        reset  :in  std_logic;   -- Input reset
        cout   :out std_logic;  -- Output clock
    );
end entity;

architecture rtl of CLK_DIV is
    signal clk_div :std_logic := '0';
    signal counter:std_logic_vector(3 downto 0) := "0000" ;
begin
    process (clk, reset) begin
        if (reset = '1') then
            clk_div <= '0';
            counter <= "0000" ;
        elsif (rising_edge(clk)) then
        		counter <= counter + 1;
        		if (counter = 10) then
                	clk_div <= not clk_div;
                	counter <= "0000";
                end if;
        end if;
    end process;
    
    cout <= clk_div;
    
end architecture;

-----------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter4 is 
	port(
		reset, clk : IN std_logic ;
		value : out std_logic_vector(3 downto 0)
	);
end ;

architecture COUNTER_ARCH of Counter4 is
	signal cng_reg: std_logic_vector(3 downto 0):="0000";
	signal clk:std_logic :='0';
	signal reset:std_logic :='0';
	signal cout:std_logic :='0';
	--decl
	component CLK_DIV is
    port (
        clk    :in  std_logic;
        reset  :in  std_logic;
        cout   :out std_logic;
    );
	end component;
	begin ---
	clock: CLK_DIV port map(clk,reset,cout);
	--
	 process(cout)
	 begin
	 	if (cout = '0' AND cout'EVENT) then
	 		if(reset = '1') then
	 			cng_reg <= "0000";
	 		else 
	 			cng_reg <= cng_reg + 1;
	 		end if;
 		end if;
	end process;
	value <= cng_reg;
	clk <= '0' after 40ns, not clk after 80ns;
end architecture; 
