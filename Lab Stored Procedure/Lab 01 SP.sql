/* Listar base de datos del servidor */
EXEC sp_databases
GO

/* Listar procedimientos almacenados de una base de datos */
EXEC sp_stored_procedures
GO

/* Listar tablas y vistas de una base de datos activa */
EXEC sp_tables
GO


/* Mi primer procedimiento almacenado */
CREATE PROCEDURE sp_SumNum
    @VarUno INT = 0,
    @VarDos INT = 0,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno + @VarDos
    SELECT @Suma
END
GO

/* Eliminar un PROCEDURE */
DROP PROCEDURE sp_SumNum
GO

/* Modificar mi procedimiento almacenado */

ALTER PROCEDURE sp_SumNum
    @VarUno INT = 5,
    @VarDos INT = 20,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno + @VarDos
    SELECT @Suma AS 'Resultado'
END
GO

/* Ejecutar mi primer procedimiento almacenado */
EXEC sp_SumNum
GO

/* Mi segundo procedimiento almacenado */

CREATE PROCEDURE sp_MulNum
    @VarUno INT = 5,
    @VarDos INT = 20,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno * @VarDos
    SELECT @Suma
END
GO

/* Ejecutar mi segundo procedimiento almacenado */
EXEC sp_MulNum
GO

/* Elaborar un SP que permita ingresar 2 números y devuelva la sumatoria de ellos */
CREATE PROCEDURE sp_SumNum2
    @VarUno INT,
    @VarDos INT,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno * @VarDos
    SELECT @Suma AS 'Resultado'
END
GO

/* Sumando dos números */
EXEC sp_SumNum2 @VarUno = 300, @VarDos = 60
GO

/* Mi segundo procedimiento almacenado que permita ingresar 2 números y devuelva la sumatoria de ellos */

CREATE PROCEDURE sp_MulNum2
    @VarUno INT,
    @VarDos INT ,
    @Suma INT = 0
AS
BEGIN
    SET @Suma = @VarUno * @VarDos
    SELECT @Suma 'Resultado'
END
GO

/* Multiplicación de dos números */
EXEC sp_MulNum2 @VarUno = 300, @VarDos = 60
GO

/* Elaborar un SP que permita ingresar dos números y devolver el mayor de ellos */
CREATE PROCEDURE sp_Evaluar
    @NumUno INT,
    @NunDos INT
AS
BEGIN
    IF  @NumUno > @NunDos 
        SELECT @NumUno AS'número mayor'
    ELSE
        SELECT @NunDos AS'número mayor'
END
GO

/* Comparando números */
EXEC sp_Evaluar @NumUno = 50, @NunDos = 50
GO

/* Elaborar un SP que permita COMPARAR DOS NÚMEROS SI SON IGUALES O SI SON DIFERENTES DEVOLVER EL MAYOR */
CREATE PROCEDURE sp_Evaluar2
    @NumUno INT,
    @NunDos INT
AS
BEGIN
    IF  @NumUno = @NunDos 
        SELECT @NumUno AS 'Son Iguales'
    ELSE
        IF @NumUno > @NunDos
        SELECT @NumUno AS'Es mayor'
        ELSE
        IF @NunDos > @NumUno
        SELECT @NunDos AS'Es mayor'
END
GO

/* Comparando números */
EXEC sp_Evaluar2 @NumUno = 80, @NunDos = 90
GO

/* Elaborar un SP que permita COMPARAR DOS NÚMEROS SI SON IGUALES O SI SON DIFERENTES DEVOLVER EL MAYOR Y EL MENOR*/
CREATE PROCEDURE sp_Evaluar3
    @NumUno INT,
    @NunDos INT
AS
BEGIN
    IF  @NumUno = @NunDos 
        SELECT @NumUno AS 'Son Iguales'
    ELSE
        IF @NumUno > @NunDos
        SELECT @NumUno AS 'Es mayor', @NunDos AS 'Es menor'
    IF @NumUno < @NunDos
        SELECT @NunDos AS'Es mayor', @NumUno AS'Es menor'
