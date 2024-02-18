Database Migration README

Structure

1.	Intro 
2.	Requirements and Prerequisites.
3.	Database connection and download of scripts
4.	Creating tables.
5.	Data migration algorithm
6.	Roll back algorithm


1.Intro 
 
This readme file provides step by step algorithm to complete the database migration and algorithm of rolling it back for PostgreSQL database. The migration process encompasses altering column names, expanding column sizes, and converting a column to an array type. The rollback procedure undoes all undertaken modifications and restores the original configuration.


2. Requirements & Prerequisites

In order to successfully implement the below mentioned algorithm you need to have:
1.	PostgreSQL Database installed on your device. (Preferably one of the latest versions)
2.	All your corresponding  credentials for the database: LOGIN, PASSWORD, Database NAME.
3.	PgAdmin (Database GUI) installed and configured.
4.	Database Access permissions. ( Ensure the eligibility of modifying the data )



3. Database Connection and download of scripts.

In order to implement the database migration , we first need to connect to the database (server).  
Command line
Follow these steps to connect to your database:
1. Open the terminal or command prompt.
2. Run the specified command: psql -U username -d database_name
Input your own username and database_name correspondingly.
3. Enter the password for the PostgreSQL user.
After successful authorization, you'll be able to establish a connection to your database.
 
You can also connect  to your database via PgAdmin.  
1. Open PgAdmin: Launch PgAdmin on your computer.
2. Add a New Server.
3. Fill in Connection Details: When you add a new server, you provide connection details such as the hostname, port, database name, username, and password. In this case, you would provide the details specific to the existing PostgreSQL server where your database resides.
4. Test the Connection: Once you've filled in the connection details, you save the configuration and test the connection to ensure that pgAdmin can connect to the existing database server.
After completing these steps, you'll be able to access and work with the databases that are already present on the PostgreSQL server to which you've connected.


Next, download all the necessary SQL files.
1.	Open this link: https://github.com/ADA-GWU/2024-a1-db-migration-Jamal023

2.	 Download 3  SQL files ( Creation and Insertion, Migration, and Rollback)  

4.  Creating tables.

Use this command in order to create the necessary tables.
psql -U username -d databasename -a -f Creation and Insertion.sql
If your SQL script file is located elsewhere on your file system, you need to provide the full path to the file. This includes the directory structure leading up to the file. For example: Windows: C:\path\to\my_script.sql

C:\Users\Baku\Desktop\J.T\Production & Operations\HW1 – Example of my path of a file


You create them can using PgAdmin as well:
1. Open the query tool of your database by right clicking on it with your mouse.
2. Paste the SQL script from the file into the query tool. ( Open the file in any text editor or VScode)
(Creation and Insertion.sql) - file
3. Press F5 to Run the query or simply click on the run button.
To check how tables ( student or interest )look paste this query in the query tool of your database using  PgAdmin: 	
SELECT * FROM STUDENTS  
SELECT * FROM INTERESTS 



5.  Data Migration 

1. Use this command in order to implement the migration process.
psql -U username -d databasename -a -f Migration.sql

You implement it using PgAdmin as well:

1. Open the query tool of your database by right clicking on it with your mouse.
2. Paste the SQL script from the file into the query tool.
(Migration.sql) - file
3. Press F5 to Run the query or simply click on the run button.

6. Roll back algorithm

1. Use this command in order to implement the roll back process.
psql -U username -d databasename -a -f Rollback.sql




You can implement it using PgAdmin as well
1. Open the query tool of your database by right clicking on it with your mouse.
2. Paste the SQL script from the file into the query tool.
(Rollback.sql) - file
3. Press F5 to Run the query or simply click on the run button.










