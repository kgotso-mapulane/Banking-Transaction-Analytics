-- Create customer table used for relational analysis and JOIN practice

CREATE TABLE bank_customers (
    customer_id TEXT PRIMARY KEY,
    customer_name TEXT
);


-- Insert fictional customer records

INSERT INTO bank_customers (customer_id, customer_name)
VALUES
('CUST001', 'Lebo Mokoena'),
('CUST002', 'Thabo Nkosi'),
('CUST003', 'Naledi Molefe'),
('CUST004', 'Kagiso Dlamini'),
('CUST005', 'Oratile Khumalo'),
('CUST006', 'Lesedi Ndlovu'),
('CUST007', 'Tshepo Maseko'),
('CUST008', 'Amogelang Sithole'),
('CUST009', 'Karabo Zulu'),
('CUST010', 'Refilwe Naidoo'),
('CUST011', 'Neo Mthembu'),
('CUST012', 'Boitumelo Mokoena'),
('CUST013', 'Katlego Nkosi'),
('CUST014', 'Onthatile Molefe'),
('CUST015', 'Tebogo Dlamini'),
('CUST016', 'Mpho Modise');
