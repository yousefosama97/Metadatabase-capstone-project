CREATE VIEW OrderCost AS
select order_id,
SUM(Total_Cost) as TotalCost 
FROM orders 
GROUP BY order_id;

CREATE VIEW Orderabove150 AS
SELECT c.customer_id as CustomerID,
c.customer_name as CustomerName,
o.Order_id as OrderID,
SUM(o.Total_cost) AS Cost,
m.Menu_name as MenuName,
m.Course_name as CourseName
FROM orders o
LEFT JOIN customerdetails c ON c.customer_id = o.customer_id
LEFT JOIN menu m ON m.item_id = o.item_id
GROUP BY c.customer_id,
c.customer_name,
o.Order_id,
m.Menu_name,
m.Course_name 
HAVING SUM(o.Total_cost) > 150
ORDER BY SUM(o.Total_cost); 

