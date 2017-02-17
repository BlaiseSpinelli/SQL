-- 1st Query------------------------------------------------------------------------------------
select city
from Agents 
inner join Orders on orders.aid = agents.aid
where cid = 'c006' ;
-- 2nd Query-----------------------------------------------------------------------------------
select distinct pid
from Orders 
inner join Customers on Orders.cid = Customers.cid
where city = 'Kyoto' 
order by pid desc; 
-- 3rd Query -----------------------------------------------------------------------------------------
select name
from Customers
where cid not in(select cid
	             from Orders ) ;
-- 4th Query----------------------------------------------------------------------------------------------
select name
from Customers 
full outer join Orders on Customers.cid = Orders.cid 
where Orders.ordnumber is null ; 
-- 5th Query------------------------------------------------------------------------------------------------
select distinct customers.name, agents.name
from Customers 
inner join Orders on Customers.cid = Orders.cid
inner join Agents on Agents.aid = Orders.aid
where Agents.city = Customers.city ;
-- 6th Query----------------------------------------------------------------------------------
select customers.name, agents.name, customers.city
from Customers 
inner join Agents on customers.city = agents.city ;
-- 7th Query------------------------------------------------------------------------------------
select customers.name, customers.city
from Customers 
where customers.city in (select customers.city
                         from Customers 
                         inner join Products on Customers.city = Products.city 
                         group by products.city, customers.name, customers.city 
                         limit (1)
                         );