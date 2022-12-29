--WHERE                               HAVING
--             İKİSİ DE FİLTRELEME YAPAR
--ON FİLTRELEME                       SON FİLTRELEME
--GROUP BY ONCE YER ALIR              GROUP BY SONRA YER ALIR
--AGGREGATE METHOD KULLANILAMAZ       AGGREGATE METH KULLANILABILIR
--SATIRLARI FILTRELER                 GRUPLARI FILTRELER
--SELECT, DELETE, UPDATE +            SADECE SELECT ILE KULLANILIR


CREATE table KISILER(
id int,
isim varchar(30),
soyisim varchar(30),
yas int,
sehir varchar(20),
cinsiyet char(1),
ulke varchar(30),
maas int)

insert into kisiler values(1, 'Ahmet', 'Yilmaz', 20, 'Ankara', 'E', 'Turkiye',  2000);
insert into kisiler values(2, 'Mehmet', 'Efe', 22, 'Bolu', 'E', 'Turkiye',  2000);
insert into kisiler values(3, 'Ayse', 'Can', 23, 'Istanbul', 'K', 'Turkiye',  3500);
insert into kisiler values(4, 'Fatma', 'Ak', 35, 'Ankara', 'K', 'Turkiye',  3200);
insert into kisiler values(5, 'John', 'Smith', 45, 'New York', 'E', 'USA',  3500);
insert into kisiler values(6, 'Ellen', 'Smith', 40, 'New York', 'K', 'USA',  3500);
insert into kisiler values(7, 'Hans', 'Muller', 30, 'Berlin', 'E', 'Almanya',  4000);
insert into kisiler values(8, 'Frank', 'Cesanne', 35, 'Paris', 'E', 'Fransa',  3700);
insert into kisiler values(9, 'Abbas', 'Demir', 26, 'Adana', 'E', 'Turkiye',  2000);
insert into kisiler values(10, 'Hatice', 'Topcu', 26, 'Hatay', 'K', 'Turkiye',  2200);
insert into kisiler values(11, 'Gulsum', 'Demir', 35, 'Adana', 'K', 'Turkiye',  2000);


SELECT ulke, AVG(maas) FROM kisiler GROUP BY ulke

--1.YASI 30dan buyuk olan kısılerın ulkelere gore maas ort
select ulke, avg(maas) from kisiler where yas>30 group by ulke

--2.YAS ort 30dan buyuk olan ulkeler ortalama maas
select ulke, avg(maas) from kisiler group by ulke having avg(yas)>30

--3.turkiyede olanların sehirlere gore toplam yas
select sehir, sum(yas) from kisiler where ulke ='Turkiye' group by  sehir
select ulke, sehir, sum(yas) from kisiler group by ulke, sehir having ulke='Turkiye'

--4.sehırlere gore yas ort 30dan cok olan sehırler
select sehir, avg(yas) from kisiler group by sehir having avg(yas)>30

--5.toplam maası 5000den fazla olan sehırler
select sehir, sum(maas) from kisiler group by sehir having sum(maas)>5000

select isim, sehir from kisiler where maas>3000 group by sehir, isim

--6.sehir ve cinsiyete gore gruplandırıp yas ort 30dan cok olan gruplar
select sehir, cinsiyet, round(avg(yas)) from kisiler group by sehir, cinsiyet having avg(yas)>30

--7.cinsiyet ve ulkelere gore maas ort 3500den cok olanlar
select cinsiyet, ulke, round(avg(maas)) from kisiler 
group by cinsiyet, ulke having avg(maas)>3500

--8.yas ort 30dan buyuk ulkelerın ulke isimlerini WWW yap(subquery)
update kisiler set ulke='WWW' 
where ulke in( select ulke from kisiler group by ulke having avg(yas)>30 )

select * from kisiler

--9.çalışan sayısı 1’den fazla olan şehirleri ve çalışan sayılarını getiren sorguyu yazalım
select sehir, count (*) as calısan from kisiler group by sehir having count(*)>1;


--10.Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
--Burada gruplamanın ülkelere göre yapılacağı ve yalnızca erkek çalışanların hesaba katılacağı açık.
select ulke, avg(maas) from kisiler where cinsiyet='E'
group by ulke having avg(maas)>3000


--11.Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu:
SELECT ulke, AVG(maaş) FROM kisiler WHERE Cinsiyet='E' GROUP BY ulke HAVING COUNT(*) > 1


