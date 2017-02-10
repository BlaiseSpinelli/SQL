-- 1st Query--------------------------------------------------------------------------------
select city 
from agents
where aid in (select aid
              from orders
              where cid = 'c006' 
              )
order by city ASC;
-- 2nd Query----------------------------------------------------------------------------------
select distinct pid
from orders
where cid in (select cid
              from customers
              where city in ('Kyoto')
              )
order by pid DESC;
-- 3rd Query----------------------------------------------------------------------------------
select cid, name
from customers
where cid not in (select cid
                 from orders 
                 where aid = ('a01')
                 )
order by name ASC;
-- 4th Query ids of customers who ordered p01 and p07-------------------------------------------------------------------------------
select cid 
from orders
where pid = 'p07' and cid in (select distinct cid 
							 from orders
							 where pid = 'p01' );
-- 5th-------------------------- --------------------------------------------------------------------------------
select distinct pid 
from products
where pid not in (select cid
                  from orders 
                  where aid = 'a08'
                  )
order by pid DESC;
-- 6th Query--------------------------------------------------------------------------------
select name, discount, city
from customers
where cid in (select cid
              from orders
              where aid in (select aid
                            from agents
                            where city in ('Tokyo', 'New York')
              )
);
-- 7th Query--------------------------------------------------------------------------------
select *
from customers
where discount in (select discount 
                   from customers
                   where city in ('Duluth', 'London')
                   );
-- Question 8-------------------------------------------------------------------------------------------
 --   The check constraint is used to limit the value range placed within a single column
 --  This is essentially an integrity constraint only allowing for certain values to be entered into a column
 --  When defining the check constraint on a table you can limit the values in certain columns
 -- One simple example is when a boolean value is required, then a string cannot be entered in that value place.
 -- Another good example of a check constraint is when you prompt for the specific string values such as sports, ('football,basketball,soccer,baseball') and the user enters something other than a sport. However you could also argue that sports is not necessarily a good example and in fact a bad check constraint because it is possible that your school could add another sport.
 -- A bad example of a check constraint is a social security number simply because it changes. This can change over 130 days and some people do not have one. 
 
         
         
         
         