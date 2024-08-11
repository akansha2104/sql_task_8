create view sales_customer_product_details as 
select s.product_id , p.product_name, s.customer_id ,  c.customer_name ,
sum(s.sales) as "sum_of_sales", sum(s.profit) as "sum_of_profit", sum(s.quantity) as "sum_of_quantity",
sum(s.discount) as "sum_of_discount"
from sales as s
inner join customer as c
on s.customer_id = c.customer_id
inner join product as p
on s.product_id = p.product_id
group by s.product_id , p.product_name, s.customer_id ,  c.customer_name 
order by sum(sales)

--1)INSERT
select * from sales_customer_product_details
insert into sales_customer_product_details (customer_id,customer_name,sum_of_sales,sum_of_profit) 
values ('KB-70497','ashish',5,0.2554)
--ERROR AFTER INSERTING THE VALUES
ERROR:  cannot insert into view "sales_customer_product_details"
SQL state: 55000
Detail: Views containing GROUP BY are not automatically updatable.
Hint: To enable inserting into the view, provide an INSTEAD OF INSERT trigger or an unconditional ON INSERT DO INSTEAD rule.

--2)UPDATE
select * from sales_customer_product_details
update sales_customer_product_details set customer_id = 'AZ-14253' where product_id = 'OFF-AP-10002906'
--ERROR AFTER UPDATING THE VALUES
ERROR:  cannot update view "sales_customer_product_details"
SQL state: 55000
Detail: Views containing GROUP BY are not automatically updatable.
Hint: To enable updating the view, provide an INSTEAD OF UPDATE trigger or an unconditional ON UPDATE DO INSTEAD rule.

--3)ALTER
select * from sales_customer_product_details
alter table sales_customer_product_details add column sales_loss double precision
--ERROR AFTER ALTERING THE VALUES
ERROR:  This operation is not supported for views.ALTER action ADD COLUMN cannot be performed on relation "sales_customer_product_details" 
ERROR:  ALTER action ADD COLUMN cannot be performed on relation "sales_customer_product_details"
SQL state: 42809
Detail: This operation is not supported for views.

--hence from this above querries we can conclude that views opion of sql does not support insert,update and delete