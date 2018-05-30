create database HospitalHHH;
go

select database_id, name 
from sys.databases
/*ver listado de AdventureVG_copia*/
use AdventureVG_copia
select name from sys.tables;
/*ver listado de vistas de una base de datos */
use AdventureVG_copia
select name from SYS.views ;
GO
/*visualizar la informacion detallada de una base de datos */
exec sp_helpdb AdventureVG_copia;

/*utilizando snippets*/
-- Create a new database called 'MercadoVG'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'MercadoVG'
)
CREATE DATABASE MercadoVG
GO

/*eliminar una base de datos*/
drop database HospitalHHH;
GO

/*Eliminar base de datos AdventureVG_copia*/
drop database AdventureVG_copia;
go
