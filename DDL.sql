							
/*							
							SQL Project Name : Inventory Management Systems 
							    Trainee Name : Md. Arman Hossain   
						    	  Trainee ID : 1266043       
								    Batch ID : ESAD-CS/PNTL-M/49/01 

																															*/
--=====================================   START OF DDL SCRIPT   =======================================--


USE MASTER
GO

DROP DATABASE IF EXISTS dbInventoryManagement
GO

CREATE DATABASE dbInventoryManagement
GO

/*
CREATE DATABASE dbInventoryManagement
ON
(
	NAME= dbIventoryManagement_data,
	FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbIventoryManagement_data.mdf',
	SIZE=50MB,
	MAXSIZE=100MB,
	FILEGROWTH=10MB
)
LOG ON
(
NAME= dbIventoryManagement_log,
	FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbIventoryManagement_log.ldf',
	SIZE=15MB,
	MAXSIZE=30MB,
	FILEGROWTH=5%
)
GO
*/

USE dbInventoryManagement
GO


CREATE TABLE tblCustomers
(
	CustomerId INT PRIMARY KEY,
	CustomerFName NVARCHAR(20) NOT NULL,
	CustomerLName NVARCHAR(20)  NULL,
	CustomerAddress VARCHAR(100) NULL,
	City VARCHAR(40) NULL ,
	Country VARCHAR(50) NULL,
	PhoneNo VARCHAR(20) CHECK(PhoneNo like '+%[0-9]') DEFAULT NULL,
	Email VARCHAR(80) NULL
)
GO

