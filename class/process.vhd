entity AND_OR_XOR is
port(
	A,B: in bit;
	Z_OR,Z_AND,Z_XOR: out bit;
);
end;


architecture RTL of AND_OR_XOR is 
--Decl

begin

A_O_X: process (A,B) -- Cuncurrent
begin
  Z_OR <= A or B;
  Z_AND <= A and B;
  Z_XOR <= A xor B;
end process;
  
end;

-----------------------------------------------------