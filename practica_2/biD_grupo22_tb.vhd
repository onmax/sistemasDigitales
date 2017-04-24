---------------------------------------------------------------------------
-- Este dise�o es propietario el autor y puede ser utilizado con fines de
-- estudio
---------------------------------------------------------------------------
-- Proyecto: Segunda pr�ctica de Sistemas Digitales
-- Dise�o: Biestables y Registros
-- Nombre del fichero: biD_grupo22.vhd
-- Autor: Ra�l Carbajosa Gonz�lez (y160311) y M�ximo Garc�a Mart�nez (y160242)
-- Fecha: 18/04/2017
-- Versi�n: 1
-- Resumen: Contiene una entidad y una arquitectura de un
-- biestable tipo D activado por flanco de bajada del reloj y se�al de clear
-- as�ncrona activa a nivel alto.
-- Se utilizan el tipo de datos STD_LOGIC para todas las se�ales.
-- La arquitectura se realiza en estilo de flujo de datos.
--
-- Modificaciones:
--
-- Fecha Autor Versi�n Descripci�n del cambio
-- ========================================================================
--
-- ========================================================================
--TEST--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY biestable_D_test IS
END biestable_D_test;

ARCHITECTURE test_general OF biestable_D_test IS

     COMPONENT biestable_D_con_Clr IS
          GENERIC(retardo: time:= 0 ns);
          PORT(clear, clk, d: IN std_logic; q: OUT std_logic);
     END COMPONENT;

     FOR id: biestable_D_con_Clr USE ENTITY WORK.biestable_D_con_Clr(flujo_asin);

     SIGNAL reloj: std_logic:= '1';
     SIGNAL entrada, reset: std_logic;
     SIGNAL salidaQ: std_logic;
BEGIN
    id: biestable_D_con_Clr PORT MAP(clear=>reset, clk=> reloj, d=>entrada, q=>salidaQ);

     reset<= '1',
             '0' AFTER 25 ns,
             '1' AFTER 50 ns;

     reloj<= NOT reloj AFTER 5 ns;

     entrada<= '1',
               '0' AFTER 10 ns,
               '1' AFTER 20 ns,
               '0' AFTER 30 ns,
               '1' AFTER 40 ns,
	       '0' AFTER 50 ns;

END test_general;
