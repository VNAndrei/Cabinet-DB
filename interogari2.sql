-- cauta cabinetul unde lucreaza Mirel Doc1
select  Cabinet.Nume, Cabinet.NumarTelefon 
from Cabinet inner join Medic 
on Medic.CabinetID=Cabinet.CabinetID
where Medic.Prenume = 'Mirel' and Medic.Nume='Doc1';

--cauta medicii care au programari in data de 1/12/2019
select distinct Medic.Nume, Medic.Prenume, Client.Nume,Client.Prenume,Client.NumarTelefon,Programare.Data
from Medic inner join Client
on Medic.MedicID = Client.MedicID 
inner join Programare
on Client.ClientID = Programare.ClientID
where Data='1/12/2019';

--afiseaza ce fel de lucrari au programate medici
select distinct Medic.Nume, Medic.Prenume, Programare.Descriere
from Medic inner join Client 
on Medic.MedicID = Client.MedicID
inner join Programare
on Programare.ClientID=Client.ClientID;

--afiseaza numarul de asistenti pe care ii au medicii
select Medic.MedicID,Medic.Nume,Medic.Prenume,COUNT(Asistent.AsistentID) as [Numar asistenti]
from Medic inner join Medici_Asistenti
on Medic.MedicID=Medici_Asistenti.MedicID
inner join Asistent
on Medici_Asistenti.AsistentID= Asistent.AsistentID
group by Medic.MedicID, Medic.Nume, Medic.Prenume;

--afiseaza medicii care au mai putin de 2 programari
select Medic.Nume,Medic.Prenume,COUNT(Programare.ProgramareID) as [Nr programari]--adauga i
from Medic inner join Client
on Medic.MedicID=Client.MedicID
inner join Programare
on Programare.ClientID= Client.ClientID
group by Medic.Nume, Medic.Prenume
having COUNT(Programare.ProgramareID)<2
;

--afiseaza cabinetele care au un material in mai putin de 5 bucati si care e acesta
select Cabinet.Nume, Furnizor.Nume, Furnizor.NumarTelefon, Material.Nume, Material.Pret,Material.Cantitate 
from Cabinet inner join Material
on Cabinet.CabinetID=Material.CabientID 
inner join Furnizor
on Material.FurnizorID=Furnizor.FurnizorID
where Material.Cantitate<5;

--afiseaza cabinetul care nu-i pe profit
select Cabinet.Nume 
from Cabinet
where CabinetID not in (
select Buget.CabinetID
from Buget
where Buget.Profit<Buget.Cheltuieli
 )

 -- tehnicienii care lucreaza cu mai mult de 1 medic
 select Tehnician.Nume, Tehnician.Prenume, count(Medic.TehnicianID) as [Nr Medici]
 from Tehnician inner join Medic 
 on Tehnician.TehnicianID=Medic.TehnicianID
 group by
 Tehnician.Nume, Tehnician.Prenume
 having COUNT(Medic.TehnicianID)>1;

 --afiseaza medicii care au cel putin 1 asistent
select distinct Medic.MedicID,Medic.Nume,Medic.Prenume
from Medic inner join Medici_Asistenti
on Medic.MedicID=Medici_Asistenti.MedicID
inner join Asistent
on Medici_Asistenti.AsistentID= Asistent.AsistentID

--afiseaza toate cabinetele cu nr de fix
select * from Cabinet
where Cabinet.NumarTelefon like '02%';
