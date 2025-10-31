
-- ============================================
-- mehank.sql - E-Commerce Database Structure & Data
-- ============================================

-- DROP TABLES IF EXISTS (Order matters due to FK constraints)
IF OBJECT_ID('OrderDetails', 'U') IS NOT NULL DROP TABLE OrderDetails;
IF OBJECT_ID('Reviews', 'U') IS NOT NULL DROP TABLE Reviews;
IF OBJECT_ID('Shipping', 'U') IS NOT NULL DROP TABLE Shipping;
IF OBJECT_ID('Discounts', 'U') IS NOT NULL DROP TABLE Discounts;
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Products', 'U') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID('Categories', 'U') IS NOT NULL DROP TABLE Categories;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;

-- Create Tables
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE NOT NULL
);

CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(MAX)
);

CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT UNIQUE FOREIGN KEY REFERENCES Orders(OrderID),
    ShipDate DATE,
    DeliveryDate DATE
);

CREATE TABLE Discounts (
    DiscountID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    DiscountAmount DECIMAL(6,2) NOT NULL,
    DiscountType NVARCHAR(20) CHECK (DiscountType IN ('Flat', 'Percentage')) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

-- Insert Data for Categories
INSERT INTO Categories (CategoryName) VALUES
('Electronics'), ('Books'), ('Clothing'), ('Home & Kitchen'), ('Sports & Outdoors'),
('Beauty & Personal Care'), ('Toys & Games'), ('Grocery'), ('Automotive'),
('Health & Wellness'), ('Office Supplies'), ('Pet Supplies');

-- Insert Data for Products
INSERT INTO Products (Name, Price, StockQuantity, CategoryID) VALUES
('Wireless Earbuds', 59.99, 50, 1),
('Science Fiction Book', 18.49, 120, 2),
('Men’s T-Shirt', 12.99, 200, 3),
('Blender Mixer', 89.00, 40, 4),
('Camping Tent', 149.99, 15, 5),
('Face Moisturizer', 22.00, 85, 6),
('Board Game', 35.99, 60, 7),
('Organic Pasta', 4.99, 150, 8),
('Car Vacuum Cleaner', 39.90, 30, 9),
('Vitamins Supplement', 19.99, 75, 10),
('Notebook Pack', 8.99, 300, 11),
('Dog Food (5kg)', 26.50, 50, 12),
('Smartwatch', 199.99, 20, 1),
('Cookbook', 25.00, 95, 2),
('Women’s Jeans', 39.99, 120, 3);

-- Insert Data for Customers
INSERT INTO Customers (Name, Email) VALUES
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Smith', 'bob.smith@example.com'),
('Charlie Brown', 'charlie.brown@example.com'),
('Diana Prince', 'diana.prince@example.com'),
('Ethan Clark', 'ethan.clark@example.com'),
('Fiona Davis', 'fiona.davis@example.com'),
('George Miller', 'george.miller@example.com'),
('Hannah Lee', 'hannah.lee@example.com'),
('Ivan Martinez', 'ivan.martinez@example.com'),
('Julia Roberts', 'julia.roberts@example.com');

-- Insert 50 Orders
INSERT INTO Orders (CustomerID, OrderDate) VALUES (9, '2025-05-23');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (8, '2025-06-03');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (6, '2025-06-24');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (7, '2025-06-25');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (3, '2025-05-18');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (3, '2025-05-27');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (7, '2025-05-20');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (10, '2025-06-02');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (7, '2025-07-07');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (5, '2025-05-17');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (1, '2025-07-11');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (6, '2025-07-01');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (3, '2025-06-13');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (8, '2025-05-24');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (1, '2025-06-21');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (7, '2025-05-27');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (4, '2025-07-06');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (7, '2025-06-11');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (2, '2025-06-03');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (6, '2025-07-10');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (4, '2025-06-04');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (10, '2025-07-12');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (1, '2025-05-16');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (9, '2025-06-21');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (8, '2025-07-11');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (6, '2025-05-26');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (6, '2025-07-03');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (2, '2025-05-17');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (5, '2025-06-23');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (6, '2025-06-12');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (9, '2025-06-19');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (8, '2025-06-18');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (4, '2025-06-28');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (7, '2025-05-31');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (1, '2025-06-30');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (10, '2025-06-06');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (6, '2025-05-16');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (2, '2025-06-16');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (1, '2025-06-21');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (3, '2025-06-16');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (9, '2025-06-12');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (2, '2025-05-14');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (10, '2025-06-12');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (4, '2025-07-04');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (2, '2025-07-03');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (8, '2025-06-10');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (4, '2025-06-17');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (7, '2025-07-12');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (6, '2025-07-11');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (6, '2025-06-03');

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (1, 9, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (1, 7, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (2, 3, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (2, 12, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (2, 14, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (3, 6, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (3, 7, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (3, 4, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (4, 12, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (5, 10, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (5, 15, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (5, 7, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (6, 11, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (6, 13, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (6, 15, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (7, 1, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (7, 15, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (8, 15, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (9, 11, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (10, 1, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (11, 12, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (12, 15, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (12, 5, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (13, 15, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (13, 9, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (13, 3, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (14, 9, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (14, 6, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (15, 15, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (15, 14, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (16, 2, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (16, 8, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (17, 11, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (18, 8, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (18, 13, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (19, 9, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (19, 5, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (20, 12, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (21, 11, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (22, 11, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (22, 15, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (23, 2, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (23, 6, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (24, 9, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (24, 15, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (24, 6, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (25, 7, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (25, 4, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (25, 6, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (26, 5, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (26, 9, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (27, 8, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (28, 2, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (28, 5, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (28, 9, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (29, 8, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (29, 15, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (30, 4, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (30, 7, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (30, 6, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (31, 1, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (32, 5, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (32, 2, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (32, 7, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (33, 2, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (33, 15, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (34, 12, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (35, 13, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (35, 8, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (35, 1, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (36, 6, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (36, 3, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (37, 13, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (37, 8, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (38, 8, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (38, 2, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (39, 4, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (39, 5, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (40, 5, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (41, 7, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (41, 6, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (41, 10, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (42, 5, 4);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (42, 1, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (42, 3, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (43, 7, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (43, 12, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (44, 15, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (44, 2, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (45, 12, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (45, 11, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (45, 15, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (46, 6, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (46, 7, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (46, 9, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (47, 1, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (48, 9, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (48, 2, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (48, 5, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (49, 14, 5);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (49, 1, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (49, 3, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (50, 11, 3);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES (50, 3, 1);

-- Insert Shipping Info
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (1, '2025-07-11', '2025-07-16');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (2, '2025-06-07', '2025-06-09');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (3, '2025-06-23', '2025-06-28');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (4, '2025-07-10', '2025-07-12');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (5, '2025-07-02', '2025-07-08');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (6, '2025-05-25', '2025-06-01');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (7, '2025-06-24', '2025-06-28');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (8, '2025-07-08', '2025-07-11');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (9, '2025-05-21', '2025-05-25');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (10, '2025-06-23', '2025-06-27');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (11, '2025-06-12', '2025-06-18');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (12, '2025-06-15', '2025-06-21');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (13, '2025-05-25', '2025-06-01');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (14, '2025-07-04', '2025-07-08');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (15, '2025-07-10', '2025-07-13');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (16, '2025-07-14', '2025-07-21');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (17, '2025-06-21', '2025-06-23');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (18, '2025-07-07', '2025-07-12');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (19, '2025-06-10', '2025-06-13');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (20, '2025-05-21', '2025-05-25');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (21, '2025-07-07', '2025-07-09');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (22, '2025-05-30', '2025-06-04');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (23, '2025-06-08', '2025-06-11');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (24, '2025-06-28', '2025-07-02');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (25, '2025-07-03', '2025-07-07');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (26, '2025-05-24', '2025-05-29');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (27, '2025-06-06', '2025-06-08');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (28, '2025-06-01', '2025-06-08');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (29, '2025-06-08', '2025-06-14');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (30, '2025-05-29', '2025-06-03');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (31, '2025-06-02', '2025-06-04');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (32, '2025-06-11', '2025-06-14');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (33, '2025-06-12', '2025-06-15');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (34, '2025-05-26', '2025-05-31');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (35, '2025-06-16', '2025-06-23');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (36, '2025-06-21', '2025-06-23');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (37, '2025-06-15', '2025-06-19');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (38, '2025-07-02', '2025-07-07');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (39, '2025-07-14', '2025-07-20');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (40, '2025-06-27', '2025-07-01');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (41, '2025-06-22', '2025-06-29');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (42, '2025-07-13', '2025-07-18');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (43, '2025-07-10', '2025-07-16');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (44, '2025-06-04', '2025-06-09');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (45, '2025-06-13', '2025-06-15');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (46, '2025-06-29', '2025-07-03');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (47, '2025-05-27', '2025-06-03');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (48, '2025-06-06', '2025-06-13');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (49, '2025-07-02', '2025-07-06');
INSERT INTO Shipping (OrderID, ShipDate, DeliveryDate) VALUES (50, '2025-05-31', '2025-06-03');

-- Insert 20 Product Reviews
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (3, 8, 5, 'Not great, could be better.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (14, 9, 1, 'Not great, could be better.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (15, 3, 4, 'Disappointed with the product.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (10, 8, 2, 'It was okay, met expectations.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (4, 5, 2, 'It was okay, met expectations.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (15, 7, 5, 'Disappointed with the product.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (1, 2, 2, 'It was okay, met expectations.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (13, 5, 5, 'It was okay, met expectations.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (13, 3, 2, 'Not great, could be better.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (4, 9, 2, 'Very good, satisfied.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (15, 6, 1, 'Not great, could be better.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (13, 9, 4, 'Disappointed with the product.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (13, 10, 5, 'It was okay, met expectations.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (6, 7, 4, 'Disappointed with the product.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (15, 8, 2, 'Not great, could be better.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (12, 8, 4, 'Disappointed with the product.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (13, 9, 2, 'Not great, could be better.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (10, 5, 4, 'Disappointed with the product.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (7, 2, 4, 'Disappointed with the product.');
INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment) VALUES (4, 5, 3, 'It was okay, met expectations.');

-- Insert Discounts for 10 Products
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (10, 11.62, 'Flat', '2025-07-11', '2025-08-10');
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (14, 15.19, 'Percentage', '2025-07-05', '2025-08-04');
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (1, 34.13, 'Flat', '2025-07-04', '2025-08-03');
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (12, 27.27, 'Flat', '2025-07-07', '2025-08-06');
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (11, 23.58, 'Flat', '2025-07-11', '2025-08-10');
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (6, 18.45, 'Percentage', '2025-07-03', '2025-08-02');
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (7, 24.19, 'Percentage', '2025-07-03', '2025-08-02');
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (4, 32.45, 'Flat', '2025-07-03', '2025-08-02');
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (15, 19.77, 'Flat', '2025-07-04', '2025-08-03');
INSERT INTO Discounts (ProductID, DiscountAmount, DiscountType, StartDate, EndDate)
VALUES (8, 49.54, 'Flat', '2025-07-08', '2025-08-07');

SELECT p.Name, d.DiscountAmount
FROM Discounts d
JOIN Products p ON d.ProductID = p.ProductID
WHERE d.DiscountAmount > 20;
