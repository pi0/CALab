-- ADD16
-- 16Bit adder

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity add16 is
	port (  X,Y : in std_logic_vector(15 downto 0);
			Z : out std_logic_vector(15 downto 0));
end;

architecture logic of add16 is

signal C : std_logic_vector(4 downto 0);

begin

C(0)<='0';

ADD_COMP1 : add4 port map(X(3 downto 0),Y(3 downto 0),C(0),Z(3 downto 0),C(1));
ADD_COMP2 : add4 port map(X(7 downto 4),Y(7 downto 4),C(1),Z(7 downto 8),C(2));
ADD_COMP3 : add4 port map(X(11 downto 8),Y(11 downto 8),C(2),Z(11 downto 8),C(3));
ADD_COMP4 : add4 port map(X(15 downto 12),Y(15 downto 12),C(3),Z(15 downto 12),C(4));

end;