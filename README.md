# Pizza_Sales_Analysis

This project focuses on analyzing pizza sales data to gain insights into revenue trends, popular pizza categories, customer preferences, and performance of pizza sellers. The analysis involves SQL queries and Excel operations to clean the data, perform calculations, and create visualizations.

## Dataset

The dataset used for this analysis consists of four csv file: `orders`, `order_details`, `pizzas`, and `pizza_types`. These file contain information about orders, order details, pizzas, pizza types, sizes, prices, categories, and ingredients.

## SQL Operations

The SQL operations performed in this project include joining the four tables using inner joins to create a comprehensive view of each order. The SQL script `pizza_sales_analysis.sql` contains the SQL queries used to perform the joins and retrieve relevant information. The results of the joins are stored in a new table called `pizza_sales_analysis_table`.

## Excel Operations

Several Excel operations were performed to preprocess the data, perform calculations, and generate visualizations. The Excel file `pizza_analysis.xlsx` contains these operations, including data cleaning, calculations for average order value, and creation of visualizations.

The Excel operations performed in this project are as follows:
- Extracting the day from the Date column to analyze the daily trend of pizza sales.
- Calculating the average order value using a COUNTIF formula to handle repetitive values in the Order_ID column.
- Creating visualizations such as line charts, pie charts, funnel charts, and bar charts to represent the analyzed data.

## Analysis and Key Findings

The analysis of the pizza sales data revealed several key findings:
- Revenue trends: Analyzing the monthly revenue trends showed fluctuations throughout the analyzed period.
- Popular pizza categories: Certain pizza categories showed higher sales and popularity among customers.
- Customer preferences: Customer preferences for pizza sizes and flavors were identified based on sales data.
- Performance of pizza sellers: The analysis highlighted the top-performing and bottom-performing pizza sellers based on the total number of orders.

## Conclusion

Based on the analysis findings, it is recommended to optimize the menu offerings, focus on popular pizza categories, and implement targeted marketing strategies. These actions can help drive revenue growth and improve customer satisfaction. .






