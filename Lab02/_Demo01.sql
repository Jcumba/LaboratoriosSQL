use AdventureWorks2016
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT * FROM Person.Address
Bothell

select ModifiedDate,City from Person.Address
WHERE YEAR (ModifiedDate)='2014' and
MONTH(ModifiedDate)='01' AND
City ='Beaverton';

select * from Person.Address
WHERE AddressLine2
 LIKE 'B%' ;


 select *FROM Person.Person
where LastName = 'Miller' and PersonType ='in'

/*AND*/
select * from HumanResources.Employee where BusinessEntityID >= '10' and BusinessEntityID <= '40';

/*OR*/
select * from HumanResources.Employee where BusinessEntityID < '10' or BusinessEntityID >= '4000';

/*NOT*/
select * from HumanResources.Employee where not Gender ='M';
/*LIKE*/
select FirstName from Person.Person
Where FirstName LIKE 'P%'

/*IN*/
select BusinessEntityID,FirstName,LastName
from Person.Person
where FirstName in ('Michael')
go


