-- Project SQL 

-- 1-Easy

create database Travego;
use Travego;
-- step1
create table passenger(passenger_id int,
passenger_name varchar(20),
category varchar(20),
gender varchar(20),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(20));

create table price(id int,
bus_type varchar(20),
distance int,
price int);

show tables;

-- step2
insert into passenger values(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into passenger values(2,'Anmol',	'Non-AC',	'M'	,'Mumbai',		'Hyderabad'	,'700',		'Sitting');
insert into passenger values(3	,'Pallavi'	,'AC',	'F',	'Panaji',	                 	'Bengaluru',	600,	'Sleeper');
insert into passenger values(4,	'Khusboo', 	'AC',	'F',	'Chennai',	'Mumbai',	1500,	'Sleeper');
insert into passenger values(5,	'Udit',	'Non-AC',		'M',	'Trivandrum',	'Panaji',	1000,	'Sleeper');
insert into passenger values(6,	'Ankur',	'AC',	'M',	'Nagpur',	'Hyderabad',	500,	'Sitting');
insert into passenger values(7,	'Hemant',	'Non-AC',	'M',	'Panaji',	'Mumbai',		700,	'Sleeper');
insert into passenger values(8,	'Manish',	'Non-AC',	'M',	'Hyderabad',	'Bengaluru',	500,	'Sitting');
insert into passenger values(9,	'Piyush',	'AC',	'M',	'Pune',	'Nagpur',	700,	'Sitting');

select * from passenger;

insert into price values(1,	'Sleeper',	350,	770);
insert into price values(2,	'Sleeper',	500,	1100);
insert into price values(3,	'Sleeper',	600,	1320);
insert into price values(4	,'Sleeper'	,700	,1540);
insert into price values(5,	'Sleeper',	1000,	2200);
insert into price values(6	,'Sleeper',1200	,2640);
insert into price values(7,	'Sleeper',	1500,	2700);
insert into price values(8,	'Sitting',	500,	620);
insert into price values(9,	'Sitting',	600,	744);
insert into price values(10,	'Sitting',	700,	868);
insert into price values(11,	'Sitting',	1000,	1240);
insert into price values(12,	'Sitting',	1200,	1488);
insert into price values(13,	'Sitting',	1500,	1860);

select * from price;

-- 2.Medium

-- PROBLEM STATEMENT
-- a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?

select gender,count(gender) from passenger where distance >= 600 group by gender;

-- b.	Find the minimum ticket price of a Sleeper Bus. 
select min(price) from price where bus_type = 'sleeper';

-- c.	Select passenger names whose names start with character 'S' 
select passenger_name from passenger where passenger_name like 'S%';

-- d.	Calculate price charged for each passenger displaying
-- Passenger name, Boarding City, Destination City, Bus_Type, Price in the output--take from view

select * from price;
select * from passenger;

select passenger_name,boarding_city,destination_city,p.bus_type,pr.price from passenger p
inner join price pr
where p.distance=pr.distance and p.bus_type=pr.bus_type;


-- e.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  

select * from price;
select * from passenger;

select passenger_name,pr.price from passenger p inner join
price pr on p.distance=pr.distance and p.bus_type=pr.bus_type where p.distance = 1000 and p.bus_type='sitting';

-- f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

select boarding_city,destination_city,bus_type,distance from passenger WHERE (boarding_city,destination_city) = ('Panaji','Bengaluru');

select p.distance,pr.bus_type,pr.price from passenger p 
inner join price pr on p.distance=pr.distance
 where (boarding_city,destination_city)=('Panaji','Bengaluru');
 
-- g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 

select distinct(distance) from passenger order by distance desc;
 
 -- h.	Display the passenger name and percentage of distance traveled by that 
 -- passenger from the total distance traveled by all passengers without using user variables 
 
 -- method 1
 -- using subquery
 select passenger_name,distance/total_distance*100 percent_distance from
 (select *,sum(distance) over() as total_distance from passenger) as p;
 
-- method 2
select sum(distance) from passenger; 
select passenger_name,(distance/6550)*100 as percent_distance from passenger;
 
 
 
 
 





