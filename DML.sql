
/*							
							SQL Project Name : Inventory Management Systems 
							    Trainee Name : Md. Arman Hossain   
						    	  Trainee ID : 1266043       
								    Batch ID : ESAD-CS/PNTL-M/49/01 

																															*/

--=======================================     START OF DML SCRIPT     =========================================--

USE dbInventoryManagement
GO

SELECT * FROM tblCustomers
SELECT * FROM tblEmployees
SELECT * FROM tblSuppliers
SELECT * FROM tblProducts
SELECT * FROM tblCategory
SELECT * FROM tblShippers
SELECT * FROM tblOrders
SELECT * FROM tblOrdersDetails
SELECT * FROM tblInventory


INSERT INTO tblCUSTOMERS 
VALUES 
		(101,'Arman','Hossain','Sadarghat','Dhaka','Bangladesh','+88 0175581900','arman@gmil.com'),
		(102,'Saddam','Hossain','Rampura','Barisal','Bangladesh','+88 0175581900','arman@gmil.com'),
		(103,'Imam','Masum','Badda','Shylet','Bangladesh','+88 0175581900','imam@gmil.com'),
		(104,'Shihab','Hossain','Greenroad','Bangladesh','Bangladesh','+88 0175581900','shihab@gmil.com'),
		(105,'Arafat','Rimon','Framgate','Rangpur','Bangladesh','+88 0175581900','arafat@gmil.com'),
		(106,'Tanzil','Islam','Mirpur','Rajshahi','Bangladesh','+88 0175581900','tanzil@gmil.com'),
		(107,'Sifat-e','Islam','Mohammadpur','Jossore','Bangladesh','+88 0175581900','sifat@gmil.com'),
		(108,'Sohel','Mia','Gulshan','Faridpur','Bangladesh','+88 0175581900','sohel@gmil.com'),
		(109,'Jannanul','Islam','Jatrabari','Cumilla','Bangladesh','+88 0175581900','jannatul@gmil.com'),
		(110,'Mainul','Islam','wari','Dhaka','Bangladesh','+88 0175581900','mainul@gmil.com')
GO

INSERT INTO tblEmployees 
VALUES
		(201,'MD. Rabin','Sadar','Faridpur','Bangladesh','1995-01-01','2015-01-01','1995253265125','N/A','017814××××','rabin@gmil.com'),
		(202,'MD. Rabbi','Badda','Dhaka','Bangladesh','1995-02-03','2016-01-01','1995253265124','N/A','017814××××','rabbi@gmil.com'),
		(203,'MD. Sieam','Gazipur','Dhaka','Bangladesh','1996-01-01','2017-01-01','1995253222125','N/A','017814××××','sieam@gmil.com'),
		(204,'MD. Ferdoes','Savar','Mymensing','Bangladesh','1998-01-01','2018-01-01','1995253235125','N/A','017814××××','ferdoes@gmil.com'),
		(205,'MD. Abbas','Rajbari','Chattagram','Bangladesh','1994-01-01','2014-01-01','1995215265125','N/A','017814××××','abbas@gmil.com')
GO

INSERT INTO tblSuppliers
VALUES
		('APPLE','Mr. Devid','Sales Manager','ER Road','Washington','America',default),
		('DELL','Mr. Ronald','Sales Manager','12/wc','New York','America',default),
		('HP','Mr. Robart','Manager','15/wc','Texas','America',default),
		('LENEVO','Mrs. Rose','Production Manager','17/wc','Beijing','China',default),
		('ASUS','Ms. Swift','Sales Manager','20/wc','Taipei','Taiwan',default)
GO

SELECT * FROM tblSuppliers
GO

INSERT INTO tblCategory
VALUES
		(DEFAULT,'MONITOR'),
		(DEFAULT,'ASSESCORIES'),
		(DEFAULT,'STORAGE'),
		(DEFAULT,'MOBILE PHONE'),
		(DEFAULT,'MEMORY'),
		(DEFAULT,'COMPUTER')
GO

SELECT * FROM tblCategory
GO

INSERT INTO tblProducts(ProductId,ProductName,UnitPrice,Quantity,Category)
VALUES
		(1,'Laptop',50000.00,20,5)
GO
SELECT * FROM tblProducts
GO




INSERT INTO tblShippers
VALUES
		('REDX','0175500000'),
		('SUNDORBAN','0165500000'),
		('SA','0175500000')

