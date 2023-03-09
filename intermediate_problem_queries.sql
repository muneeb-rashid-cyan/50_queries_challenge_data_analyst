-- 1. Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?

select * from sales where amount > 2000 and boxes < 100;
-- 2. How many shipments (sales) each of the sales persons had in the month of January 2022?

 select people.Salesperson, count(*) as 'shipment_count' from sales JOIN people on sales.SPID=people.SPID  where month(SaleDate)='1' and year(SaleDate)='2022' group by Salesperson;




-- 3. Which product sells more boxes? Milk Bars or Eclairs?

select products.Product,count(sales.Boxes) as num_boxes
from sales JOIN products on sales.PID=products.PID 
where products.Product in ('Milk Bars', 'Eclairs')
group by products.Product;



-- 4. Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?

select products.Product ,count(BOXES) as 'nu_boxes'
from sales JOIN products on sales.PID=products.PID 
 where products.Product in ('Milk Bars', 'Eclairs')
 and SaleDate between '2022-2-1' and '2022-2-7'
group by products.Product;


-- 5. Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?
select  * from sales
where DAYOFWEEK(SaleDate)=2
and customers < 100 and boxes < 100;



