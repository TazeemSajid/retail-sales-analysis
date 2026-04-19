TRUNCATE TABLE superstore;

COPY superstore
FROM 'C:\Users\tazee\Downloads\superstore_pipe.csv'
DELIMITER '|'
CSV HEADER;

SELECT
    ROUND(SUM("Sales")::numeric, 2)                          AS total_sales,
    ROUND(SUM("Profit")::numeric, 2)                         AS total_profit,
    ROUND((SUM("Profit")/SUM("Sales")*100)::numeric, 2)      AS profit_margin_pct,
    COUNT(DISTINCT "Order ID")                                AS total_orders,
    ROUND(AVG("Sales")::numeric, 2)                          AS avg_order_value,
    ROUND(SUM("Shipping Cost")::numeric, 2)                  AS total_shipping_cost,
    COUNT(DISTINCT "Customer ID")                             AS total_customers,
    COUNT(DISTINCT "Country")                                 AS total_countries
FROM superstore;

SELECT
    "Year",
    ROUND(SUM("Sales")::numeric, 0)                      AS annual_sales,
    ROUND(SUM("Profit")::numeric, 0)                     AS annual_profit,
    ROUND((SUM("Profit")/SUM("Sales")*100)::numeric, 2)  AS profit_margin_pct,
    COUNT(DISTINCT "Order ID")                            AS total_orders,
    ROUND(SUM("Sales")::numeric, 0) - 
    LAG(ROUND(SUM("Sales")::numeric, 0)) 
    OVER (ORDER BY "Year")                                AS yoy_sales_growth
FROM superstore
GROUP BY "Year"
ORDER BY "Year";

SELECT
    "Category",
    ROUND(SUM("Sales")::numeric, 0)                      AS total_sales,
    ROUND(SUM("Profit")::numeric, 0)                     AS total_profit,
    ROUND((SUM("Profit")/SUM("Sales")*100)::numeric, 2)  AS profit_margin_pct,
    COUNT(DISTINCT "Order ID")                            AS total_orders,
    ROUND(AVG("Discount")::numeric*100, 1)               AS avg_discount_pct
FROM superstore
GROUP BY "Category"
ORDER BY total_profit DESC;