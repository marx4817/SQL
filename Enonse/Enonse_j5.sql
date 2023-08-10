create database StudentGrades;
use StudentGrades;

-- kreyasyon table
create table Students (
 	student_id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(30) not null,
    age int,
    grade_math int default 0,
    grade_science int default 0,
    grade_history int default 0
);

-- ensere done
 insert into Students(first_name, last_name, age, grade_math, grade_science, grade_history)
 values
	("Woodov", "Louis", 20, 9, 8, 6),
    ("Charleine", "Lordeus", 19, 8, 9, 9),
    ("Youse", "Dorsaintvil", 21, 7, 8, 9),
    ("Vonise", "Lordeus", 22, 10, 8, 6),
    ("Tchasso", "Jean", 18, 5, 7, 9)
;

-- update grade_math
update  Students set grade_math = 10 WHERE student_id = 2;

-- mwayen
select avg(grade_math) as "Avg math", avg(grade_science) as "Avg Sc", avg(grade_history) as "Avg hist" from Students;

-- ajouter yon kolon
alter table Students add column grade_english int default 0;

-- efase yon eleve gras ak laj li
delete from Students where age = 18;

