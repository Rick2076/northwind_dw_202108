{{ config(materialized='table') }}

WITH
    suppliers as (
        Select *
        from {{ ref('dim_suppliers') }}
),
    selected as (
    SELECT 
        product_id	---PrimaryKey	
        , products.category_id  ---Foreign Key
        , s.supplier_sk as supplier_fk
        , products.product_name	
        , products.unit_price
        , products.units_in_stock	
        , products.units_on_order			
        , products.quantity_per_unit
        , products.reorder_level 	
        , products.is_discotinued

    FROM {{ ref('stg_products') }} as products
    left join suppliers s on products.supplier_id = s.supplier_id
    )
    ,transformed as (
    SELECT 
        row_number() over(order by product_id) as product_sk
        ,*	
    FROM selected
    order by product_sk
)

SELECT* From transformed