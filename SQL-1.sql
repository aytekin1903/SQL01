--Table nasil olusturulur:

--1. yol: sifirdan tablo olusturma

CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALLINT,
student_dob DATE

);

SELECT * FROM students

--2. yol :baska bir table kullanarak table olusturma


CREATE TABLE student_name_age
as SELECT student_name,student_age
FROM students;



SELECT * FROM student_name_age

--Table olustururken bazi kisitlamalar (Constraints) atamalari yapabiliriz 
-- Constraints
--A)Unique
--B)Not null
--C)Primary key
--D)Foreign key : iki tablo arasinda bag kurar
--E)Check Constraint

--Primary Key olusturmak icin iki yol kullanabiliriz:

--1-Yol
CREATE TABLE students
(
student_id SMALLINT PRIMARY KEY , 
student_name VARCHAR(50) NOT NULL,  -- (student_name) null deger alamaz.
student_age SMALLINT,
student_dob DATE UNIQUE -- (student_dob)  null deger disindaki degerler tekrarsiz olmalidir. Coklu null deger atanbilir.
);
 
 --2. yol:
 
 CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALLINT,
student_dob DATE,	
CONSTRAINT student_id_pk primary key(student_id)
);
 
 --Foraign Key nasil eklenir
 CREATE TABLE parents 
 (
student_id SMALLINT,
parent_name	 VARCHAR(50),
phone_number CHAR(11),
CONSTRAINT student_id_PK PRIMARY KEY (student_id)
 );
 
 CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALLINT,
student_dob DATE,
CONSTRAINT student_id_FK FOREIGN KEY(student_id) REFERENCES parents(student_id)
);
 
 
 --Check constraint nasil eklenir
 
 CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),
student_age SMALLINT,
student_dob DATE,
CONSTRAINT student_age_check CHECK (student_age BETWEEN 0 AND 30),-- 0 ve 30 dahil
CONSTRAINT student_name_check CHECK (student_name = UPPER(student_name))-- ISIMLER BUYUK HARF OLACAK
);

--Table'a veri nasil girilir

 CREATE TABLE students
(
student_id SMALLINT PRIMARY KEY,
student_name VARCHAR(50) UNIQUE,
student_age SMALLINT NOT NULL,
student_dob DATE,
CONSTRAINT student_age_check CHECK (student_age BETWEEN 0 AND 30),-- 0 ve 30 dahil
CONSTRAINT student_name_check CHECK (student_name = UPPER(student_name))
);

INSERT INTO students VALUES (101,'ALI CAN',13,'10-Aug-2008');
INSERT INTO students VALUES (102,'VELI HAN',14,'10-Aug-2007');
INSERT INTO students VALUES (103,'AYSE TAN',14,'10-Aug-2007');

-- Integer degerler single quote(tek tirnak) ile veya yalin kullanilabilir
 INSERT INTO students VALUES (104,'KEMAL KUZU',15 , NULL);
 INSERT INTO students VALUES (105,'TOM HANKS',25 , '12-Sep-1996');
 
 INSERT INTO students VALUES (106,'ANGELINA JULIE',30 , '12-Sep-1987');

 INSERT INTO students VALUES (107,'BRAD PITT',0 , '26-Jul-2022');
 
 --Spesifik bir sutuna veri nasil girilir
 INSERT INTO students (student_id, student_age) VALUES(108,17);

  INSERT INTO students (student_name,student_id, student_age) VALUES('JOHN WALKER', 109, 24);
  
  --Var olan date nasil degistirilir
  UPDATE students
  SET student_name='LEO OCEAN'
  WHERE student_id =108;
  
  --Example 1: John Walker , dob sutununu 11-Dec-1997 degerine degistir.
  UPDATE students
  SET student_dob = '11-Dec-1997'
  WHERE student_id= 109-- degestirme islemini primary key uzerinden yapilmasi daha garantidir
  
-- Coklu hucre(cell ) nasil degistirilir.
--Example 2 : 105 id'li dob hucresini 11_Apr_1996 degerine ve name hucresini TOM HANKS  guncelleyiniz
UPDATE students
SET student_dob='11_Apr_1996',
    student_name='TOM HANKS '
WHERE student_id='105';

--Coklu record(satir) nasil guncellenir:
--Example 3 : id'si 106'dan kucuk tum dib degerlerini 01-Aug-2021 degerine guncelleyiniz
UPDATE students
SET student_dob='01-Aug-2021'
WHERE student_id < 106;


--Example 4: TuM age degerlerini en yuksek degerine guncelleyiniz
UPDATE students
SET  student_age=(SELECT MAX(student_age) FROM students);

--Example 5: TuM student_dob  degerlerini en DUSUK  student_dob degerine guncelleyiniz
UPDATE students
SET student_dob=(SELECT MIN(student_dob) FROM students);

--Sutunlari worker_id, worker_name, worker_salary olan bir 'workers' table olusturun. 
--worker_id sutununa worker_id_pk adiyla primary key atayin.
--4 record(satir) girisi yapin
-- TABLE'YI KONSOLDA GURUNTULEYIN





