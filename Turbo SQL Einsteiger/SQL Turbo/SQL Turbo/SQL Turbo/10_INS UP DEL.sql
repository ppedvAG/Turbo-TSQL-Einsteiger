--INS DEL UP


--INSERT

select into --Werte von .. nach 


select CustomerID, companyname as Firma, country, city 
into Kunden --Tabelle Kunden  wird in diesem Moment angelegt
from customers

select * from kunden


--DS in best Tabelle.. Reihenfole muss schon stimmen

insert into Kunden
select customerid, companyname, country, city from Customers where City = 'London'

--neue Werte in Tabelle
insert into Kunden
select 'PPEDV','ppedv AG', 'Germany', 'Burghausen'

--wenn nicht alle Spaltenwerte vorhande sind
insert into Kunden
select 'PPEDV','ppedv AG', 'Germany', NULL

insert into Kunden (CustomerID, Firma) values('XYZTR','FA x')


--DELETE ... löscht Zeilen

delete from Kunden where Customerid = 'XYZTR'


select * from kunden

--eindeutiger Wert in Tabelle
alter table kunden add id int identity

delete  kunden where id = 10
delete from kunden where id = 10



--Update

update tabelle set sp = Wert, sp2 = Wert
	where spx = Wert


update Kunden set City = 'Bonn' where CustomerID = 'ALFKI' --das where nicht vergessen...

--Wir wollen die Frachtkosten dort um 10 Erhöhen, wo der Kunde aus UK war..
--da brauchen wir Customers und Orders

--zuerst den Select schreiben, der die zu ändernden DS anzeigt
--dann from in nächste Zeile
--dann select auskommentieren
--dann update darüber schreiben

update orders set Freight = Freight*1.1
--select o.OrderID, o.Freight, c.Country 
from Customers c 
	inner join orders o on c.CustomerID= o.CustomerID
	where c.Country = 'UK'


---wie würde das Löschen aussehen
delete orders
--select o.OrderID, o.Freight, c.Country 
from Customers c 
	inner join orders o on c.CustomerID= o.CustomerID
	where c.Country = 'UK'













