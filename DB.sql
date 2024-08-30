--create database Cars
use Cars

-- Create Accounts table
CREATE TABLE ACCOUNTS (
    AccountID INT IDENTITY(1,1) PRIMARY KEY,
    AccountName NVARCHAR(50) NOT NULL,
    Role NVARCHAR(50) NOT NULL
);

-- Create Customers table
CREATE TABLE CUSTOMERS (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Birthdate DATE,
    CustomerName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    IdentityCard NVARCHAR(50),
    LicenceDate DATE,
    LicenceNumber NVARCHAR(50),
    Mobile NVARCHAR(15),
    Password NVARCHAR(100),
    AccountID int FOREIGN KEY REFERENCES Accounts(AccountID)
);

-- Create CarProducer table
CREATE TABLE CarProducer (
    ProducerID INT IDENTITY(1,1) PRIMARY KEY,
    Address NVARCHAR(100),
    Country NVARCHAR(50),
    ProducerName NVARCHAR(100) NOT NULL
);

-- Create Category table
CREATE TABLE CATEGORY (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL
);

-- Create Cars table
CREATE TABLE CARS (
    CarID INT IDENTITY(1,1) PRIMARY KEY,
    CarName NVARCHAR(100) NOT NULL,
    CarModelYear INT NOT NULL,
    Color NVARCHAR(50),
    Capacity INT,
    Description TEXT,
    ImageLink TEXT,
    ImportDate DATE,
    IsAvailable BIT DEFAULT 1,
    RatedStar INT,
    RentPrice DECIMAL(10, 2),
    Status NVARCHAR(50),
    Transmission INT,
    CategoryID int FOREIGN KEY  REFERENCES CATEGORY(CategoryID),
    ProducerID int FOREIGN KEY  REFERENCES CarProducer(ProducerID)
);

-- Create CAR_RENTAL table
CREATE TABLE CAR_RENTAL (
    CAR_RENTALID INT IDENTITY(1,1) PRIMARY KEY,
    PickupDate DATE NOT NULL,
    RentPrice DECIMAL(10, 2) NOT NULL,
    ReturnDate DATE,
    Status NVARCHAR(50) NOT NULL,
    CarID int FOREIGN KEY  REFERENCES Cars(CarID),
    CustomerID int FOREIGN KEY  REFERENCES Customers(CustomerID)
);

-- Create Reviews table
CREATE TABLE REVIEWS (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    Comment NVarchar(Max),
    ReviewStar INT NOT NULL CHECK (ReviewStar >= 1 AND ReviewStar <= 5),
    CustomerID int FOREIGN KEY  REFERENCES Customers(CustomerID),
    CarID int FOREIGN KEY  REFERENCES Cars(CarID)
);


-- Insert accounts into the Accounts table
INSERT INTO ACCOUNTS (AccountName, Role) VALUES
('admin', 'ADMIN'),
( 'user1', 'Customer'),
('jane_smith', 'Customer'),
( 'bob_johnson', 'Admin'),
('charlie_davis', 'Admin'),
('george_moore', 'Admin'),
('noah_anderson', 'Admin'),
( 'olivia_thomas', 'Customer'),
('Michael Dang', 'Customer'),
('Dang Trinh Anh Duy', 'Admin'),
('Dang Trinh Anh Duy (K18 HCM)', 'Admin');


