 Create database peyi character set "utf8";
 use peyi;

 create table depatman (
 	Non varchar(30) not null,
 	Vil_prensipal varchar(40) not null,
 	Sipèfisi decimal not null
);

 insert into depatman(non, Vil_prensipal, Sipèfisi)
 values
 	("Lwès", "Pòtoprens", 	4827),
 	("Nò", "Okap", 2106),
 	("Sid", "Okay", 2794),
 	("Sidès", "Jakmèl", 2023),
 	("Grandans", "Jeremi", 2091),
 	("Latibonit", "Gonayiv", 4895),
 	("Sant", "Ench", 3675),
 	("Nodès", "Fòlibète", 1805),
 	("Nodwès", "Pòdepè", 2176),
 	("Nip", "Miragwàn", 1219)
;

select * from depatman;
