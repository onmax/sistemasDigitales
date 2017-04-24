LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registro_PP IS
	GENERIC (retardo:time:= 0 ns; num_bits:natural);
	PORT(ent_datos:IN std_logic_vector (num_bits-1 DOWNTO 0);clear, clock: IN std_logic;sal_datos: OUT std_logic_vector (num_bits-1 DOWNTO 0));
END registro_PP;

ARCHITECTURE con_generate OF registro_PP IS
COMPONENT biestable_D_con_Clr IS
	GENERIC(retardo: time:= 0 ns);
	PORT(clear, clk, D: IN std_logic; Q: OUT std_logic);
END COMPONENT;

SIGNAL q_out_aux: std_logic_vector(num_bits DOWNTO 0);
BEGIN
	Q_out_aux(0) <= ent_datos(0);
	
	C: FOR I IN 0 to num_bits-1 GENERATE
		C_i:  biestable_D_con_Clr PORT MAP(clear => clear, clk=> clock, D=> Q_out_aux(I), Q=>Q_out_aux(I+1));
	END GENERATE;

	sal_datos(num_bits)<=Q_out_aux(num_bits);

END con_generate;


