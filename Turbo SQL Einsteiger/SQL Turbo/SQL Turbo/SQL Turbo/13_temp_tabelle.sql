--temporäre Tabellen

-- #tabelle
-- 
-- #t lokale temp Tabellen.. werden automatisch gelöscht beim Beenden der Sitzung
--oder der Ersteller macht drop table
--keine andere Sitzung kann darauf zugreifen

--gibt auch welche mit ##tabelle.. existiert auch in anderen Sitzungen ..globale Tabellen

--gerne verwendet , um komplexe Abfragen zu vereinfachen.. 
--statt komplexer Abfrage prozedruale Schritte



select * into #t from Customers where Country = 'UK'
select * into ##t from Customers where Country = 'UK'


--Ideen für #tabellen


--Umsatz pro Angestellte
--fleissigste Ang und faulste Angstellte


--1. Umsatz pro Angestellten


select e.LastName, SUM(unitprice*quantity)
			from orders o inner join Employees e on e.EmployeeID=o.EmployeeID
						  inner join [Order Details] od on od.OrderID=o.OrderID
group by e.lastname

--2 wie finde ich besten und schlechtsten--mit top 1 und sortiert

select top 1 e.LastName, SUM(unitprice*quantity) as Umsatz
			from orders o inner join Employees e on e.EmployeeID=o.EmployeeID
						  inner join [Order Details] od on od.OrderID=o.OrderID
group by e.lastname
order by Umsatz desc

select top 1 e.LastName, SUM(unitprice*quantity) as Umsatz
			from orders o inner join Employees e on e.EmployeeID=o.EmployeeID
						  inner join [Order Details] od on od.OrderID=o.OrderID
group by e.lastname
order by Umsatz asc

--3--Lösung mit #tabellen

--2 wie finde ich besten und schlechtsten--mit top 1 und sortiert

select top 1 e.LastName, SUM(unitprice*quantity) as Umsatz
into #ergebnis
			from orders o inner join Employees e on e.EmployeeID=o.EmployeeID
						  inner join [Order Details] od on od.OrderID=o.OrderID
group by e.lastname
order by Umsatz desc

select * from #ergebnis

--den anderen dazunehmen
insert into #ergebnis
select top 1 e.LastName, SUM(unitprice*quantity) as Umsatz
			from orders o inner join Employees e on e.EmployeeID=o.EmployeeID
						  inner join [Order Details] od on od.OrderID=o.OrderID
group by e.lastname
order by Umsatz asc


select * from #ergebnis



select top 1 e.LastName, SUM(unitprice*quantity) as Umsatz, 'bester!' as Who
into #ergebnis2
			from orders o inner join Employees e on e.EmployeeID=o.EmployeeID
						  inner join [Order Details] od on od.OrderID=o.OrderID
group by e.lastname
order by Umsatz desc

select * from #ergebnis2

--den anderen dazunehmen
insert into #ergebnis2
select top 1 e.LastName, SUM(unitprice*quantity) as Umsatz, 'fauler!' as Who
			from orders o inner join Employees e on e.EmployeeID=o.EmployeeID
						  inner join [Order Details] od on od.OrderID=o.OrderID
group by e.lastname
order by Umsatz asc

