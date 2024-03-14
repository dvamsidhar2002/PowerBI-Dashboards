
select * from pizza_sales;

select SUM(total_price) AS Total_Revenue from pizza_sales;

select SUM(total_price)/COUNT(DISTINCT order_id) AS Average_Order_Value from pizza_sales;

select SUM(quantity) AS Total_Pizzas_Sold from pizza_sales;

select COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales;

select CAST(CAST(COUNT(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_Order from pizza_sales;

