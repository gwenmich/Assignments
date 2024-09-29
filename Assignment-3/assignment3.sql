-- DROP DATABASE IF EXISTS online_library;
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
    phone_number VARCHAR(15) NOT NULL UNIQUE,
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
    FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id),
    CHECK (return_date >= loan_date)
);

CREATE TABLE reviews (
	review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    loan_id INT NOT NULL,
    book_id INT NOT NULL,
    review_text VARCHAR(250),
    rating INT NOT NULL CHECK (rating > 0 AND rating <= 5),
    date_of_review DATE NOT NULL,
	FOREIGN KEY (book_id) REFERENCES library_books(book_id),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

-- adding customer information
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

-- adding customer contact details
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

-- adding available books
INSERT INTO library_books (title, author, genre)
VALUES
('Irrationality', 'Stuart Sutherland', 'Psychology'),
('The Greatest Show on Earth', 'Richard Dawkins', 'Science'),
('Scattered Minds', 'Gabor Mate', 'Psychology'),
('A Bit of a Stretch', 'Chris Atkins', 'Memoir'),
('Geisha of Gion', 'Mineko Iwasaki', 'Memoir'),
('Sign of the Cross', 'Chris Kuzneski', 'Thriller'),
('The Last Templar', 'Raymond Khoury', 'Thriller'),
('Digital Fortress', 'Dan Brown', 'Thriller');

-- adding books that are on loan
INSERT INTO library_books (status, title, author, genre)
VALUES
('On Loan', 'Games People Play', 'Eric Berne', 'Psychology'),
('On Loan', 'Think Again', 'Adam Grant', 'Psychology'),
('On Loan', 'Cosmos', 'Carl Sagan', 'Science'),
('On Loan', 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Thriller'),
('On Loan', 'A Brief History of Time', 'Stephen Hawking', 'Science'),
('On Loan', 'Physics of the Impossible', 'Michio Kaku', 'Science'),
('On Loan', 'Secret Narco', 'Wensley Clarkson', 'Biography'),
('On Loan', 'Carl Sagan: A Life in the Cosmos', 'William Poundstone', 'Biography');

-- adding past and present loans
INSERT INTO loans (book_id, customer_id, loan_date, return_date)
VALUES 
(5, 4, '2024-07-28', '2024-08-11'),
(15, 2, '2024-08-01', '2024-08-16'),
(4, 3, '2024-08-17', '2024-08-31'),
(3, 1, '2024-08-20', '2024-09-03'),
(12, 8, '2024-08-21', '2024-09-04'),
(14, 8, '2024-08-22', '2024-09-05'),
(14, 6, '2024-08-23', '2024-09-06'),
(2, 9, '2024-08-24', '2024-09-07'),
(13, 1, '2024-08-27', '2024-09-10'),
(1, 10, '2024-08-29', '2024-09-12'),
(8, 7, '2024-08-30', '2024-09-13'),
(7, 2, '2024-08-30', '2024-09-13'),
(13, 4, '2024-08-31', '2024-09-14'),
(4, 6, '2024-09-01', '2024-09-15'),
(6, 3, '2024-09-02', '2024-09-16'),
(9, 5, '2024-09-02', '2024-09-16'),
(16, 5, '2024-09-03', '2024-09-17'),
(10, 8, '2024-09-10', '2024-09-24'),
(7, 9, '2024-09-10', '2024-09-24'),
(11, 7, '2024-09-13', '2024-09-27'),
(9, 1, '2024-09-20', '2024-10-04'),
(14, 6, '2024-09-22', '2024-10-06'),
(16, 9, '2024-09-24', '2024-10-08'),
(12, 7, '2024-09-25', '2024-10-09'),
(11, 10, '2024-09-25', '2024-10-09'),
(10, 2, '2024-09-26', '2024-10-10'),
(13, 3, '2024-09-26', '2024-10-10'),
(15, 4, '2024-09-27', '2024-10-11')
;

-- adding book reviews and ratings
INSERT INTO reviews (loan_id, book_id, review_text, rating, date_of_review)
VALUES
(1, 5, 'A revealing glimpse into the life of a geisha, rich in culture and personal stories.', 4, '2024-08-12'),
(2, 15, 'An eye-opening account of the drug trade’s impact on society.', 1, '2024-08-16'),
(3, 4, 'A humorous take on life in prison, blending wit and reflection.', 5, '2024-09-01'),
(6, 14, 'Kaku bridges science and imagination in this engaging read.', 4, '2024-09-03'),
(4, 3, 'A heartfelt exploration of ADHD that emphasizes compassion and understanding.', 2, '2024-09-04'),
(5, 12, 'A riveting mystery full of unforgettable characters and dark secrets.', 4, '2024-09-05'),
(7, 14, 'A fascinating look at theoretical physics and futuristic possibilities.', 3, '2024-09-06'),
(8, 2, 'A powerful defense of evolution that captivates with its insights.', 3, '2024-09-09'),
(10, 1, 'Sutherland explores the surprising ways we act against our best interests.', 3, '2024-09-13'),
(11, 8, 'A thrilling exploration of privacy and security in the digital age.', 4, '2024-09-14'),
(14, 4, 'Atkins delivers a candid account of the absurdities behind bars.', 5, '2024-09-15'),
(12, 7, 'Khourys plot twists make this an unputdownable thriller.', 4, '2024-09-15'),
(16, 9, 'A groundbreaking analysis of the psychological games in our interactions.', 4, '2024-09-17'),
(15, 6, 'A gripping thriller that mixes history with suspenseful twists.', 3, '2024-09-17'),
(9, 13, 'An accessible guide to cosmology that sparks curiosity about the universe.', 3, '2024-09-17'),
(13, 13, 'Hawkings insights challenge our understanding of reality.', 2, '2024-09-18'),
(17, 16, 'A captivating biography celebrating Sagan’s contributions to science.', 4, '2024-09-18'),
(18, 10, 'A call to embrace rethinking and adaptability in a changing world.', 2, '2024-09-25'),
(19, 7, 'An exciting blend of historical intrigue and modern adventure.', 1, '2024-09-25'),
(20, 11, 'Sagans poetic prose invites readers to ponder the universe.', 3, '2024-09-28')
;


-- creating a stored procedure to extract top 3 books based on rating for monthly newsletter
DELIMITER //
CREATE PROCEDURE get_books_by_month()
BEGIN
	SELECT 
		CONCAT(
			LEFT(SUBSTRING_INDEX(b.author, ' ', 1), 1), '.',
            LEFT(SUBSTRING_INDEX(b.author, ' ', -1), 1), '.'
        ) AS author_initials,
        b.title,
        ROUND(AVG(r.rating), 1) AS avg_rating,
        b.genre
	FROM library_books b
    JOIN reviews r ON b.book_id = r.book_id
    WHERE MONTH(r.date_of_review) = MONTH(CURDATE())
    GROUP BY author_initials, b.title, b.genre
    ORDER BY avg_rating DESC LIMIT 3;
END //

DELIMITER ;

CALL get_books_by_month();


-- finding all available books to borrow
SELECT  b.title, b. author, b.genre
FROM library_books b
WHERE status = 'Available'
ORDER BY b.title; 


-- getting the top 3 most borrowed books
SELECT  b.title, COUNT(l.loan_id) AS times_borrowed
FROM library_books b
JOIN loans l ON b.book_id = l.book_id
GROUP BY b.title
ORDER BY times_borrowed DESC LIMIT 3;

-- list all books with their authors and average ratings
SELECT b.title, b.author, ROUND(AVG(r.rating), 1) AS avg_rating
FROM library_books b
JOIN reviews r ON b.book_id = r.book_id
GROUP BY b.title, b.author
ORDER BY avg_rating DESC;

-- retrieve reviews for a specific book
DELIMITER //
-- DROP PROCEDURE book_review //
CREATE PROCEDURE book_review(bookID INT)
BEGIN
	SELECT  
		b.title, 
		r.review_text,
        r.rating
	FROM library_books b
	LEFT JOIN reviews r ON b.book_id = r.book_id
	WHERE b.book_id = bookID;
END //
DELIMITER ;

CALL book_review(4);

-- procedure to add new books to the database
DELIMITER //
CREATE PROCEDURE add_book(
	IN db_title VARCHAR(250),
    IN db_author VARCHAR(250),
    IN db_genre VARCHAR(50)
)
BEGIN
	INSERT INTO library_books (title, author, genre)
    VALUES (db_title, db_author, db_genre);
END//
DELIMITER ;

-- CALL add_book('Becoming Myself', 'Irvin Yalom', 'Memoir');
-- SELECT * FROM library_books;


-- delete last added book (I have commented the code out so it doesn't autorun)
SET @latest_book_id = (SELECT MAX(book_id) FROM library_books);

-- DELETE FROM library_books
-- WHERE book_id = @latest_book_id;



-- count the total number of books in every genre in descending order
SELECT b.genre, COUNT(genre) AS count
FROM library_books b
GROUP BY b.genre
ORDER BY count DESC;  


-- setting return date and loan status upon book being borrowing 
UPDATE loans
SET status = 'On Loan', return_date = DATE_ADD(CURDATE(), INTERVAL 14 DAY)
WHERE loan_date = CURDATE();