SELECT * FROM tblShippers
GO


INSERT INTO tblOrders
VALUES
		(1,101,201,'2020-01-01','2020-01-15',1,5000.00),
		(2,102,201,'2020-01-10','2020-01-20',2,2000.00),
		(3,103,202,'2020-02-01','2020-02-15',3,4000.00),
		(4,104,203,'2020-02-20','2020-02-15',2,5500.00),
		(5,105,204,'2020-03-01','2020-03-15',3,4500.00),
		(6,106,205,'2020-03-15','2020-03-15',2,2500.00),
		(7,107,201,'2020-04-01','2020-04-15',1,3000.00),
		(8,108,202,'2020-04-05','2020-04-15',1,2200.00),
		(9,109,203,'2020-05-01','2020-05-15',2,4000.00),
		(10,110,204,'2020-05-25','2020-06-15',3,8000.00),
		(11,101,205,'2020-06-01','2020-06-15',1,8500.00),
		(12,102,201,'2020-07-10','2020-07-15',1,9000.00),
		(13,102,202,'2020-08-15','2020-08-15',3,1000.00),
		(14,103,203,'2020-09-01','2020-09-15',1,2500.00),
		(15,104,201,'2020-10-30','2020-11-15',3,3200.00),
		(16,105,202,'2020-11-01','2020-11-15',1,5000.00),
		(17,105,204,'2020-12-15','2020-12-15',2,2500.00),
		(18,106,203,'2021-01-01','2021-01-16',3,2700.00),
		(19,107,202,'2021-01-15','2021-01-25',2,3600.00),
		(20,108,201,'2021-02-01','2021-02-15',3,3800.00),
		(21,109,202,'2021-03-01','2021-03-15',3,9500.00),
		(22,105,205,'2021-04-01','2021-04-15',1,1200.00),
		(23,105,203,'2021-05-01','2021-05-15',1,7800.00),
		(24,107,201,'2021-06-01','2021-06-15',1,500.00),
		(25,108,202,'2021-06-05','2021-06-20',1,4500.00),
		(26,109,205,'2021-07-01','2021-07-15',2,8000.00),
		(27,102,204,'2021-07-20','2021-07-28',3,6500.00),
		(28,110,203,'2021-08-01','2021-08-15',3,6200.00),
		(29,105,201,'2021-09-01','2021-09-15',2,4500.00),
		(30,101,204,'2021-10-01','2021-10-15',1,1800.00)
GO		
SELECT * FROM tblOrders
GO


INSERT INTO tblOrdersDetails(OrderId,ProductId,UnitPrice,Quantity,Discount)
VALUES
		(1,1,15000.00,5,.05),
		(2,2,15000.00,4,.05),
		(3,3,15000.00,10,.05),
		(4,3,15000.00,12,.05),
		(5,4,15000.00,20,.05),
		(6,4,15000.00,7,.05),
		(7,5,15000.00,8,.05),
		(8,1,15000.00,10,.05),
		(9,6,15000.00,20,.05),
		(12,7,15000.00,25,.10),
		(14,8,15000.00,30,.10),
		(15,1,15000.00,10,.05),
		(16,14,15000.00,40,.10),
		(17,15,15000.00,4,.05),
		(18,10,15000.00,8,.05),
		(19,12,15000.00,15,.05),
		(20,1,15000.00,18,.05)
GO
SELECT * FROM tblOrdersDetails
GO

select * from tblProducts
INSERT INTO tblInventory(SupplierId,Quantity,PurchaseDate,StockOutDate,Category,Available,PId)
VALUES
		(1,100,'2019-01-15',DEFAULT,4,1,1),
		(2,100,'2019-02-15','2021-11-10',1,0,2),
		(3,100,'2019-03-15',DEFAULT,2,1,3),
		(4,100,'2019-04-15',DEFAULT,2,1,4),
		(5,100,'2019-05-15',DEFAULT,6,1,5),
		(2,100,'2019-06-15',DEFAULT,2,1,6),
		(3,100,'2019-04-25',DEFAULT,5,1,7),
		(4,100,'2019-07-15',DEFAULT,5,1,7),
		(5,100,'2019-08-15',DEFAULT,3,1,8),
		(1,100,'2019-09-15',DEFAULT,2,1,9),
		(3,100,'2019-10-15','2021-11-15',6,0,10),
		(4,100,'2019-11-15',DEFAULT,2,1,11),
		(5,100,'2019-12-15',DEFAULT,3,1,12),
		(3,100,'2019-04-20',DEFAULT,6,1,13),
		(2,100,'2019-09-30','2021-11-20',1,0,14),
		(1,100,'2019-01-20',DEFAULT,2,1,15)
