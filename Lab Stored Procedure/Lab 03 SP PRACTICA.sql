/* Permita ingresar el nombre de un empleado, su fecha de ingreso a la empresa y determine la cantidad de años de permanencia */
CREATE PROCEDURE sp_Resp1






/* Ingrese un número e imprima el texto " Mensaje de prueba" */
ALTER PROCEDURE sp_Resp2
    @Num INT,
    @Inicio INT = 0
AS
BEGIN
    WHILE (@Num > @Inicio)
    BEGIN
        SET @Inicio = @Inicio + 1
        PRINT 'Mensaje de prueba'
    END
END
GO
/* Probando SP */
EXEC sp_Resp2 @Num = 3
GO


/* Ingrese 3 números y los permita ordenar de mayor e menor */


CREATE PROCEDURE sp_Resp3
    @NumUno INT,
    @NumDos INT,
    @NumTres INT
AS
BEGIN
    SELECT 
    ORDER BY sp_Resp3 DESC
END
GO

/* Comparando números */
EXEC sp_Resp3 @NumUno = 80, @NunDos = 90, @NumTres = 50
GO


/* Elaborar una vista que permita Visualizar el número de pedidos atendidos por bibliotecario */

USE dbLibrary;


CREATE VIEW vwNumPedidos
AS
SELECT CONCAT(Bibliotecario.nomBibliotecario, ',', Bibliotecario.apeBibliotecario) AS 'Bibliotecario' ,
    COUNT(Prestamos.idPrestamo) AS 'Total'
FROM Bibliotecario
    INNER JOIN Prestamos
    ON  Bibliotecario.idBibliotecario = Prestamos.Bibliotecario_idBibliotecario
    GROUP BY Bibliotecario.nomBibliotecario, Bibliotecario.apeBibliotecario
GO

SELECT * FROM vwNumPedidos;


/* Elaborar una vista que permita visualisar: codigo de prestamo, fecha de prestamo, bibliotecario, libro, autor y género. */

SELECT Prestamos.idPrestamo, Prestamos.fecsalPrestamo, Prestamos.Bibliotecario_idBibliotecario FROM Prestamos;




