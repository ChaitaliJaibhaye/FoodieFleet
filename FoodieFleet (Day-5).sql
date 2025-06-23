use foodiefleet;

ALTER TABLE Customers
MODIFY phone VARCHAR(15) UNIQUE NOT NULL;

ALTER TABLE Delivery_Partners
MODIFY phone VARCHAR(15) UNIQUE NOT NULL;

ALTER TABLE Restaurants
ADD CONSTRAINT chk_rating CHECK (rating >= 0 AND rating <= 5);

ALTER TABLE Menu_Items
ADD CONSTRAINT chk_price CHECK (price >= 0);

ALTER TABLE Orders
MODIFY delivery_status VARCHAR(20) DEFAULT 'Pending';

ALTER TABLE Order_Items
ADD CONSTRAINT chk_quantity CHECK (quantity > 0);

-- Fail because of negative price
INSERT INTO Menu_Items (item_id, restaurant_id, item_name, price)
VALUES (10, 1, 'Fake Dish', -100);

