select * from Inventory_Dataset;

select count(distinct(EmployeeName)) as EmployeeCount from Inventory_Dataset;

select AVG(OrderItemQuantity) as Avg_Order_Item_Quantity from Inventory_Dataset;

select CategoryName, COUNT(*) as ValueCount from Inventory_Dataset group by CategoryName order by ValueCount DESC;

select AVG(Profit) as Avg_Profit from Inventory_Dataset;

select COUNT(DISTINCT(CustomerName)) as CustomerCount from Inventory_Dataset;

select ProductName, COUNT(*) as ValueCount from Inventory_Dataset group by ProductName order by ValueCount DESC;

select MAX(CustomerCreditLimit) as MAX_Customer_Credit_Limit, MIN(CustomerCreditLimit) as MIN_Customer_Credit_Limit, AVG(CustomerCreditLimit) as AVG_Customer_Credit_Limit from Inventory_Dataset;

select SUM(TotalItemQuantity) as Total_Item_Quantity from Inventory_Dataset;

select SUM(OrderItemQuantity) as Total_Orders from Inventory_Dataset;

select COUNT(DISTINCT(ProductName)) as ProductsCount from Inventory_Dataset;