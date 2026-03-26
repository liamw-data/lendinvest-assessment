SELECT
    offer_id,
    app_id,
    offer_ts,
    offer_amount,

    -- Product Type Parsing
    CASE 
        WHEN product_name LIKE '%BTL%' THEN 'BTL'
        WHEN product_name LIKE '%Bridge%' THEN 'Bridging'
        WHEN product_name LIKE '%Development%' THEN 'Development'
    END AS product_type,

    -- Sub Product
    product_name AS sub_product,

    -- Region Parsing
    CASE 
        WHEN product_name LIKE '%London%' THEN 'London'
        WHEN product_name LIKE '%South East%' THEN 'South East'
        WHEN product_name LIKE '%North West%' THEN 'North West'
        WHEN product_name LIKE '%Midlands%' THEN 'Midlands'
    END AS region,

    rate_pct,
    term_months,
    status

FROM offers_raw;