GO	

SELECT * FROM tblInventory
GO
--inserting data through stored procedure
		EXEC sp_InsertCustomers 111,'Shakib','Rana','Elephant Road','Dhaka','Bangladesh','+88 0175581900','shakib@gmil.com'
		EXEC sp_InsertCustomers 112,'Helal','Uddin','DC Road','Dhaka','Bangladesh','+88 0175581900','helal@gmil.com'
		EXEC sp_InsertCustomers 113,'Riaz','Morshed','AC Road','Dhaka','Bangladesh','+88 0175581900','riaz@gmil.com'
		EXEC sp_InsertCustomers 114,'Abdur','Rahaman','BC Road','Dhaka','Bangladesh','+88 0175581900','rahman@gmil.com'
		EXEC sp_InsertCustomers 115,'Abdur','Razzak','W/C Road','Dhaka','Bangladesh','+88 0175581900','razzak@gmil.com'
		EXEC sp_InsertCustomers 116,'Abul','Kalam','A/F Road','Dhaka','Bangladesh','+88 0175581900','kalam@gmil.com'
		EXEC sp_InsertCustomers 117,'Abik','Hossain','Badda','Dhaka','Bangladesh','+88 0175581900','abik@gmil.com'
		EXEC sp_InsertCustomers 118,'Masud','Rana','Dhanmondi','Dhaka','Bangladesh','+88 0175581900','masud@gmil.com'
		EXEC sp_InsertCustomers 119,'Suman','Molla','Rampura','Dhaka','Bangladesh','+88 0175581900','suman@gmil.com'
		EXEC sp_InsertCustomers 120,'Ripon','Reza','Halishore','Ctg','Bangladesh','+88 0175581900','ripon@gmil.com'
		EXEC sp_InsertCustomers 121,'Rafin','Islam','Agrabad ','Ctg','Bangladesh','+88 0175581900','rafin@gmil.com'
		EXEC sp_InsertCustomers 122,'Rakib','Molla','CRB ','Ctg','Bangladesh','+88 0175581900','rakib@gmil.com'
		EXEC sp_InsertCustomers 123,'Belal','Biswas','Dakkhin Khan ','Ctg','Bangladesh','+88 0175581900','belal@gmil.com'
		EXEC sp_InsertCustomers 124,'Liton','Sheik','Keraniganj','Dhaka','Bangladesh','+88 0175581900','liton@gmil.com'
		EXEC sp_InsertCustomers 125,'Abul','Hakim','Airport','Dhaka','Bangladesh','+88 0175581900','abul@gmil.com'
		
GO
SELECT * FROM tblCustomers
GO
--simple query
SELECT * FROM tblInventory
GO

--JOIN QUARY TO FIND OUT ORDER DETAILS
SELECT * FROM tblOrders O
JOIN tblOrdersDetails OD ON OD.OrderId=O.OrderId
WHERE O.CustomerId = 105
GO

/*         JOIN QUARY WITH AGGREGATE COLUMN WITH GROUP BY,ORDERBY CLAUSE
           TO FIND OUT CUSTOMER WISE TOTAL DISCOUNT                        */
			
SELECT O.CustomerId,SUM(od.UnitPrice*od.Quantity* OD.Discount) 'Discount_per_Customer' FROM tblOrders O
JOIN tblOrdersDetails OD ON OD.OrderId=O.OrderId
GROUP BY O.CustomerId
ORDER BY O.CustomerId DESC
GO

--SUBQUERY TO FIND OUT THE ORDERS DETAILS OF A SPECIFIC CUSTOMER
SELECT * FROM tblOrders O
JOIN tblCustomers C ON C.CustomerId = O.CustomerId
WHERE O.CustomerId=(SELECT CustomerId FROM tblCustomers WHERE CustomerFName='ARMAN')
GO

