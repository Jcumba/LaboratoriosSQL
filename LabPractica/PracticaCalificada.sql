use AdventureWorks2016

/* ------ Práctica calificada de MS SQL Server*/
/*Para esta práctica vamos a utilizar la base de datos Adventure Works 2016*/

-- Elabore el código Transact SQL para resolver los siguientes anunciados --- 

--- Se necesita listar los empleados y sus respectivos departamentos en el que labora ---

CREATE VIEW Empleado
AS 
SELECT BusinessEntityID, DepartmentID
FROM HumanResources.Department, HumanResources.Employee


--- Se necesita saber la cantidad de empleados por departamento ---

CREATE VIEW Empleado2
AS 
SELECT DepartmentID, BusinessEntityID
FROM HumanResources.Employee, HumanResources.Department


--- Se necesita listar las cantidades de ventas realizadas por año ---



--- Se necesita listar los empleados con su respectivo correo  y número de teléfono

CREATE VIEW Empleado4
AS 
SELECT BusinessEntityID, PhoneNumber, EmailAddress
FROM HumanResources.Employee, Person.PersonPhone, Person.EmailAddress

SELECT * FROM Empleado4


--- Se necesita saber la cantidad de ventas atendidas por cada vendedos


--- Cada uno de los enunciados deben ser considerados Vistas


/* Se calificará desde su repositorio de GitHub en la que deberá crear una carpeta llamada práctica calificada */




/* Poner en uso la base de datos */
USE AdventureWorks2016
GO

/* Listado de esquemas pertenecientes a esta base de datos*/

SELECT name
FROM sys.schemas
GO

/* Ver tablas de base de datos en uso */
SELECT name
FROM sys.tables
GO

/* Ver estructura de una tabla específica */
EXEC sp_help 'HumanResources.Employee'

/* Ver listado de departamentos de la empresa */
SELECT *
FROM HumanResources.Department
GO

/* Visualizar sólo los departamentos que pertenecen al grupo Marketing y Ventas */
SELECT *
FROM HumanResources.Department
WHERE HumanResources.Department.GroupName = 'Sales and Markenting'
GO

/* Ver listado de todos los empleados cuto estado civil es CASADO */
SELECT HumanResources.Employee.BusinessEntityID AS 'Codigo de empleado',
    HumanResources.Employee.MaritalStatus AS 'Estado civil'
FROM HumanResources.Employee
WHERE HumanResources.Employee.MaritalStatus 
like 'M'
GO

/* Ver listado el código de las órdenes de ventas y su respectivo mes del año 2013 */
SELECT SalesOrderHeader.SalesOrderID AS 'Código de Orden',
    DATENAME (MONTH, Sales.SalesOrderHeader.OrderDate) AS 'Mes',
    YEAR(Sales.SalesOrderHeader.OrderDate) AS 'Año'
FROM Sales.SalesOrderHeader
WHERE YEAR(SalesOrderHeader.OrderDate) = 2013
GO

/* Visualizar la cantidad de órdenes de venta por año 2013 */
SELECT YEAR(Sales.SalesOrderHeader.OrderDate) AS 'Año',
    COUNT(Sales.SalesOrderHeader.SalesOrderID) AS 'Cantidad'
FROM Sales.SalesOrderHeader
WHERE YEAR(SalesOrderHeader.OrderDate) = 2011
GROUP BY YEAR(Sales.SalesOrderHeader.OrderDate)
GO

/* Visualizar la cantidad de ventas por mes y por año 2011 */

SELECT YEAR(Sales.SalesOrderHeader.OrderDate) AS 'AÑO',
    DATENAME (MONTH, Sales.SalesOrderHeader.OrderDate) AS 'MES',
    COUNT(Sales.SalesOrderHeader.SalesOrderID) AS 'Cantidad'
FROM Sales.SalesOrderHeader
WHERE YEAR(SalesOrderHeader.OrderDate) = 2011
GROUP BY YEAR(Sales.SalesOrderHeader.OrderDate),
DATENAME (MONTH,Sales.SalesOrderHeader.OrderDate)
GO

/* Cantidad de empleados por cargo de mayor a menor*/
SELECT COUNT(HumanResources.Employee.BusinessEntityID) AS 'Total',
    HumanResources.Employee.JobTitle AS 'Cargo'
FROM HumanResources.Employee
GROUP BY HumanResources.Employee.JobTitle
ORDER BY COUNT(HumanResources.Employee.BusinessEntityID) DESC

/* Listado de empleado Nombres, Apellido y su departamento */
SELECT Person.FirstName AS Nombre, Person.LastName AS Apellido, HumanResources.Department.Name AS Departamento
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN Person.Person
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID  = HumanResources.Department.DepartmentID

/* Muestrame la cantidad de empleados por departamento */

SELECT COUNT(HumanResources.EmployeeDepartmentHistory.BusinessEntityID) AS 'Cantidad',
    HumanResources.Department.Name AS Departamento
FROM HumanResources.EmployeeDepartmentHistory
INNER JOIN Person.Person
ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Department.Name
GO

/* Muestrame la cantidad de empleados por estado civil en cada departamento */
SELECT HumanResources.Department.Name AS 'Departamento',
HumanResources.Employee.MaritalStatus AS 'Estado Civil',
COUNT(HumanResources.Employee.BusinessEntityID) AS 'Cantidad'
FROM HumanResources.Employee
INNER JOIN HumanResources.EmployeeDepartmentHistory
ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER JOIN HumanResources.Department
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Employee.MaritalStatus, 
HumanResources.EmployeeDepartmentHistory.DepartmentID, 
HumanResources.Department.Name
GO

/* Muestrame el Nombre, Apellido, Departamento, Estado civil del empleado */

SELECT Person.FirstName AS 'Nombre', 
Person.LastName AS 'Apellido', 
HumanResources.Department.Name AS 'Departamento',
HumanResources.Employee.MaritalStatus AS 'Estado Civil'
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN HumanResources.Employee
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID
    INNER JOIN Person.Person
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID  = HumanResources.Department.DepartmentID
GO

/* Muestrame el listado de clientes que hicieron su orden de compra en los meses de noviembre y diciembre del año 2012 */



/* Mauestrame la cantidad de ordenes de pedido atendidos por cada medio de envio */


