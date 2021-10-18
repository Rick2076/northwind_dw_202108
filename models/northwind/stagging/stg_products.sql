WITH 
    source as (
    SELECT 
        product_id			
        , category_id			
        , product_name	
        , unit_price
        , units_in_stock	
        , units_on_order			
        , quantity_per_unit
        , supplier_id			
        , reorder_level 	
        , discontinued	
    FROM {{ source('northwind_erp','products') }}
    )
	

SELECT * FROM source