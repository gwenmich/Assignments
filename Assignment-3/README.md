### Assignment 3 - SQL

In this assignment, I am assisting an online library in organising its 
data through a structured database to improve tracking of its customers, 
available books, loans, and return dates. 

The database will encompass essential information, including: 
* **customer details** (_customer ID, first name, last name_),
* **customer contact information** (_contact ID, customer ID, email, address, 
phone number_)
* **library books** (_book ID, status, title, author, genre_),
* **loans** (_loan ID, book ID, customer ID, loan date, return date_).

Additionally, the library aims to distribute a monthly newsletter showcasing 
the top three books based on reader ratings. To facilitate this, I will 
store **reviews** in the database, capturing _review ID, loand ID, book ID, review 
text, rating, and review date_.

I will implement SQL queries to manage data entries, including adding or 
deleting data, updating book availability, and processing new arrivals. 
Furthermore, I will utilise aggregate functions to compute the average rating of 
the top three books.