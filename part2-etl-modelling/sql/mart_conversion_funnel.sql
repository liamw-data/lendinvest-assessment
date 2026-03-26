WITH applications AS (

SELECT * 
FROM stg_applications

),

offers AS (

SELECT * 
FROM stg_offers

)

SELECT

    a.product_type,
    a.region,

    COUNT(DISTINCT a.app_id) AS applications_count,

    COUNT(DISTINCT o.app_id) AS offers_count,

    ROUND(
        100.0 * COUNT(DISTINCT o.app_id) 
        / COUNT(DISTINCT a.app_id)
    ,2) AS conversion_rate_pct,

    ROUND(AVG(o.offer_amount),0) AS avg_offer_amount

FROM applications a

LEFT JOIN offers o
    ON a.app_id = o.app_id

GROUP BY
    a.product_type,
    a.region

ORDER BY
    a.product_type,
    conversion_rate_pct DESC;