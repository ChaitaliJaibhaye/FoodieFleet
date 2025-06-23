use foodiefleet;

INSERT INTO Restaurants (restaurant_id, name, cuisine, location, rating) VALUES
(1, 'Spicy Bite', 'Indian', 'Mumbai', 4.3),
(2, 'Pasta Palace', 'Italian', 'Delhi', 4.5),
(3, 'Dragon Wok', 'Chinese', 'Bangalore', 4.1);

insert into menu_items (item_id, restaurant_id, item_name, price) values
(1,2,'Paneer Butter Masala', 220.00),
(2,1,'Veg Biryani', 180.00),
(3,2,'Margherita Pizza', 250.00),
(4,2,'Pasta Alfredo' ,270.00),
(5,3,'Veg Noodles', 160.00),
(6,3,'Spring Rolla', 140.00);

insert into delivery_partners (delivery_partner_id, name, phone, vehicle_type) values
(1,'Amit Dubey', '8888888888','Bike'),
(2,'Jyoti Rane', '9999999999','Scooter');

insert into orders (order_id, customer_id, order_time, delivery_status, delivery_partner_id) values
(101,1,'2025-06-22 13:00:00', 'Delivered', 1),
(102,2,'2025-06-22 14:15:00', 'Pending' ,2),
(103,3,'2025-06-22 15:30:00', 'Delivered' ,1);

insert into order_items(order_item_id, order_id, item_id, quantity) values
(1, 101, 1, 1),
(2, 101, 2, 2),
(3, 102, 3, 1),
(4, 103, 4, 1),
(5, 103, 5, 1);

insert into payments (payment_id, order_id, amount, payment_method, payment_status) values
(1, 101, 620.00, 'UPI' ,'Success'),
(2, 102, 250.00, 'Cash', 'Pending'),
(3, 103, 430.00, 'Card', 'Success');




