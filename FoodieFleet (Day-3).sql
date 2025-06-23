use foodiefleet; 

--Total Sales per Restaurant

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
ORDER BY total_sales DESC;

--Most Ordered Food Item
SELECT 
    m.item_name,
    SUM(oi.quantity) AS total_ordered
FROM 
    Order_Items oi
JOIN Menu_Items m ON oi.item_id = m.item_id
GROUP BY m.item_name
ORDER BY total_ordered DESC
LIMIT 1;

--Customer Order History
SELECT 
    c.name AS customer_name,
    o.order_id,
    o.order_time,
    p.amount,
    p.payment_method,
    o.delivery_status
FROM 
    Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id
WHERE c.customer_id = 1;

--Top Delivery partner by number of orders

SELECT 
    d.name AS delivery_partner,
    COUNT(o.order_id) AS total_orders
FROM 
    Delivery_Partners d
JOIN Orders o ON d.delivery_partner_id = o.delivery_partner_id
GROUP BY d.name
ORDER BY total_orders DESC;



