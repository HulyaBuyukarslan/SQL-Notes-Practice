CREATE TABLE personel (
id int, 
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20) 
);

INSERT INTO personel VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500,'IBM');
INSERT INTO personel VALUES(234567891, 'Brian Pitt', 'Florida', 1500,'LINUX');
INSERT INTO personel VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLSFARGO');
INSERT INTO personel VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000,'GOOGLE');
INSERT INTO personel VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO personel VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TDBANK');
INSERT INTO personel VALUES(123456719, 'Adem Stone', 'New Jersey', 2500,'IBM');

SELECT * FROM personel;

CREATE TABLE isciler(
id int, 
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);

INSERT INTO isciler VALUES(123456789,'JohnWalker','Florida',2500,'IBM');
INSERT INTO isciler VALUES(234567890,'BradPitt','Florida',1500,'APPLE');
INSERT INTO isciler VALUES(345678901,'EddieMurphy','Texas',3000,'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500,'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500,'IBM');

SELECT * FROM isciler;

--1)Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri listeleyen query yaziniz.
SELECT isim, id 
FROM personel 
WHERE id IN (SELECT id 
			 FROM isciler 
			 WHERE isciler.id= personel.id);-- Kitaptaki Cozum

Select personel.isim, personel.id 
From personel, isciler 
where personel.id = isciler.id
Group by personel.id, personel.isim


Select isim, id 
from personel 
where 
id In (Select id from isciler)


Select isim, id 
from personel 
where Exists (Select id from isciler 
			  where personel.id = isciler.id)


Select a.isim, a.id 
from personel a 
Inner join isciler e 
On a.id = e.id
Group by a.id, a.isim



SELECT personel.isim,personel.id 
FROM personel, isciler 
WHERE personel.id= isciler.id
GROUP BY personel.id,personel.isim;











