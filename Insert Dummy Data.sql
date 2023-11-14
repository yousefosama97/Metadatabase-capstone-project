INSERT INTO Menu (item_name, item_type, menu_name, course_name) 
VALUES 
('Pasta Carbonara', 'Main Course', 'Pasta', 'Italian'),
('Caesar Salad', 'Starter', 'Salad', 'Appetizer'),
('Grilled Salmon', 'Main Course', 'Seafood', 'Entree'),
('Mushroom Risotto', 'Main Course', 'Risotto', 'Italian'),
('Chicken Satay', 'Starter', 'Skewers', 'Appetizer');
INSERT INTO CustomerDetails (customer_name, contact_details)
VALUES 
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com'),
('Diana Miller', 'diana@example.com');
INSERT INTO StaffInformation (staff_name, role, salary)
VALUES 
('John Doe', 'Manager', 50000.00),
('Jane Smith', 'Chef', 40000.00),
('David Johnson', 'Waiter', 30000.00);
INSERT INTO `bookings` (Booking_ID, Booking_Date, Table_Number, Customer_ID, staff_id)
VALUES
(1, '2022-10-10', 5, 1,1),
(2, '2022-11-12', 3, 3,1),
(3, '2022-10-11', 2, 2,1),
(4, '2022-10-13', 2, 1,1);
INSERT INTO Orders (customer_id, staff_id, order_date, quantity, total_cost, item_id)
VALUES 
(1, 1, '2023-01-15', 2, 25.00, 1),  -- Assuming item_id 1 is a Pasta dish
(2, 2, '2023-01-16', 3, 45.50, 2),  -- Assuming item_id 2 is a Salad
(3, 3, '2023-01-17', 1, 12.75, 3);  -- Assuming item_id 3 is a Grilled Salmon
INSERT INTO OrderDeliveryStatus (order_id, delivery_date, status)
VALUES 
(1, '2023-01-20', 'Delivered'),
(2, '2023-01-21', 'In transit'),
(3, '2023-01-22', 'Pending');
