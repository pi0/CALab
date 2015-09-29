library IEEE;
use IEEE.std_logic_1164.all;

----------------------------------------------------------

entity FULL_ADDER_4 is
  port (
    A : IN std_logic_vector(3 downto 0);
    B : IN std_logic_vector(3 downto 0);
    CI : IN std_logic;
    O : OUT std_logic_vector(3 downto 0);
    CO : out std_logic;
  );
end;

----------------------------------------------------------

architecture ARCH of FULL_ADDER_4 is
  --- Decl
  signal C: std_logic_vector(4 downto 0);
  component fulladder is
    port (
      A:  in  std_logic;
      B:  in  std_logic;
      CI: in  std_logic;
      O:  out std_logic;
      CO: out std_logic
    );
  end component;
  --- Begin
begin
  adders: for i in 0 to 3 generate
 	fa: fulladder port map (A(i),B(i),C(i),C(i+1)); 	
  end generate;
end;
