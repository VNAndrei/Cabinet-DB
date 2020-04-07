
alter VIEW MaterialList AS
--afiseaza comenzile cu prioritate GREEN
select MaterialID,Nume,Cantitate from Material
where CabientID = 1
GO

SELECT * FROM MaterialList

GO

alter VIEW BugetView as
--afiseaza cartile cu minim 101 pagini
SELECT Cabinet.CabinetID,Nume,NumarTelefon from Cabinet
inner join Buget
on Buget.CabinetID=Cabinet.CabinetID
WHERE Profit > Cheltuieli
go





SELECT * FROM BugetView


