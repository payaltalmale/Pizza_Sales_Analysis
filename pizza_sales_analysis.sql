SELECT
    o.order_id,
    o.date,
    o.time,
    od.order_details_id,
    od.quantity,
    pt.pizza_type_id,
    pt.name AS pizza_name,
    pt.category AS pizza_category,
    pt.ingredients AS pizza_ingredients,
    p.size AS pizza_size,
    p.price AS pizza_price
FROM
    orders o
    INNER JOIN order_details od ON o.order_id = od.order_id
    INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
    INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id;

	-- Create the table
use Pizza_salesDB
CREATE TABLE pizza_sales_analysis (
    order_id INT,
    date DATE,
    time TIME,
    order_details_id INT,
    quantity INT,
    pizza_type_id VARCHAR(50),
    pizza_name VARCHAR(100),
    pizza_category VARCHAR(100),
    pizza_ingredients VARCHAR(MAX),
    pizza_size VARCHAR(50),
    pizza_price DECIMAL(10, 2)
);

-- Insert data into the table using the SELECT statement
INSERT INTO pizza_sales_analysis
    (order_id, date, time, order_details_id, quantity, pizza_type_id, pizza_name, pizza_category, pizza_ingredients, pizza_size, pizza_price)
SELECT
    o.order_id,
    o.date,
    o.time,
    od.order_details_id,
    od.quantity,
    pt.pizza_type_id,
    pt.name AS pizza_name,
    pt.category AS pizza_category,
    pt.ingredients AS pizza_ingredients,
    p.size AS pizza_size,
    p.price AS pizza_price
FROM
    orders o
    INNER JOIN order_details od ON o.order_id = od.order_id
    INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
    INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id;

--Total Revenue:
SELECT SUM(pizza_price) AS Total_Revenue FROM pizza_sales_analysis;

--Average Order Value
SELECT (SUM(pizza_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales_analysis;

--Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales_analysis

--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_analysis;

--Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales_analysis;



--Daily Trend for Total Orders
SELECT DATENAME(DW,date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales_analysis
GROUP BY DATENAME(DW, date)

--Hourly Trend for Orders

SELECT DATEPART(HOUR, time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales_analysis
group by DATEPART(HOUR, time)
order by DATEPART(HOUR, time)

--. % of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(pizza_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(pizza_price) * 100 / (SELECT SUM(pizza_price) from pizza_sales_analysis) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_analysis
GROUP BY pizza_category

--% of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(pizza_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(pizza_price) * 100 / (SELECT SUM(pizza_price) from pizza_sales_analysis) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_analysis
GROUP BY pizza_size
ORDER BY pizza_size

--Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales_analysis
WHERE MONTH(date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--Top 5 Best Sellers by Total Pizzas Sold
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales_analysis
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
--Bottom 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales_analysis
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC



