WITH
    source as (
    SELECT 
        order_id
        , customer_id
        , ship_via as shipper_id
        , employee_id
        , order_date
        , ship_region
        , shipped_date
        , ship_country
        , ship_address
        , ship_postal_code
        , ship_city
        , ship_name
        , freight
        , cast(required_date as timestamp) as required_date
        
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('northwind_erp','order') }}
    )

SELECT* From source