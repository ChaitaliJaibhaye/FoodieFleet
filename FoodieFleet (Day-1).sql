create DATABASE FoodieFleet;
USE	FoodieFleet;

create table Customers(
	customer_id int primary key,
	name varchar(50),
	phone varchar(15),
	address text
);

create table restaurants(
	restaurant_id int primary key,
    name varchar(100),
    cuisine varchar(50),
    location varchar(100),
    rating decimal(2,1)
);

create table menu_items(
	item_id int primary key,
    restaurant_id int,
    item_name varchar(100),
    price decimal(6,2),
    foreign key(restaurant_id) references restaurants(restaurant_id)
);

create table orders(
	order_id int primary key,
    customer_id int,
    order_time datetime,
    delivery_status varchar(20),
    delivery_partner_id int,
    foreign key (customer_id) references Customers(customer_id)
);

create table order_items(
	order_item_id int primary key,
    order_id int,
    item_id int,
    quantity int,
    foreign key (order_id) references orders(order_id),
    foreign key (item_id) references menu_items(item_id)
);

create table delivery_partners(
	delivery_partner_id int primary key,
    name varchar(50),
    phone varchar(15),
    vehicle_type varchar(20)
);

create table payments(
	payment_id int primary key,
    order_id int,
    amount decimal(8,2),
    payment_method varchar(30),
    payment_status varchar(20),
    foreign key (order_id) references orders(order_id)
);

insert into customers (customer_id, name, phone, address) values
(1, 'Anika Sharma', '9876543210', 'Mumbai'),
(2, 'Ravi Mehta', '9123456780', 'Delhi'),
(3, 'Sara Khan', '9001234567', 'Bangalore');

insert into restaurants (restaurant_id, name, cuisine, location, rating) values
(1, 'Spicy Bite', 'Indian', 'Mumbai', 4.3),
(2, 'Pasta Palace', 'Italian', 'Delhi', 4.5),
(3, 'Dragon Wok', 'Chinese', 'Bangalore', 4.1);



