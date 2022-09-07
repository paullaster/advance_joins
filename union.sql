/*
Write a query that uses 
UNION ALL on two instances
 (and selecting all columns) 
 of the accounts table.
*/
SELECT *
FROM accounts

UNION ALL

SELECT *
FROM accounts

/*
Add a WHERE clause to each 
of the tables that you unioned in the query above, 
filtering the first table where 
name equals Walmart and filtering 
the second table where name equals Disney.
*/
SELECT *
FROM accounts
WHERE name = 'Walmart'

UNION ALL

SELECT *
FROM accounts
WHERE name = 'Disney'