--USING ROLLUP IN QUERY WITH HAVING CLAUSE TO FIND OUT THE CUSTOMER AND PRODUCT WSIE NET ORDER AMOUNT WHO HAVE MORE THAN 50000 ORDER AMOUNT
SELECT CUSTOMERID,PRODUCTID,SUM(UnitPrice*Quantity*(1-DISCOUNT)) AS 'NET_ORDER_AMOUNT' FROM tblOrders O
JOIN tblOrdersDetails OD ON O.OrderId=OD.OrderId
GROUP BY ROLLUP (CustomerId,PRODUCTID)
HAVING SUM(UnitPrice*Quantity*(1-DISCOUNT)) >=50000
ORDER BY CustomerId
GO


-- USING  SEARCHED CASE FUNCTION TO FIND OUT THE CUSTOMER WHO HAVE GET 20 OR MORE PERCENT DISCOUNT ON THEIR PURCHASE

SELECT ORDERID,SUM(Quantity*UnitPrice) AS 'Total Amount ordered',
CASE
	WHEN SUM(Quantity*UnitPrice)>= 100000
		THEN '25% DISCOUNT'
	WHEN SUM(Quantity*UnitPrice)>= 75000
		THEN '20% DISCOUNT'
	ELSE 'DEFAULT DISCOUNT'
END AS DISCOUNT
FROM tblOrdersDetails
GROUP BY OrderId

--Check for view
select * from V_tblOrdersDetails
GO

--Check for stored procedure
EXEC sp_tblCustomers
GO

--INSERTING data using STORED PROCEDURE
DECLARE @id INT
EXEC @id= sp_InsertEmployeesWithReturn 212,'MD. ABU BAKAR','BADDA','DHAKA','BANGLADESH','1995-02-10','2015-10-15','1245367895412','N/A','01770000','kalam@gmail.com'
PRINT 'New product inserted with Id : '+STR(@id)
GO

--TEST FOR SCALAR VALUED FUNCTION for calculating MONTH WISE TOTAL SALES
SELECT DBO.fn_OrdersDetailS(02,2020) AS TOTAL_SALES_AMOUNT
GO

--TEST FOR SCALAR VALUED FUNCTION TO CALCULATING PRODUCT WISE TOTAL SALES
SELECT DBO.fn_ordersamountPerProduct(1) AS product_wise_total_sales
GO

--TEST FOR SINGLE STATEMENT TABLE VALUED FUNCTION TO BRING OUT THE NET AMOUNT OF SPECIFIC CUSTOMER
SELECT * FROM fn_OrderdetailsSimpleTable(105)
GO

--TEST FOR MULTI-STATEMENT TABLE VALUED FUNCTION TO BRING OUT THE TOTAL AMOUNT OF SPECIFIC INVENTORY PURCHASED AT A SPECIFIC DATE
SELECT * FROM fn_InventoryMultiStatement('2019-01-15')
GO

--TEST FOR AFTER TRIGGER THAT DOES NOT LET TO DELETE ANY DATA FROM ORDERS TABLE
DELETE FROM tblOrders
WHERE OrderId=1
GO


--TEST FOR AFTER TRIGGER TO INSERT DATA--

INSERT INTO tblInventory VALUES(2,50,'2019-12-15',DEFAULT,3,1,4)
INSERT INTO tblInventory VALUES(3,50,'2019-11-12',DEFAULT,4,0,8)
GO

SELECT * FROM tblInventory
SELECT * FROM tblProducts
GO

--TEST TRIGGERS FOR DELETE DATA
DELETE FROM tblInventory WHERE PId=1
GO

SELECT * FROM tblInventory
SELECT * FROM tblProducts
GO

--TEST TRIGGERS FOR UPDATE DATA
UPDATE tblInventory
SET Quantity=40
WHERE InventoryId=10
GO

SELECT * FROM tblInventory
SELECT * FROM tblProducts
GO

--Test INSTED OF TRIGERS FOR INSERT DATA INTO A VIEW
INSERT INTO V_tblSuppliers VALUES ('WALTON','MR. Habib','Manager','Gazipur','Gazipur','Bangladesh',DEFAULT)
GO

--Test INSTED OF TRIGERS FOR INSERT DATA INTO TABLE. IF THE STOCK IS LESS THAN THE ORDER AMOUNT DATA CAN'T BE INSERTED. ROLLBACKED

INSERT INTO tblOrdersDetails VALUES(21,11,12000.00,10,.05)
GO

INSERT INTO tblOrdersDetails VALUES(22,10,20000.00,50,.05)
GO

SELECT * FROM tblOrdersDetails
SELECT * FROM tblInventory


--=======================================     END OF DML SCRIPT     =========================================--