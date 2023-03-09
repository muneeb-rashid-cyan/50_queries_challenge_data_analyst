-- What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022?

select distinct p.Salesperson
from sales s
join people p on p.spid = s.SPID
where s.SaleDate between ‘2022-01-01’ and ‘2022-01-07’;

-- Which salespersons did not make any shipments in the first 7 days of January 2022?

select p.salesperson
from people p
where p.spid not in
(select distinct s.spid from sales s where s.SaleDate between ‘2022-01-01’ and ‘2022-01-07’);

-- How many times we shipped more than 1,000 boxes in each month?

select year(saledate) 'Year', month(saledate) 'Month', count(*) 'Times we shipped 1k boxes'
from sales
where boxes>1000
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);

-- Did we ship at least one box of ‘After Nines’ to ‘New Zealand’ on all the months?

set @product_name = ‘After Nines’;
set @country_name = ‘New Zealand’;

select year(saledate) ‘Year’, month(saledate) ‘Month’,
if(sum(boxes)>1, ‘Yes’,’No’) ‘Status’
from sales s
join products pr on pr.PID = s.PID
join geo g on g.GeoID=s.GeoID
where pr.Product = @product_name and g.Geo = @country_name
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);

-- India or Australia? Who buys more chocolate boxes on a monthly basis?

select year(saledate) ‘Year’, month(saledate) ‘Month’,
sum(CASE WHEN g.geo=’India’ = 1 THEN boxes ELSE 0 END) ‘India Boxes’,
sum(CASE WHEN g.geo=’Australia’ = 1 THEN boxes ELSE 0 END) ‘Australia Boxes’
from sales s
join geo g on g.GeoID=s.GeoID
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);