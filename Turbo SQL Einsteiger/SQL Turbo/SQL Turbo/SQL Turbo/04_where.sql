--WHERE

--select * from tabelle
--	where
--		Spalte = Wert
--		Spalte > Wert
--		Spalte < Wert
--		Spalte <=  => Wert
--		
--		Spalte between Wert1 AND Wert2
--		-- Spalte >= Wert1 AND Spalte <= Wert2
--		
--		Spalte in ('Wert1', 'Wert2', 'Wert3',...)
--			Spalte = 'Wert1' or Spalte = 'Wert2' Spalte = 'Wert3' ...
--	    
--		Spalte like ... nur hier gibts Wildcards
--			Wildcards: % steht f¸r beliebig viele Zeichen
--					 'A%' ..alles was mit A beginnt
--					 '%A' .. alles was mit A endet
--					 _ : steht f¸r genau ein Zeichen
--					 [a-d]: Wertebereich
--					 [abcd]: steht f¸r genau ein Zeichen

--		AND OR
--		..ab hier immer mit Klammern arbeiten!!!
--		denn das AND wird st‰rker gebunden...


--		VERNEINUNG

--		NOT LIKE
--		NOT Between
--		NOT IN

--		etwas soll es nicht sein
--		!= 
--		<>

--		Suche nach NULL : is NULL
--						 is not null


--mit Sortierbefehl l‰ﬂt sich wunderbar das Ergebnis validieren

select * from orders where Freight < 100
order by Freight desc

--alle DS Frachtkosten grˆﬂer  500
select * from orders where Freight > 500 order by Freight asc


--alle Bestellungen bei denen die Frachtkosten zwischen 100 und 500
--Grenzen inkl
--		Spalte between Wert1 AND Wert2
select * from orders 
	where 
		Freight between 100 AND 500


		--alle Kunden die mit A beginnen

select * from Customers
	where 
		CompanyName like 'A%'
order by CompanyName desc

--Hauptsache ein A kommt vor
select * from Customers
	where 
		CompanyName like '%A%'
order by CompanyName desc


--Alle Kunden, die in einem Land wohnen wo ein y vorkommt

select * from Customers 
		where 
			Country like '%z%'
--alle Kunden, in einem Land, das als 2ten Buchstabe ein R besitzt

select * from Customers
	where Country like '_r%'


--Suche alle Kunden, die in einer Stadt wohnen, deren vorlletztes Zeichen 
--ein o ist

select * from Customers 
	where City like '%o_'


--mehree Spalten im Where

select * from Customers
	where 
			City = 'Paris'
			AND
			Country = 'France'

--2 Ergbnismengen aber keine doppelten
select * from Customers
	where 
			City = 'Paris'
			OR
			Country = 'Germany'

--alle Best, die Freightkosten < 100 haben
--oder vom Ang (ID) 3 betreut wurden
--und m¸ssen ¸ber Frankreich geliefert worden sein

--das AND ist immer st‰rker bindend


select Freight, EmployeeID, shipcountry from Orders
where
	freight < 100
	OR
	Employeeid = 3
	AND
	ShipCountry = 'France'
	order by 3,1 desc

select Freight, EmployeeID, shipcountry from Orders
where
	freight < 100
	OR
	(Employeeid = 3
	AND
	ShipCountry = 'France')
	order by 3,1 desc

--alle m¸ssen aus Frankreich sein
select Freight, EmployeeID, shipcountry from Orders
where
	(freight < 100
	OR
	Employeeid = 3)
	AND
	ShipCountry = 'France'
	order by 3,1 desc


--alle L‰nder die mit A B C oder D beginnen

select * from customers
	where
		country like 'A%'
		AND
		country like 'B%'
		... b‰h..

select * from customers
	where
		country like '[a-d]%' 
order by country desc

--Suche alle Kunden aus St‰dten , die mit A c e g beginnen [aceg]
--und deren vorletzter Buchstabe ein d k l m o sein darf   [dklmo]
[aceg]%[dklmo]_

select * from customers
	where city like '[aceg]%[dklmo]_'

select * from customers
	where city like '[aceg]%'
		  AND
		  city like '%[dklmo]_'


--PIN 4stellige

Liste  PIN
	   123
	   A34H

PIN >= 1000 ... 0003 !

'[0-9][0-9][0-9][0-9]'


--Suche nach NULL
select region from customers where region = null
select region from customers where region is null

--Suche nach allen Firmen, die im Namen ein ' haben
select * from customers 
	where companyname like '%'%'


select * from customers 
	where companyname like '%''%'  --2 mal '


--Suche nach allen Firmen, die im Namen ein % haben

select * from customers 
	where companyname like '%%%'

select * from customers 
	where companyname like '%[%]%' --[%] keine Wildcard mehr


select * from customers where country <= 'D'


