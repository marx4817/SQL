create database mache_elektwonik character set "utf8mb4";
use mache_elektwonik;

-- kreye tab itilizate
Create table itilizate(
	id int auto_increment primary key,
    non varchar(50) not null,
	siyati varchar(30),
	imel varchar(100) not null unique,
    telefon varchar(15) not null unique
);

-- ajoute 2 itilizate
insert into itilizate(non, siyati, imel, telefon)
values
	("Yousenie", "Dorsainvil", "youse@gmail.com", "194949900"),
    ("Charleine", "Lordeus", "charleine@gmail.com", "109309493")
 ;

-- Tab pwodwi
Create table pwodwi(
	id int auto_increment primary key,
    non varchar(40) not null,
	deskripsyon text(1000),
	kantite_disponib int not null default 1,
	foto varchar(150),
	vre_pri decimal not null,
    ansyen_pri decimal,
	aktif varchar(5) not null default "yes"
);

-- ajoute kek pwodwi
insert into pwodwi(non, kantite_disponib, vre_pri, aktif)
values
	("iPhone 14 prox  max", 5, 1200, "yes" ),
    ("Samsung Galaxie S9", 10, 500, "Yes"),
   ("Lenovo Thinkpad", 15, 950, "yes"),
   ("Batterie Trojan", 3, 150, "yes")
;

-- table kategori
create table kategori(
	id int auto_increment primary key,
    non varchar(100) not null
);

-- ajoute kek kategori
insert into kategori(non) values("telefon"),( "laptop"), ("eneji");

-- tab pwodwiKategori
create table pwodwiKategori(
	id int auto_increment primary key,
    pwodwi int not null,
    kategori int,
    constraint Fk_pwodwi foreign key(pwodwi) references pwodwi(id),
     constraint Fk_kategori foreign key(kategori) references kategori(id) on delete set null on update cascade
);

-- ajoute pwodwi ak kategori
insert into pwodwiKategori(pwodwi, kategori)
values(1, 1), (2, 1), (3, 2), (4, 3);

-- tab acha
create table acha(
	id int auto_increment primary key,
	dat date not null,
    pwodwi	int not null,
    itilizate int not null,
	kategori int not null,
	kantite int not null default 1,
	kach_total decimal not null,
	eskont decimal,
    constraint Fk_iti foreign key(itilizate) references itilizate(id) on delete restrict,
    constraint Fk_pwo foreign key(pwodwi) references pwodwi(id),
    constraint Fk_kate foreign key(kategori) references kategori(id)
);

-- 3 acha
insert into acha(dat, pwodwi, itilizate, kategori, kantite, kach_total, eskont)
values
	("2023-08-22", 1, 1, 1, 2, 2400, 0),
    ("2023-08-22", 2, 1, 1, 1,  600, 100),
    ("2023-08-22", 3, 1, 2, 1, 1000, 50)
;

-- tab panye
create table panye(
	id int auto_increment primary key,
    itilizate int not null,
    total int not null,
    constraint Fk_iti_pa foreign key(itilizate) references itilizate(id)
);

-- panye iti
insert into panye(itilizate, total) values(1, 0);

-- table panyePwodwi
create table panyePwodwi(
	id int auto_increment primary key,
    pwodwi int not null,
    panye int not null,
    dat date not null,
    kantite int not null,
    constraint FK_panye foreign key(panye) references panye(id),
    constraint FkPwod foreign key(pwodwi) references pwodwi(id)
);

-- ajoute pwodwi nan panye
insert into panyePwodwi(panye, pwodwi, kantite, dat)
values(1, 4, 2, "2023-08-20"), (1, 3, 2, "2023-08-20");

-- Koleksyon tout pwodwi ki achte oubyen ki ajoute nan panye yo
SELECT p.id, p.non
FROM pwodwi p
WHERE p.id IN (
    SELECT pwodwi FROM panyePwodwi
    UNION
    SELECT pwodwi FROM acha
);

-- Afiche total potansyèl vant (Sa vle di pwodwi ki nan panye
SELECT p.id, p.non
FROM pwodwi p
INNER JOIN panyePwodwi pP ON p.id = pP.pwodwi;

-- Afichye total acha - san eskont
-- select * from acha where eskont is null;

-- Afiche total acha - ak eskont
select count(id) as Total_acha from acha where eskont is not null;

-- Ki kategori ki gen plis pwodwi
SELECT k.id, k.non, SUM(p.kantite_disponib) AS kantite_pw
FROM kategori k
JOIN pwodwiKategori pk ON k.id = pk.kategori
JOIN pwodwi p ON pk.pwodwi = p.id
GROUP BY k.id, k.non
ORDER BY kantite_pw DESC
LIMIT 1;

-- Ki pwodwi ki gen pi wo eskont
SELECT p.non
FROM pwodwi p
JOIN acha  a ON p.id = a.pwodwi
WHERE a.eskont = (SELECT MAX(eskont) FROM acha);


