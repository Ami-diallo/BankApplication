DROP DATABASE IF EXISTS bankDB;
CREATE DATABASE bankDB;

USE bankDB;
CREATE TABLE user(
user_id INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(50) NOT NULL,
`lastname` VARCHAR(50) NOT NULL,
`email` VARCHAR(255) NOT NULL,
`password` VARCHAR(255) NOT NULL,
token VARCHAR(255),
code INT NULL,
verified INT DEFAULT 0,
verified_at DATEtIME,
created_at TIMESTAMP,
updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE account(
account_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
account_number VARCHAR(100) NOT NULL,
account_name VARCHAR(50) NOT NULL,
account_type VARCHAR(50) NOT NULL,
balance DECIMAL(18,2) DEFAULT 0.00,
created_at TIMESTAMP,
updated_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

CREATE TABLE transaction(
transaction_id INT PRIMARY KEY AUTO_INCREMENT,
account_id INT,
transaction_type VARCHAR(50) NOT NULL,
amount DECIMAL(18,2),
status VARCHAR(50) NULL,
reason_code VARCHAR(100) NULL,
created_at TIMESTAMP,
FOREIGN KEY(account_id) REFERENCES account(account_id) ON DELETE CASCADE
);

CREATE TABLE payment(
payment_id INT PRIMARY KEY AUTO_INCREMENT,
account_id INT,
beneficiary VARCHAR(50) NULL,
beneficiary_acc_no VARCHAR(255) NULL,
amount DECIMAL(18,2) NULL,
reference_no VARCHAR(100) NULL,
status VARCHAR(50) NULL,
reason_code VARCHAR(100) NULL,
created_at TIMESTAMP,
FOREIGN KEY(account_id) REFERENCES account(account_id) ON DELETE CASCADE
);
-- Transaction Hstory View
CREATE VIEW v_transaction
AS
SELECT
t.transaction_id,
a.account_id,
u.user_id,
t.transaction_type,
t.amount,
t.status,
t.reason_code,
t.created_at
FROM
transaction AS t
INNER JOIN
account AS a
ON
t.account_id = a.account_id
INNER JOIN
user AS u
ON
a.user_id = u.user_id;

-- Payment history View
CREATE VIEW v_payment
AS
SELECT
p.payment_id,
a.account_id,
u.user_id,
p.beneficiary,
p.beneficiary_acc_no,
p.amount,
p.status,
p.reference_no,
p.reason_code,
p.created_at
FROM
payment AS p
INNER JOIN
account AS a
ON
p.account_id = a.account_id
INNER JOIN
user AS u
ON
a.user_id = u.user_id;

select * from v_transaction;
select * from v_payment;







