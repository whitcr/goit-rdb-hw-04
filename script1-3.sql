CREATE DATABASE LibraryManagement;

USE LibraryManagement;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR NOT NULL,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO authors (author_name) VALUES ('John'), ('Jane');

INSERT INTO genres (genre_name) VALUES ('Fiction'), ('Non-Fiction');

INSERT INTO books (title, publication_year, author_id, genre_id) 
VALUES ('Book 1', 2020, 1, 1), ('Book 2', 2021, 2, 2);

INSERT INTO users (username, email) VALUES ('user1', 'user1@example.com'), ('user2', 'user2@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) 
VALUES (1, 1, '2023-01-01', '2023-01-15'), (2, 2, '2023-02-01', '2023-02-15');

