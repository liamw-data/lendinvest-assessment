SELECT 
    product_type,
    region,
    COUNT(loan_id) AS number_of_loans,
    SUM(current_balance) AS total_current_balance,
    ROUND(AVG(ltv_at_origination), 2) AS avg_ltv_at_origination
FROM loans_snapshot
GROUP BY 
    product_type,
    region
ORDER BY 
    total_current_balance DESC;