--- MoonGlim Jewelry database developed and written by Mouyseang An 
IF NOT EXISTS(SELECT * FROM sys.databases
	WHERE NAME = N'MoonGlimJewelry')
	CREATE DATABASE MoonGlimJewelry 


GO
USE MoonGlimJewelry

DECLARE
	@data_path NVARCHAR(256);
SELECT @data_path = 'C:\Users\Mouyseang.An\Downloads\INFO 3240 Project 1\MoonGlimJewelry\'; 


-- Deleting Existing Tables
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'PRODUCT'
       )
	DROP TABLE PRODUCT;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'EMPLOYEE'
       )
	DROP TABLE EMPLOYEE;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'INVENTORY'
       )
	DROP TABLE INVENTORY;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'ORDER_PRODUCT'
       )
	DROP TABLE ORDER_PRODUCT;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'CUSTOMER_PREFERENCE'
       )
	DROP TABLE CUSTOMER_PREFERENCE;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'CUSTOMER_ORDER'
       )
	DROP TABLE CUSTOMER_ORDER;
--
IF EXISTS(

	SELECT *
	FROM sys.tables
	WHERE NAME = N'CUSTOMER'
       )
	DROP TABLE CUSTOMER;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'PAYMENT'
       )
	DROP TABLE PAYMENT;
--
---Create Tables

CREATE TABLE EMPLOYEE
	(Employee_ID			INT CONSTRAINT pk_employee PRIMARY KEY,
	Employee_FirstName			NVARCHAR(30) CONSTRAINT nn_employee_first_name NOT NULL,
	Employee_LastName			NVARCHAR(30) CONSTRAINT nn_employee_last_name NOT NULL,
	Employee_PhoneNumber		NVARCHAR(15) CONSTRAINT nn_employee_phone_number NOT NULL,
	Employee_HireDate			DATE CONSTRAINT nn_hire_date NOT NULL,
	);


CREATE TABLE INVENTORY
	(Inventory_ID			INT CONSTRAINT pk_inventory PRIMARY KEY,
	Inventory_location			NVARCHAR(10) CONSTRAINT nn_inventory_location NOT NULL
	);

CREATE TABLE CUSTOMER
	(Customer_ID			INT CONSTRAINT pk_customer PRIMARY KEY,
	Customer_FirstName			NVARCHAR(30) CONSTRAINT nn_customer_first_name NOT NULL,
	Customer_LastName			NVARCHAR(30) CONSTRAINT nn_customer_last_name NOT NULL,
	Customer_Phone				NVARCHAR(14),
	Customer_Email				NVARCHAR(50) CONSTRAINT nn_customer_email NOT NULL,
	Customer_Address            NVARCHAR(100) CONSTRAINT nn_customer_address NOT NULL,
	Customer_State				NVARCHAR(50) CONSTRAINT nn_customer_state NOT NULL,
	Customer_Zip				NVARCHAR(11) CONSTRAINT nn_customer_zip_ NOT NULL,
	Customer_City				NVARCHAR(30) CONSTRAINT nn_customer_city NOT NULL
	);


CREATE TABLE PRODUCT
	(Product_ID				INT CONSTRAINT pk_product PRIMARY KEY,
	Product_Name				NVARCHAR(60) CONSTRAINT nn_product_name NOT NULL,
	Product_Type				NVARCHAR(20) CONSTRAINT nn_product_type NOT NULL,
	Product_Price				MONEY CONSTRAINT nn_product_price NOT NULL,
	Quantity					INT NOT NULL,
	Inventory_ID			INT	CONSTRAINT fk_product_inventory FOREIGN KEY REFERENCES INVENTORY(Inventory_ID)
	);



CREATE TABLE PAYMENT
	(Payment_ID				INT CONSTRAINT pk_payment PRIMARY KEY,
	Payment_Date				DATE CONSTRAINT nn_payment_date NOT NULL,
	Payment_Option				NVARCHAR(20) CONSTRAINT nn_payment_option NOT NULL,
	Payment_Time				TIME CONSTRAINT nn_payment_time NOT NULL,
	Customer_ID				INT CONSTRAINT fk_payment_customer FOREIGN KEY REFERENCES CUSTOMER(Customer_ID)
	);


CREATE TABLE CUSTOMER_ORDER 
	(Order_ID				INT CONSTRAINT pk_order PRIMARY KEY,
	Order_Date                  DATE CONSTRAINT nn_payment_date NOT NULL,
	Order_Time					TIME CONSTRAINT nn_payment_time NOT NULL,
	Order_Quantity				INT NOT NULL,
	Customer_ID					INT CONSTRAINT fk_customer_order_customer FOREIGN KEY REFERENCES CUSTOMER(Customer_ID),
	Employee_ID					INT CONSTRAINT fk_customer_order_employee FOREIGN KEY REFERENCES EMPLOYEE(Employee_ID)
	);

