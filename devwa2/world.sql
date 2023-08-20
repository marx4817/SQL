-- kreya daz done mond
Create database Mond character set "utf8mb4";
 use Mond;

-- Kreye tab Kontinan
Create Table Kontinan (
	id int auto_increment primary key,
    non varchar(30) not null
);

-- ensere done nan tab kontinan
insert into Kontinan(non)
values
	("Amerik"),
    ("Ewòp"),
    ("Oseyani"),
    ("Afrik"),
    ("Azi")
;

-- kreye tab Peyi
Create Table Peyi(
	id int auto_increment primary key, 
    non varchar(30) not null,
    popilasyon int not null,
	sipefisi decimal not null
);

-- ensere done nan tab Peyi
insert into Peyi(non, popilasyon, sipefisi)
Values
	("Ayiti", 11260000,	27750),
    ("Kanada", 37590000,	9985000),
    ("Frans", 67060000, 643801),
   ("Pòtigal", 10280000, 2212),
   ("Ostrali", 25360000, 7692000),
    ("Nouvèl Zelann", 4917000, 268021),
    ("Kamewoun", 25880000, 475442),
	("Nijerya", 20100000, 923768),
	("Chin", 1398000000, 9597000),
	("Vyetnam", 96460000, 331212)
;

-- ajoute kolon id_kontinan nan tab peyi
Alter Table Peyi Add column id_kontinan int;
Alter Table Peyi Add constraint FK_kontinan foreign key(id_kontinan) references Kontinan(id);

-- ajouter peyi yon nan kntinan respektif
update Peyi set id_kontinan = 1
where non ="Kanada" or non ="Ayiti";

update Peyi set id_kontinan = 2
where non ="Pòtigal" or non ="Frans";

update Peyi set id_kontinan = 3
where non ="Ostrali" or non ="Nouvèl Zelann";

update Peyi set id_kontinan = 4
where non ="Nijerya" or non ="Kamewoun";

update Peyi set id_kontinan = 5
where non ="Vyetnam" or non ="Chin";

-- Kreye tab lang
Create Table Lang(
 	id int auto_increment primary key,
    non varchar(25) not null
 );

-- ensere done nan tab lang 
insert into Lang(non) values("Fransè"), ("Kreyòl"), ("Anglè"), ("Pòtigè"), ("Mandaren"), ("Vyetnamyen");

create table PeyiLang(
 	id int auto_increment primary key,
	lang_id int not null,
    peyi_id int not null,
    constraint Fk_lang foreign key(lang_id) references Lang(id),
    constraint Fk_peyi foreign key(peyi_id) references Peyi(id)
);

-- Ensere done nn tab Peyilang
insert into PeyiLang(lang_id, peyi_id)
values
	(1, 1),
    (2, 1),
	(1, 2),
    (3, 2),
    (1, 3),
    (4, 4),
    (3, 5),
    (3, 6),
    (3, 7),
    (1, 7),
     (3, 8),
     (5, 9),
     (6, 10)
;

--  2 Kreye yon kolòn ki rele ofisyel CHAR(1) nan tab ki relye lang ak peyi ki ka pran 2 valè sèlman: O ak N
Alter table PeyiLang add ofisyel char(1) default "O";

-- 3 Kreye yon kontrent ki pou toujou tcheke si kolòn ofisyel sa, resevwa O oubyen N
alter table PeyiLang add constraint check_ofis check(ofisyel="O" or ofisyel="N");

-- 4 Afiche tout peyi ki pale plis ke yon lang
SELECT p.non
FROM Peyi p
JOIN PeyiLang pl ON p.id = pl.peyi_id
GROUP BY p.id, p.non
HAVING COUNT(pl.lang_id) > 1;

-- 5 Afiche peyi ki pale sèlman yon lang
SELECT p.non
FROM Peyi p
JOIN PeyiLang pl ON p.id = pl.peyi_id
GROUP BY p.id, p.non
HAVING COUNT(pl.lang_id) = 1;

-- 6 Afiche peyi ki gen plis abitan
select * from Peyi
order by popilasyon DESC
limit 1;

--  7 Afichye tout peyi ki gen pi gwo sipèfisi pou chak kontinan
SELECT k.non, p.non, p.sipefisi
FROM Kontinan k
JOIN Peyi p ON k.id = p.id_kontinan
WHERE (k.id, p.sipefisi) IN (
    SELECT k.id, MAX(p.sipefisi) AS max_sipefisi
    FROM Kontinan k
    JOIN Peyi p ON k.id = p.id_kontinan
    GROUP BY k.id
);

--  8 Nan yon sèl rekèt, afiche yon chak peyi ak non kontinan ki atache ak li a, plis grenn lang oubyen youn nan lang li pale yo
SELECT
     p.non AS non_peyi,
    k.non AS non_kontinan,
     (
         SELECT l.non
        FROM Lang l
        JOIN PeyiLang pl ON p.id = pl.peyi_id
         WHERE l.id = pl.lang_id
         LIMIT 1
     ) AS exemple_langue
FROM Peyi p
JOIN Kontinan k ON p.id_kontinan = k.id;

-- 9 Ekri rekèt pou chanje non rantre "Frans" pou "France"
update peyi set non = "France" where non = "Frans";

-- 10 Ekri rekèt pou chanje non tab "Kontinan" pou "Continent"
ALTER TABLE Kontinan RENAME TO Continent;

-- 11 Afiche tout kontinan yo, nan lòd monte(kwasan) sou kontinan ki gen plis popilasyon
SELECT k.non, SUM(p.popilasyon) AS total_popilasyn
FROM Continent k
JOIN Peyi p ON k.id = p.id_kontinan
GROUP BY k.id
ORDER BY total_popilasyn asc;

-- 12 Afiche tout kontinan yo, nan lòd desann(dekwasan) sou kontinan ki gen pi plis sipèfisi
SELECT k.non, SUM(p.popilasyon) AS total_popilasyn
FROM Continent k
JOIN Peyi p ON k.id = p.id_kontinan
GROUP BY k.id
ORDER BY total_popilasyn DESC;




