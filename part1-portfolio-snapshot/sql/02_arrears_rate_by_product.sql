SELECT 
    product_type,
    COUNT(*) AS total_loans,
    SUM(
        CASE 
            WHEN status = 'InArrears' THEN 1 
            ELSE 0 
        END
    ) AS loans_in_arrears,
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN status = 'InArrears' THEN 1 
                ELSE 0 
            END
        ) / COUNT(*), 
        2
    ) AS arrears_rate_percent
FROM loans_snapshot
GROUP BY product_type
ORDER BY arrears_rate_percent DESC;