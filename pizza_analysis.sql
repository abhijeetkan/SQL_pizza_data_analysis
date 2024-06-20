-- Select total numbers of orders placed 
SELECT count(order_id) as total_orders from pizzahut.orders;

-- Calculate total revenue generated from pizza sales
SELECT 
round(sum(order_details.quantity * pizzas.price),2) as total_sales
from order_details inner join pizzas on pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest priced pizza USING JOIN
Select pizza_types.name, pizzas.price
from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id 
order by pizzas.price desc limit 1;
 
 -- Highest price pizza WITHOUT JOIN
 Select pizza_types.name, pizzas.price
 from pizza_types, pizzas
 order by pizzas.price desc limit 1;
 
 -- Identify the most common pizza size ordered
Select pizzas.size, 
count(order_details.order_details_id) as times_ordered
from order_details join pizzas on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size ORDER BY count(order_details.order_details_id) asc;

-- List top 5 most ordered pizza types along with their quantities
Select pizza_types.name, sum(order_details.quantity) from pizza_types
join pizzas on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by sum(order_details.quantity) desc limit 5;
 
 