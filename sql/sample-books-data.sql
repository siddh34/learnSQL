-- Adding more books
INSERT INTO Books (Title, Author, PublishedYear, Genre) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Classic'),
('1984', 'George Orwell', 1949, 'Dystopian'),
('Pride and Prejudice', 'Jane Austen', 1813, 'Romance'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 'Fiction'),
('Moby-Dick', 'Herman Melville', 1851, 'Adventure'),
('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy'),
('Harry Potter and the Sorcerers' 'Stone', 'JK Rowling', 1997, 'Fantasy'),
('The Lord of the Rings', 'J.R.R. Tolkien', 1954, 'Fantasy'),
('The Alchemist', 'Paulo Coelho', 1988, 'Philosophy');

INSERT INTO Members (Name, Email, JoinDate) VALUES
('Alice Johnson', 'alice@example.com', '2024-01-10'),
('Bob Smith', 'bob@example.com', '2024-02-15'),
('Charlie Davis', 'charlie@example.com', '2024-03-20'),
('David Wilson', 'david@example.com', '2024-04-05'),
('Emma Thomas', 'emma@example.com', '2024-04-12');

INSERT INTO BorrowedBooks (BookID, MemberID, BorrowDate, ReturnDate) VALUES
(1, 1, '2024-03-01', '2024-03-15'),
(2, 2, '2024-03-05', NULL),
(3, 3, '2024-03-10', '2024-03-25'),
(4, 4, '2024-03-12', NULL),
(5, 5, '2024-03-15', '2024-03-28'),
(6, 1, '2024-03-20', NULL),
(7, 2, '2024-03-22', '2024-04-01'),
(8, 3, '2024-03-25', NULL),
(9, 4, '2024-03-28', NULL),
(10, 5, '2024-03-30', '2024-04-10');
