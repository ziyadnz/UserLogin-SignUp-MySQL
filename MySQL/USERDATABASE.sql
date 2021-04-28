create database assigment3;
use assigment3;

create table users(
user_id INT AUTO_INCREMENT PRIMARY KEY,
user_name varchar(40) NOT NULL,
user_surname varchar(40) NOT NULL,
user_role bool default false, -- -if 1 it is admin if 0 user
user_mail varchar(50) NOT NULL,
user_phone varchar(12) NOT NULL,
user_adress text,
user_password varchar(10) NOT NULL,
UNIQUE KEY(user_mail)
);

insert into users(user_name,user_surname,user_mail,user_phone,user_adress,user_password) 
	Values('ziya','deniz','mail','525252', 'adresss', '123456789');
    
insert into users(user_name,user_surname,user_role,user_mail,user_phone,user_adress,user_password) 
	Values('ziya','dd',true,'q','525252', 'adresss', 'a');
    
    
UPDATE users SET  user_phone = '+33 14 723',user_surname='dnz' WHERE user_id = 1;
    select * from users;
    SELECT * FROM users where user_mail='a';
    
    select * from users where user_mail="mail" and user_role=true;