CREATE TABLE CUSTOMER_PREFERENCE
	(Customer_Preference_ID		INT CONSTRAINT pk_customer_preference PRIMARY KEY,
	Preference_Detail				NVARCHAR(30) CONSTRAINT nn_payment_option NOT NULL,
	Customer_ID					INT CONSTRAINT fk_customer_preference_customer FOREIGN KEY REFERENCES CUSTOMER(Customer_ID)
	);

CREATE TABLE ORDER_PRODUCT
	(Order_Product_ID		INT CONSTRAINT pk_order_product PRIMARY KEY,
	Product_ID				INT CONSTRAINT fk_order_product_product FOREIGN KEY REFERENCES PRODUCT(Product_ID),	
	Order_ID				INT CONSTRAINT fk_order_product_customer_order FOREIGN KEY REFERENCES CUSTOMER_ORDER(Order_ID)
	);


---Load the table

EXECUTE (N'BULK INSERT EMPLOYEE FROM ''' + @data_path + N'EMPLOYEE.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');


--
EXECUTE (N'BULK INSERT CUSTOMER FROM ''' + @data_path + N'CUSTOMER.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');




--
EXECUTE (N'BULK INSERT CUSTOMER_PREFERENCE FROM ''' + @data_path + N'CUSTOMER_PREFERENCE.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');


--
EXECUTE (N'BULK INSERT CUSTOMER_ORDER FROM ''' + @data_path + N'CUSTOMER_ORDER.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');


EXECUTE (N'BULK INSERT INVENTORY FROM ''' + @data_path + N'INVENTORY.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');

--
EXECUTE (N'BULK INSERT PRODUCT FROM ''' + @data_path + N'PRODUCT.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');

--
EXECUTE (N'BULK INSERT ORDER_PRODUCT FROM ''' + @data_path + N'ORDER_PRODUCT.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');


--
EXECUTE (N'BULK INSERT PAYMENT FROM ''' + @data_path + N'PAYMENT.csv''
WITH (
	CHECK_CONSTRAINTS,
	CODEPAGE=''ACP'',
	DATAFILETYPE = ''char'',
	FIELDTERMINATOR= '','',
	ROWTERMINATOR = ''\n'',
	KEEPIDENTITY,
	TABLOCK
	);
');

--

-- List table names and row counts for confirmation
--
SET NOCOUNT ON
SELECT 'CUSTOMER'AS "Table",	COUNT(*) AS "Rows"	FROM CUSTOMER				UNION
SELECT 'CUSTOMER_PREFERENCE',	COUNT(*)			FROM CUSTOMER_PREFERENCE	UNION
SELECT 'EMPLOYEE',				COUNT(*)			FROM EMPLOYEE				UNION
SELECT 'CUSTOMER_ORDER',		COUNT(*)			FROM CUSTOMER_ORDER			UNION
SELECT 'PRODUCT',				COUNT(*)			FROM PRODUCT				UNION
SELECT 'ORDER_PRODUCT',			COUNT(*)			FROM ORDER_PRODUCT			UNION
SELECT 'INVENTORY',				COUNT(*)			FROM INVENTORY				UNION
SELECT 'PAYMENT',				COUNT(*)			FROM PAYMENT				
ORDER BY 1;
SET NOCOUNT OFF
GO



--- VIEW 

CREATE VIEW dbo.vlowPrice AS (
    SELECT
        Product_Name,
        Product_Type,
        Product_Price
    FROM PRODUCT
    WHERE
        Product_Price < 100 );
-- Drop the view.

DROP VIEW dbo.vlowPrice;


---USER-DEFINED FUNCTION
CREATE FUNCTION dbo.udf_Product(@num1 INT, @num2 INT) RETURNS INT AS
BEGIN
	DECLARE @product INT;
	SET @product = ISNULL(@num1, 0) * ISNULL(@num2, 0);
	RETURN @product;
END;
GO
--- Drop the existing 

DROP FUNCTION IF EXISTS  dbo.udf_Product;
GO


---PROCEDURE

CREATE OR ALTER PROC dbo.usp_CustomerInformation AS 
	SET NOCOUNT ON;
	SELECT 
		Customer_ID,
		Customer_FirstName,
		Customer_LastName,
		Customer_Email,
		Customer_Phone,
		Customer_State
	FROM 
		CUSTOMER 
	ORDER BY 
		Customer_FirstName,
		Customer_LastName;

--- Drop the Existing Procedure
DROP PROCEDURE IF EXISTS dbo.usp_CustomerInformation;  
GO 
