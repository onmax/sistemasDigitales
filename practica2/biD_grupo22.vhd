---------------------------------------------------------------------------
<<<<<<< HEAD
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
=======
-- Este diseño es propietario el autor y puede ser utilizado con fines de
-- estudio
---------------------------------------------------------------------------
-- Proyecto: Segunda práctica de Sistemas Digitales
-- Diseño: Biestables y Registros
-- Nombre del fichero: biD_grupo22.vhd
-- Autor: Raúl Carbajosa González (y160311) y Máximo García Martínez (y160242)
-- Fecha: 18/04/2017
-- Versión: 1
-- Resumen: Contiene una entidad y una arquitectura de un
-- biestable tipo D activado por flanco de bajada del reloj y señal de clear
-- asíncrona activa a nivel alto.
-- Se utilizan el tipo de datos STD_LOGIC para todas las señales.
>>>>>>> origin/master
-- La arquitectura se realiza en estilo de flujo de datos.
--
-- Modificaciones:
--
<<<<<<< HEAD
-- Fecha Autor Versi�n Descripci�n del cambio
-- ========================================================================
--
-- ========================================================================
=======
-- Fecha Autor Versión Descripción del cambio
-- ========================================================================
--
-- ========================================================================

>>>>>>> origin/master
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY biestable_D_con_Clr IS
     GENERIC(retardo: time:= 0 ns);
     PORT(clear, clk, d: IN std_logic; q: OUT std_logic);
END biestable_D_con_Clr;

ARCHITECTURE flujo_asin OF biestable_D_con_Clr IS
BEGIN
     q<= '0' AFTER retardo WHEN clear= '1' ELSE
         d AFTER retardo WHEN rising_edge(clk);
END flujo_asin;

