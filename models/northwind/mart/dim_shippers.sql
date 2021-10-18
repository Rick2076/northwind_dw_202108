{{ config(materialized='table') }}

WITH
    selected as (
        SELECT 
        shipper_id	
        , phone	
        , company_name
        FROM {{ ref('stg_shippers') }}
)
    ,transformed as (
        SELECT 
            row_number() over(order by shipper_id) as shipper_sk
            ,*	
        FROM selected
)

SELECT* From transformed