/* Crear un SP que permita listar los registros de la tabla género */

CREATE PROCEDURE sp_ListGen
AS
BEGIN
    SELECT *
    FROM Genero
END
GO

/*  EJECUTAR STORE PROCEDURE LISTADO DE GÉNERO */
EXEC sp_ListGen
GO

/* Elaborar un SP que permita listar los registros de la tabla cliente */

CREATE PROCEDURE sp_ListClient
AS
BEGIN
    SELECT *
    FROM Cliente
END
GO

/*  EJECUTAR STORE PROCEDURE LISTADO DE TABLA CLIENTE */
EXEC sp_ListClient
GO

/* CREAR UN SP QUE PERMITA LISTAR LOS CLIENTES ORDENADOS POR LA COLUMNA SEXO DE FORMA ASCENDENTE */

USE dbLibrary;

CREATE PROCEDURE sp_ListClientSexo
AS
BEGIN
    SELECT *
    FROM Cliente
    ORDER BY Cliente.sexoCliente ASC
END
    GO

/* EJECUTAR SP QUE MUESTRE LOS CLIENTES DE LA COLUMNA SEXO DE MANERA ASCENDENTE*/
EXEC SP_listclientSexo
GO

/* MODIFICAR EL SP ANTERIOR DE TAL FORMA QUE PERMITA MOSTRAR EL LISTADO DE CLIENTES DE ACUERDO A LA LETRA DEL SEXO INDICADO */

ALTER PROCEDURE sp_ListClientSexo
    @Sexo VARCHAR(1)
AS
BEGIN
    SELECT *
    FROM Cliente
    WHERE Cliente.sexoCliente = @Sexo
END
    GO

/* EJECUTAR SP QUE MUESTRE LOS CLIENTES DEL SEXO FEMENINO */
EXEC sp_ListClientSexo @Sexo = F
GO


/* MODIFICAR EL SP DE TAL FORMA QUE SE VEA COMPLETO EL NOMBRE DEL SEXO */

ALTER PROCEDURE sp_ListClientSexo
    @Sexo VARCHAR(1)
AS
BEGIN
    SELECT CONCAT(Cliente.apeCliente, ',' , Cliente.nomCliente) AS Cliente,
        Cliente.dniCliente AS DNI,
        Sexo = 
    CASE 
    WHEN Cliente.sexoCliente = 'F' THEN 'Femenino'
    WHEN Cliente.sexoCliente = 'M' THEN 'Masculino'
    END
    FROM Cliente
    WHERE Cliente.sexoCliente = @Sexo
END
    GO

/* EJECUTAR SP QUE MUESTRE LOS CLIENTES DEL SEXO FEMENINO */
EXEC sp_ListClientSexo @Sexo = M
GO


/* CREAR UN SP QUE PERMITA INGRESAR REGISTROS A LA TABLA GENERO */

CREATE PROCEDURE sp_AddGen
    @Codigo VARCHAR(4),
    @Nombre VARCHAR(MAX)
AS
BEGIN
    INSERT INTO Genero
        (idGenero, nomGenero)
    VALUES
        (@Codigo, @Nombre)
END
GO

/* AGREGAR EK GÉNERO COMEDIA */
EXEC sp_AddGen @Codigo = 7, @nombre = 'Romance'

/* AGREGAR LOS GENEROS Infantil, Obra Literaria y Drama */
EXEC sp_AddGen @Codigo = 8, @nombre = 'Infantil'
EXEC sp_AddGen @Codigo = 9, @nombre = 'Obra Literaria'
EXEC sp_AddGen @Codigo = 10, @nombre = 'Drama'
GO

/* VERIFICAR QUE SE HAYA AGREGADO EL REGISTRO */
SELECT *
FROM Genero
GO

/* ELABORAR UN SP QUE PERMITA VALIDAR EL CODIGO DE GENERO ANTES DE INGRESAR UN REGISTRO */

CREATE PROCEDURE sp_ValiAddReg
    @Codigo INT,
    @Nombre VARCHAR(MAX)
AS
BEGIN
    IF (SELECT Genero.idGenero
    FROM GENERO
    WHERE Genero.idGenero = @Codigo) IS NOT NULL
         SELECT 'No puedo ingresar el registro porque el código ya existe.' AS 'Resultado'
    ELSE
    INSERT INTO Genero
        (idGenero, nomGenero)
    VALUES
        (@Codigo, @Nombre);
    SELECT *
    FROM Genero ORDER BY idGenero
END
GO

/* VALIDAR INGRESO DE GENERO CON EL CÓDIGO 2 */
EXEC sp_ValiAddReg @Codigo = 11, @Nombre = 'Series'
EXEC sp_ValiAddReg @Codigo = 12, @Nombre = 'Cuentos'
EXEC sp_ValiAddReg @Codigo = 13, @Nombre = 'Susto'
EXEC sp_ValiAddReg @Codigo = 14, @Nombre = 'Risas'
GO

/* Eliminar un registros a traves de un SP */
CREATE PROCEDURE SP_DelGen
@Codigo VARCHAR(4)
AS  
    BEGIN
        DELETE FROM Genero
        WHERE Genero.idGenero = @Codigo
        SELECT * FROM Genero 
    END
GO

/* Ejecutar SP */
EXEC SP_DelGen @Codigo = 11;


/* Listar registros de la tabla género */
SELECT * FROM Genero
GO

/* Eliminar un registros a traves de un SP Y VALIDAR SI NO EXISTE MANDAR MENSAJE DE ERROR */
ALTER PROCEDURE SP_DelGen
    @Codigo VARCHAR(4)
AS
BEGIN
    IF (SELECT Genero.idGenero
    FROM GENERO
    WHERE Genero.idGenero = @Codigo) IS NULL
         SELECT 'No se ah podido eliminar el registro del código ya existe.' AS 'Resultado'
    ELSE
        DELETE FROM Genero
        WHERE Genero.idGenero = @Codigo;
END
GO

/* Ejecutar SP */
EXEC SP_DelGen @Codigo = 14
GO

/* Listar registros de la tabla género */
SELECT *
FROM Genero
GO


