WITH 
    source as (
    SELECT 
        shipper_id	
        , phone	
        , company_name
    FROM {{ source('northwind_erp','shippers') }}
    )

SELECT * FROM source