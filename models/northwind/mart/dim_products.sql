{{ config(materialized='table') }}

WITH
    staging as (
    SELECT *
    FROM {{ ref('stg_products') }}
    )

    ,transformed as (
    SELECT 
        row_number() over(order by product_id) as product_sk
        , product_id
        , category_id
        , product_name	
        , unit_price
        , units_in_stock	
        , units_on_order
        , quantity_per_unit
        , supplier_id			
        , reorder_level 	
        , discontinued	
    FROM staging
)

SELECT* From transformed