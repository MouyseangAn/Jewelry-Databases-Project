# MoonGlim Jewelry Database

## Project Overview

This project is a Python-based web application designed to manage and interact with the MoonGlim Jewelry database. The application provides functionalities to view, update, and insert data into the database, catering to business users such as store managers or HR personnel who need to manage customer information, orders, inventory, and employee records.

## Business Problem

MoonGlim Jewelry, a growing jewelry retailer, faced challenges in efficiently managing its business operations. The company relied on manual processes and disparate systems to handle customer data, inventory, orders, and employee records. This led to inefficiencies, data inconsistencies, and delays in decision-making. The lack of an integrated system made it difficult to track inventory levels, manage customer orders, and maintain accurate employee records.

### Key Challenges:
- **Manual Data Entry**: Time-consuming and prone to errors.
- **Data Silos**: Information was scattered across different systems, making it hard to get a unified view.
- **Inefficient Inventory Management**: Difficulty in tracking stock levels and updating product quantities.
- **Customer Order Management**: Challenges in processing orders quickly and accurately.
- **Employee Record Management**: Inefficient handling of employee data, leading to delays in HR processes.

## Business Value and Impact

The MoonGlim Jewelry Database Application addresses these challenges by providing a centralized, automated system for managing business operations. The application enables the company to streamline its processes, improve data accuracy, and enhance decision-making.

### Business Improvements:
- **Enhanced Data Accuracy**: Automated data entry and updates reduce the risk of errors, ensuring accurate and reliable information.
- **Improved Inventory Management**: Real-time tracking of inventory levels helps in maintaining optimal stock levels and reducing stockouts or overstock situations.
- **Efficient Order Processing**: Streamlined order management ensures faster and more accurate processing of customer orders, leading to improved customer satisfaction.
- **Centralized Employee Records**: Easy access to employee data simplifies HR processes, such as hiring, payroll, and performance management.
- **Better Decision-Making**: Access to real-time data and comprehensive reports enables management to make informed decisions quickly.

## Key Features:
- **Database Interaction**: The application connects to a SQL Server database using SQLAlchemy and allows users to view data from various tables such as Customer, Customer_Order, Product, Employee, and more.
- **Data Viewing**: Users can select and view data from different tables in the database, making it easy to access information about customers, orders, products, and employees.
- **Data Updating**: The application allows users to update existing data, such as modifying product quantities in the inventory.
- **Data Insertion**: New data can be inserted into the database, such as adding new customers or orders.
- **User-Friendly Interface**: The application includes a menu-driven interface for easy navigation between different functionalities.

## Technologies Used:
- **Python**: The core programming language used for the application.
- **SQLAlchemy**: Used for database connectivity and interaction.
- **Pandas**: For data manipulation and displaying database records.
- **Jupyter Notebook**: The development environment used for coding and testing.
