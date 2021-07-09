--SUM MIN MAX COUNT AVG

select SUM(freight), AVG(freight), MIN(freight), COUNT(*) from orders

--brauche aber die Summe der Frachtkosten pro AngID

select employeeid, SUM(freight) from orders --Summe Pro... braucht Group By

--Group by kommt nach where bzw from

select employeeid, SUM(freight) from orders --alles aus dem Select in Group by , dann Alias und AGG wegwerfen
	group by employeeid

--Tabelle Kunden: Anzahl der Kunden pro Land.. nur tabelle Customers

select country, COUNT(*) from customers
group by country


--Umsatz pro Land
--wie komm ich an Umsatz

select c.country,sum(od.unitprice*od.quantity) as Umsatz
			from Customers C	 inner join orders O			on C.customerid = O.CustomerID
								 inner join [Order Details] od  on od.OrderID   = O.OrderID
group by country
order by Umsatz desc


select c.country,city,sum(od.unitprice*od.quantity) as Umsatz
			from Customers C	 inner join orders O			on C.customerid = O.CustomerID
								 inner join [Order Details] od  on od.OrderID   = O.OrderID
 --where
group by country, city
order by 1,2 asc

--Filter auf Länder die mit u beginnen
select c.country,sum(od.unitprice*od.quantity) as Umsatz
			from Customers C	 inner join orders O			on C.customerid = O.CustomerID
								 inner join [Order Details] od  on od.OrderID   = O.OrderID
where c.Country like 'U%' --eine Suche nach Umsatz geht hier nicht
	 and Umsatz > 100000 --error
group by country
order by Umsatz desc

select c.country,sum(od.unitprice*od.quantity) as Umsatz
			from Customers C	 inner join orders O			on C.customerid = O.CustomerID
								 inner join [Order Details] od  on od.OrderID   = O.OrderID
where c.Country like 'U%' --eine Suche nach Umsatz geht hier nicht	
group by country having sum(od.unitprice*od.quantity) > 100000
order by Umsatz desc

--Das Having ist das Where für das Group by
--was mit where zu filter ist, das filter mit where
--im Having sollte nur AGG stehen

