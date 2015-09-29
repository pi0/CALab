library IEEE;
use IEEE.std_logic_1164.all;

----------------------------------------------------------

entity FULL_ADDER is
  port (
    a,b,c : IN std_logic;
    sum,cout : OUT std_logic
  );
end;

----------------------------------------------------------

architecture ARCH of FULL_ADDER is
  --- Decl
  signal s1,c1,c2 : std_logic;
  component HALF_ADDER is
    port (
      a,b : IN std_logic;
      sum,cout : OUT std_logic
    );
  end component;
  --- Begin
begin
  HA1: HALF_ADDER port map(a=>a, b=>b, sum=>s1, cout=>c1);
  HA2: HALF_ADDER port map(a=>s1, b=>c, sum=>sum, cout=>c2);  
  cout <= c1 or c2;
end;

----------------------------------------------------------

library IEEE ;
use IEEE.std_logic_1164.all ;

entity FULL_ADDR_TB is end;

architecture ARCH of FULL_ADDR_TB is 
  --- Decl
  signal a,b,c,sum,cout : std_logic;
  component FULL_ADDER is
    port (
      a,b,c : IN std_logic;
      sum,cout : OUT std_logic
    );
  end component;
  --- Begin
begin
    instance: FULL_ADDER port map (a,b,c,sum,cout);
    a <= '1';
    b <= '1';
    c <= '1', '0' after 150 ns;
end;




