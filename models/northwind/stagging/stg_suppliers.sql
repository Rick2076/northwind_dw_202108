WITH 
    sources as (
    SELECT 
        supplier_id	
        , company_name	
        , contact_name	
        , contact_title		
        , country	
        , city	
        , region
        , address	
        , fax	
        , homepage		
        , postal_code	
        , phone
        
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('northwind_etl','suppliers') }}
    )

SELECT * FROM sources