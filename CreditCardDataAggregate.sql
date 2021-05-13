USE credit_card;
GO

SELECT TOP (5) * FROM dbo.CardBase; -- 500 rows
SELECT TOP (5) * FROM dbo.CustomerBase; -- 5,674 rows
SELECT TOP (5) * FROM dbo.FraudBase; -- 109 rows
SELECT TOP (5) * FROM dbo.TransactionBase; -- 10,000 rows
GO

/*SELECT * FROM dbo.CardBase
INNER JOIN dbo.CustomerBase
ON CardBase.Cust_ID = CustomerBase.Cust_ID;*/

/*SELECT * FROM dbo.FraudBase
LEFT JOIN dbo.TransactionBase
ON FraudBase.Transaction_ID = TransactionBase.Transaction_ID;*/

CREATE VIEW CardTransactionBase AS
SELECT * FROM dbo.CardBase AS cb
FULL JOIN dbo.TransactionBase AS tb
ON cb.Card_Number = tb.Credit_Card_ID;
GO

SELECT * FROM CardTransactionBase AS ctrb
FULL JOIN CustomerBase AS cusb
ON ctrb.Cust_ID = cusb.Cust_ID
FULL JOIN dbo.FraudBase AS fb
ON ctrb.Transaction_ID = fb.Transaction_ID;
GO

-- CREATE VIEW CardFraudTransactionBase AS
/*SELECT * FROM dbo.CardTransactionBase AS ctb
INNER JOIN dbo.FraudBase AS fb
ON ctb.Transaction_ID = fb.Transaction_ID;
GO*/

/*SELECT * FROM CardTransactionBase
GROUP BY CardTransactionBase.Transaction_ID;*/

--SELECT DISTINCT Transaction_ID FROM CardTransactionBase;

DROP VIEW CardTransactionBase;
GO