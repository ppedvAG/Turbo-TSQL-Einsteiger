--CREATE ALTER DROP

create database testdb;
GO

drop database testdb
go

use Northwind
GO

create table personal
		(
			PerID int identity,
			FamName nvarchar(50),
			Vorname nvarchar(50),
			GebDatum date NOT NULL --Pflichfeld
		)

select * from personal

alter table personal add Geschlecht bit not null

--Ein Spalte zu Pflichtfeld machen..beser über SSMS Oberfläche entwerfen
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_personal
	(
	PerID int NOT NULL IDENTITY (1, 1),
	FamName nvarchar(50) NULL,
	Vorname nvarchar(50) NULL,
	GebDatum date NOT NULL,
	Geschlecht bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_personal SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_personal ON
GO
IF EXISTS(SELECT * FROM dbo.personal)
	 EXEC('INSERT INTO dbo.Tmp_personal (PerID, FamName, Vorname, GebDatum, Geschlecht)
		SELECT PerID, FamName, Vorname, GebDatum, Geschlecht FROM dbo.personal WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_personal OFF
GO
DROP TABLE dbo.personal
GO
EXECUTE sp_rename N'dbo.Tmp_personal', N'personal', 'OBJECT' 
GO
COMMIT


--Spalte löschen
alter table personal drop column GebDat

--ganze Tabelle weg
drop table personal

select * from #t

select * from ##t

