SELECT 
    broker_name,
    COUNT(*) AS number_of_loans,
    SUM(current_balance) AS total_exposure,
    ROUND(AVG(interest_rate), 2) AS avg_interest_rate,
    RANK() OVER (ORDER BY SUM(current_balance) DESC) AS broker_rank
FROM loans_snapshot
GROUP BY broker_name
ORDER BY total_exposure DESC;