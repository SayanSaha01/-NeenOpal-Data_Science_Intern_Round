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

select * from bike

create database task;
use task;

/* 1 How to identify the Records (Order ID + Product ID combination) present in data1 
but missing in data2 (Specify the number of records missing in your answer)*/
SELECT COUNT(*) FROM (
    SELECT data1.`Order ID`, data1.`Product ID`
    FROM data1
    LEFT JOIN data2
    ON data1.`Order ID` = data2.`Order ID` AND data1.`Product ID` = data2.`Product ID`
    WHERE data2.`Order ID` IS NULL
) as missing_records;
/* Approach
The query uses a LEFT JOIN to join Data1 and Data2 on the OrderID and ProductID columns. 
The query then uses a WHERE clause to filter out any records where the OrderID and ProductID
columns in Data2 are not NULL. This will return all records from Data1 that do not have
a matching record in Data2. The number of records missing can be found by adding count() function.*/


/* 2How to identify the Records (Order ID + Product ID combination) missing in 
data1 but present in data2 (Specify the number of records missing in your answer)*/
SELECT COUNT(*) FROM data2
LEFT JOIN data1
ON data1.`Order ID` = data2.`Order ID` AND data1.`Product ID` = data2.`Product ID`
WHERE data1.`Order ID` IS NULL;
/*Approach This query uses a LEFT JOIN to join Data1 and Data2 on the OrderID and ProductID columns.
The query then uses a WHERE clause to filter out any records where the OrderID and ProductID columns in Data2 are not NULL.
This will return all records from Data1 that do not have a matching record in Data2. 
The count() function is used to get the number of records missing.*/


/*3 Find the Sum of the total Qty of Records missing in data1 but present in data2*/
SELECT SUM(data2.Qty)
FROM data2
LEFT JOIN data1
ON data1.`Order ID` = data2.`Order ID` AND data1.`Product ID` = data2.`Product ID`
WHERE data1.`Order ID` IS NULL;
/* Approach 
This query uses a LEFT JOIN to join Data2 and Data1 on the OrderID and ProductID columns. 
The query then uses a WHERE clause to filter out any records where the OrderID and ProductID columns in Data1 are not NULL. 
This will return all records from Data2 that do not have a matching record in Data1. 
The SUM() function is used to calculate the sum of the total quantity of these missing records.*/

/*Find the total number of unique records (Order ID + Product ID combination) 
present in the combined dataset of data1 and data2*/
SELECT COUNT(DISTINCT data1.`Order ID`, data1.`Product ID`)
FROM data1 INNER JOIN data2 on data1.`Order ID`=data2.`Order ID`
and data1.`Product ID`=data2.`Product ID`;
/* Approach  
The UNION operator combines the results of these two SELECT statements, 
providing the total number of unique records (Order ID + Product ID combination) 
present in the combined dataset of Data1 and Data2. */
