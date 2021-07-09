--JOIN

select * 
from Tabelle A  inner | right | left join
     Tabelle B
	 ON A.sp = B.sp
/*
select top 3 * from customers
select top 3 * from orders
*/
--Nur ein Join schafft es, dass Spalten nebenbeimamder
--ausgegen werden
--welche Kunde hat welche Bestellung gemacht

select * from
			   Customers C 
	inner join Orders O
	ON 
		C.CustomerID=O.CustomerID

--woher weiss ich das...?

--Liste alle Bestellungen auf (orders) und deren Angestellte
--Orderid, orderdate, employeeid, lastname

select 
		O.OrderID, O.EmployeeID, O.OrderDate,
		E.EmployeeID, E.LastName, E.Country
from
	orders O inner join Employees E
			  ON E.EmployeeID=O.EmployeeID
where
	E.Country='UK'


select top 3 * from [order details]
select top 3 * from products

--Alle Positionen (Zeilen) und alle Spalten der Bestellungen und deren vollst Produktnamen auflisten..

select od.*, P.ProductName from 
			[Order Details]			od 
inner join  Products				P 
			   ON					od.ProductID  =	 P.ProductID

--mehrere Tabellen

--welcher Kunde ist bei welcher Bestellung von welchem Angstellt betreut worden

select C.CompanyName, E.LastName
	from Customers C	 inner join orders O	on C.customerid = O.CustomerID
						 inner join Employees E on E.EmployeeID = O.EmployeeID
order by 1,2

--und wie bekommt man doppelte Zeilen raus
--der distinct filter mehrfach vorkommende Eregebniszeilen (Duplikate) raus
select distinct C.CompanyName, E.LastName
	from Customers C	 inner join orders O	on C.customerid = O.CustomerID
						 inner join Employees E on E.EmployeeID = O.EmployeeID
order by 1,2

select distinct C.CompanyName, E.LastName, o.orderid --! überflüssig und macht das Ding teurer
	from Customers C	 inner join orders O	on C.customerid = O.CustomerID
						 inner join Employees E on E.EmployeeID = O.EmployeeID
order by 1,2


--Welche Produkte kaufte ein Kunde..
--Ausgabe: Companyname, Produktname


select distinct C.CompanyName, p.ProductName
	from Customers C	 inner join orders O			on C.customerid = O.CustomerID
					     inner join [Order Details] od  on od.OrderID   = O.OrderID
						 inner join products p			on p.ProductID  = od.ProductID 
order by 1,2



--LEFT RIGHT


select c.CustomerID, o.* from 
	Customers c left join orders o on c.CustomerID=o.CustomerID
	--was steht links vom Join.. Customers.. davon alle..die Spalten der anderen Tabelle werden mit NULL aufgefüllt
	order by 1

select c.CustomerID, o.* from 
	Customers c right join orders o on c.CustomerID=o.CustomerID
	--was steht links vom Join.. Customers.. davon alle..die Spalten der anderen Tabelle werden mit NULL aufgefüllt
	order by 1


select * from Customers cross join orders alles mit allem kombiniert



