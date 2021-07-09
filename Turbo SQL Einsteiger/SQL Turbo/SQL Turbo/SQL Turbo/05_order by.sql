--order by kommt immer am Ende des Statements

select * from tabelle 
order by spalte ASC | DESC


select * from Customers 
order by city desc

---wenn das order by nicht dabei steht.. dann kommt das Ergebnis 
---so wie die DAten pyhsilalisch in der DB liegen


--für die Schreibfaulen

select 'TEXT',* from orders
order by 8 desc --die 6te Spalte aus dem Ergebnis  !!


--Mehrfachsortierung

--	select * from tabelle 
--	order by SP1 asc, sp2 desc, sp3 asc ....