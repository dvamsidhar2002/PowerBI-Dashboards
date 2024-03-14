select DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY DATENAME(DW, order_date);

select DATENAME(MONTH, order_date) AS Order_Month, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY DATENAME(MONTH, order_date);

select pizza_category, 