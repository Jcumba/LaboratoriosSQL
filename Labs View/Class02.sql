/*CREATE VIEW Libros AS*/
SELECT Libro.tituloLibro, Genero.nomGenero
FROM Libro
    INNER JOIN Genero
    ON Libro.Genero_idGenero = Genero_idGenero
GO

SELECT Libro.tituloLibro, Pais.nomPais
FROM Libro
    INNER JOIN Pais
    ON Libro.Pais_idPais = Pais.idPais

SELECT Libro.tituloLibro, Autor.nomAutor, Autor.apeAutor
FROM Libro
    INNER JOIN Autor
    ON Libro.Autor_idAutor = Autor_idAutor
GO



/* Creando una Vista */
CREATE VIEW vwDatosLibro
AS
    SELECT Libro.tituloLibro, Autor.nomAutor, Autor.apeAutor, Genero.nomGenero
    FROM Libro
        INNER JOIN Autor
        ON Libro.Autor_idAutor = Autor_idAutor
        INNER JOIN Genero
        ON Libro.Genero_idGenero = Genero.idGenero
GO

/* Ver registros de una vista */
SELECT *
FROM vwDatosLibro;



/* En Vista listar la cantidad de libros por genero*/
CREATE VIEW vwGenLib
AS
    SELECT Genero.nomGenero AS 'Genero' , COUNT(Libro.Genero_idGenero) AS 'Total'
    FROM Libro
        INNER JOIN Genero
        ON Libro.Genero_idGenero =  Genero.idGenero
    GROUP BY Genero.nomGenero
    GO
/* ver registros de vista */
SELECT *
FROM vwGenLib
GO

/* Vista que liste la cantidad de libros por país */
CREATE VIEW vwPaisLib
AS
    SELECT Pais.nomPais AS 'País', COUNT(Pais.idPais) AS 'Total'
    FROM Libro
        INNER JOIN Pais
        ON Libro.Pais_idPais =  Pais.idPais
    GROUP BY Pais.nomPais
GO

SELECT *
FROM vwPaisLib;


/* Mostrar las vistas de la BD */
SELECT Name
FROM sys.views
 GO

/* Mostrar nombre del bibliotecario, titulo del libro y fecha prestamo */

SELECT Prestamos.fecsalPrestamo,
    CONCAT(Bibliotecario.apeBibliotecario, ',', Bibliotecario.nomBibliotecario) AS 'Bibliotecario',
    Libro.tituloLibro,
    Cliente.nomCliente
    FROM Prestamos
    INNER JOIN bibliotecario
    ON Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
    INNER JOIN Detalle_Prestamo
    ON Prestamos.idPrestamo = Detalle_Prestamo.Prestamos_idPrestamo
    INNER JOIN Libro
    ON Detalle_Prestamo.Libro_idLibro = Libro.idLibro
    INNER JOIN Cliente
    ON Prestamos.Cliente_idCliente = Cliente.idCliente
GO

