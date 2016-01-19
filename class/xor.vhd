LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity MY_XOR is
  port (
  		I1,I2: IN std_logic; 
  		O1: OUT std_logic
  );
end entity;
  
architecture ARCH of MY_XOR is 
begin 
	O1<=I1 xor I2 after 3 NS;
end architecture;
  

