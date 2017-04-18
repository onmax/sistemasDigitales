--------------------------------------------------------------------------- 
-- Proyecto: Primera pr�ctica de Sistemas Digitales 
-- Dise�o: Codificador 
-- Nombre del fichero: codifica_boton_grupo05.vhd
-- Autor: PONER AQU� LOS NOMBRES DE LOS ALUMNOS QUE CONFORMAN EL GRUPO 
-- Fecha: 23/2/2017 
-- Versi�n:0.1 
-- Resumen: entidad y arquitectura de un      
-- codificador?. 
-- Se utilizan el tipo de datos STD_LOGIC_VECTOR para todas las se�ales. 
-- La arquitectura se realiza en estilo comportamiento. 
-- 
-- Modificaciones: 
-- 
-- Fecha              Autor            Versi�n       Descripci�n del cambio 
-- ======================================================================== 
-- 
-- 
-- ======================================================================== 

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY codifica_boton IS
     PORT(piso_donde_va: IN STD_LOGIC_VECTOR (2 DOWNTO 0); codigo_piso: OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
END codifica_boton;

--------------------------------------------------------------------------------------------

ARCHITECTURE arquitectura_cod_boton OF  codifica_boton IS
    BEGIN
        PROCESS(piso_donde_va) -- IMPORTANTE: debemos incluir aqu� todas las entradas que luego intervengan en el resto del c�digo
                        -- asociado al bloque process 
             BEGIN
             CASE(piso_donde_va) IS 
               	WHEN "001" => codigo_piso <= "00";          
              	WHEN "010" => codigo_piso <= "01";          
              	WHEN "100" => codigo_piso <= "10";                   
              	WHEN OTHERS => codigo_piso <= "11";         -- Este caso no aparece en la tabla de verdad         
              END CASE;
         END PROCESS;
    END  arquitectura_cod_boton;
