WITH
    source as (
    SELECT 
        order_id
        , order_date
        , ship_region
        , shipped_date
        , ship_country
        , ship_address
        , ship_postal_code
        , ship_city
        , ship_name
        , freight
        , required_date
    FROM {{ source('northwind_erp','order') }}
    )

SELECT* From source