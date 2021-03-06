LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY combinationalMultiplier IS
  PORT( A_IN  : IN  STD_LOGIC_VECTOR( 3 downto 0 );
        B_IN  : IN  STD_LOGIC_VECTOR( 3 downto 0 );
        R_OUT : OUT STD_LOGIC_VECTOR( 7 downto 0) );
END ENTITY combinationalMultiplier;

ARCHITECTURE structure OF combinationalMultiplier IS

COMPONENT halfAdder
  PORT(A    : IN  STD_LOGIC;
       B    : IN  STD_LOGIC;
       Sum  : OUT STD_LOGIC;
       Cout : OUT STD_LOGIC);
END COMPONENT;

COMPONENT fullAdder
  PORT(A    : IN  STD_LOGIC;
       B    : IN  STD_LOGIC;
       Cin  : IN  STD_LOGIC;
       Sum  : OUT STD_LOGIC;
       Cout : OUT STD_LOGIC);
END COMPONENT;

SIGNAL HA_1_Cout   : STD_LOGIC;
SIGNAL HA_2_Sum    : STD_LOGIC;
SIGNAL HA_2_Cout   : STD_LOGIC;
SIGNAL FA_2_Cout   : STD_LOGIC;
SIGNAL HA_3_Sum    : STD_LOGIC;
SIGNAL HA_3_Cout   : STD_LOGIC;
SIGNAL FA_3_0_Sum  : STD_LOGIC;
SIGNAL FA_3_0_Cout : STD_LOGIC;
SIGNAL FA_3_1_Cout : STD_LOGIC;
SIGNAL FA_4_0_Sum  : STD_LOGIC;
SIGNAL FA_4_0_Cout : STD_LOGIC;
SIGNAL FA_4_1_Sum  : STD_LOGIC;
SIGNAL FA_4_1_Cout : STD_LOGIC;
SIGNAL HA_4_Cout   : STD_LOGIC;
SIGNAL FA_5_0_Sum  : STD_LOGIC;
SIGNAL FA_5_0_Cout : STD_LOGIC;
SIGNAL FA_5_1_Cout : STD_LOGIC;


BEGIN
	R_OUT(0) <= A_IN(0) AND B_IN(0);
	HA_1   : halfAdder
		PORT MAP ( A_IN(1) AND B_IN(0), A_IN(0) AND B_IN(1), R_OUT(1), HA_1_Cout );
	HA_2   : halfAdder
		PORT MAP ( A_IN(0) AND B_IN(2), A_IN(1) AND B_IN(1), HA_2_Sum, HA_2_Cout );
	FA_2   : fullAdder
		PORT MAP ( HA_2_Sum, A_IN(2) AND B_IN(0), HA_1_Cout, R_OUT(2), FA_2_Cout );
	HA_3   : halfAdder
		PORT MAP ( A_IN(0) AND B_IN(3), A_IN(1) AND B_IN(2), HA_3_Sum, HA_3_Cout );
	FA_3_0 : fullAdder
		PORT MAP ( HA_3_Sum, A_IN(2) AND B_IN(1), HA_2_Cout, FA_3_0_Sum, FA_3_0_Cout );
	FA_3_1 : fullAdder
		PORT MAP ( FA_3_0_Sum, A_IN(3) AND B_IN(0), FA_2_Cout, R_OUT(3), FA_3_1_Cout );
	FA_4_0 : fullAdder
		PORT MAP ( A_IN(1) AND B_IN(3), A_IN(2) AND B_IN(2), HA_3_Cout, FA_4_0_Sum, FA_4_0_Cout );
	FA_4_1 : fullAdder
		PORT MAP ( FA_4_0_Sum, A_IN(3) AND B_IN(1), FA_3_0_Cout, FA_4_1_Sum, FA_4_1_Cout );
	HA_4   : halfAdder
		PORT MAP ( FA_3_1_Cout, FA_4_1_Sum, R_OUT(4), HA_4_Cout );
	FA_5_0 : fullAdder
		PORT MAP ( A_IN(2) AND B_IN(3), A_IN(3) AND B_IN(2), FA_4_0_Cout, FA_5_0_Sum, FA_5_0_Cout );
	FA_5_1 : fullAdder
		PORT MAP ( FA_4_1_Cout, FA_5_0_Sum, HA_4_Cout, R_OUT(5), FA_5_1_Cout );
	FA_6   : fullAdder
		PORT MAP ( FA_5_0_Cout, A_IN(3) AND B_IN(3), FA_5_1_Cout, R_OUT(6), R_OUT(7) );
END ARCHITECTURE structure;
