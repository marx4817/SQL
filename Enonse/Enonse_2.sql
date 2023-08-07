CREATE DATABASE boutik CHARACTER SET 'utf8';
USE Boutik;
CREATE TABLE pwodwi (
	non_pwodwi VARCHAR(50) NOT NULL,
	desk_pwodwi VARCHAR(150) NULL,
    pri_pwodwi DECIMAL  NOT NULL ,
    kantite_pwodwi INT DEFAULT  1
);

CREATE TABLE Kategori(
	non VARCHAR(30) NOT NULL,
	deskripsyon TEXT(500)
);

CREATE TABLE Kliyan(
	non_kli VARCHAR(35) NOT NULL,
    tel_kli VARCHAR(12) NULL,
    adrès_kli VARCHAR(50)
);