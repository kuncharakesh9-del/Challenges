 
1. List all customers who have placed at least one order.
For this query I used Join and distinct
 
2. Find the total amount spent by each customer.
For this query I used Aggregate function sum and group by
  
3. Display the top 3 customers based on total spending.
For this query I used Aggregate function sum, group by, order by and limit
  
4. Retrieve all orders placed in the last 7 days (from latest order date).
For this query I used inner query. Aggregate function max, where clause and date function (date_sub)

5. Show customers who have never placed an order.
For this query I used left join, Where clause with is null  
  
6. Find the restaurant that received the highest number of orders.
For this query I used Aggregate function count, inner join and group by
 
7. List customers from “Bengaluru” who spent more than ₹1000.
For this query I used left join, Aggregate function sum, Where clause and group by
  
8. Show the total number of orders placed per city.
For this query I used Aggregate function count, left join and group by
  
9. Find the average order amount for each restaurant.
For this query I used Aggregate function Avg and group by
  
10. Identify customers who placed more than 5 orders.
For this query I used join, Aggregate function count, group by and having

