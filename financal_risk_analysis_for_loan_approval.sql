USE finance_data;
SELECT * FROM loan;

SET SQL_SAFE_UPDATES = 0;

UPDATE finance_data.loan
SET ApplicationDate = STR_TO_DATE(ApplicationDate, '%Y-%m-%d'); 

ALTER TABLE finance_data.loan
MODIFY ApplicationDate Date;

SET SQL_SAFE_UPDATES = 1;

SELECT
   DATE_FORMAT(ApplicationDate, '%Y') AS _year,
    CASE WHEN LoanApproved = 1 THEN 'Approved' ELSE 'Decline' END AS approval_status,
    COUNT(*) AS total_applicants,
    ROUND(AVG(Age), 2) AS avg_age,
    ROUND(AVG(AnnualIncome), 2) AS avg_income,
    ROUND(AVG(TotalAssets), 2) AS avg_assets,
    ROUND(AVG(TotalLiabilities), 2) AS avg_liabilities,
    ROUND(AVG(SavingsAccountBalance), 2) AS avg_savings,
    ROUND(AVG(JobTenure), 2) AS avg_jobtenure,
    ROUND(AVG(TotalDebtToIncomeRatio), 2) AS avg_debtincomeratio
FROM finance_data.loan
GROUP BY 1,2
ORDER BY 1;