SELECT
    "Region",
    ROUND(SUM("Sales")::numeric, 0)                      AS total_sales,
    ROUND(SUM("Profit")::numeric, 0)                     AS total_profit,
    ROUND((SUM("Profit")/SUM("Sales")*100)::numeric, 2)  AS profit_margin_pct,
    COUNT(DISTINCT "Order ID")                            AS total_orders,
    ROUND(AVG("Discount")::numeric*100, 1)               AS avg_discount_pct
FROM superstore
GROUP BY "Region"
ORDER BY total_profit DESC;


SELECT
    "Category",
    "Sub-Category",
    ROUND(SUM("Sales")::numeric, 0)                      AS total_sales,
    ROUND(SUM("Profit")::numeric, 0)                     AS total_profit,
    ROUND((SUM("Profit")/SUM("Sales")*100)::numeric, 2)  AS profit_margin_pct,
    COUNT(DISTINCT "Order ID")                            AS total_orders,
    ROUND(AVG("Discount")::numeric*100, 1)               AS avg_discount_pct
FROM superstore
GROUP BY "Category", "Sub-Category"
ORDER BY total_profit DESC;

SELECT
    "Month_Year",
    "Year",
    ROUND(SUM("Sales")::numeric, 0)                      AS monthly_sales,
    ROUND(SUM("Profit")::numeric, 0)                     AS monthly_profit,
    COUNT(DISTINCT "Order ID")                            AS monthly_orders
FROM superstore
GROUP BY "Month_Year", "Year"
ORDER BY "Month_Year";


SELECT
    "Product Name",
    "Category",
    "Sub-Category",
    ROUND(SUM("Sales")::numeric, 0)                      AS total_revenue,
    ROUND(SUM("Profit")::numeric, 0)                     AS total_profit,
    ROUND((SUM("Profit")/SUM("Sales")*100)::numeric, 2)  AS profit_margin_pct,
    SUM("Quantity")                                       AS total_units_sold
FROM superstore
GROUP BY "Product Name", "Category", "Sub-Category"
ORDER BY total_profit DESC;
