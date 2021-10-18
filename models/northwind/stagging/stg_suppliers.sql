WITH 
    sources as (
    SELECT 
        row_number() over(order by supplier_id) as supplier_sk
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

SELECT * FROM sources