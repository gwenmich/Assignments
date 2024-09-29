-- CREATE DATABASE online_library;

USE online_library; 

CREATE TABLE customer_info (
	customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50)
);

CREATE TABLE customer_contact (
	contact_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(250),
    phone_number INT NOT NULL UNIQUE,
    FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);

CREATE TABLE library_books (
	book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status ENUM('Available','On Loan') NOT NULL DEFAULT 'Available',
    title VARCHAR(250) NOT NULL,
    author VARCHAR(250) NOT NULL,
    genre VARCHAR(50)
);

CREATE TABLE loans (
	loan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    customer_id INT NOT NULL,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES library_books(book_id),
    FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);

CREATE TABLE reviews (
	review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    review_text VARCHAR(250),
    rating INT NOT NULL CHECK (rating > 0 AND rating <= 10),
    date_of_review DATE NOT NULL,
	FOREIGN KEY (book_id) REFERENCES library_books(book_id)
);


INSERT INTO customer_info (first_name, last_name)
VALUES 
('Amanda', 'Bane'),
('Caroline', 'Forbes'),
('Ian', 'Sommers'),
('Rebecca', 'Knight'),
('Matt', 'Grant'),
('Nick', 'Powell'),
('Gwendolyn', 'Roderick'),
('Cassian', 'Black'),
('Iris', 'Summers'),
('James', 'Priest');

INSERT INTO customer_contact (customer_id, email_address, address, phone_number)
VALUES
(1, 'abane@gmail.com', '66 Albert St, Bristol', 0732658210),
(2, 'cforbes@gmail.com', '7 Mayflower St, Chippenham', 0789523654),
(3, 'isommers@gmail.com', '35 Grove Av, Birmingham', 0721836001),
(4, 'rknight@gmail.com', '9 High St, Bath', 07005632589),
(5, 'mgrant@gmail.com', '45 Lady Lane, Swindon', 0763528955),
(6, 'npowell@gmail.com', '77 Beechcroft Rd, Reading', 0763885321),
(7, 'groderick@gmail.com', '29 Manor Rd, Oxford', 0768243511),
(8, 'cblack@gmail.com', '66 Rose Lane, York', 0766824995),
(9, 'isummers@gmail.com', '3 Thorn Rd, Leeds', 0785255633),
(10, 'jpriest@gmail.com', '90 Church Lane, Brighton', 0744632088);

INSERT INTO library_books (title, author, genre)
VALUES
('Irrationality', 'Stuart Sutherland', 'Psychology'),
('The Greatest Show on Earth', 'Richard Dawkins', 'Science'),
('Scattered Minds', 'Gabor Mate', 'Psychology'),
('A Bit of a Stretch', 'Chris Atkins', 'Memoir'),
('Geisha of Gion', 'Mineko Iwasaki', 'Memoir'),
('Sign of the Cross', 'Chris Kuzneski', 'Thriller'),
('The Last Templar', 'Raymond Khoury', 'Thriller'),
('Digital Fortress', 'Dan Brown', 'Thriller'),
('Games People Play', 'Eric Berne', 'Psychology'),
('Think Again', 'Adam Grant', 'Psychology'),
('Cosmos', 'Carl Sagan', 'Science'),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Thriller'),
('A Brief History of Time', 'Stephen Hawking', 'Science'),
('Physics of the Impossible', 'Michio Kaku', 'Science'),
('Secret Narco', 'Wensley Clarkson', 'Biography'),
('Carl Sagan: A Life in the Cosmos', 'William Poundstone', 'Biography');









