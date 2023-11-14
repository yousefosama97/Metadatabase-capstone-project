
CREATE TABLE Menu (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100),
    item_type VARCHAR(50)
);
CREATE TABLE CustomerDetails (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    contact_details VARCHAR(100)
);

CREATE TABLE StaffInformation (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_name VARCHAR(100),
    role VARCHAR(50),
    salary DECIMAL(10, 2)
);

CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	staff_id INT,
    booking_date DATE,
    table_number INT,
	FOREIGN KEY (customer_id) REFERENCES CustomerDetails(customer_id),
	FOREIGN KEY (staff_id) REFERENCES StaffInformation(staff_id)
);
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    staff_id INT,
    order_date DATE,
    quantity INT,
    total_cost DECIMAL(10, 2),
	FOREIGN KEY (customer_id) REFERENCES CustomerDetails(customer_id),
	FOREIGN KEY (staff_id) REFERENCES StaffInformation(staff_id)
);

ALTER TABLE Orders
ADD COLUMN item_id INT,
ADD CONSTRAINT fk_item_id
FOREIGN KEY (item_id) REFERENCES Menu(item_id);

CREATE TABLE OrderDeliveryStatus (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    delivery_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

