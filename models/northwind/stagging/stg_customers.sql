WITH
    sources as (
    SELECT 
        customer_id
        , contact_name
        , contact_title
        , country
        , city
        , postal_code
        , address
        , region
        , phone
        , company_name
        , fax
        
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('northwind_erp','customers') }}
)

SELECT * FROM sources