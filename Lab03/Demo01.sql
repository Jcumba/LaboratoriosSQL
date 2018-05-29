use AdventureWorks2016



SELECT * FROM Person.Person


CREATE VIEW vw_Persona
as
SELECT FirstName, LastName
FROM Person.Person
SELECT * FROM vw_Persona 


CREATE VIEW vw_Persona2
as
SELECT FirstName, LastName
FROM Person.Person
WHERE LastName like 'Adams'
SELECT * FROM vw_Persona2 

CREATE VIEW vw_Persona3
as
SELECT CONCAT(FirstName,',',LastName) AS Datos
FROM Person.Person
WHERE LastName like 'Adams'
SELECT * FROM vw_Persona3