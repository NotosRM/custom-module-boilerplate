if not exists (select *
from sys.schemas
where name = N'cmb')
	exec('create schema [cmb]')
go

if object_id('[cmb].[BooksData]') is null
begin
	CREATE TABLE [cmb].[BooksData]
	(
		[ID] int NOT NULL IDENTITY,
		[Name] varchar(100) NOT NULL,
		[Author] varchar(100) NOT NULL,
		[ReleaseYear] int NOT NULL,
		[FlagRead] bit NOT NULL,
		[ISBN] int NOT NULL,
		CONSTRAINT [PK_cmb_BooksData] PRIMARY KEY ([ID]),
		CONSTRAINT [UQ_cmb_BooksData_Name] UNIQUE ([Name])
	)
end
else
begin
	delete from [cmb].[BooksData]
END


