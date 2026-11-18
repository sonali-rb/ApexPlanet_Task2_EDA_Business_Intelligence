CREATE TABLE sales_data (
    "Order_ID" VARCHAR(30),
    "Order_Date" DATE,
    "Customer_ID" VARCHAR(30),
    "Customer_Name" VARCHAR(100),
    "Age" NUMERIC,
    "Gender" VARCHAR(20),
    "City" VARCHAR(50),
    "Product" VARCHAR(50),
    "Category" VARCHAR(50),
    "Quantity" INTEGER,
    "Unit_Price" NUMERIC(12,2),
    "Total_Sales" NUMERIC(14,2),
    "Duplicate_Order_ID_Flag" BOOLEAN,
    "Order_Year" INTEGER,
    "Order_Month" VARCHAR(20),
    "Age_Group" VARCHAR(20)
);

SELECT * FROM sales_data LIMIT 10;

/* Business Question 1: What is the total sales amount? */
SELECT
    SUM("Total_Sales") AS total_sales
FROM sales_data;

/*Business Question 2: Which category generates the highest sales?*/
SELECT
    "Category",
    SUM("Total_Sales") AS total_sales
FROM sales_data
GROUP BY "Category"
ORDER BY total_sales DESC;

/*Business Question 3: What are the top 5 products based on sales?*/
SELECT
    "Product",
    SUM("Total_Sales") AS total_sales
FROM sales_data
GROUP BY "Product"
ORDER BY total_sales DESC
LIMIT 5;

/*Business Question 4: Which cities generate the highest sales?*/
SELECT
    "City",
    SUM("Total_Sales") AS total_sales
FROM sales_data
GROUP BY "City"
ORDER BY total_sales DESC;

/*Business Question 5: What is the monthly sales trend?*/
SELECT
    DATE_TRUNC('month', "Order_Date") AS sales_month,
    SUM("Total_Sales") AS monthly_sales
FROM sales_data
GROUP BY sales_month
ORDER BY sales_month;

/*Business Question 6: How do sales compare between male and female customers?*/
SELECT
    "Gender",
    COUNT(*) AS total_records,
    SUM("Total_Sales") AS total_sales,
    AVG("Total_Sales") AS average_sales
FROM sales_data
GROUP BY "Gender"
ORDER BY total_sales DESC;

/*Business Question 7: Who are the top 10 customers by total purchases?*/
SELECT
    "Customer_ID",
    "Customer_Name",
    SUM("Total_Sales") AS total_purchase
FROM sales_data
GROUP BY "Customer_ID", "Customer_Name"
ORDER BY total_purchase DESC
LIMIT 10;

