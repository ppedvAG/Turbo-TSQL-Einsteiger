--TEXTFUNKTIONEN
select LEFT('abcdefg',3)
select LEFT(Customerid,3), Customerid from customers

select RIGHT('abcdefg',3)

select RTRIM('otto        ') --4 Zeichen

select datalength(RTRIM('otto        ')) --4 Zeichen
select datalength('otto        ') --4 Zeichen

select 'A' + 'B'

select SUBSTRING('abcdefg',3,2) ..von eine bstimmten Pos für eine best Länge

--ab einer best Pos  für eine best Länge Zeiochen ersetzen
select STUFF('abcdefg',3,2,'X')

select REVERSE('abcdefg')

select stuff('08677-912388971'
			,datalength('08677-912388971')-2
			,3
			,'XXX')


select reverse(stuff(REVERSE('08677-912388971'),1,3,'XXX'))


--DATUM

Intervalle:


 --   year, yyyy, yy = Year
 --   quarter, qq, q = Quarter
 --   month, MM, M = month
 --   week, ww, wk = Week
 --   day, dd, d = Day
 --   hour, hh = hour
 --   minute, mi, n = Minute
 --   second, ss, s = Second
 --   millisecond, ms = Millisecond
	--nanosecond, ns
 --   weekday, dw, w = Weekday
 --   dayofyear, dy, y = Day of the year


--dateadd
--datepart
--datediff
--datename



--Teil eines Datums ausgeben
select OrderDate, DATEPART(yy,OrderDate), YEAR(orderdate)  from orders
select DATEPART(qq,orderdate) from orders

--14 tage später
select DATEADD(dd,14, orderdate), orderdate from orders

select GETDATE()

--welches Datum hatten wir vor 100 Tagen?
select DATEADD(dd,-100, GETDATE())

-- Differenz zwischen zwei Daten
SELECT DATEDIFF(dd, '2019-11-04', '2019-12-24')
SELECT DATEDIFF(dd, '2019-12-24', '2019-11-04') 

select DATEDIFF(dd,getdate(), '12.2.2021')


select DATEDIFF(hh, getdate(), '29.7.1969')

select DATEDIFF (hh, '1.1.2022', getdate()) --Blickrichtung


select DATENAME(mm, getdate())

select DATENAME( dd, getdate()) --9 ??

select DATENAME( dw, getdate()) --9 ??




select datalength('08677-988971')-2




--die letzten 3 ZEichen ausixen..
--0972189728378xxx

--078947237472  078947237xxx
--389048203948923482384  38904820394892348xxx







---DATUMSFUNKTIONEN


select 'Otto' as sp1 into tab1


--Bestellungen aus dem Jahr 1997 ohne F()
select * from orders


--where datepart(yy,orderdate) = 1997
select DATEPART(yy, orderdate), YEAR(orderdate) from orders


select * from Orders
	where 
			OrderDate = '1997' --= 00 Uhr am 1.1.

select * from orders 
	where OrderDate between '1.1.1997' and '31.12.1997 23:59:59.999'
order by orderdate


select * from orders 
	where 
	OrderDate >= '1.1.1997' 
	and 
	OrderDate < '1.1.1998'	-- <='31.12.1997 23:59:59.999'
	order by orderdate

order by orderdate