CREATE TABLE tblEmployees
(
	EmployeeId INT PRIMARY KEY,
	EmpName NVARCHAR(50) NOT NULL,
	EmpAddress VARCHAR(100) NOT NULL,
	Empcity VARCHAR(20) NOT NULL,
	Empcountry VARCHAR(30) NULL,
	Birthdate DATE  NOT NULL,
	Hiredate DATE NOT NULL,
	NID CHAR(13) NOT NULL UNIQUE CHECK(NID LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	EmpImage  VARCHAR(MAX) NOT NULL DEFAULT 'N/A',
	Phone VARCHAR(20) NOT NULL,
	Email VARCHAR(50) NULL
)
GO

CREATE TABLE tblSuppliers
(
	SupplierId INT PRIMARY KEY IDENTITY,
	CompanyName VARCHAR(50) NOT NULL,
	ContactName VARCHAR(30) NULL,
	ContactTitle VARCHAR(30) NULL,
	SupAddress VARCHAR(100) NULL,
	City VARCHAR(20) NULL,
	Country VARCHAR(20) NULL,
	Phone  VARCHAR(20) NOT NULL DEFAULT 'N/A',
)
GO

CREATE TABLE tblCategory
(
	id INT IDENTITY PRIMARY KEY,
	CategoryId UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	CategoryName VARCHAR(50) NOT NULL
)
GO

CREATE TABLE tblProducts
(
	ProductId INT PRIMARY KEY,
	ProductName VARCHAR(100),
	UnitPrice MONEY,
	Quantity INT DEFAULT 0,
	Category INT REFERENCES tblCategory(Id),
	ProductPicture VARBINARY(MAX) NULL
	

)
GO



CREATE TABLE tblShippers
(
	ShipperId INT IDENTITY PRIMARY KEY,
	CompanyName VARCHAR(50) NOT NULL,
	Phone NVARCHAR(20)
)
GO

CREATE TABLE tblOrders
(
	OrderId INT PRIMARY KEY,
	CustomerId INT REFERENCES tblCustomers(Customerid),
	EmployeeId INT REFERENCES tblEmployees(Employeeid),
	OrderDate DATE NOT NULL,
	ShipDate DATE NOT NULL DEFAULT GETDATE(),
	ShippingCompany INT REFERENCES tblShippers(Shipperid),
	Freight MONEY NULL,
)
GO

CREATE TABLE tblOrdersDetails
(
	OrderId INT REFERENCES tblOrders(Orderid),
	ProductId INT REFERENCES tblProducts(ProductId),
	UnitPrice FLOAT NOT NULL,
	Quantity INT NOT NULL,
	Discount FLOAT NOT NULL DEFAULT 0,
	DiscountedAmount AS UnitPrice*Quantity*Discount,
	PRIMARY KEY(OrderId,ProductId)
)
GO

CREATE TABLE tblInventory
(
	InventoryId INT IDENTITY PRIMARY KEY,
	SupplierId INT REFERENCES tblSuppliers(Supplierid),
	Quantity INT NOT NULL DEFAULT 0,
	PurchaseDate DATE NOT NULL,
	StockOutDate DATE NULL,
	Category INT REFERENCES tblCategory(Id),
	Available BIT NOT NULL,
	PId INT REFERENCES tblProducts(productid)
)
GO

CREATE TABLE tblCity
(
	CityId INT NOT NULL UNIQUE,
	CityName VARCHAR(20) NOT NULL
)
GO

--============     ALTER TABLE (ADD, DELETE COLUMN, DROP COLUMN)   ===============--

-- ADD COLUMN TO A EXISTING TABLE 
ALTER TABLE tblcity
ADD Zipcode VARCHAR(10)
GO
--DELETE COLUMN FROM A EXISTING TABLE
ALTER TABLE tblcity
DROP COLUMN ZipCode
GO

--DROP A TABLE
IF OBJECT_ID('tblcity') IS NOT NULL
DROP TABLE tblCity
GO



						-- CREATING INDEX, VIEW, STORED PROCEDURE, FUNTIONS, TRIGGERS ON THE TABLE CREATE BEFORE --


--==================================================   001 INDEX    ======================================================--



--CREATING A NON-CLUSTERED INDEX FOR CUSTOMER TABLE
CREATE UNIQUE NONCLUSTERED INDEX IX_Customer
ON tblCustomers(CUSTOMERID)
GO
--AS CLUSTERED INDEX AUTOMETICALLY CREATED FOR PRIMARY KEY COLUMN, I CAN'T CREATED IT. BECAUSE ALL TABLE HOLD A PRIMARY KEY COLUMN.


--==================================================   002 VIEW   ====================================================--


--Create a view for update, insert and delete data from base table
CREATE VIEW V_tblSuppliers
AS
SELECT * FROM tblSuppliers
GO

--Inserting data using view
INSERT INTO V_tblSuppliers VALUES
		('ACER','MR.RAHIM','Manager','17/AC','KUALA LAMPUR','MALAYSIA',DEFAULT)
GO

--as suppliers is referenced to others table, we can not delete it using view. but I write the syntax of deleting data using view
DELETE FROM V_tblSuppliers
WHERE CompanyName='Dell'
GO

--Create a view to find out the customers who have ordered more the 5000 tk

CREATE VIEW V_tblOrdersDetails
WITH ENCRYPTION
AS
SELECT TOP 5 PERCENT OD.OrderId,OD.ProductId,O.CustomerId,OD.Quantity,OD.UnitPrice 
FROM tblOrdersDetails OD
JOIN tblOrders O ON OD.OrderId=O.OrderId
WHERE (UnitPrice*Quantity) >=5000
WITH CHECK OPTION
GO


--==============================================     003 STORED PROCEDURE    =======================================================--



--A STORED PROCEDURE FOR QUERY  DATA

CREATE PROC sp_tblCustomers
WITH ENCRYPTION
AS
SELECT * FROM tblCustomers
WHERE City='Dhaka'
GO

--A Stored Procedure for inserting DATA
CREATE PROC sp_InsertCustomers
						@customerid INT,
						@customerFname VARCHAR(20),
						@customerLname VARCHAR(20)=NULL,
						@address VARCHAR(50)=NULL,
						@city VARCHAR(20),
						@country VARCHAR(20),
						@phoneNo VARCHAR(20),
						@email VARCHAR(50)
AS
BEGIN
	INSERT INTO tblCustomers(CustomerId,CustomerFName,CustomerLName,CustomerAddress,City,Country,PhoneNo,Email)
	VALUES(@customerid,@customerFname,@customerLname,@address,@city,@country,@phoneNo,@email)
END
GO

--A Stored procedure for deleting data 
CREATE PROC sp_deleteCustomers
						@customerFname VARCHAR(20)
AS 
	DELETE FROM tblCustomers WHERE CustomerFName=@customerFname
GO

--A Stored procedure for inserting data with return values
CREATE PROC sp_InsertEmployeesWithReturn
						@employeeid INT,
						@empName VARCHAR(20),
						@empAddress VARCHAR(50),
						@city VARCHAR(20),
						@country VARCHAR(20),
						@birthdate DATE,
						@hiredate DATE,
						@NID CHAR(13),
						@empImage VARCHAR(MAX)='N/A',
						@phone VARCHAR(20),
						@email VARCHAR(50)=NULL
AS
DECLARE @id INT 
INSERT INTO tblEmployees VALUES(@employeeid,@empName,@empAddress,@city,@country,@birthdate,@hiredate,@NID,@empImage,@phone,@email)
SELECT @id=IDENT_CURRENT('tblEmployees')
RETURN @id
GO


--test with data insert

DECLARE @id INT
EXEC @id= sp_InsertEmployeesWithReturn 208,'MD. KALAM','BADDA','DHAKA','BANGLADESH','1995-02-10','2015-10-15','1245367895412','N/A','01770000','kalam@gmail.com'
PRINT 'New product inserted with Id : '+STR(@id)
GO

--A Stored procedure for inserting data with output parameter
CREATE PROC sp_InsertEmployeesWithOutPutParameter
						@employeeid INT,
						@empName VARCHAR(20),
						@empAddress VARCHAR(50),
						@city VARCHAR(20),
						@country VARCHAR(20),
						@birthdate DATE,
						@hiredate DATE,
						@NID CHAR(13),
						@empImage VARCHAR(MAX)='N/A',
						@phone VARCHAR(20),
						@email VARCHAR(50)=NULL,
						@Eid INT OUTPUT
AS
INSERT INTO tblEmployees VALUES(@employeeid,@empName,@empAddress,@city,@country,@birthdate,@hiredate,@NID,@empImage,@phone,@email)
SELECT @Eid=IDENT_CURRENT('tblEmployees')
GO


--test with data insert
DECLARE @eid INT
EXEC sp_InsertEmployeesWithOutPutParameter 210,'MD. ABU BAKAR','BADDA','DHAKA','BANGLADESH','1995-02-10','2015-10-15','1245365895412','N/A','01770000','kalam@gmail.com',@eid OUTPUT
SELECT @eid 'New Id'
GO



--==================================================   004 FUNCTIONS   =========================================================--




--functions
/*
There are three types of user defined functions in the sql language.
				1.Scalar valued function
				2.Single-Statement table valued function
				3.Multi-Statement table valued function

I have used all the three in my project
*/
--1. Scalar valued function for calculating the total sales amount
CREATE FUNCTION fn_OrdersDetails
					(@month int,@year int)
RETURNS INT
AS
	BEGIN
		DECLARE @amount MONEY
		SELECT @amount=SUM(UNITPRICE*QUANTITY) FROM tblOrders 
		JOIN tblOrdersDetails ON tblOrders.OrderId=tblOrdersDetails.OrderId
		WHERE YEAR(OrderDate)=@year AND MONTH(OrderDate)=@month
		RETURN @amount
	END	
GO

--2. Scalar valued function for calculating the total  amount according to PRODUCT
CREATE FUNCTION fn_ordersamountPerProduct
					(@productid INT)
RETURNS MONEY
AS
	BEGIN
		DECLARE @amount MONEY
		SELECT @amount= SUM(UNITPRICE*QUANTITY)FROM tblOrdersDetails WHERE ProductId=@productid
		RETURN @amount
	END
GO

--3. SINGLE STATEMENT TABLE VALUED FUNCTION(as single statement we won't use BEGIN END block)
CREATE FUNCTION fn_OrderdetailsSimpleTable(@customerid INT)
RETURNS TABLE
AS 
RETURN
(
	SELECT SUM(UnitPrice*Quantity) AS 'Total Amount',
	SUM(UnitPrice*Quantity*Discount) AS 'Total Discount',
	SUM(UnitPrice*Quantity*(1-Discount)) AS 'Net Amount'
	FROM tblOrders O 
	JOIN tblOrdersDetails OD ON O.OrderId=OD.OrderId
	WHERE O.CustomerId=@CUSTOMERID
)
GO

--4 Multi-Statement table-valued function(More than one statement. So we will use BEGIN AND END STATEMENT)

CREATE FUNCTION fn_InventoryMultiStatement(@purchasedate DATE)
RETURNS @salesDetails TABLE
(
	ProductID INT,
	Totolamount MONEY,
	Category VARCHAR(30)
)
AS
BEGIN
		 INSERT INTO @salesDetails
		 SELECT PId,
		 SUM(UnitPrice * p.Quantity),
		 I.Category
		 FROM tblInventory I
		 JOIN tblProducts P ON P.ProductId=I.PId
		 WHERE PurchaseDate=@purchasedate
		 GROUP BY PId, I.Category
		 ORDER BY PId ASC
		 RETURN
END
GO

select * from tblInventory
go
select * from tblProducts
go

--=======================================================   005 TRIGGERS   ============================================================--
/*
			I have used Two types of TRIGGERS 
			1. AFTER/ FOR TRIGGERS
			2. INSTEAD OF TRIGGERS

																															*/

--AFTER TRIGGER FOR NOT DELETING ANY DATA FROM ORDERS DATA
CREATE TRIGGER tr_orders
ON tblorders
FOR DELETE
AS
	BEGIN
			PRINT'YOU CAN NOT DELETE AN EMPLOYEE DATA'
			ROLLBACK TRANSACTION
	END
GO

select * from tblInventory
go



-- AFTER TRIGGER FOR INSERT DATA INTO INVENTORY TABLE --
CREATE TRIGGER tr_InventoryInsert
ON tblInventory
FOR INSERT
AS
	BEGIN
			DECLARE @pid INT, @Q INT
			SELECT @pid=pid , @q=quantity FROM inserted

			UPDATE tblProducts
			SET Quantity = Quantity + @Q
			WHERE ProductId = @pid
	END
GO


--CREATE TRIGGERS FOR DELETE DATA FROM INVENTORY TABLE

CREATE TRIGGER tr_DeleteInventory
ON tblInventory
FOR DELETE
AS
	BEGIN
			DECLARE @Pid INT, @q INT
			SELECT @Pid=pid,@q=quantity FROM deleted

			UPDATE tblProducts
			SET Quantity=Quantity-@q
			WHERE ProductId=@Pid
	END
GO

--TEST--
DELETE FROM tblInventory
WHERE InventoryId=1
GO


--CREATE FOR TRIGGERS FOR update DATA IN THE INVENTORY TABLE
CREATE TRIGGER tr_UpdateInventory
ON tblinventory
FOR UPDATE
AS
	BEGIN
			IF UPDATE (QUANTITY)
			BEGIN
						DECLARE @ID INT, 
								@DQ INT,
								@IQ INT,
								@change INT

						SELECT @ID=I.PId,@DQ=D.Quantity,@IQ=I.Quantity
						FROM inserted I
						JOIN deleted D ON D.PId=I.PId
						SET @change=@iq-@DQ

						UPDATE tblProducts
						SET Quantity = Quantity + @change
						WHERE ProductId=@ID
			END
	END
GO

--TEST--


--After triggers for orders and inventory management
CREATE TRIGGER tr_ordersInventory
ON tblordersdetails
FOR INSERT 
AS
	BEGIN 
			DECLARE @Q INT,@Pid int
			SELECT @Q=Quantity,@pid=ProductId FROM inserted

			UPDATE tblInventory
			SET Quantity=Quantity-@Q
			WHERE PId=@Pid
	END
GO

--Create INSTEAD OF TRIGGERS ON VIEW FOR INSERTING DATA 

CREATE TRIGGER tr_V_tblSuppliers
ON V_tblSuppliers
INSTEAD OF INSERT
AS
	BEGIN
			INSERT INTO tblSuppliers(SupplierId,CompanyName,ContactName,ContactTitle,SupAddress,City,Country,Phone)
			SELECT SupplierId,CompanyName,ContactName,ContactTitle,SupAddress,City,Country,Phone FROM inserted
	END
GO


--CREATING AN INSTEAD OF TRIGGER FOR NOT INSERTING ORDERS WHEN STOCK OF PARTICULAR PRODUCT HAS ENDED. 

CREATE TRIGGER tr_OutOfStock
ON tblOrdersDetails
INSTEAD OF INSERT
AS
	BEGIN
			DECLARE @Pid INT, @quantity INT,@stock INT
			SELECT @Pid=ProductId, @quantity=Quantity FROM inserted
			SELECT @stock= SUM(Quantity) FROM tblInventory WHERE Pid=@pid
			
			IF @stock>=@quantity
					BEGIN 
							INSERT INTO tblOrdersDetails(OrderId,ProductId,UnitPrice,Quantity,Discount)	
							SELECT OrderId,ProductId,UnitPrice,Quantity,Discount FROM inserted
					END

			ELSE
					BEGIN
							RAISERROR('SORRY, THERE IS NOT ENOUGH STOCK.',10,1)
							ROLLBACK TRANSACTION
					END
	END
GO

SELECT * FROM tblOrdersDetails
SELECT * FROM tblInventory




--=============================                   END OF DDL SCRIPT           =================================--