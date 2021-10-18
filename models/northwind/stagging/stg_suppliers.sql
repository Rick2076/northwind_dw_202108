WITH 
    source as (
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
    FROM {{ source('northwind_erp','suppliers') }}
    )

SELECT * FROM source