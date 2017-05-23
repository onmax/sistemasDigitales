---------------------------------------------------------------------------
-- Este diseño es propietario el autor y puede ser utilizado con fines de
-- estudio
---------------------------------------------------------------------------
-- Proyecto: Tercera práctica de Sistemas Digitales
-- Diseño: Máquina de Estados Finitos
-- Nombre del fichero: NOMBRE DEL FICHERO.vhd
-- Autor: Raúl Carbajosa González (y160311) y Máximo García Martínez (y160242)
-- Fecha: 23/05/2017
-- Versión: 1.0
-- Resumen: Contiene una entidad y una arquitectura de una
-- máquina de estados finitos que controla el funcionamiento de un ascensor
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales.
-- La arquitectura se realiza en estilo ESTRUCTURAL.
-- Modificaciones:
--
-- Fecha Autor Versión Descripción del cambio
-- ========================================================================
--
-- ========================================================================

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY FSM_ascensor_test IS
END FSM_ascensor_test;

ARCHITECTURE FSM_arquitectura_test OF FSM_ascensor_test IS

-- Declaraci?n del componente

COMPONENT FSM_ascensor IS
	PORT
	(
		clk   : IN STD_LOGIC;
                reset : IN STD_LOGIC;
		codigo_piso : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		sube, baja : OUT STD_LOGIC;
		piso_donde_esta	: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

     	CONSTANT periodo : TIME := 20 ns;
	SIGNAL reloj     : STD_LOGIC := '0'; -- Arranque de secuencia del reloj
        SIGNAL reset     : STD_LOGIC := '0'; 
     	SIGNAL boton	 : STD_LOGIC_VECTOR (1 DOWNTO 0);  -- boton que se activa
     	SIGNAL sube      :  STD_LOGIC; 
     	SIGNAL baja      :  STD_LOGIC;  
	SIGNAL piso_donde_esta  :  STD_LOGIC_VECTOR(1 DOWNTO 0); 

BEGIN
ascen: FSM_ascensor 
	PORT MAP (clk => reloj,  
      		  reset => reset,
       		  codigo_piso => boton,  -- boton que se activa
       		  sube  => sube, 
       		  baja => baja,
		  piso_donde_esta   => piso_donde_esta
       );     

reloj <= NOT reloj AFTER periodo/2;
reset <= '0', '1' after 1 ns;

boton <= "10",                          -- piso 2
         "00" AFTER periodo,       	-- piso 0
         "01" AFTER 2 * periodo,  	-- piso 1
         "10" AFTER 3 * periodo,   	-- piso 2
         "11" AFTER 4 * periodo,    	-- sin marcar piso
         "11" AFTER 5 * periodo,    	-- se aprietan dos botones a la vez
         "01" AFTER 6 * periodo,    	-- piso 0
	 "10" AFTER 7 * periodo,    	-- piso 2
	 "01" AFTER 8 * periodo,    	-- piso 1
	 "10" AFTER 9 * periodo,    	-- piso 2
         "01" AFTER 10 * periodo;    	-- piso 0


END FSM_arquitectura_test;
