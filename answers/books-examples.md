# Examples

## SEE ALL DATA

```sql
SELECT * FROM Books;
```

## SORT 5 BOOK Descending According to PublishedYear

```sql
SELECT * FROM Books ORDER BY PublishedYear DESC LIMIT 5;
```

## Find books borrowed by a specific member

```sql
SELECT Members.Name, Books.Title, BorrowedBooks.BorrowDate 
FROM BorrowedBooks
JOIN Members ON BorrowedBooks.MemberID = Members.MemberID
JOIN Books ON BorrowedBooks.BookID = Books.BookID
WHERE Members.Name = 'Alice Johnson';
```

## Count how many books each member has borrowed

```sql
SELECT Members.Name, COUNT(BorrowedBooks.BorrowID) AS TotalBorrowed
FROM Members
LEFT JOIN BorrowedBooks ON Members.MemberID = BorrowedBooks.MemberID
GROUP BY Members.Name;
```

## People Who has not returned the book

```sql
SELECT Members.Name, Books.Title, BorrowedBooks.BorrowDate 
FROM BorrowedBooks
JOIN Members ON Members.MemberID = BorrowedBooks.MemberID
JOIN Books ON Books.BookID = BorrowedBooks.BookID
WHERE BorrowedBooks.ReturnDate IS NULL;
```

## Reverse Transcation

```sql
START TRANSACTION;
UPDATE Books SET PublishedYear = 1925 WHERE BookID = 1;
ROLLBACK;
```