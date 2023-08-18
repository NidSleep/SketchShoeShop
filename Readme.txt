# Shoe Project(Sketchy Shoes)

This is a web application project for an online shoe store built using Java, JavaScript, MVC (Model-View-Controller) architecture, and Servlets.

## Table of Contents

- [Description](#description)
- [Database](#database)
- [Installation](#installation)
- [Login Info](#login information)
- [Usage](#usage)
- [Contribution](#contribuion)

## Description

The Shoe Project is an online shoe store that allows customers to browse and purchase shoes. The project follows the MVC architecture pattern, where the Model represents the data and business logic, the View handles the presentation layer, and the Controller manages the interaction between the Model and the View.

Key features of the Shoe Project:
- User registration and login
- Product catalog with details and images
- Shopping cart functionality
- Order placement and tracking
- Staff management for administrators

## Database

The project uses a relational database management system (RDBMS) to store data. The following tables are used:

- `ITEM`: Stores information about the available shoes.
- `LOGINUSER`: Manages user login details and status.
- `ORDERS`: Tracks customer orders and their status.
- `STAFF`: Stores information about staff members.

Please refer to the database script provided in the project repository for table creation and sample data insertion.

## Installation

To run the Shoe Project locally, follow these steps:

1. Download the project folder
2. Extract the downloaded project folder to your desired location.
3. Open NetBeans IDE.
4. Click on "File" in the menu bar and select "Open Project."
5. Navigate to the extracted project folder and select it. Click on the "Open Project" button.
6. The project will be loaded in NetBeans.
7. Configure the database connection:
	-Click the tab Services in left side navigation bar.
	-Expand the "Database".
	-Right Click Java DB and choose the "Create Database..."
	-Enter the following information
	 "Database Name": assignment,
	 "User Name":nbuser,
	 "Password" : nbuser,
	 "Confirm Password": nbuser
	-Right click on jdbc:derby://localhost:1527/assignment -> execute command
8. Set up the database by execute the sql code in sql file which provide in same folder

## Login information
Admin account:'james@admin.com'
Admin password:admin

Staff account:'kheyang@gmail.com'
Staff password:a

Staff account2:'vivi@gmail.com'
Staff account2:vivivi1

Customer account:'ali1010@gmail.com'
Customer password:1234567

## Usage

1. Access the Shoe Project by opening a web browser and entering the appropriate URL.
2. Navigate through the product catalog to view available shoes and their details.
3. Add desired shoes to the shopping cart.
4. Proceed to checkout and provide the necessary information, including payment method.
5. Confirm the order and track its status.
6. Staff members can log in to access the staff portal for order management and other administrative tasks.

## Contribution

1. Cheong Khe Yang
2. Chiew Jie Lun
3. Er Qing Yap
4. Chong Soon He