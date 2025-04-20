-- Question 1: Converting to 1NF
-- Split the original ProductDetail table into two tables to eliminate multiple values in Products column

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    PRIMARY KEY (OrderID, Product)
);

-- Populate Orders table with unique order-customer combinations
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Populate OrderProducts with individual product entries per order
INSERT INTO OrderProducts (OrderID, Product) VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Tablet'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Phone');

-- Question 2: Converting to 2NF
-- Create separate tables to remove partial dependencies

CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT, 
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY(OrderID) REFERENCES Customers(OrderID)
);

-- Populate Customers table
INSERT INTO Customers (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Populate OrderDetails with product and quantity information
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES 
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
