create database bikes;
use bikes;

create table bike(
bike_name varchar(64),
price int,
city varchar(64),
kms_driven int,
owner varchar(64),
age int,
power int,
brand varchar(64)
);

SELECT * FROM bikes.bike;