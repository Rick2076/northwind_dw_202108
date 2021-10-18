WITH
    source as (
    SELECT 
        row_number() over(order by customer_id) as customer_sk
        , country
        , city
        , fax
        , postal_code
        , address
        , region
        , customer_id
        , contact_name
        , phone
        , company_name
        , contact_title
        
        ---Sticht
        ,_sdc_table_version	
        ,_sdc_received_at
        ,_sdc_sequence
        ,_sdc_batched_at
    FROM {{ source('northwind_erp','customers') }}
)

SELECT * FROM source