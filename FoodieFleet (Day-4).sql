use foodiefleet;

--View: Customer Order Summary

CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.order_time,
    p.amount,
    p.payment_method,
    o.delivery_status
FROM 
    Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id;

SELECT * FROM CustomerOrderSummary WHERE customer_id = 1;

--View: Restaurant Sales Summary

CREATE VIEW RestaurantSalesSummary AS
SELECT 
    r.restaurant_id,
    r.name AS restaurant_name,
    SUM(p.amount) AS total_sales
FROM 
    Restaurants r
JOIN Menu_Items m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.item_id = oi.item_id
JOIN Orders o ON oi.order_id = o.order_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY r.restaurant_id, r.name;

SELECT * FROM RestaurantSalesSummary ORDER BY total_sales DESC;

--Total number of orders
SELECT COUNT(*) AS total_orders FROM Orders;

--Average payment amount
SELECT AVG(amount) AS average_payment FROM Payments;

--Highest and lowest order payment
SELECT 
    MAX(amount) AS highest_payment,
    MIN(amount) AS lowest_payment
FROM Payments;

--Number of items sold per restaurant
SELECT 
    r.name AS restaurant_name,
    SUM(oi.quantity) AS total_items_sold
FROM 
    Restaurants r
JOIN Menu_Items m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.item_id = oi.item_id
GROUP BY r.name;

--Find customers who placed orders worth more than the average payment
SELECT c.name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id
WHERE p.amount > (SELECT AVG(amount) FROM Payments);

--List items ordered in the most expensive order
SELECT m.item_name, oi.quantity
FROM Order_Items oi
JOIN Menu_Items m ON oi.item_id = m.item_id
WHERE oi.order_id = (
    SELECT order_id FROM Payments ORDER BY amount DESC LIMIT 1
);

--Restaurants with sales over ₹500
SELECT 
    r.name AS restaurant_name,
    SUM(p.amount) AS total_sales
FROM 
    Restaurants r
JOIN Menu_Items m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.item_id = oi.item_id
JOIN Orders o ON oi.order_id = o.order_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY r.name
HAVING SUM(p.amount) > 500;





