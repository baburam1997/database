-- Insert Users
INSERT INTO Users (UserID, Username, Password, FirstName, LastName, Email, PhoneNumber, Address, Role)
VALUES
(1, 'librarian1', 'password123', 'Alice', 'Smith', 'alice@example.com', '1234567890', '123 Library St.', 'Librarian'),
(2, 'member1', 'password123', 'Bob', 'Brown', 'bob@example.com', '0987654321', '456 Main St.', 'Member');

-- Insert Authors
INSERT INTO Authors (AuthorID, FirstName, LastName, Biography)
VALUES
(1, 'John', 'Doe', 'Biography of John Doe.'),
(2, 'Jane', 'Austen', 'Biography of Jane Austen.');

-- Insert Publishers
INSERT INTO Publishers (PublisherID, Name, Address, Phone, Email)
VALUES
(1, 'Publisher One', '789 Publisher Ave.', '1234567890', 'contact@publisherone.com'),
(2, 'Publisher Two', '101 Publisher Blvd.', '0987654321', 'contact@publishertwo.com');

-- Insert Books
INSERT INTO Books (BookID, Title, AuthorID, PublisherID, ISBN, Genre, PublicationYear, CopiesAvailable, TotalCopies)
VALUES
(1, 'Book Title One', 1, 1, '111-1111111111', 'Fiction', 2020, 5, 5),
(2, 'Book Title Two', 2, 2, '222-2222222222', 'Romance', 2018, 3, 3);

-- Insert BorrowRecords
INSERT INTO BorrowRecords (BorrowID, UserID, BookID, BorrowDate, DueDate, ReturnDate)
VALUES
(1, 2, 1, '2024-01-01', '2024-01-15', NULL);

-- Insert Reservations
INSERT INTO Reservations (ReservationID, UserID, BookID, ReservationDate, ExpirationDate)
VALUES
(1, 2, 2, '2024-02-01', '2024-02-15');

-- Insert Fines
INSERT INTO Fines (FineID, BorrowID, Amount, PaidDate)
VALUES
(1, 1, 5.00, NULL);

-- Insert Genres
INSERT INTO Genres (GenreID, GenreName)
VALUES
(1, 'Fiction'),
(2, 'Romance');
