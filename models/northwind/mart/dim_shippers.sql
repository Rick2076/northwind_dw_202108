{{ config(materialized='table') }}

WITH
    staging as (
    SELECT *
    FROM {{ ref('stg_products') }}
    )

    ,transformed as (
    SELECT 
        row_number() over(order by shipper_id) as shipper_sk
        shipper_id	
        , phone	
        , company_name
    FROM staging
)

SELECT* From transformed