-- 1st Query -- 
select ordNumber, totalUSD
from Orders; 

-- 2nd Query-- 
select name, city
from Agents
where aid in ('a01');

-- 3rd Query--
select pid, name, priceUSD
from Products
where quantity > 200100;

-- 4th Query--
select name, city 
from customers
where city in ('Duluth');

-- 5th Query--
select name 
from Agents 
where city not in ('New York', 'Duluth');

-- 6th Query-- 
select pid, name, city, quantity, priceUSD
from products
where city not in ('Duluth', 'Dallas') and priceUSD >= 1; 

-- 7th Query-- 
select ordNumber, month, cid, aid, pid, qty, totalUSD
from Orders 
where month in ('Feb', 'May');

-- 8th Query-- 
select ordNumber, month, cid, aid, pid, qty, totalUSD
from Orders
where month in ('Feb') and totalUSD >= 600;

-- 9th Query-- 
select ordNumber
from Orders
where cid in ('C005');

