LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY RippleCarry4bits IS

PORT (
		ci: IN STD_LOGIC;
		a, b : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		s : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		cout: OUT STD_LOGIC
		);
		
END RippleCarry4bits;

ARCHITECTURE Struct OF RippleCarry4bits IS
SIGNAL c: STD_LOGIC_VECTOR (3 downto 0);

COMPONENT FullAdder
PORT (
		cin, a, b : IN  STD_LOGIC;
		s, cout : OUT  STD_LOGIC);

END COMPONENT;

BEGIN 
	PET0: FullAdder
		PORT MAP (ci, a(0), b(0), s(0), c(0));
		
	FIRST: FOR I IN 1 TO 3 GENERATE
			PET1: FullAdder
				PORT MAP (c(I-1), a(I), b(I), s(I), c(I));
		END GENERATE;
			cout <= c(3);
END Struct;