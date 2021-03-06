library IEEE;
use IEEE.std_logic_1164.all;
-------------------------------------

ENTITY SEQ_DETECTOR2_1001 IS
	PORT (
		a, clk, reset  : IN std_logic;
		w: OUT std_logic
	);
END ENTITY;

ARCHITECTURE ARCH OF SEQ_DETECTOR2_1001 IS 
	
	TYPE state IS (S0, S1, S2, S3, S4);
	SIGNAL current : state := S0;
	
	BEGIN PROCESS (clk) BEGIN
		IF (clk = '0' AND clk'EVENT) THEN	
			IF reset = '1' THEN current <= S0;
			ELSE CASE current IS
				WHEN S0 => 
					IF a = '1' THEN
						current <= S1;
						w <= '0';
					ELSE
						current <= S0;
						w <= '0';
					END IF;
				WHEN S1 =>
					IF a = '0' THEN
						current <= S2;
						w <= '0';
					ELSE
						current <= S1;
						w <= '0';
					END IF;
				WHEN S2 =>
					IF a = '0' THEN
						current <= S3;
						w <= '0';
					ELSE
						current <= S1;
						w <= '0';
					END IF;
				WHEN S3 =>
					IF a = '1' THEN
						current <= S4;
						w <= '1';
					ELSE
						current <= S0;
						w <= '0';
					END IF;
				WHEN S4 =>
					IF a = '1' THEN
						current <= S1;
						w <= '0';
					ELSE
						current <= S0;
						w <= '0';
					END IF;
				END CASE;
			END IF; -- reset = '1' THEN current <= S0
		END IF; -- clk = '0' AND clk'EVENT
	END PROCESS;

	clk <= '1' after 10ns, not clk after 20ns, not clk after 30ns, not clk after 40ns, not clk after 50ns; 

END ARCHITECTURE;
