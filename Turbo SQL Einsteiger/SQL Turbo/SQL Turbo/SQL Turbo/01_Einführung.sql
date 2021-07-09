--Links https://www.w3schools.com/sql/

--docs.microsoft

---- ********************************* OPTIONEN UND EINSTELLUNGEN  ***************************************


-- Explorer: beliebig andocken mit drag&drop

-- Explorer: pin & unpin
-- new Project: File -> New... -> Project
-- new Query: Rechtsklick auf Query -> New Query

-- Rechtsclick auf Results: Copy with Headers (z.B. f�r Tabelle -> Excel)

-- Farbindikatoren in Scrollbar: gr�n/gelb/rot/blau
-- gr�n: gespeichert
-- gelb: neu
-- rot: Fehler
-- blau: hier steht gerade der Cursor

-- Zeilennummern: Tools -> Options... -> Text Editor -> All Languages -> General -> Line Numbers

-- Word Wrap: Tools -> Options... -> Text Editor -> All Languages -> General -> Word Wrap

-- Scrollbar Map Mode: Tools -> Options... -> Text Editor -> All Languages -> Scroll Bars -> Use map mode for vertical scrollbar



-- **************************** H�UFIGE KEY COMBINATIONS/SHORTCUTS *************************************
/*

F5 - Execute

STRG + R - �ffnet/schlie�t Results

STRG + Leer - Vorschl�ge

*/

-- richtige Datenbank verwenden! USE DBNAME oder oben im Auswahlfenster einstellen
USE Northwind

-- Kommentar einzeilig

/*

	mehrzeilige
	Kommentare

*/


--mehrzeilge 
--Kommentare sind auch so
--m�glich

-- Tastenkombination STRG + K, STRG + C (comment)
-- STRG + K, STRG + U (uncomment)



--Kommentare mit 2 Minuszeichen der rest der Zeile

select 100 --ab hier Commentar

/* l�ngere Kommentare
select 100
*/

--Sch�n formatieren


select 
		Sp1, sp2, sp3

select	sp1,
		sp2,
		sp3,..

select 
		 sp1
		,sp2
		,sp3..

select
		customerid
		, companyname
		, country,
		--city
from customers
