library IEEE;
use IEEE.std_logic_1164.ALL;

----------------------------------------------------------

entity HALF_ADDER is
  port (
    a,b : IN std_logic;
    sum,cout : OUT std_logic
  );
end; 
  
----------------------------------------------------------
  
architecture ARCH of HALF_ADDER is
  begin
    sum <= a xor b;
    cout <= a and b;
end;
