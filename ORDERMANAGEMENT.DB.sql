CREATE DATABASE OrderManagementDB;
USE OrderManagementDB;
CREATE TABLE Users (
    userId INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(10) CHECK(role IN ('Admin', 'User')) NOT NULL
);
INSERT INTO Users (Username, Password, Role)
VALUES ('admin1', 'admin@123', 'Admin');
DROP TABLE Users;


create table Users(

UserId int Primary key Identity(1,1),
Username nvarchar(100) Not null,
[Password] Nvarchar(100) Not Null,
[Role] Nvarchar(100) Not Null Check ([Role] IN ('Admin','User'))
);

create table Product (
ProductId int Primary key Identity(1,1),
ProductName Nvarchar(100) Not Null,
Description Nvarchar(200),
Price Decimal(10,2) Not Null,
QuantityInStock int not null,
Type NVARCHAR(50) NOT NULL CHECK (Type IN ('Electronics', 'Clothing'))
);

CREATE TABLE Electronics (
    ProductId INT PRIMARY KEY,
    Brand NVARCHAR(100),
    WarrantyPeriod INT,
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

create table Clothing(
ProductId int primary key,
Size nvarchar(100),
Color nvarchar(50),
FOREIGN KEY (ProductId) references Product(ProductId)
);

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE OrderDetails (
    OrderDetailId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

INSERT INTO Users (Username, Password, Role)
VALUES ('admin1', 'admin@123', 'Admin');

INSERT INTO Product (ProductName, Description, Price, QuantityInStock, Type)
VALUES ('Laptop', 'High-end gaming laptop', 1500.00, 10, 'Electronics');

INSERT INTO Electronics (ProductId, Brand, WarrantyPeriod)
VALUES (SCOPE_IDENTITY(), 'ASUS', 24);

select * from Clothing
ALTER TABLE Clothing ADD Quantity INT NOT NULL DEFAULT 1;
select * from Product
select * from users
select * from Orders