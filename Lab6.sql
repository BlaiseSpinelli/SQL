-------------
-- Lab 6 --
-------------
-- 1st Query--
select distinct customers.name, customers.city
from customers 
inner join products on products.city = customers.city
where products.city in (select city
                        from (select city, count(*)
                              from products
                              group by city
                              order by count DESC
                              limit 1
                              )sub
                        );
 -- 2nd Query--
 select name
 from products 
 where priceUSD > (select avg(priceUSD) from products)
 order by name DESC
 ;
 -- 3rd Query--
 select distinct customers.name, orders.pid, orders.totalUSD
 from customers
 inner join orders on orders.cid = customers.cid
 order by orders.totalUSD ASC
;
-- 4th Query--
select customers.name, sum(coalesce(totalUSD,0)) as "totalOrdered"
from customers
left outer join Orders on orders.cid = customers.cid
group by customers.name
order by customers.name
;
-- 5th Query--
select customers.name, products.name, agents.name
from customers
inner join orders on customers.cid = orders.cid 
inner join agents on orders.aid = agents.aid
inner join products on orders.pid = products.pid
where agents.city = 'Newark'
;
-- 6th Query--
select ordNumber, month, orders.cid, orders.aid, orders.pid, orders.qty,
totalUSD as "totalUSDfromOrders",
(orders.qty*products.priceUSD - (orders.qty*products.priceUSD*(customers.discount/100))) as "CalculatedUSD"
from orders
inner join products on orders.pid = products.pid
inner join customers on orders.cid = customers.cid
where orders.totalUSD != (orders.qty*products.priceUSD -(orders.qty*products.priceUSD*(customers.discount/100)))
;
-- 7th Query--
select customers.city, agents.city 
from customers
right outer join agents on customers.city = agents.city

select customers.city, agents.city 
from customers
left outer join agents on customers.city = agents.city 
;