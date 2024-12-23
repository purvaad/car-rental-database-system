

CREATE TABLE Fall24_S003_T1_Rental_Location (
    Location_id INT PRIMARY KEY,
    Location_name VARCHAR(100) NOT NULL,
    State VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Zipcode VARCHAR(10) NOT NULL
);


CREATE TABLE Fall24_S003_T1_Cars (
    Car_id INT PRIMARY KEY,
    Make VARCHAR(50) NOT NULL,
    Rental_rate DECIMAL(10, 2) NOT NULL,
    Car_type VARCHAR(50) NOT NULL,
    Car_model VARCHAR(50) NOT NULL,
    Car_year INT NOT NULL,
    Location_id INT,  
    FOREIGN KEY (Location_id) REFERENCES Fall24_S003_T1_Rental_Location(Location_id)
);

CREATE TABLE Fall24_S003_T1_Employee (
    Employee_id INT PRIMARY KEY,
    Employee_name VARCHAR(50) NOT NULL,
    Employee_contact VARCHAR(50) NOT NULL,
    Employee_DOB DATE,
    Employee_gender VARCHAR(10) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Location_id INT,
    FOREIGN KEY (Location_id) REFERENCES Fall24_S003_T1_Rental_Location(Location_id)
);

CREATE TABLE Fall24_S003_T1_Maintenance (
    Maintenance_id INT PRIMARY KEY,
    Car_id INT,
    Issue VARCHAR(100) NOT NULL,
    Maintenance_date DATE NOT NULL,
    Maintenance_due_to_miles_covered NUMBER(1),  
    Maintenance_description VARCHAR(100),  
    FOREIGN KEY (Car_id) REFERENCES Fall24_S003_T1_Cars(Car_id)
);

CREATE TABLE Fall24_S003_T1_Customer (
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(50) NOT NULL,
    Customer_DOB DATE,
    Customer_gender VARCHAR(10),
    Contact VARCHAR(50),
    Email VARCHAR(100),
    Preferred_Car_Type VARCHAR(50),
    License_no VARCHAR(20) NOT NULL
);

CREATE TABLE Fall24_S003_T1_Feedback_about_Employee (
    Feedback_id INT PRIMARY KEY,
    Employee_id INT,
    Customer_id INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments VARCHAR(100),
    FOREIGN KEY (Employee_id) REFERENCES Fall24_S003_T1_Employee(Employee_id),
    FOREIGN KEY (Customer_id) REFERENCES Fall24_S003_T1_Customer(Customer_id)
);

CREATE TABLE Fall24_S003_T1_Feedback_about_Car (
    Feedback_id INT PRIMARY KEY,
    Car_id INT,
    Customer_id INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments VARCHAR(100),
    FOREIGN KEY (Car_id) REFERENCES Fall24_S003_T1_Cars(Car_id),
    FOREIGN KEY (Customer_id) REFERENCES Fall24_S003_T1_Customer(Customer_id)
);

CREATE TABLE Fall24_S003_T1_Feedback_by_Customer (
    Feedback_id INT PRIMARY KEY,
    Customer_id INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments VARCHAR(100),
    FOREIGN KEY (Customer_id) REFERENCES Fall24_S003_T1_Customer(Customer_id)
);

CREATE TABLE Fall24_S003_T1_Location_has_Car (
    Location_id INT NOT NULL,
    Car_id INT NOT NULL,
    Car_availability VARCHAR(20) NOT NULL CHECK (Car_availability IN ('Available', 'Rented', 'Maintenance', 'Reserved')),
    PRIMARY KEY (Location_id, Car_id),
    FOREIGN KEY (Location_id) REFERENCES Fall24_S003_T1_Rental_Location(Location_id),
    FOREIGN KEY (Car_id) REFERENCES Fall24_S003_T1_Cars(Car_id)
);

CREATE TABLE Fall24_S003_T1_Transaction_For_By (
    Car_id INT NOT NULL,  
    Customer_id INT NOT NULL,  
    Start_date DATE NOT NULL,  
    Duration INT NOT NULL,  
    End_date DATE,  
    Total_cost DECIMAL(10, 2) NOT NULL,  
    Payment_status VARCHAR(50) NOT NULL,  
    Payment_method VARCHAR(50) NOT NULL,  
    PRIMARY KEY (Car_id, Customer_id, Start_date),  
    FOREIGN KEY (Car_id) REFERENCES Fall24_S003_T1_Cars(Car_id),
    FOREIGN KEY (Customer_id) REFERENCES Fall24_S003_T1_Customer(Customer_id)
);
