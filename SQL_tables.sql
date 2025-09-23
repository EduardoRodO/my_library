CREATE DATABASE my_library;
USE my_library;
SHOW TABLES;

CREATE TABLE book(
book_id INT AUTO_INCREMENT, 
book_name VARCHAR(100) NOT NULL,
isbn VARCHAR(50) NOT NULL UNIQUE,
pages INT NOT NULL,
publisher_id INT,
book_status ENUM('Completed', 'In process', 'Not started', 'Abandoned') NOT NULL,
personal_thoughts TEXT NULL,
front_page_url VARCHAR(300),
book_started VARCHAR(50) NULL,
book_completed VARCHAR(50) NULL,
PRIMARY KEY (book_id),
FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

CREATE TABLE book_author_bridge(
book_id INT NOT NULL,
author_id INT NOT NULL,
PRIMARY KEY (book_id, author_id),
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE author(
author_id INT AUTO_INCREMENT,
author_name VARCHAR(200) NOT NULL UNIQUE,
PRIMARY KEY (author_id)
);

CREATE TABLE publisher(
publisher_id INT AUTO_INCREMENT,
publisher_name VARCHAR(100) NOT NULL,
PRIMARY KEY (publisher_id)
);

CREATE TABLE genre(
genre_id INT AUTO_INCREMENT,
genre_name VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (genre_id)
);

CREATE TABLE book_genre_bridge(
book_id INT NOT NULL,
genre_id INT NOT NULL,
PRIMARY KEY (book_id, genre_id),
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE book_type(
book_type_id INT AUTO_INCREMENT,
book_type_name VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (book_type_id)
);

CREATE TABLE book_type_bridge(
book_id INT NOT NULL,
book_type_id INT NOT NULL,
PRIMARY KEY (book_id, book_type_id),
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (book_type_id) REFERENCES book_type(book_type_id)
);



