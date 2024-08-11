CREATE  DATABASE IF NOT EXISTS library_db;
-- Users Table==

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address TEXT,
    Role VARCHAR(20) NOT NULL
);

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Biography TEXT
);

-- Publishers Table
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address TEXT,
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    PublisherID INT,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Genre VARCHAR(50),
    PublicationYear INT,
    CopiesAvailable INT,
    TotalCopies INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- BorrowRecords Table
CREATE TABLE BorrowRecords (
    BorrowID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Reservations Table
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    ReservationDate DATE NOT NULL,
    ExpirationDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Fines Table
CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    BorrowID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaidDate DATE,
    FOREIGN KEY (BorrowID) REFERENCES BorrowRecords(BorrowID)
);

-- Genres Table
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL
);CREATE  DATABASE IF NOT EXISTS library_db;
-- Users Table==

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address TEXT,
    Role VARCHAR(20) NOT NULL
);

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Biography TEXT
);

-- Publishers Table
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address TEXT,
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    PublisherID INT,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Genre VARCHAR(50),
    PublicationYear INT,
    CopiesAvailable INT,
    TotalCopies INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- BorrowRecords Table
CREATE TABLE BorrowRecords (
    BorrowID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Reservations Table
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    ReservationDate DATE NOT NULL,
    ExpirationDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Fines Table
CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    BorrowID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaidDate DATE,
    FOREIGN KEY (BorrowID) REFERENCES BorrowRecords(BorrowID)
);

-- Genres Table
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL
);
