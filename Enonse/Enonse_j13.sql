create database ToDoList character set "utf8mb4";
use ToDoList;
create table tasks (
	task_id int auto_increment,
    task_name varchar(30) not null,
    description text(500) not null,
    due_date date,
    status varchar(10),
    constraint Pk_task primary key(task_id)
);

insert into tasks(task_name, description, due_date, status)
values
	("Learn Python", "is simply dummy text of the printing and typesetting industry" , "2022-06-17",  "completed"),
    ("Learn React Native", "is simply dummy text of the printing and typesetting industry", "2023-07-01", "pending"),
    ("Ethicale Hacking", "is simply dummy text of the printing and typesetting industry", "2023-08-01", "pending"),
    ("Master JS", "is simply dummy text of the printing and typesetting industry", "2023-06-01", "completed"),
    ("Learn English", "is simply dummy text of the printing and typesetting industry", "2023-02-01", "pending")
;

-- Rekèt
-- Rekipere tout tach yo.
Select * from tasks;

-- Rekipere tach ki gen pending yo
Select *from tasks where status = "pending";

-- Rekipere tach ki ke dat yo ap rive, nan semèn pwochen an (7 jou).
insert into tasks(task_name, description, due_date, status)
values("konkeri ke", "is simply dummy text of the printing and typesetting industry", "2023-08-25", "pending");
select * from tasks where due_date = date_add(CURDATE(), interval 7 day);

-- Rekipere tach ki konplete yo.
select * from tasks where status = "completed";

-- Modifikasyon:
-- Chanje stati yon tach ki te pending pou w mete l completed
update tasks set status = "completed" where task_name ="Ethicale Hacking";

-- Defi
-- Ajoute yon nouvo kolòn priority (ki ka gen valè 1,2,3,4) nan tab tasks la
Alter table tasks add column priority int;
update tasks set priority = 4 where task_id =1
update tasks set priority = 2;

-- Kreye yon nouvo tab ki rele categories epi asosye l ak tab tach yo, gras ak yon relasyon kle etranje
create table categories (
	category_id int auto_increment primary key,
    category_name varchar(30) not null,
	description varchar(150)
);

-- Alter table tasks add category_id int;
alter table tasks add constraint fk_category_id foreign key(category_id) references categories(category_id);

insert into categories(category_name, description)
values
	("programmation", "apprendre a programmer"),
	("Piratage", "apprendre piratage"),
    ("Lanmou", "..");

update tasks set category_id = 1 where task_id = 1 or task_id = 2 or task_id = 4;
update tasks set category_id = 2 where task_id = 3;
update tasks set category_id = 3 where category_id is null;


-- Kreye yon rekèt pou w rekipere tach ki enpòtan yo. Ki gen priyorite 1.
Select * from tasks where priority =1;

-- Answit kreye rekèt ki pou retire tout tach ki "completed" yo oubyen ki ekspire.
delete from tasks where status="completed" or due_date < curdate() ;

