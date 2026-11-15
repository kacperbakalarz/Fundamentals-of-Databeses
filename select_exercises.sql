--1.1SELECT title, title_no FROM title
--1.2 SELECT title FROM title WHERE title_no = 10
--1.3 SELECT title_no, author FROM title WHERE author = 'Charles Dickens' or author = 'Jane Austen'

--2.1 SELECT title_no, title FROM title WHERE title LIKE '%adventure%';
--2.2 SELECT member_no, fine_paid FROM loanhist WHERE in_date >= '2001-11-01' AND in_date < '2001-12-01';
--2.3 SELECT DISTINCT city, state FROM adult;
--2.4SELECT title FROM title ORDER BY title ASC

/* 3.1 SELECT member_no, isbn, fine_assessed, fine_assessed*2 AS double_fine, fine_assessed AS diff
FROM loanhist
WHERE fine_assessed is not NUll AND fine_assessed > 3; */

-- 4.1 SELECT firstname + ' ' + middleinitial + ' ' + lastname AS email_name FROM member WHERE lastname = 'Anderson'
-- 4.2 SELECT LOWER(firstname + middleinitial + LEFT(lastname,2)) AS email_name FROM member WHERE lastname = 'Anderson'

-- 5.1 SELECT 'The title is: ' + title + ', title number ' + CAST(title_no AS VARCHAR) FROM title;