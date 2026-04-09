SELECT COUNT(id) AS Total_Loan_Applications FROM dbo.bank_loan_data

SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
-----------------------

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM dbo.bank_loan_data

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
-----------------------

SELECT SUM(total_payment) AS Total_Amont_Recieved FROM dbo.bank_loan_data

SELECT SUM(total_payment) AS MTD_Total_Amont_Recieved FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amont_Recieved FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
-----------------------

SELECT CAST(AVG(int_rate) *100 AS DECIMAL(10,2)) AS MTD_Avg_Interest_Rate FROM dbo.bank_loan_data

SELECT CAST(AVG(int_rate) *100 AS DECIMAL(10,2)) AS MTD_Avg_Interest_Rate FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT CAST(AVG(int_rate) *100 AS DECIMAL(10,2)) AS PMTD_Avg_Interest_Rate FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
-----------------------

SELECT ROUND(AVG(dti),4) *100 AS Avg_DTI FROM dbo.bank_loan_data

SELECT ROUND(AVG(dti),4) *100 AS MTD_Avg_DTI FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti),4) *100 AS PMTD_Avg_DTI FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
-----------------------

SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) /
		COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' 

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_Amount_Recieved FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
-----------------------

SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) /
		COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Amount_Recieved FROM bank_loan_data
WHERE loan_status = 'Charged Off'
-----------------------

SELECT
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Recieved,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM
	bank_loan_data
WHERE
	MONTH(issue_date) = 12 
GROUP BY
	loan_status

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

SELECT
	MONTH(issue_date) AS Month_Num,
	DATENAME(MONTH, issue_date) AS Month,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date) 

SELECT
	address_state AS State,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state

SELECT
	term AS Term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term


SELECT
	purpose AS Purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Recieved,
	SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose