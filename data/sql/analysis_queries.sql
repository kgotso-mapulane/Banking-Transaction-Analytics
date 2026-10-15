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
