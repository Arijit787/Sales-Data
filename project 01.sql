
-- **Creat Table**
create table aw_datastore.user(
id int,
first_name varchar(255),
last_name varchar(255),
phone varchar(255),
address varchar(255)
);

-- **Insert Data into Table**
insert into aw_datastore.user(id,first_name,last_name,phone,address)
values(01, "Amit", "Saha", "01711225889", "Dhaka");

-- **Delete/Truncate/Drop Data from Table**
delete from aw_datastore.user as u
where u.last_name = "Saha";

truncate aw_datastore.user;

update aw_datastore.user as u
set last_name = 'Das'
where u.id=1;

-- **Add Email into Table**
ALTER TABLE aw_datastore.user
add email varchar(256);

-- **Update Email into Table**
update aw_datastore.user as u
set email= 'amitdas@gmail.com'
where u.id=1;

-- **Filtering First name & Last Name from database**
select c.FirstName, c.LastName from aw_datastore2.aw_customers c;

-- **Count anything from Datsets (DISTINCT= Unique Number of Data)** (Let aw_datastore2.aw_products=p)
Select 
count(distinct p.productkey) as total_product
from 
aw_datastore2.aw_products as p;

Select 
count(distinct p.productkey) as total_sales_count
from 
aw_datastore2.aw_sales_2015 as p;

-- **Where, And & Or**
select 
*
from
aw_datastore2.aw_sales_2015 as s
where
s.Orderdate = '2015-01-02'
and
s.TerritoryKey = 9
or
s.OrderQuantity = 1
;

-- ** Between**
select 
*
from
aw_datastore2.aw_sales_2015 as s
where
s.Orderdate = '2015-01-02' and '2015-01-08'
;

-- **Find Out Order Quanity Between a Date**
select 
sum(s.OrderQuantity) as Total_Sales_Quanity
from
aw_datastore2.aw_sales_2015 as s
where
s.Orderdate = '2015-01-02' and '2015-01-06'
;

-- **Minimum, Maximum & Average**
select
min(s.TerritoryKey),
max(s.TerritoryKey)
from
aw_datastore2.aw_sales_2015 as s
;

-- **Group By, Order By & Limit**
select
s.OrderDate,
sum(s.OrderQuantity) as Total_Quantity
from
aw_datastore2.aw_sales_2015 as s
group by s.OrderDate
order by Total_Quantity desc
Limit 5
;

-- **Like**    (Example of "%" : A%= All character started with 'A', %A= All character Ended with 'A', %A%= A in middle and common of character, A&B= All character started with 'A' and Ended with 'B')
select
c.CustomerKey,
c.FirstName,
c.Gender
from 
aw_datastore2.aw_customers as c
where c.FirstName like 'J%'
;


-- **Case (Changing Live Data in SQL)**
select	
c.FirstName,
c.LastName,
case
when c.Gender= 'M' then 'Male'
when c.Gender= 'F' then 'Female'
else 'Others'
end as Gender,
TotalChildren,
case  
when TotalChildren>0 then 'Parents' 
else 'Non_parents'
end as parents
from
aw_datastore2.aw_customers as c
;


-- **Join**
  -- Join = "all elements", Left Join = "All elements from 1st Table and Common from 2nd Table"", Right Join = "All elements from 2nd Table and Common from 1st Table"
select
s.id ID,
s.name Name,
s.color Color,
s.price Price,
p.unit Unit
from 
tj.sales as s
join tj.product as p 
on s.id = p.unit
;

-- **Extract**
select
distinct(extract( year from OrderDate))
from 
aw_datastore2.aw_sales_2015
;