END
/* Comparando números */
EXEC sp_Evaluar3 @NumUno = 90, @NunDos = 90
GO

/* ELABORAR UN SP QUE PERMITA ENUMERAR UNA DEBIDA CANTIDAD DE NUMEROS */
CREATE PROCEDURE sp_Listar
    @Num INT,
    @Inicio INT = 0
AS
BEGIN
    WHILE (@Num > @Inicio)
    BEGIN
    SET @Inicio = @Inicio + 1
    PRINT @Inicio 
    END
END
GO

/* listar 5 números */
EXEC sp_Listar @Num = 5
GO

/* Elaborar un SP que permita repetir el mensaje "RETROCEDER NUNCA, RENDIRSE JAMAS" de acuerdo a un número que an sido ingresador */
CREATE PROCEDURE sp_Listar2
    @Num INT,
    @Inicio INT = 0
AS
BEGIN
    WHILE (@Num > @Inicio)
    BEGIN
    SET @Inicio = @Inicio + 1
    PRINT 'RETROCEDER NUNCA, RENDIRSE JAMAS'
    END
END
GO

/* listar 5 números */
EXEC sp_Listar2 @Num = 5
GO

/* Elaborar un SP que permita ingresar un nombre y devuelva un mensaje de saludo con el mismo nombre */

CREATE PROCEDURE sp_Saludo
    @Nombre VARCHAR(40)
AS
BEGIN
    PRINT'Hola ' + @Nombre
END

/* Probando el SP Saludo  */
EXEC sp_Saludo @Nombre = Manuel
GO

/* Elaborar un SP que permita ingresar un nombre y una fecha de nacimiento */
CREATE PROCEDURE sp_NomFecNac
    @Nombre VARCHAR(40),
    @FecNac DATE
AS
BEGIN
    SELECT @Nombre AS 'Nombre', @FecNac AS 'Fecha de Nacimiento'

END

/* Probando el SP Ingresar nombre y Fecha de Naciemiento  */
EXEC sp_NomFecNac @Nombre = 'Manuel Alberto', @FecNac = '06/23/2018'
GO

--Ver la configuración de idioma del servidor
SELECT @@LANGUAGE
GO

--Ver formato de fecha de acuerdo al idioma
EXEC sp_helplanguage
GO

/* Elabora un SP que permita ingresar un nombre y fecha  de nacimiento en formato dd/mm/yy */

CREATE PROCEDURE sp_NomFecNac2
    @Nombre VARCHAR(40),
    @FecNac VARCHAR (10)
AS
BEGIN
    SELECT @Nombre AS 'Nombre', 
   FORMAT( CONVERT(date, @FecNac, 103),'d', 'en-gb') AS 'Fecha de Nacimiento'
END
/* Probando el SP Ingresar nombre y Fecha de Naciemiento  */
EXEC sp_NomFecNac2 @Nombre = 'Manuel Alberto', @FecNac = '23/06/2018'
GO

/* Elaborar un SP que permita ingresar un nombre, una fecha de nacimiento y devuelva los datos mas la edad */
CREATE PROCEDURE sp_NomFecNac3
    @Nombre VARCHAR(40),
    @FecNac VARCHAR (10)
AS
BEGIN
    SELECT @Nombre AS 'Nombre', 
   FORMAT(CONVERT(date, @FecNac, 103),'d', 'en-gb') AS 'Fecha de Nacimiento',
   DATEDIFF(YEAR,CONVERT(date, @FecNac, 103), GETDATE()) AS 'Edad'
END

/* Probando SP */
EXEC sp_NomFecNac3 @Nombre = 'Gilberto', @FecNac = '02/12/2000'
GO

/* Poner em uso la base de datos Adventure */
USE AdventureWorks2016;
