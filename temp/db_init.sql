create database hypercube;
use hypercube;

create table users(
username varchar(20) primary key,
emailid varchar(40) unique not null,
fname varchar(30) not null,
lname varchar(30) not null,
college varchar(50) not null,
user_passwd tinyblob not null
);

create table contests (
name varchar(50) not null,
cid integer primary key auto_increment,
start_time datetime not null,
end_time datetime not null
);

create table normal_problems (
prob_name varchar(100) not null,
prob_id integer primary key auto_increment,
prob_code varchar(10) unique not null,
prob_desc varchar(255) not null
);

create table contest_problems (
prob_name varchar(100) not null,
prob_id integer primary key auto_increment,
prob_code varchar(10) unique not null,
prob_desc varchar(256) not null,
cid integer not null,
foreign key(cid) references contests(cid) on delete cascade on update cascade
);

create table normal_sub (
sub_id bigint primary key auto_increment,
username varchar(20) not null,
prob_id integer not null,
status enum("TLE", "WA", "AC") not null,
sub_time datetime not null,
code_file varchar(255) not null,
foreign key(username) references users(username) on delete cascade on update cascade,
foreign key(prob_id) references normal_problems(prob_id) on delete cascade on update cascade
);

create table contest_sub (
sub_id bigint primary key auto_increment,
username varchar(20) not null,
prob_id integer not null,
status enum("TLE", "WA", "AC") not null,
sub_time datetime not null,
code_file varchar(255) not null,
foreign key(username) references users(username) on delete cascade on update cascade,
foreign key(prob_id) references contest_problems(prob_id) on delete cascade on update cascade
);

insert into users values ('admin', 'admin@hcoj.com', 'Hypercube', 'Admin', 'UVCE', password('admin'));
