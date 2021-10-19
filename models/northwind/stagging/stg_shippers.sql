WITH 
    sources as (
    SELECT 
        shipper_id	
        , phone	
        , company_name
        
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('northwind_etl','shippers') }}
    )

SELECT * FROM sources