-- CHALLENGUE 1, PASS 1

SELECT  
authors.au_id AS 'Author ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'SALES ROYALTY'

FROM
authors
INNER JOIN
titleauthor
ON 
authors.au_id = titleauthor.au_id
INNER JOIN
titles
ON
titleauthor.title_id = titles.title_id
INNER JOIN
sales
ON
titles.title_id = sales.title_id

GROUP BY
authors.au_id, titles.title_id

ORDER BY
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 DESC 


LIMIT 3

-- CHALLENGUE 1, PASS 3

SELECT  
authors.au_id AS 'Author ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'SALES ROYALTY',
sum(titles.royalty) as 'TOTAL ROYALTY'

FROM
authors
INNER JOIN
titleauthor
ON 
authors.au_id = titleauthor.au_id
INNER JOIN
titles
ON
titleauthor.title_id = titles.title_id
INNER JOIN
sales
ON
titles.title_id = sales.title_id

GROUP BY
authors.au_id, titles.title_id

ORDER BY
sum(titles.royalty) DESC 

LIMIT 3

-- CHALLENGUE 1, PASS 4

SELECT  
authors.au_id AS 'Author ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'SALES ROYALTY',
sum(titles.royalty) as 'TOTAL ROYALTY',
sum(titles.advance)+sum(titles.royalty) AS 'PROFITS'

FROM
authors
INNER JOIN
titleauthor
ON 
authors.au_id = titleauthor.au_id
INNER JOIN
titles
ON
titleauthor.title_id = titles.title_id
INNER JOIN
sales
ON
titles.title_id = sales.title_id

GROUP BY
authors.au_id, titles.title_id

ORDER BY
sum(titles.advance)+sum(titles.royalty) DESC 

LIMIT 3

-- CHALLENGUE 2
CREATE TEMPORARY TABLE publications.authors_profit
SELECT  
authors.au_id AS 'Author ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'SALES ROYALTY',
sum(titles.royalty) as 'TOTAL ROYALTY',
sum(titles.advance)+sum(titles.royalty) AS 'PROFITS'

FROM
authors
INNER JOIN
titleauthor
ON 
authors.au_id = titleauthor.au_id
INNER JOIN
titles
ON
titleauthor.title_id = titles.title_id
INNER JOIN
sales
ON
titles.title_id = sales.title_id

GROUP BY
authors.au_id, titles.title_id

ORDER BY
sum(titles.advance)+sum(titles.royalty) DESC 

LIMIT 3

-- CHALLENGUE 3
CREATE TABLE publications.most_profiting_authors
SELECT  
authors.au_id AS 'Author ID',
sum(titles.advance)+sum(titles.royalty) AS 'PROFITS'

FROM
authors
INNER JOIN
titleauthor
ON 
authors.au_id = titleauthor.au_id
INNER JOIN
titles
ON
titleauthor.title_id = titles.title_id

GROUP BY
authors.au_id

ORDER BY
sum(titles.advance)+sum(titles.royalty) DESC 

LIMIT 3