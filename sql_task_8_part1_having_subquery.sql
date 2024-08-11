select * from customer
select * from sales
select * from product

select * from sales as s inner join product as p on s.product_id = p.product_id



select s.customer_id, sum(s.profit) as total_profit, count(s.order_id) as order_count
from Sales s
group by s.customer_id
having count (s.order_id) > 1 and sum (s.profit) > 
(select avg(customer_profit)
from(select sum(s.profit) AS customer_profit
from Sales s
group by s.customer_id) AS subquery)