-- Insert into Customer table
INSERT INTO CUSTOMERS (Birthdate, CustomerName, Email, IdentityCard, LicenceDate, LicenceNumber, Mobile, Password, AccountID) VALUES
('1985-07-08', 'John Doe', 'johndoe@example.com', 'ID12345', '2010-05-20', 'LN67890', '1234567890', 'password123', 2),
('1985-02-02', 'Jane Smith', 'jane.smith@example.com', 'ID23456', '2011-02-02', 'LN23456', '2345678901', 'password2', 4),
('1978-03-03', 'Bob Johnson', 'bob.johnson@example.com', 'ID34567', '2012-03-03', 'LN34567', '3456789012', 'password3', 6),
('1982-04-04', 'Alice Brown', 'alice.brown@example.com', 'ID45678', '2013-04-04', 'LN45678', '4567890123', 'password4', 8),
('1995-05-05', 'Charlie Davis', 'charlie.davis@example.com', 'ID56789', '2014-05-05', 'LN56789', '5678901234', 'password5', 5),
('1992-06-06', 'Emma Wilson', 'emma.wilson@example.com', 'ID67890', '2015-06-06', 'LN67890', '6789012345', 'password6', 1),
('1988-07-07', 'George Moore', 'george.moore@example.com', 'ID78901', '2016-07-07', 'LN78901', '7890123456', 'password7', 3),
(NULL, 'Michael Dang', 'michaeldang0104@gmail.com', NULL, NULL, NULL, NULL, NULL, 9),
(NULL, 'Dang Trinh Anh Duy', 'duydang1101@gmail.com', NULL, NULL, NULL, NULL, NULL, 10),
(NULL, 'Dang Trinh Anh Duy (K18 HCM)', 'duydtase183660@fpt.edu.vn', NULL, NULL, NULL, NULL, NULL, 11);


-- Insert into CarProducer table
INSERT INTO CarProducer(Address, Country, ProducerName) VALUES
('123 Main St', 'Japan', 'Toyota'),
('456 Elm St', 'Japan', 'Honda'),
('123 Toyota St', 'Japan', 'Toyota'),
('456 Ford Ave', 'USA', 'Ford'),
('789 Honda Blvd', 'Japan', 'Honda'),
('123 BMW Rd', 'Germany', 'BMW'),
('456 Mercedes Ln', 'Germany', 'Mercedes'),
('789 Audi Way', 'Germany', 'Audi'),
('123 Chevy St', 'USA', 'Chevrolet'),
('456 Nissan Ave', 'Japan', 'Nissan'),
('789 Hyundai Blvd', 'South Korea', 'Hyundai'),
('123 Kia Rd', 'South Korea', 'Kia');


-- Insert into Category table
INSERT INTO CATEGORY (CategoryName) VALUES
('Sedan'),
('SUV'),
('SUV'),
('Sedan'),
('Truck'),
('Coupe'),
('Convertible'),
('Hatchback'),
('Minivan'),
('Station Wagon'),
('Pickup Truck'),
('Sports Car');


