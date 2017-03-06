--------------------------------------------------------------------------- 
-- Proyecto: Primera pr�ctica de Sistemas Digitales 
-- Dise�o: Codificador 
-- Nombre del fichero: codifica_boton_grupo_22.vhd
-- Autor: M�ximo Garc�a Mart�nez(y160242) y Ra�l Carbajosa Gonz�lez(y160311) 
-- Fecha: 23/2/2017 
-- Versi�n:0.1 
-- Resumen: entidad y arquitectura de un      
-- codificador. 
-- Se utilizan el tipo de datos STD_LOGIC_VECTOR para todas las se�ales. 
-- La arquitectura se realiza en estilo comportamiento. 
-- 
-- Modificaciones: 
-- 
-- Fecha:               Autor            Versi�n       Descripci�n del cambio 
-- ======================================================================== 
-- 
-- 
-- ======================================================================== 

LIBRARY ieee;--Llamamos a la libreria ieee
USE ieee.std_logic_1164.all; --Importamos los elementos declarados dentro del PACKAGE std_logic_1164


--En la entidad declaramos la entrada (piso_donde_va) y la salida (codigo_piso) 
--sin especificar su funcionamiento
ENTITY codifica_boton IS
     PORT(piso_donde_va: IN STD_LOGIC_VECTOR (2 DOWNTO 0); codigo_piso: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
END codifica_boton;

--------------------------------------------------------------------------------------------
--En la arquitectura declaramos la funcionalidad del circuito
ARCHITECTURE arquitectura_cod_boton OF  codifica_boton IS
    BEGIN
        PROCESS(piso_donde_va) --Incluimos la Entrada
             BEGIN
             CASE(piso_donde_va) IS 
               	WHEN "001" => codigo_piso <= "00";          
              	WHEN "010" => codigo_piso <= "01";          
              	WHEN "100" => codigo_piso <= "10";                   
              	WHEN OTHERS => codigo_piso <= "11";                  
              END CASE;
         END PROCESS;
    END  arquitectura_cod_boton;
