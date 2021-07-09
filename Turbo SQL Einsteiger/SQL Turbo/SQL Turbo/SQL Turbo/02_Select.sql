--Einfacher SELECT
- --***************************** SELECT STATEMENTS ***************************************
-- immer �berpr�fen, welche Datenbank verwendet wird!

USE Northwind


-- Datenbankdiagramm f�r �bersicht �ber Tabellen
-- Object Explorer -> Databases -> DB Name -> Database Diagrams--



-- Wildcard * (alles ausw�hlen)
-- * sollte in der Realit�t NICHT verwendet werden. Auch, wenn die gesamte Tabelle ausgegeben werden soll, sollten stattdessen die Spaltennamen angegeben werden.


SELECT 100

SELECT 'TEXT'

SELECT 100,'TEXT'

SELECT GETDATE() --jetzt Datum plus Zeit auf ms

use Northwind;
GO


-- * steht f�r alle Spalten
select * from Customers 

select companyname, customerid from Customers

select 
			companyname, customerid, 
			100, 'text', getdate() 
from customers
GO


--Orders: Orderdate, orderid, freight

--Spalten d�rfen auch wiederholt genannt werden 
--und nat. d�rfen auch Berechnungen stattfinden

select
		orderid, orderdate, freight, freight * 1.19
from orders

--Ergbnis ja.. aber AUsgabe :-(
--Alias

select
		orderid, orderdate
		, freight			as NettoFracht
		, freight * 1.19	as Bruttofracht
from orders

--ohne Kommas wird die Spalte zum Alias
select companyname  customerid from customers

--Math : * + - / %  
--und jetzt mit MwSt Anteil
select
		orderid, orderdate
		, freight			as NettoFracht
		, freight * 1.19	as Bruttofracht
from orders


select
		orderid, orderdate
		, freight					as NettoFracht
		, freight * 1.19			as Bruttofracht
		, freight * 1.19-freight	as MwSt
from orders


--Allerdings m�ssen die Werte kompatibel sein
select 100+'A' --ERROR

select '100'+'A'

--Problem
select freight + customerid from orders

select 'freight' + customerid from orders --ufff

select CONVERT(varchar(50),freight), customerid from orders


select CONVERT(varchar(50),freight)+ customerid from orders


select orderid,freight from orders
--Ausgabe 32.38 Euro

select orderid , freight + 'EURO' from orders --Error money und text

select orderid 
, convert(varchar(50),freight) + ' EURO' 
from orders 






















