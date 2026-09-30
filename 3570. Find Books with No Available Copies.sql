-- 3570. Find Books with No Available Copies



SELECT 
    r.book_id,
    b.title,
    b.author,
    b.genre,
    b.publication_year,
    b.total_copies   as current_borrowers
FROM library_books b
JOIN borrowing_records r
USING(book_id)
WHERE return_date IS NULL  
GROUP BY 
    r.book_id,
    b.title,
    b.author,
    b.genre,
    b.publication_year,
    b.total_copies
HAVING COUNT(r.book_id) = b.total_copies
ORDER BY current_borrowers DESC, b.title 

