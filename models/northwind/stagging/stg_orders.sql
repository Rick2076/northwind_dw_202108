WITH
    source as (
    SELECT 
        o.order_id
        , o.customer_id
        , o.ship_via as shipper_id
        , o.employee_id
        , o.order_date
        , o.ship_region
        , o.shipped_date
        , o.ship_country
        , o.ship_address
        , o.ship_postal_code
        , o.ship_city
        , o.ship_name
        , o.freight
        , cast(required_date as timestamp) as required_date
        
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('northwind_etl','orders') }} as o
    )

SELECT* From source