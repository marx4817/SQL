Create database Koleksyon character set "utf8mb4";
use Koleksyon;

Create Table Veyikil (
 	id int auto_increment primary key,
 	Mak varchar(15) not null,
 	Model varchar(20) not null,
 	Ane int not null,
 	Pri decimal not null,
 	Seri varchar(17) not null,
 	`Total Plas` int not null,
 	Tip char(2) not null
);

insert into Veyikil (Mak, Model, Ane, Pri, Seri, `Total Plas`, Tip)
Values
	("Toyota", "Rav4", 2008, 7771.00, "00AA6390439PPA", 5, "MC"),
	("Toyota", "Land Cruiser", 2009, 25425.00, "29434BA0GF90032", 8, "MC"),
	("Suzuki", "Grand Vitara", 2010, 7934.00, "856AG1200", 5, "MC"),
	("Subaru", "Forester", 2008, 8320.00, "PPL45300A", 5, "MC"),
	("Jeep", "Wrangler", 2009, 14076.00, "ZZA973JHA", 4, "MC"),
	("Nissan", "Rogue", 2010, 6575.00, "258589YYY", 5, "MC"),
	("Honda", "Pantheon", 2008, 1650.56,	"AA28283", 2, "MT"),
	("Yamaha", "YZF-R1", 2009, 8915.00, "MYQ11022", 2, "MT"),
 	("Kawasaki", "Teryx", 2010, 11699.00, "KL019879923A1", 3,	"MT")
;

-- 1.	Seleksyone tout moto depi 2009.
Select * from Veyikil Where Tip = "MT" and Ane>= 2009;

-- 2.	Seleksyone tout machin ki kreye avan 2010.
Select * from Veyikil Where Ane<2010 and Tip ="MC";

-- 3.	Filtre Toyota ki vann pi chè.
Select * from Veyikil
 	Where Mak ="Toyota"
 	Order by Pri DESC
 	LImit 1;

-- 4.	Rekèt ki pou di ki lane machin ki pi chè a kreye.
Select Ane From Veyikil
 	Where Tip ="MC"
 	Order By Pri DESC
     Limit 1;

-- 5.	Rekèt pou jwenn mwayèn pri moto yo.
Select AVG(Pri) as `Mwayen Moto` from Veyikil Where Tip ="MT";

-- 6.	Triye moto yo nan lòd desann(Lòd dekwasan) sou pri yo ak modèl yo.
Select * from Veyikil Where Tip ="MT"
	Order By Pri DESC, Model DESC;

-- 7.	Filtre tout veyikil yo, epi distenge tout rantre yo sou chan modèl la.
select distinct model from Veyikil;