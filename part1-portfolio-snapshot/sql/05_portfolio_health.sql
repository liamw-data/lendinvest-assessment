SELECT
    status,
    COUNT(*) AS loan_count,
    SUM(current_balance) AS total_balance,
    ROUND(
        SUM(current_balance) * 100.0 /
        SUM(SUM(current_balance)) OVER (),
        2
    ) AS portfolio_percentage
FROM loans_snapshot
GROUP BY status
ORDER BY total_balance DESC;