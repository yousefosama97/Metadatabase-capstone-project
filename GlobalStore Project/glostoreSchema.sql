CREATE SCHEMA glostore;
USE glostore;

CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Name VARCHAR(255)
);

CREATE TABLE Addresses (
    Address_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Segment VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Country VARCHAR(255),
    Postal_Code INT,
    Market VARCHAR(255),
    Region VARCHAR(255),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Orders (
    Order_ID VARCHAR(75) PRIMARY KEY,
    Order_Date VARCHAR(75),
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Products (
    Product_ID VARCHAR(75)  PRIMARY KEY,
    Category VARCHAR(255),
    Sub_Category VARCHAR(255),
    Product_Name VARCHAR(255)
);


CREATE TABLE Order_Details (
    Order_ID  VARCHAR(75),
	Ship_Date VARCHAR(75),
    Ship_Mode VARCHAR(255),
    Shipping_Cost DECIMAL(10, 4),
    Product_ID VARCHAR(75),
    Sales DECIMAL(10, 4),
    Quantity INT,
    Discount DECIMAL(5, 4),
    Profit DECIMAL(10, 4),
    Order_Priority VARCHAR(255),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);
