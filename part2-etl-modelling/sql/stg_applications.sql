SELECT
    app_id,
    submitted_ts,
    
    -- Product Type
    CASE 
        WHEN product LIKE 'BTL%' THEN 'BTL'
        WHEN product LIKE 'BRIDGE%' THEN 'Bridging'
        WHEN product LIKE 'DEV%' THEN 'Development'
    END AS product_type,
    
    -- Sub Product
    product AS sub_product,
    
    -- Region Cleaning
    CASE 
        WHEN region = 'LON' THEN 'London'
        WHEN region = 'SE' THEN 'South East'
        WHEN region = 'NW' THEN 'North West'
        WHEN region = 'MIDS' THEN 'Midlands'
        ELSE region
    END AS region,
    
    broker,
    borrower_type,
    property_value,
    requested_amount,
    
    -- LTV Cleaning
    CASE 
        WHEN ltv_pct_text LIKE '%-%' THEN 
            (CAST(SUBSTR(ltv_pct_text,1,2) AS FLOAT) +
             CAST(SUBSTR(ltv_pct_text,4,2) AS FLOAT)) / 2
        WHEN ltv_pct_text LIKE '%~%' THEN 
            CAST(REPLACE(ltv_pct_text,'~','') AS FLOAT)
        ELSE 
            CAST(REPLACE(ltv_pct_text,'%','') AS FLOAT)
    END AS ltv_pct,
    
    stage

FROM applications_raw;