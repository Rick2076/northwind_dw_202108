WITH
    source as (
    SELECT 
        product_id	
        , discount	
        , unit_price	
        , quantity	
        , order_id	
        
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('northwind_etl','order_details') }} 
    )

SELECT* From source