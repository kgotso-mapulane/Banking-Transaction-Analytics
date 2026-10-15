-- Banking Transaction Analytics
-- SQL analysis performed on a synthetic banking transaction dataset.


-- 1. View all banking transactions
SELECT *
FROM banking_transactions;


-- 2. View selected customer and transaction information
SELECT customer_id, customer_name, amount
FROM banking_transactions;


-- 3. Find failed transactions
SELECT *
FROM banking_transactions
WHERE status = 'Failed';


-- 4. Find transactions greater than R5,000
SELECT customer_name, transaction_type, amount, status
FROM banking_transactions
WHERE amount > 5000;


-- 5. Find failed transactions greater than R5,000
SELECT customer_name, transaction_type, amount, status
FROM banking_transactions
WHERE amount > 5000
AND status = 'Failed';


-- 6. Find the five highest-value transactions
SELECT customer_name, transaction_type, amount, status
FROM banking_transactions
ORDER BY amount DESC
LIMIT 5;


-- 7. Count all transactions
SELECT COUNT(*) AS total_transactions
FROM banking_transactions;


-- 8. Count failed transactions
SELECT COUNT(*) AS failed_transactions
FROM banking_transactions
WHERE status = 'Failed';


-- 9. Calculate total transaction value
SELECT SUM(amount) AS total_transaction_value
FROM banking_transactions;


-- 10. Calculate average transaction value
SELECT AVG(amount) AS average_transaction_value
FROM banking_transactions;


-- 11. Count transactions by transaction type
SELECT transaction_type,
       COUNT(*) AS transaction_count
FROM banking_transactions
GROUP BY transaction_type;


-- 12. Calculate total value by transaction type
SELECT transaction_type,
       SUM(amount) AS total_value
FROM banking_transactions
GROUP BY transaction_type
ORDER BY total_value DESC;


-- 13. Analyse usage by banking channel
SELECT channel,
       COUNT(*) AS transaction_count
FROM banking_transactions
GROUP BY channel
ORDER BY transaction_count DESC;


-- 14. Count transactions per customer
SELECT customer_name,
       COUNT(*) AS transaction_count
FROM banking_transactions
GROUP BY customer_name
ORDER BY transaction_count DESC;


-- 15. Calculate transaction count and total value per customer
SELECT customer_name,
       COUNT(*) AS transaction_count,
       SUM(amount) AS total_transaction_value
FROM banking_transactions
GROUP BY customer_name
ORDER BY total_transaction_value DESC;


-- 16. Calculate customer transaction count, total value and average value
SELECT customer_name,
       COUNT(*) AS transaction_count,
       SUM(amount) AS total_transaction_value,
       AVG(amount) AS average_transaction_value
FROM banking_transactions
GROUP BY customer_name
ORDER BY average_transaction_value DESC;


-- 17. Find customers with more than R25,000 in total transactions
SELECT customer_name,
       SUM(amount) AS total_transaction_value
FROM banking_transactions
GROUP BY customer_name
HAVING SUM(amount) > 25000
ORDER BY total_transaction_value DESC;


-- 18. Count transactions by month
SELECT strftime('%Y-%m', transaction_date) AS transaction_month,
       COUNT(*) AS transaction_count
FROM banking_transactions
GROUP BY transaction_month
ORDER BY transaction_month;


-- 19. Analyse monthly transaction count and total value
SELECT strftime('%Y-%m', transaction_date) AS transaction_month,
       COUNT(*) AS transaction_count,
       SUM(amount) AS total_transaction_value
FROM banking_transactions
GROUP BY transaction_month
ORDER BY total_transaction_value DESC;


-- 20. Analyse transactions by time of day
SELECT
    CASE
        WHEN transaction_time >= '06:00:00'
             AND transaction_time < '12:00:00' THEN 'Morning'
        WHEN transaction_time >= '12:00:00'
             AND transaction_time < '18:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS transaction_count
FROM banking_transactions
GROUP BY time_of_day
ORDER BY transaction_count DESC;

-- 21. Join transactions with customer information
SELECT
    t.transaction_id,
    t.customer_id,
    c.customer_name,
    t.transaction_type,
    t.amount
FROM banking_transactions AS t
INNER JOIN bank_customers AS c
    ON t.customer_id = c.customer_id;


-- 22. Analyse transaction count and total value per customer using INNER JOIN
SELECT
    c.customer_name,
    COUNT(*) AS transaction_count,
    ROUND(SUM(t.amount), 2) AS total_transaction_value
FROM banking_transactions AS t
INNER JOIN bank_customers AS c
    ON t.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_transaction_value DESC;


-- 23. Include all customers using LEFT JOIN
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(t.transaction_id) AS transaction_count,
    COALESCE(ROUND(SUM(t.amount), 2), 0) AS total_transaction_value
FROM bank_customers AS c
LEFT JOIN banking_transactions AS t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY transaction_count DESC;
