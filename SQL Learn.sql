-- Basic:

-- Retrieve the total number of orders placed.
select count(order_id) as total_order from orders;


-- Calculate the total revenue generated from pizza sales.
select (order_details.quantity*pizzas.price) as total_sales  
from order_details join pizzas
-- common 
on pizzas.pizza_id=order_details.pizza_id

-- -------------------------------------------------------------------------------
SELECT round(SUM(order_details.quantity * pizzas.price),2) AS total_revenue -- likkkkkkkkkkkkkk
FROM order_details 
JOIN pizzas 
ON pizzas.pizza_id = order_details.pizza_id;
-- ----------------------------------------------------------------------------------

-- Identify the highest-priced pizza.
select pizza_types.name, pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price DESC limit 1 ;

-- Identify the most common pizza size ordered.
select pizzas.size, count(order_details.order_details_id) as order_count
from pizzas join order_details
on pizzas.pizza_id= order_details.pizza_id
group by pizzas.size order by order_count desc ;


-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name, sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by  pizza_types.name order by quantity desc limit 5;

-- -------------------------------------------------
-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.                                                   
select pizza_types.category, sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by  pizza_types.category order by quantity desc;

-- Determine the distribution of orders by hour of the day.
select hour(order_time),count(order_id) from orders
group by hour(order_time);

-- Join relevant tables to find the category-wise distribution of pizzas.
select category, count(name) from pizza_types
group by category;

-- Group the orders by date and calculate the average number of pizzas ordered per day
select orders.order_date, sum(order_details.quantity) as quantity
from orders join order_details
on orders.order_id=order_details.order_id
group by orders.order_date;

select avg(quantity) from (select orders.order_date, sum(order_details.quantity) as quantity
from orders join order_details
on orders.order_id=order_details.order_id
group by orders.order_date) as order_date_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.
select pizza_types.name, order_details.quantity*pizzas.price as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id= pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id;

select pizza_types.name, sum(order_details.quantity*pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id= pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name;

-- -------------------------------------------------
-- Advanced:
-- Calculate the percentage contribution of each pizza type to total revenue.

select pizza_types.category, sum(order_details.quantity*pizzas.price)/ total_revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id= pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category ;




CREATE VIEW total_revenue_view AS
SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS total_revenue
FROM order_details 
JOIN pizzas 
ON pizzas.pizza_id = order_details.pizza_id;

SELECT pizza_types.category, 
      ( SUM(order_details.quantity * pizzas.price) / (SELECT total_revenue FROM total_revenue_view))*100 AS percentage_revenue
FROM pizza_types 
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category;
-- --------------------------------------
-- Analyze the cumulative revenue generated over time.
select orders.order_date, SUM(order_details.quantity * pizzas.price) as order_revenue
FROM order_details JOIN pizzas 
ON pizzas.pizza_id = order_details.pizza_id
join orders
on orders.order_id=order_details.order_id
group by orders.order_date;




select order_date, sum(order_revenue) over (order by order_date) as cum_revenue
from (
select orders.order_date, SUM(order_details.quantity * pizzas.price) as order_revenue
FROM order_details JOIN pizzas 
ON pizzas.pizza_id = order_details.pizza_id
join orders
on orders.order_id=order_details.order_id
group by orders.order_date) as sales;

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select pizza_types.category, pizza_types.name, SUM(order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id= pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category, pizza_types.name ;


select category,name,revenue,
rank() over(partition by category order by revenue desc) as rn
from
(select pizza_types.category, pizza_types.name, SUM(order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id= pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category, pizza_types.name ) as a;




select name,revenue from

(select category,name,revenue,
rank() over(partition by category order by revenue desc) as rn
from
(select pizza_types.category, pizza_types.name, SUM(order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id= pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category, pizza_types.name ) as a) as b

where rn<=3;









