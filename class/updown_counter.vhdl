library IEEE;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
-------------------------------------
 
entity counter is 
port(
  	UD,C, CLR : in  std_logic;  
    Q : out std_logic_vector(3 downto 0)
);  
end counter; 

architecture ARCH of counter is  
  signal tmp: std_logic_vector(3 downto 0):="0000"; 
  begin  
      
      process (C, CLR) 
        begin  
          if (CLR='1') then  
            tmp <= "0000";  
          elsif (C'event and C='1') then  
            if (UD='1') then
            	tmp <= tmp + 1; 
            else
            	tmp <= tmp - 1;
            end if;
          end if;  
      end process;
      
      Q <= tmp;
      
      C <= '1' after 10ns, not C after 20ns, not C after 30ns, not C after 40ns, not C after 50ns;
        
end architecture;