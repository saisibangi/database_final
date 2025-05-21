CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
-- Insert data into authors
INSERT INTO authors (name) VALUES 
('Jane Austen'), 
('Mark Twain'), 
('J.K. Rowling');

-- Insert data into genres
INSERT INTO genres (genre_name) VALUES 
('Fiction'), 
('Science Fiction'), 
('Biography');

-- Insert data into books
INSERT INTO books (title, isbn, available) VALUES 
('Pride and Prejudice', '9780141040349', TRUE), 
('Adventures of Huckleberry Finn', '9780486403496', TRUE), 
('Harry Potter and the Sorcerers Stone', '9780439554930', FALSE);

-- Insert data into members
INSERT INTO members (name, email, registration_date) VALUES 
('Alice Johnson', 'alice.j@example.com', '2023-10-01'), 
('Bob Smith', 'bob.s@example.com', '2024-02-15'), 
('Charlie Lee', 'charlie.l@example.com', '2024-05-10');

-- Insert data into loans
INSERT INTO loans (member_id, book_id, loan_date, return_date) VALUES 
(1, 3, '2024-05-20', NULL), 
(2, 1, '2024-05-18', '2024-05-25'), 
(3, 2, '2024-05-10', '2024-05-17');
