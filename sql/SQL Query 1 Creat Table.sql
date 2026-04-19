CREATE TABLE superstore (
    "Row ID"            INTEGER,
    "Order ID"          VARCHAR(50),
    "Order Date"        DATE,
    "Ship Date"         DATE,
    "Ship Mode"         VARCHAR(50),
    "Customer ID"       VARCHAR(50),
    "Customer Name"     VARCHAR(100),
    "Segment"           VARCHAR(50),
    "City"              VARCHAR(100),
    "State"             VARCHAR(100),
    "Country"           VARCHAR(100),
    "Postal Code"       VARCHAR(20),
    "Market"            VARCHAR(50),
    "Region"            VARCHAR(50),
    "Product ID"        VARCHAR(50),
    "Category"          VARCHAR(50),
    "Sub-Category"      VARCHAR(50),
    "Product Name"      VARCHAR(255),
    "Sales"             NUMERIC(12,4),
    "Quantity"          INTEGER,
    "Discount"          NUMERIC(5,4),
    "Profit"            NUMERIC(12,4),
    "Shipping Cost"     NUMERIC(12,4),
    "Order Priority"    VARCHAR(50),
    "Profit_Margin"     NUMERIC(10,4),
    "Month_Year"        VARCHAR(10),
    "Year"              INTEGER,
    "Month"             INTEGER,
    "Ship_Days"         INTEGER,
    "Discount_Category" VARCHAR(50)
);


SELECT 
    COUNT(*)                            AS total_rows,
    ROUND(SUM("Sales")::numeric, 0)     AS total_sales,
    ROUND(SUM("Profit")::numeric, 0)    AS total_profit,
    COUNT(DISTINCT "Order ID")          AS total_orders,
    COUNT(DISTINCT "Country")           AS total_countries,
    MIN("Order Date")                   AS date_from,
    MAX("Order Date")                   AS date_to
FROM superstore;