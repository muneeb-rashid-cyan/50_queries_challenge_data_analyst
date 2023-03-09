select * from sales;


-- Show just a few columns from sales table

-- select SaleDate, Amount, Customers from sales;


-- select Amount, Customers, GeoID from sales;


-- Adding a calculated column with SQL

-- Select SaleDate, Amount, Boxes, Amount / boxes  from sales;

-- Naming a field with AS in SQL

-- Select SaleDate, Amount, Boxes, Amount / boxes as 'Amount per box'  from sales;

-- Using WHERE Clause in SQL

select * from sales
where amount > 10000;


-- Showing sales data where amount is greater than 10,000 by descending order
select * from sales
where amount > 10000
order by amount desc;


-- Showing sales data where geography is g1 by product ID &
-- descending order of amounts

select * from sales
where geoid='g1'
order by PID, Amount desc;



-- Working with dates in SQL

Select * from sales
where amount > 10000 and SaleDate >= '2022-01-01';



-- Using year() function to select all data in a specific year

select SaleDate, Amount from sales
where amount > 10000 and year(SaleDate) = 2022
order by amount desc;


-- BETWEEN condition in SQL with < & > operators

select * from sales
where boxes >0 and boxes <=50;



-- Using the between operator in SQL

select * from sales
where boxes between 0 and 50;


-- Using weekday() function in SQL

select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week'
from sales
where weekday(SaleDate) = 4;