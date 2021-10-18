{{ config(materialized='table') }}

WITH
    staging as (
    SELECT *
    FROM {{ ref('stg_products') }}
    )

    ,transformed as (
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
    FROM staging
)

SELECT* From transformed