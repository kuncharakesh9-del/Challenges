create database Database_Schema ;
Use database_schema;

# Craete customer table
CREATE TABLE Customers ( 
    customer_id INT PRIMARY KEY, 
    name VARCHAR(50), 
    city VARCHAR(50) );
    
# Insert Customer details
INSERT INTO Customers (customer_id, name, city) VALUES 
(1, 'Arjun', 'Bengaluru'), 
(2, 'Sneha', 'Hyderabad'), 
(3, 'Rahul', 'Chennai'), 
(4, 'Priya', 'Bengaluru'), 
(5, 'Kiran', 'Mumbai'), 
(6, 'Divya', 'Bengaluru'), 
(7, 'Vikram', 'Hyderabad'), 
(8, 'Asha', 'Chennai'), 
(9, 'Manoj', 'Pune'), 
(10, 'Swathi', 'Bengaluru');

# Create order table
CREATE TABLE Orders ( 
    order_id INT PRIMARY KEY, 
    customer_id INT, 
    restaurant VARCHAR(50), 
    amount DECIMAL(10,2), 
    order_date DATE, 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 
);

# Insert Order details

INSERT INTO Orders (order_id, customer_id, restaurant, amount, order_date) VALUES 
(101, 1, 'Meghana Foods', 550.00, '2025-01-01'), 
(102, 2, 'Paradise Biryani', 780.00, '2025-01-03'), 
(103, 3, 'KFC', 420.00, '2025-01-05'), 
(104, 1, 'Empire Restaurant', 300.00, '2025-01-08'), 
(105, 4, 'Meghana Foods', 950.00, '2025-01-10'), 
(106, 6, 'Truffles', 1100.00, '2025-01-11'), 
(107, 7, 'Kritunga', 650.00, '2025-01-12'), 
(108, 4, 'KFC', 350.00, '2025-01-14'), 
(109, 9, 'Burger King', 270.00, '2025-01-15'), 
(110, 10, 'Meghana Foods', 1250.00, '2025-01-16');

Select * from Customers;
Select * from Orders;

# 1) List all customers who have placed at least one order. 
select distinct c.name from customers c inner join Orders o on c.customer_id = o.customer_id ;

# 2) Find the total amount spent by each customer. 
select customer_id, sum(amount)  from orders group by customer_id ; 

# 3) Display the top 3 customers based on total spending.
select customer_id, sum(amount) as total_amount from orders group by customer_id order by total_amount desc limit 3;  

# 4) Retrieve all orders placed in the last 7 days (from latest order date).
SELECT c.customer_id, c.name, c.city, o.order_id, o.amount, o.order_date from customers c  join orders o on c.customer_id = o.customer_id
 where order_date >= date_sub((select max(order_date) from orders), interval 7 day );
 
# 5) Show customers who have never placed an order. 
select c.customer_id, c.name, o.order_id, o.restaurant, o.amount from 
customers c left join Orders o on c.customer_id = o.customer_id where order_id is null;

# 6) Find the restaurant that received the highest number of orders. 
select count(o.order_id) as Number_of_orders, o.restaurant from 
customers c inner join Orders o on c.customer_id = o.customer_id group by o.restaurant;

# 7) List customers from “Bengaluru” who spent more than ₹1000. 
select c.customer_id, c.name, c.city, o.order_id, o.restaurant, sum(o.amount) as total_amount from 
customers c left join Orders o on c.customer_id = o.customer_id 
where c.city = "Bengaluru" group by name having sum(o.amount) >1000;


# 8) Show the total number of orders placed per city.
select c.city, count(o.order_id) as total_orders from 
customers c left join Orders o on c.customer_id = o.customer_id group by c.city;

# 9) Find the average order amount for each restaurant.
select  restaurant, avg(amount) as Avg_amount from  orders group by restaurant; 

# 10) Identify customers who placed more than 5 orders. 
select c.customer_id, c.name, count(o.order_id) as total_orders from 
customers c join Orders o on c.customer_id = o.customer_id group by c.city having total_orders >5 ;




























