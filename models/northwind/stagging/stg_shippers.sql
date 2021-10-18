WITH 
    source as (
    SELECT 
        row_number() over(order by shipper_id) as shipper_sk
        shipper_id	
        , phone	
        , company_name
    FROM {{ source('northwind_erp','shippers') }}
    )

SELECT * FROM source