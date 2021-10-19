{{ config(materialized='table') }}

WITH
    selected as (
    SELECT 
        product_id	---PrimaryKey	
        , category_id  ---Foreign Key
        , supplier_id ---Foreign Key
        , product_name	
        , unit_price
        , units_in_stock	
        , units_on_order			
        , quantity_per_unit
        , reorder_level 	
        , case
            when discontinued = 1 then True
            else False
            end as is_discotinued        
    FROM {{ ref('stg_products') }}
    

    ,transformed as (
    SELECT 
        row_number() over(order by product_id) as product_sk
        ,*	
    FROM selected
)

SELECT* From transformed