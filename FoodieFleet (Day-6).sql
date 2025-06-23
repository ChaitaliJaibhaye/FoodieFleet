use foodiefleet;

-- Top 3 Customers by Total Spending
SELECT 
    c.name AS customer_name,
    SUM(p.amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 3;

-- Restaurant-Wise Average Rating and Sales
SELECT 
    r.name AS restaurant_name,
    r.rating,
    SUM(p.amount) AS total_sales
FROM Restaurants r
JOIN Menu_Items m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.item_id = oi.item_id
JOIN Orders o ON oi.order_id = o.order_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY r.restaurant_id, r.name, r.rating
ORDER BY total_sales DESC;


-- Delivery Partner Performance
SELECT 
    d.name AS delivery_partner,
    COUNT(o.order_id) AS deliveries_made
FROM Delivery_Partners d
JOIN Orders o ON d.delivery_partner_id = o.delivery_partner_id
GROUP BY d.name
ORDER BY deliveries_made DESC;

-- Daily Order Count
SELECT 
    DATE(order_time) AS order_date,
    COUNT(*) AS order_count
FROM Orders
GROUP BY DATE(order_time)
ORDER BY order_date;

-- Most Popular Food Items
SELECT 
    m.item_name,
    SUM(oi.quantity) AS total_ordered
FROM Menu_Items m
JOIN Order_Items oi ON m.item_id = oi.item_id
GROUP BY m.item_name
ORDER BY total_ordered DESC
LIMIT 5;

-- Orders Paid via Cash
SELECT 
    o.order_id,
    c.name AS customer_name,
    p.amount,
    p.payment_method
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Payments p ON o.order_id = p.order_id
WHERE p.payment_method = 'Cash';

