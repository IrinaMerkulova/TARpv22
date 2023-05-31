--INNER JOIN
SELECT * FROM tootaja INNER JOIN amet
ON tootaja.ametID=amet.ametID;
SELECT * FROM tootaja t
INNER JOIN amet a
ON t.ametID= a.ametID;
--tingimuse lisamine

SELECT t.eesnimi , t.perenimi, a.ametNimetus
FROM tootaja t
INNER JOIN amet a
ON t.ametID= a.ametID
WHERE t.eesnimi LIKE 'L%';

--1. Selgita mis on Right Join, Left Join , tee näited
Right join ühendab kaks tabelit nii, et tulemusetabelisse kuvatakse kõik read paremast tabelist ja ainult need read vasakust tabelist, mis vastavad ühendusele antud tingimustele. 
Kui vasaku tabeli andmetel ei ole vastet paremas tabelis, siis kuvatakse vastavasse tulpa NULL-väärtus. Näide:

sq
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
Left join ühendab kaks tabelit nii, et tulemusetabelisse kuvatakse kõik read vasakust tabelist ja ainult need read paremast tabelist, mis vastavad ühendusele antud tingimustele. 
Kui parema tabeli andmetel ei ole vastet vasakus tabelis, siis kuvatakse vastavasse tulpa NULL-väärtus. Näide:
sql
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
--2. Lisa 3. tabel

Create table Kursus(
kursusId int PRIMARY KEY identity(1,1),
KursuseNimetus varchar(20),
tootajaId int,
kestvus int);

ALTER TABLE Kursus
ADD Foreign key (tootajaId) REFERENCES
tootaja(tootajaId);

--3. Koosta SELECT lause 3. tabeli põhjal


SELECT Amet.ametNimetus, Kursus.kursusId, Kursus.KursuseNimetus, Tootaja.eesnimi, Tootaja.perenimi
FROM Amet
INNER JOIN Tootaja ON Amet.AmetID = Tootaja.ametID
INNER JOIN Kursus ON Tootaja.tootajaID = Kursus.tootajaId;

