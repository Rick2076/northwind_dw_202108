{{ config(materialized='table') }}

WITH
    selected as (
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
        FROM {{ ref('stg_suppliers') }}
)
    ,transformed as (
        SELECT 
            row_number() over(order by supplier_id) as supplier_sk
            ,*	
        FROM selected
)

SELECT* From transformed