-- Insert into Car table
INSERT INTO CARS (CarName, CarModelYear, Color, Capacity, Description, ImageLink, ImportDate, IsAvailable, RatedStar, RentPrice, Status, Transmission, CategoryID, ProducerID) VALUES
('Camry', 2022, 'Blue', 5, 'A comfortable sedan', 'https://i.redd.it/wx0w78g1hyi91.jpg', '2023-01-15', 1, 4, 160, 'Good', 1, 1, 1),
('Civic', 2021, 'Blue', 5, 'A compact car', 'https://i.redd.it/9f2p0jbkgi5c1.jpg', '2022-08-10', 1, 4, 40, 'Available', 1, 1, 2),
('Toyota Camry', 2020, 'White', 5, 'Comfortable sedan', 'https://i1-vnexpress.vnecdn.net/2022/03/15/toyotacamry2jpeg-1647331125.jpg?w=750&h=450&q=100&dpr=1&fit=crop&s=L-BB3hdAEjvqgmiGZntf1A', '2020-01-15', 1, 4, 70, 'Available', 1, 2, 1),
('Ford Explorer', 2019, 'Black', 7, 'Spacious SUV', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReMOo7bapXiX4_aOW7jZrw1n_vevcvl6oqvw&s', '2019-03-10', 1, 5, 90, 'Available', 1, 1, 2),
('Honda Civic', 2018, 'Blue', 5, 'Economical sedan', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7118TLAFhxL4tZgPPbytVj6mO6n4gJfinJQ&s', '2018-06-22', 1, 3, 60, 'Available', 1, 2, 3),
('BMW X5', 2021, 'Gray', 5, 'Luxury SUV', 'https://cdn.dealeraccelerate.com/farland/1/291/9737/1920x1440/2016-bmw-x5-awd-4dr-xdrive50i', '2021-07-12', 1, 5, 120, 'Available', 1, 1, 4),
('Mercedes C-Class', 2020, 'Silver', 5, 'Luxury sedan', 'https://upload.wikimedia.org/wikipedia/commons/5/52/Mercedes-Benz_C_200_Avantgarde_%28W_205%29_%E2%80%93_Frontansicht%2C_26._April_2014%2C_D%C3%BCsseldorf.jpg', '2020-09-18', 1, 5, 110, 'Available', 1, 2, 5),
('Audi Q7', 2019, 'Red', 7, 'Luxury SUV', 'https://i.redd.it/kb8iqsbjaxr21.jpg', '2019-11-25', 1, 5, 130, 'Available', 1, 1, 6),
('Chevrolet Silverado', 2018, 'Black', 3, 'Powerful truck', 'https://vehicle-images.dealerinspire.com/8c96-110006886/3GCPABEK4RG101648/d75c55c08a5437f6c5d2f1ff1d6b0a20.jpg', '2018-12-15', 1, 4, 100, 'Available', 1, 3, 7),
('Nissan Altima', 2017, 'White', 5, 'Reliable sedan', 'https://di-uploads-pod27.dealerinspire.com/cbsqualitycars/uploads/2020/11/Used-Nissan-Altima-2015-Nissan-Altima-front.jpg', '2017-08-30', 1, 3, 50, 'Available', 1, 2, 8),
('Hyundai Sonata', 2016, 'Gray', 5, 'Comfortable sedan', 'https://hips.hearstapps.com/autoweek/assets/s3fs-public/2019-10/2020-hyundai-sonata-160851.jpg', '2016-05-20', 1, 3, 55, 'Available', 1, 2, 9),
('Kia Sorento', 2019, 'Blue', 7, 'Spacious SUV', 'https://www.chicagoautoshow.com/assets/1/7/Sorento-SX.png', '2019-10-05', 1, 4, 85, 'Available', 1, 1, 10),
('Vios', 2023, 'Red', 5, 'fsdfdfds', 'https://imgcdn.zigwheels.ph/large/gallery/exterior/30/1943/toyota-vios-front-side-view-752875.jpg', '2024-07-12', 0, NULL, 100.2, 'Good', 0, 3, 2),
('Toyota Camry', 2020, 'White', 5, 'Best sedan', 'https://i.ytimg.com/vi/OBFEG-LiJyU/maxresdefault.jpg', '2023-10-26', 0, NULL, 70, 'Available', 1, 2, 1),
('Audi Q7', 2019, 'Red', 7, 'Luxury SUV', 'https://i.redd.it/kb8iqsbjaxr21.jpg', '2021-10-25', 0, NULL, 130, 'Available', 1, 1, 6),
('Civic', 2023, 'Black', 5, 'Bla bla bla bla', 'asfs', '2024-05-16', 0, NULL, 110, 'Good', 0, 4, 2);

-- Insert into CAR_RENTAL table
INSERT INTO CAR_RENTAL (PickupDate, RentPrice, ReturnDate, Status, CarID, CustomerID) VALUES
('2024-07-14', 730, '2024-07-31', 'ok', 1, 3),
('2024-07-17', 50, '2024-07-18', 'In payment', 1, 3),
('2024-07-14', 0, '2024-07-14', 'ok', 2, 3),
('2023-02-05', 450, '2023-02-10', 'Returned', 2, 3),
('2024-07-17', 120, '2024-07-20', 'Rented', 2, 3);

-- Insert into Review table
-- Insert reviews into the Reviews table
INSERT INTO REVIEWS (Comment, ReviewStar, CustomerID, CarID) VALUES
('abc', 4, 1, 2),
('good', 4, 3, 2),
('very good', 5, 1, 3),
('Luxury at its best', 5, 4, 4),
('poor', 1, 1, 5),
('Top-notch sedan, very comfortable', 5, 5, 5),
('Great SUV, very luxurious', 5, 6, 6),
('Powerful truck, great performance', 4, 7, 7);

